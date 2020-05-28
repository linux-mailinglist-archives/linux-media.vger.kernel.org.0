Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52731E674E
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 18:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404924AbgE1QVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 12:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404861AbgE1QVT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 12:21:19 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4269FC08C5C6
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 09:21:19 -0700 (PDT)
Received: from [IPv6:2003:cb:871f:5b00:609a:762:a83:77bf] (p200300cb871f5b00609a07620a8377bf.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:609a:762:a83:77bf])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9074D2A4043;
        Thu, 28 May 2020 17:21:17 +0100 (BST)
Subject: Re: [PATCH v4 0/5] media: add v4l2_pipeline_stream_{enable,disable}
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        niklas.soderlund@ragnatech.se--annotate
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
 <1c8bd467-5a9c-7285-ec23-d0d864a5f938@collabora.com>
 <CAAFQd5BW9TF0iMRPCUwk3oZn-WrisMW794EuwfqZRTkmNqeKoA@mail.gmail.com>
 <20200526185754.GA25880@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <50929a55-a071-aa09-eb1a-96776c61c147@collabora.com>
Date:   Thu, 28 May 2020 18:21:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526185754.GA25880@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz, Helen, Laurent

On 26.05.20 20:57, Laurent Pinchart wrote:
> Hi Tomasz,
> 
> On Tue, May 26, 2020 at 06:11:00PM +0200, Tomasz Figa wrote:
>> On Fri, May 22, 2020 at 11:06 AM Helen Koike <helen.koike@collabora.com> wrote:
>>> On 5/22/20 4:55 AM, Dafna Hirschfeld wrote:
>>>> Hi,
>>>> This is v4 of the patchset that was sent by Helen Koike.
>>>>
>>>> Media drivers need to iterate through the pipeline and call .s_stream()
>>>> callbacks in the subdevices.
>>>>
>>>> Instead of repeating code, add helpers for this.
>>>>
>>>> These helpers will go walk through the pipeline only visiting entities
>>>> that participates in the stream, i.e. it follows links from sink to source
>>>> (and not the opposite).
>>>> For example, in a topology like this https://bit.ly/3b2MxjI
>>>> calling v4l2_pipeline_stream_enable() from rkisp1_mainpath won't call
>>>> .s_stream(true) for rkisp1_resizer_selfpath.
>>>>
>>>> stream_count variable was added in v4l2_subdevice to handle nested calls
>>>> to the helpers.
>>>> This is useful when the driver allows streaming from more then one
>>>> capture device sharing subdevices.
>>>
>>> If I understand correctly, this isn't  true anymore right? Nested calls aren't
>>> possible anymore since this version doesn't contain stream_count in struct v4l2_subdevice.
>>>
>>> Documentation of v4l2_pipeline_stream_*() should also be updated.
>>>
>>> Just to be clear, without the nested call, vimc will require to add its own
>>> counters, patch https://patchwork.kernel.org/patch/10948833/ will be
>>> required again to allow multi streaming.
>>>
>>> Also, patch "media: staging: rkisp1: cap: use v4l2_pipeline_stream_{enable,disable}"
>>> is cleaner in the previous version (with stream_count in struct v4l2_subdevice).
>>>
>>> All drivers that allows multi streaming will need to implement some special handling.
>>>
>>> Adding stream_count in struct v4l2_subdevice still seems cleaner to me. I'd like to hear
>>> what others think.
>>
>> I certainly would see this reference counting done in generic code,
>> because requiring every driver to do it simply adds to the endless

It is required only for drivers that support multistreaming. I don't know much
about other driver except of the ones I am working on, is it a common case?

>> amount of boiler plate that V4L2 currently requires from the drivers.
>> :(
>>
>> I wonder if it wouldn't be possible to redesign the framework so that
>> .s_stream() at the subdev level is only called when it's expected to
>> either start or stop this particular subdev and driver's
>> implementation can simply execute the requested action.

You mean that a generic code similar to the helper functions in this patchset
will be used for all drivers, so that drivers don't call s_stream for subdevices
anymore?
Anyway, this patchset just adds helper functions, it does not redesign the code.
Maybe the stream_count can be updated in the v4l2_subdev_call macro ?
This why it can be used not just for the helper functions.

Thanks,
Dafna

> 
> I'd very much like that. Note that I think a few drivers abuse the on
> parameter to the function to pass other values than 0 or 1. We'd have to
> fix those first (or maybe it has been done already, it's been a long
> time since I last checked).
> 
