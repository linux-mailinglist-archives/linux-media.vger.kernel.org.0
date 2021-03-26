Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C824C349E53
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 02:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhCZBBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 21:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhCZBBD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 21:01:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79CC9C06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 18:01:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32CEA443;
        Fri, 26 Mar 2021 02:01:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616720460;
        bh=YSDzt47d66DvqmyS3xrbGYQag354SLiXHCRGr4jgT84=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DuqqKlTKLJQXXGMB8/6ZUhWkTif6NUIl7tFC8/mWHRAoaIOJsMI6+0Qhmp6bCyEL1
         xHVJmy81iJag4cbWh9jkVx+LUSZqzCx9DhOAgq90Fuug8D1d1xXio9jc1hHKzHMHTa
         SnjIcKeiYp6maFRR/gj3i9caBJTDnC8ydjTnS/RY=
Date:   Fri, 26 Mar 2021 03:00:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH] drm/bridge: adv7511: fix support for large EDIDs
Message-ID: <YF0yIDWC+7HtMBLb@pendragon.ideasonboard.com>
References: <904185be-19ea-a321-a227-d4e659fe1b68@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <904185be-19ea-a321-a227-d4e659fe1b68@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Wed, Mar 24, 2021 at 09:53:32AM +0100, Hans Verkuil wrote:
> While testing support for large (> 256 bytes) EDIDs on the Renesas
> Koelsch board I noticed that the adv7511 bridge driver only read the
> first two blocks.
> 
> The media V4L2 version for the adv7511 (drivers/media/i2c/adv7511-v4l2.c)
> handled this correctly.
> 
> Besides a simple bug when setting the segment register (it was set to the
> block number instead of block / 2), the logic of the code was also weird.
> In particular reading the DDC_STATUS is odd: this is unrelated to EDID
> reading.

Bits 3:0 of DDC_STATUS report the DDC controller state, which can be
used to wait until the DDC controller is idle (it reports, among other
possible states, if an EDID read is in progress). Other options are
possible of course, including waiting for ADV7511_INT0_EDID_READY as
done in adv7511_wait_for_edid(), but I wonder if the !irq case in
adv7511_wait_for_edid() wouldn't be better of busy-looping on the DDC
status instead of running the interrupt handler manually. That's
unrelated to this patch though.

> The reworked code just waits for any EDID segment reads to finish (this
> does nothing if the a segment is already read), checks if the desired
> segment matches the read segment, and if not, then it requests the new
> segment and waits again for the EDID segment to be read.
> 
> Finally it checks if the currently buffered EDID segment contains the
> desired EDID block, and if not it will update the EDID buffer from
> the adv7511.
> 
> Tested with my Koelsch board and with EDIDs of 1, 2, 3 and 4 blocks.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Testing on the Renesas board also requires these two adv7604 patches
> if you want to test with an HDMI cable between the HDMI input and output:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/00882808-472a-d429-c565-a701da579ead@xs4all.nl/
> https://patchwork.linuxtv.org/project/linux-media/patch/c7093e76-ffb4-b19c-f576-b264f935a3ce@xs4all.nl/
> ---
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 76555ae64e9c..9e8db1c60167 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -328,6 +328,7 @@ static void adv7511_set_link_config(struct adv7511 *adv7511,
>  static void __adv7511_power_on(struct adv7511 *adv7511)
>  {
>  	adv7511->current_edid_segment = -1;
> +	adv7511->edid_read = false;
> 
>  	regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER,
>  			   ADV7511_POWER_POWER_DOWN, 0);
> @@ -529,29 +530,35 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
>  	struct adv7511 *adv7511 = data;
>  	struct i2c_msg xfer[2];
>  	uint8_t offset;
> +	unsigned int cur_segment;
>  	unsigned int i;
>  	int ret;
> 
>  	if (len > 128)
>  		return -EINVAL;
> 
> -	if (adv7511->current_edid_segment != block / 2) {
> -		unsigned int status;
> +	/* wait for any EDID segment reads to finish */
> +	adv7511_wait_for_edid(adv7511, 200);

Why do we need to wait for the EDID read to complete here ? Does the
ADV7511 initiate an EDID read by itself that we need to wait for it to
complete ?

> 
> -		ret = regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
> -				  &status);
> +	ret = regmap_read(adv7511->regmap, ADV7511_REG_EDID_SEGMENT, &cur_segment);
> +	if (ret < 0)
> +		return ret;

Do we need to read this from the device, can't we instead use
current_edid_segment ?

> +
> +	/*
> +	 * If the current read segment does not match what we need, then
> +	 * write the new segment and wait for it to be read.
> +	 */
> +	if (cur_segment != block / 2) {
> +		adv7511->edid_read = false;
> +		cur_segment = block / 2;
> +		regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
> +			     cur_segment);
> +		ret = adv7511_wait_for_edid(adv7511, 200);
>  		if (ret < 0)
>  			return ret;
> +	}
> 
> -		if (status != 2) {
> -			adv7511->edid_read = false;
> -			regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
> -				     block);
> -			ret = adv7511_wait_for_edid(adv7511, 200);
> -			if (ret < 0)
> -				return ret;
> -		}
> -
> +	if (adv7511->current_edid_segment != cur_segment) {

Do you need to test this condition separately from the previous one ?

>  		/* Break this apart, hopefully more I2C controllers will
>  		 * support 64 byte transfers than 256 byte transfers
>  		 */
> @@ -579,7 +586,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
>  			offset += 64;
>  		}
> 
> -		adv7511->current_edid_segment = block / 2;
> +		adv7511->current_edid_segment = cur_segment;
>  	}
> 
>  	if (block % 2 == 0)

-- 
Regards,

Laurent Pinchart
