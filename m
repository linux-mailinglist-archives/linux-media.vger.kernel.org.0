Return-Path: <linux-media+bounces-36736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55882AF83B0
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 827386E1FD0
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D65F2BEFF6;
	Thu,  3 Jul 2025 22:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WY2wg+++"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB2F2BE65D;
	Thu,  3 Jul 2025 22:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582498; cv=none; b=R0np44MMUx2LQuGo74ob/R3WvTg5KEYasmw9cwL/jBOZ74cMQYo7CFuZjD1G4VEIJUcNDcwtAa8Ugj7FeaxQyLVnxHfN9fKXGNhzkYyzuAkg5cpoK23TfMneMmFubVVoArlUj7ar5rcYfsChNGTr0K0OMl71r6H+ur4TfdVMoWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582498; c=relaxed/simple;
	bh=5zhoS3XJp2bkMoOA3i0nh5f5l1GHwwdsFW0ObSmbcpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUPEIxGGYmme1rYrAY63IGR5zmh7Q8Jj7BS+LmTxNS43mkozjPkClaIxIujrJPda7q8tTkZftkYitjTT3AZ16KK8CfR6eXVjN+dq1oHVhIZXDkYfkBhixVKR3i2WZwK9/DfOOXYIb4u78KznDs1aFZDcFgPG48BXVCzVvls0TaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WY2wg+++; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 20FE8667;
	Fri,  4 Jul 2025 00:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751582470;
	bh=5zhoS3XJp2bkMoOA3i0nh5f5l1GHwwdsFW0ObSmbcpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WY2wg+++v2xWQAmaAGAFq6gG8r0lqybny2f5sBAANEjPPCyAH2NLs2WBbk0VNJR9o
	 6POsuT0MO4M/6wr3Lqq3zxpZmNB6qSnpX37w+ealfP9Rpv8YmCIr9Ze/7HtJ/YDWtl
	 1/vImWyJTCqk1xe9gCZN8mszGNQ2GaDtrqQqxQmw=
Date: Fri, 4 Jul 2025 01:41:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] media: adv7180: Move adv7180_set_power() and
 init_device()
Message-ID: <20250703224107.GC3798@pendragon.ideasonboard.com>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
 <20250703205223.2810806-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703205223.2810806-2-niklas.soderlund+renesas@ragnatech.se>

