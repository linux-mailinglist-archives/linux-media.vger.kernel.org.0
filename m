Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F801F5A32
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 19:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgFJRWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 13:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbgFJRWJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 13:22:09 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F06C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:22:09 -0700 (PDT)
Received: from [IPv6:2003:cb:871f:5b00:9cc4:c525:7ca2:283] (p200300cb871f5b009cc4c5257ca20283.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:9cc4:c525:7ca2:283])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 383BE2A0596;
        Wed, 10 Jun 2020 18:22:07 +0100 (BST)
Subject: Re: [PATCH v4 4/5] media: staging: rkisp1: cap: use
 v4l2_pipeline_stream_{enable,disable} helpers
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, skhan@linuxfoundation.org,
        niklas.soderlund@ragnatech.se--annotate
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
 <20200522075522.6190-5-dafna.hirschfeld@collabora.com>
 <20200610170344.GC201868@chromium.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <02c8bd4a-0fc1-fcc5-4d8b-63ff1d406988@collabora.com>
Date:   Wed, 10 Jun 2020 19:22:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610170344.GC201868@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10.06.20 19:03, Tomasz Figa wrote:
> Hi Dafna,
> 
> On Fri, May 22, 2020 at 09:55:21AM +0200, Dafna Hirschfeld wrote:
>> From: Helen Koike <helen.koike@collabora.com>
>>
>> Use v4l2_pipeline_stream_{enable,disable} to call .s_stream()
>> subdevice callbacks through the pipeline.
>> Those helpers are called only if the other capture is not streaming.
>>
>> If the other capture is streaming then he already did that for us
>> so we call s_stream only on the resizer that is connected to the
>> capture node.
>>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 104 ++++++------------
>>   1 file changed, 32 insertions(+), 72 deletions(-)
>>
> 
> Thank you for the patch. Please see my comments inline.
> 
> [snip]
>> +static int rkisp1_s_stream_subdev(struct rkisp1_capture *cap, int enable)
>> +{
>> +	struct rkisp1_device *rkisp1 = cap->rkisp1;
>> +	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
>> +	int ret;
>> +
>> +	/*
>> +	 * if the other capture is already streaming then we only need to
>> +	 * call s_stream of our reszier
>> +	 */
>> +	if (other->is_streaming) {
>> +		struct v4l2_subdev *rsz_sd  = &rkisp1->resizer_devs[cap->id].sd;
>> +
>> +		ret = v4l2_subdev_call(rsz_sd, video, s_stream, enable);
>> +		if (ret && ret != -ENOIOCTLCMD)
>> +			dev_err(rkisp1->dev,
>> +				"stream %s resizer '%s' failed (%d)\n",
>> +				enable ? "on" : "off", rsz_sd->name, ret);
> 
> Do we need this special case? Wouldn't v4l2_pipeline_stream_*() simply
> increment reference counters for the other entities?

I removed the stream count in v4 of the patchset since I thought it
might be problematic/confusing to add a field "stream_count" in
"struct v4l2_subdev" that is used and updated only by those helper functions

What do you think?

There is also the issue that both you and Sakari Ailus mentioned that
an isp driver can't know the subtopology of a sensor driver and how it handle the
s_stream callback on it's entities.

Thanks,
Dafna


> 
>> +	} else {
>> +		if (enable)
>> +			ret = v4l2_pipeline_stream_enable(&cap->vnode.vdev);
>> +		else
>> +			ret = v4l2_pipeline_stream_disable(&cap->vnode.vdev);
> 
> I wonder if this doesn't ask for just making the helper
> v4l2_pipeline_s_stream(..., int enable).> 
> Best regards,
> Tomasz
> 
