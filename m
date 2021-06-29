Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37F883B6FEB
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 11:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbhF2JOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 05:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbhF2JOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 05:14:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71568C061574
        for <linux-media@vger.kernel.org>; Tue, 29 Jun 2021 02:12:24 -0700 (PDT)
Received: from [192.168.1.136] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A15A4AD;
        Tue, 29 Jun 2021 11:12:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624957941;
        bh=uoIPeof1DilJ+/Vfb4AtrY8sQd2+Sy0NtyBMrnK4Lt0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oXKn0Ndf2hmws6BYjkz6mGURQ7j9xMa0aKSh4zjtH1Pcn5gEMC0AE7PzwqOaodbtO
         ve1Q4Ry64E+gkuowMVKOokq4Guy88V/3iA4rs4gN0dHyn8vNe9Y49fwbh8ehPpF7zi
         ynkppLbkclXvo4WxM/VHrYN9M0yLO9EJbTRp7v/g=
Subject: Re: [PATCH v3 38/38] media: ti-vpe: cal: add multiplexed streams
 support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-39-tomi.valkeinen@ideasonboard.com>
 <YLz0ZRz1a8uwc4Ii@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <f6a00836-433b-4a00-5604-301d251a3a18@ideasonboard.com>
Date:   Tue, 29 Jun 2021 12:12:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLz0ZRz1a8uwc4Ii@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 06/06/2021 19:14, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, May 24, 2021 at 02:09:09PM +0300, Tomi Valkeinen wrote:
>> Add routing and stream_config support to CAL driver.
>>
>> Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
>> separate streams at the same time.
>>
>> Add 8 video device nodes, each representing a single dma-engine, and set
>> the number of source pads on camerarx to 8. Each video node can be
>> connected to any of the source pads on either of the camerarx instances
>> using media links. Camerarx internal routing is used to route the
>> incoming CSI-2 streams to one of the 8 source pads.
>>
>> CAL doesn't support transcoding, so the driver currently allows changes
>> only on the camerarx sink side, and then copies the sink pad config to
>> the source pad. This becomes slighly more complex with 8 source pads and
>> multiple streams on the sink pad. A helper,
>> cal_camerarx_get_opposite_stream_format(), is added, which uses the
>> routing table to get the format from the "opposite" side.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal-camerarx.c | 303 ++++++++++++++++---
>>   drivers/media/platform/ti-vpe/cal-video.c    | 103 ++++++-
>>   drivers/media/platform/ti-vpe/cal.c          |  34 ++-
>>   drivers/media/platform/ti-vpe/cal.h          |  12 +-
>>   4 files changed, 385 insertions(+), 67 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> index cb6a37f47432..d09b06780b15 100644
>> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
>> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> @@ -49,15 +49,33 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
>>   {
>>   	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
>>   	u32 num_lanes = mipi_csi2->num_data_lanes;
>> -	const struct cal_format_info *fmtinfo;
>>   	u32 bpp;
>>   	s64 freq;
>>   
>> -	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
>> -	if (!fmtinfo)
>> +	/*
>> +	 * With multistream input we don't have bpp, and cannot use
>> +	 * V4L2_CID_PIXEL_RATE. Passing 0 as bpp causes v4l2_get_link_freq()
>> +	 * to return an error if it falls back to V4L2_CID_PIXEL_RATE.
>> +	 */
> 
> I agree with the comment, but I think what should be explained here is
> that we allow falling back to V4L2_CID_PIXEL_RATE when there's a single
> stream, and require V4L2_CID_LINK_FREQ otherwise.
> 
>> +
>> +	if (phy->stream_configs.num_configs == 0)
>>   		return -EINVAL;
>>   
>> -	bpp = fmtinfo->bpp;
>> +	if (phy->stream_configs.num_configs > 2) {
> 
> Should this be >= 2 ?

If there is one stream, from a sink pad to a source pad, we have two 
configs, as each pad+stream tuple has its own config.

  Tomi