On Thu, Jul 03, 2025 at 10:52:13PM +0200, Niklas Söderlund wrote:
> Move the two functions adv7180_set_power() and init_device() earlier in
> the file so they in future changes can be used from .querystd and
> .s_stream as the driver is reworked to drop the usage of .s_power.
> 
> While at it fix two style issues in init_device() that checkpatch
> complains about.
> 
>   - Two cases of indentation issues for function arguments split over
>     multiple lines.
> 
>   - The repetition of the word 'interrupts' in a comment.
> 
> Apart from these style fixes the functions are moved verbatim and there
> are no functional changes.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/adv7180.c | 176 ++++++++++++++++++------------------
>  1 file changed, 88 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 6e50b14f888f..2519bc53333c 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -274,6 +274,38 @@ static int adv7180_vpp_write(struct adv7180_state *state, unsigned int reg,
>  	return i2c_smbus_write_byte_data(state->vpp_client, reg, value);
>  }
>  
> +static int adv7180_set_power(struct adv7180_state *state, bool on)
> +{
> +	u8 val;
> +	int ret;
> +
> +	if (on)
> +		val = ADV7180_PWR_MAN_ON;
> +	else
> +		val = ADV7180_PWR_MAN_OFF;
> +
> +	ret = adv7180_write(state, ADV7180_REG_PWR_MAN, val);
> +	if (ret)
> +		return ret;
> +
> +	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
> +		if (on) {
> +			adv7180_csi_write(state, 0xDE, 0x02);
> +			adv7180_csi_write(state, 0xD2, 0xF7);
> +			adv7180_csi_write(state, 0xD8, 0x65);
> +			adv7180_csi_write(state, 0xE0, 0x09);
> +			adv7180_csi_write(state, 0x2C, 0x00);
> +			if (state->field == V4L2_FIELD_NONE)
> +				adv7180_csi_write(state, 0x1D, 0x80);
> +			adv7180_csi_write(state, 0x00, 0x00);
> +		} else {
> +			adv7180_csi_write(state, 0x00, 0x80);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static v4l2_std_id adv7180_std_to_v4l2(u8 status1)
>  {
>  	/* in case V4L2_IN_ST_NO_SIGNAL */
> @@ -514,38 +546,6 @@ static void adv7180_set_reset_pin(struct adv7180_state *state, bool on)
>  	}
>  }
>  
> -static int adv7180_set_power(struct adv7180_state *state, bool on)
> -{
> -	u8 val;
> -	int ret;
> -
> -	if (on)
> -		val = ADV7180_PWR_MAN_ON;
> -	else
> -		val = ADV7180_PWR_MAN_OFF;
> -
> -	ret = adv7180_write(state, ADV7180_REG_PWR_MAN, val);
> -	if (ret)
> -		return ret;
> -
> -	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
> -		if (on) {
> -			adv7180_csi_write(state, 0xDE, 0x02);
> -			adv7180_csi_write(state, 0xD2, 0xF7);
> -			adv7180_csi_write(state, 0xD8, 0x65);
> -			adv7180_csi_write(state, 0xE0, 0x09);
> -			adv7180_csi_write(state, 0x2C, 0x00);
> -			if (state->field == V4L2_FIELD_NONE)
> -				adv7180_csi_write(state, 0x1D, 0x80);
> -			adv7180_csi_write(state, 0x00, 0x00);
> -		} else {
> -			adv7180_csi_write(state, 0x00, 0x80);
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>  static int adv7180_s_power(struct v4l2_subdev *sd, int on)
>  {
>  	struct adv7180_state *state = to_state(sd);
> @@ -889,6 +889,62 @@ static int adv7180_g_tvnorms(struct v4l2_subdev *sd, v4l2_std_id *norm)
>  	return 0;
>  }
>  
> +static int init_device(struct adv7180_state *state)
> +{
> +	int ret;
> +
> +	mutex_lock(&state->mutex);
> +
> +	adv7180_set_power_pin(state, true);
> +	adv7180_set_reset_pin(state, false);
> +
> +	adv7180_write(state, ADV7180_REG_PWR_MAN, ADV7180_PWR_MAN_RES);
> +	usleep_range(5000, 10000);
> +
> +	ret = state->chip_info->init(state);
> +	if (ret)
> +		goto out_unlock;
> +
> +	ret = adv7180_program_std(state);
> +	if (ret)
> +		goto out_unlock;
> +
> +	adv7180_set_field_mode(state);
> +
> +	/* register for interrupts */
> +	if (state->irq > 0) {
> +		/* config the Interrupt pin to be active low */
> +		ret = adv7180_write(state, ADV7180_REG_ICONF1,
> +				    ADV7180_ICONF1_ACTIVE_LOW |
> +				    ADV7180_ICONF1_PSYNC_ONLY);
> +		if (ret < 0)
> +			goto out_unlock;
> +
> +		ret = adv7180_write(state, ADV7180_REG_IMR1, 0);
> +		if (ret < 0)
> +			goto out_unlock;
> +
> +		ret = adv7180_write(state, ADV7180_REG_IMR2, 0);
> +		if (ret < 0)
> +			goto out_unlock;
> +
> +		/* enable AD change interrupts */
> +		ret = adv7180_write(state, ADV7180_REG_IMR3,
> +				    ADV7180_IRQ3_AD_CHANGE);
> +		if (ret < 0)
> +			goto out_unlock;
> +
> +		ret = adv7180_write(state, ADV7180_REG_IMR4, 0);
> +		if (ret < 0)
> +			goto out_unlock;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&state->mutex);
> +
> +	return ret;
> +}
> +
>  static int adv7180_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct adv7180_state *state = to_state(sd);
> @@ -1359,62 +1415,6 @@ static const struct adv7180_chip_info adv7282_m_info = {
>  	.select_input = adv7182_select_input,
>  };
>  
> -static int init_device(struct adv7180_state *state)
> -{
> -	int ret;
> -
> -	mutex_lock(&state->mutex);
> -
> -	adv7180_set_power_pin(state, true);
> -	adv7180_set_reset_pin(state, false);
> -
> -	adv7180_write(state, ADV7180_REG_PWR_MAN, ADV7180_PWR_MAN_RES);
> -	usleep_range(5000, 10000);
> -
> -	ret = state->chip_info->init(state);
> -	if (ret)
> -		goto out_unlock;
> -
> -	ret = adv7180_program_std(state);
> -	if (ret)
> -		goto out_unlock;
> -
> -	adv7180_set_field_mode(state);
> -
> -	/* register for interrupts */
> -	if (state->irq > 0) {
> -		/* config the Interrupt pin to be active low */
> -		ret = adv7180_write(state, ADV7180_REG_ICONF1,
> -						ADV7180_ICONF1_ACTIVE_LOW |
> -						ADV7180_ICONF1_PSYNC_ONLY);
> -		if (ret < 0)
> -			goto out_unlock;
> -
> -		ret = adv7180_write(state, ADV7180_REG_IMR1, 0);
> -		if (ret < 0)
> -			goto out_unlock;
> -
> -		ret = adv7180_write(state, ADV7180_REG_IMR2, 0);
> -		if (ret < 0)
> -			goto out_unlock;
> -
> -		/* enable AD change interrupts interrupts */
> -		ret = adv7180_write(state, ADV7180_REG_IMR3,
> -						ADV7180_IRQ3_AD_CHANGE);
> -		if (ret < 0)
> -			goto out_unlock;
> -
> -		ret = adv7180_write(state, ADV7180_REG_IMR4, 0);
> -		if (ret < 0)
> -			goto out_unlock;
> -	}
> -
> -out_unlock:
> -	mutex_unlock(&state->mutex);
> -
> -	return ret;
> -}
> -
>  static int adv7180_probe(struct i2c_client *client)
>  {
>  	struct device_node *np = client->dev.of_node;

-- 
Regards,

Laurent Pinchart

