Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E0139BAAF
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 16:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhFDOLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 10:11:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35404 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhFDOL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 10:11:29 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A903E2A3;
        Fri,  4 Jun 2021 16:09:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622815782;
        bh=upvNDCOeuqJGsMaQ89KfD+hDNxc6hQ/LZQ+PqqCLFso=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=C7THKiABgo/C/WaCiLakYFv98P1aZU885DnNA41zxNsoLMov/zsfuxZgqJ2b6mss4
         VtAxPlLdQCRfZJeXpzSAEIbgn/s9ADzJgNRhOSKBQS7aj4zcm2Br4ntQvRbpZnX7mL
         RfoNIJ6a4DEgj0hZk8n3cplrhYeGaxmEV8geMwNc=
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
 <20210412110211.275791-2-tomi.valkeinen@ideasonboard.com>
 <YLoKxlXsC/nT4rF7@chromium.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] media: videobuf2-v4l2.c: add
 vb2_queue_change_type() helper
Message-ID: <5ee0e9a7-c6cb-fe75-7a91-5159c3233072@ideasonboard.com>
Date:   Fri, 4 Jun 2021 17:09:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLoKxlXsC/nT4rF7@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 04/06/2021 14:13, Tomasz Figa wrote:
> Hi Tomi,
> 
> On Mon, Apr 12, 2021 at 02:02:09PM +0300, Tomi Valkeinen wrote:
>> On some platforms a video device can capture either video data or
>> metadata. The driver can implement vidioc functions for both video and
>> metadata, and use a single vb2_queue for the buffers. However, vb2_queue
>> requires choosing a single buffer type, which conflicts with the idea of
>> capturing either video or metadata.
>>
>> The buffer type of vb2_queue can be changed, but it's not obvious how
>> this should be done in the drivers. To help this, add a new helper
>> function vb2_queue_change_type() which ensures the correct checks and
>> documents how it can be used.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/common/videobuf2/videobuf2-v4l2.c | 14 ++++++++++++++
>>   include/media/videobuf2-v4l2.h                  | 15 +++++++++++++++
>>   2 files changed, 29 insertions(+)
>>
> 
> Good to see you contributing to the media subsystem. Not sure if you
> still remember me from the Common Display Framework discussions. ;)

I barely remember CDF... ;)

> Anyway, thanks for the patch. I think the code itself is okay, but I'm
> wondering why the driver couldn't just have two queues, one for each
> type?

There was an email thread about this:

https://www.spinics.net/lists/linux-media/msg189144.html

struct video_device has 'queue' field, so if you have two queues, you'd 
need to change the vd->queue based on the format. Possibly that could be 
a solution too (and, if I recall right, that's what I initially tried as 
a quick hack). Changing the whole queue sounds riskier than changing 
just the type.

  Tomi
