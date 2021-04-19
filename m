Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C91E364275
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 15:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239438AbhDSNJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 09:09:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47578 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239525AbhDSNJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 09:09:08 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B33DE11B8;
        Mon, 19 Apr 2021 15:08:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618837718;
        bh=atTYvQsCecaVsY0iX4kxpgGk5LJ7oD0Rnw3lGaT+qIM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Oqa+ERHtCTO/ove49rXKEUjzoafPlUKy3FTBFaLTmzals9LN3OO3gTD7dqhcwTisF
         0cnerLxtIpjqNGTZd4m7hSfSfCdq/HVKaJYLJ11p8CbdTXHA/C79WcxOX0/+liKUoO
         XUbTIVZkmFgtcL9YiJgTvy+aSaMt8r8rs2GT+B3E=
Subject: Re: [PATCH 27/28] media: ti-vpe: cal: remove cal_camerarx->fmtinfo
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-28-tomi.valkeinen@ideasonboard.com>
 <YHwzIJO0zwUtIVej@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <e7499875-c817-b54a-e65b-8f6a5a12e5c7@ideasonboard.com>
Date:   Mon, 19 Apr 2021 16:08:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwzIJO0zwUtIVej@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 16:24, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:56PM +0300, Tomi Valkeinen wrote:
>> struct cal_camerarx has fmtinfo field which is used to point to the
>> current active input format. The only place where the field is used is
>> cal_camerarx_get_ext_link_freq().
>>
>> With multiple streams the whole concept of single input format is not
>> valid anymore, so lets remove the field by looking up the format in
>> cal_camerarx_get_ext_link_freq(), making it easier to handle the
>> multistream-case in the following patches.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal-camerarx.c | 12 ++++++++----
>>   drivers/media/platform/ti-vpe/cal.h          |  1 -
>>   2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> index 25f4692d210e..efe6513d69e8 100644
>> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
>> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> @@ -49,8 +49,15 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
>>   {
>>   	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
>>   	u32 num_lanes = mipi_csi2->num_data_lanes;
>> -	u32 bpp = phy->fmtinfo->bpp;
>> +	u32 bpp;
>>   	s64 freq;
>> +	const struct cal_format_info *fmtinfo;
> 
> I'd declare this after num_lanes as I like the reverse xmas tree order.
> 
>> +
>> +	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
>> +	if (!fmtinfo)
>> +		return -EINVAL;
>> +
>> +	bpp = fmtinfo->bpp;
> 
> I wonder if we'll end up dropping this, as falling back to
> V4L2_CID_PIXEL_RATE in v4l2_get_link_freq() makes less sense when using
> multiplexed streams. Something to worry about later.

You're right, it goes behind an if in an unposted patch:

if (cal_streams_api) {
	bpp = 0;
} else {
	const struct cal_format_info *fmtinfo;

	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
	if (!fmtinfo)
		return -EINVAL;

	bpp = fmtinfo->bpp;
}

and calling v4l2_get_link_freq with mul == 0 (bpp) will result in ENOENT if
V4L2_CID_LINK_FREQ is not available.

  Tomi
