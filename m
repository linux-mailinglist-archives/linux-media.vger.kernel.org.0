Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039E334A505
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 10:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhCZJ5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:57:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43258 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhCZJ5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:57:42 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 401A4443;
        Fri, 26 Mar 2021 10:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616752661;
        bh=8tMLQW7TtjfY1MTeGt+LWXUAYFz6cq1ur3RO9Yq21sU=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=GSRmGEPEvNdYawSfD6HpjbyOPjPSYM4qrd3WqRznsURruOccwUGeSD8nvk0pu2KYO
         JErKq2woZSrOgPoLuAtM3WOuMKMQI2e6YyDriYkmJ+gZSgmKEJAofkirNVv4tWKyMn
         0wW/oJUWUl2eF72jAlzwL12v/U0SrI34q65dHEP8=
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <b86d16cc-e3b1-0db3-f544-9f630572126c@ideasonboard.com>
 <67107267-69c8-d87d-6579-5e7dac0400fb@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: vb2_queue type question
Message-ID: <a9325fd6-8f14-ced5-97c4-3d05dc7ab150@ideasonboard.com>
Date:   Fri, 26 Mar 2021 11:57:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <67107267-69c8-d87d-6579-5e7dac0400fb@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 22/03/2021 11:49, Hans Verkuil wrote:
> On 22/03/2021 10:18, Tomi Valkeinen wrote:
>> Hi Hans,
>>
>> We were discussing this with Laurent and Sakari, I thought I'd ask if
>> you have any feedback on this.
>>
>> struct vb2_queue has 'type' field, so you can only use a queue for
>> buffers of a single type. struct video_device has 'queue' field, so you
>> can only use a single queue for a video_device instance.
>>
>> TI's SoCs have a CSI-2 receiver, with a bunch of DMA engines. The HW
>> doesn't care if we are currently capturing pixel buffers or metadata
>> buffers (I don't have experience with other HW, but I imagine this
>> shouldn't be a rare case). However, due to vb2_queue, the driver needs
>> to decide which one to support, which limits the possible use cases.
>>
>> I was browsing the code, and afaics the type field doesn't do much. It
>> is, of course, used to reject queuing buffers of wrong type, and also
>> (mostly in mem-2-mem code) to find out if functions are called in input
>> or output context.
>>
>> The latter one could be easily removed by just comparing the given queue
>> pointer to a stored pointer (e.g. queue == priv->input_queue).
>>
>> Do you see any problems if we were to change the type field to
>> type_mask, allowing multiple buffer types per queue? Or even remove the
>> vb2_queue->type. This raises some questions, like should a queue contain
>> only buffers of a single type or can it contain a mix of buffers (I
>> think it shouldn't contain a mix of buffers), or can a queue's type_mask
>> contain both input and output types (I don't see why not).
>>
>> An alternate which I tried was creating two vb2_queues, and switching
>> the video_device->queue at runtime based on set_format. It kind of
>> works, but I think the behavior is a bit unclear, and it might be
>> difficult to catch all the corner cases.
> 
> A vb2_queue basically represents a buffer queue that will be fed to a
> DMA engine. It assumes that all the buffers are of the same format,
> which typically is tied directly to the type.
> 
> The type of a vb2_queue can be changed if you like, but once buffers
> are allocated it is fixed and can't be changed again until all buffers
> are released. So you can't mix buffers of different types.
> 
> This is actually done in the vivid driver: see vidioc_s_fmt_vbi_cap()
> and vidioc_s_fmt_sliced_vbi_cap(): depending on the format the queue
> type will be set to either capture raw or sliced VBI.
> 
> The ivtv driver does the same thing.
> 
> So as long as vb2_is_busy() returns false, you are free to change the
> queue type.

So what's the expected behavior here if I have both normal video ops 
(vidioc_g_fmt_vid_cap & co.) and metadata ops (vidioc_g_fmt_meta_cap & 
co.) defined?

I can change the queue type in s_fmt as you suggest above, but what 
should, say, vidioc_g_fmt_meta_cap return if the current format is not 
metadata format? I made it return -EINVAL, but then v4l2-compliance says 
"Metadata Capture G_FMT failed, but Metadata Capture formats defined". I 
could also make vidioc_enum_fmt_meta_cap return an error, but then it 
would look like no metadata is supported.

Should all the metadata ops always change the queue type? That would 
prevent g_fmt from working when the queue is busy.

  Tomi
