Return-Path: <linux-media+bounces-11123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9434D8BF7EB
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 10:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A3E285A9E
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 08:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D7F3B7A0;
	Wed,  8 May 2024 08:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c2Jn7XVz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018273CF73;
	Wed,  8 May 2024 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715155333; cv=none; b=lOO5Mw3FpIWv/2qjS92pr+wkVXcQ+PqdZZgujfQ6zZFmh+/rSJDheHWdbFapvWfmEFvsn/DZrBj33HbHkq4X/Qng48p+kfQfvUrAQ+ACthF6oVP0B7xd23HXLLHRNgZUmGGM7X8ojSpt8r/dH2FSxqQR0uY5AAcUhH3u+qbZ940=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715155333; c=relaxed/simple;
	bh=twUq4MHmgImpv7wpG04Pqx31slplSSwxfOhgDBytNPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrqALKyAUULLF616xCllBuH2gePIppt/Dv+KynEl9/KZd/a8P5EXXb7x6u+9Nwr6tZ+IMMWFcUCHLxTReaRkaYUH2KonswSVAKs9pShCIm/+N9QUujCqpK6ZOZBE4Rah0w0GjUHG9dPnXHjRcb7sP+APivLfiQmhK6q7Ud79Hzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c2Jn7XVz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A00AD9CE;
	Wed,  8 May 2024 10:02:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715155324;
	bh=twUq4MHmgImpv7wpG04Pqx31slplSSwxfOhgDBytNPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2Jn7XVzwml8Q8IMu8Nb4e+vL9nXiZ4CK7chUOhkRzgvcUU/MFzuylLhSt3FMwfFt
	 PJo0oCBKPRnEbuUcIeDGlZTlwwigwoof9j4r1Oq0BCJ0KfZUS1uuHxtmF5haezGZr+
	 4cSJTgBSZEveoidzGQ3p88yLzL6sQpJHHV5YKoOY=
Date: Wed, 8 May 2024 10:02:03 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Martina Krasteva <quic_mkrastev@quicinc.com>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: Fix imx412 exposure control
Message-ID: <dvyed4grpazqk7a3tz6dqwpkd76ghtrt4euinxt3kycdeh63ez@ljgfjsfhypix>
References: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v2-1-2e665f072f8f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v2-1-2e665f072f8f@linaro.org>

Hi Bryan

On Mon, May 06, 2024 at 11:38:26PM GMT, Bryan O'Donoghue wrote:
> Currently we have the following algorithm to calculate what value should be
> written to the exposure control of imx412.
>
> lpfr = imx412->vblank + imx412->cur_mode->height;
> shutter = lpfr - exposure;
>
> The 'shutter' value is given to IMX412_REG_EXPOSURE_CIT however, the above
> algorithm will result in the value given to IMX412_REG_EXPOSURE_CIT
> decreasing as the requested exposure value from user-space goes up.
>
> e.g.
> [ 2255.713989] imx412 20-001a: Received exp 1608, analog gain 0
> [ 2255.714002] imx412 20-001a: Set exp 1608, analog gain 0, shutter 1938, lpfr 3546
> [ 2256.302770] imx412 20-001a: Received exp 2586, analog gain 100
> [ 2256.302800] imx412 20-001a: Set exp 2586, analog gain 100, shutter 960, lpfr 3546
> [ 2256.753755] imx412 20-001a: Received exp 3524, analog gain 110
> [ 2256.753772] imx412 20-001a: Set exp 3524, analog gain 110, shutter 22, lpfr 3546
>
> This behaviour results in the image having less exposure as the requested
> exposure value from user-space increases.
>
> Other sensor drivers such as ov5675, imx218, hid556 and others take the
> requested exposure value and directly.

has the phrase been truncated or is it me reading it wrong ?

>
> Take the example of the above cited sensor drivers and directly apply the
> requested exposure value from user-space. The 'lpfr' variable still
> functions as before but the 'shutter' variable can be dispensed with as a
> result.
>
> Once done a similar run of the test application requesting higher exposure
> looks like this, with 'exp' written directly to the sensor.
>
> [  133.207884] imx412 20-001a: Received exp 1608, analog gain 0
> [  133.207899] imx412 20-001a: Set exp 1608, analog gain 0, lpfr 3546
> [  133.905309] imx412 20-001a: Received exp 2844, analog gain 100
> [  133.905344] imx412 20-001a: Set exp 2844, analog gain 100, lpfr 3546
> [  134.241705] imx412 20-001a: Received exp 3524, analog gain 110
> [  134.241775] imx412 20-001a: Set exp 3524, analog gain 110, lpfr 3546
>
> The result is then setting the sensor exposure to lower values results in
> darker, less exposure images and vice versa with higher exposure values.
>
> Fixes: 9214e86c0cc1 ("media: i2c: Add imx412 camera sensor driver")
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165-rb5/imx577
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Using libcamera/SoftISP on a Qualcomm RB5 with the imx577 sensor I found
> that unlike on other platforms such as the Lenovo x13s/ov5675 the image was
> constantly getting darker and darker.
>
> At first I assumed a bug in SoftISP but, looking into the code it appeared
> SoftISP was requesting higher and higher exposure values which resulted in
> the image getting progressively darker.
>
> To my mind the software contract between user-space and kernel should be
> increasing exposure requests always meant higher exposure but, to be
> certain I asked around on IRC.
>
> Those polled agreed in principle that the software contract was consistent
> across sensors.
>
> Looking at the range of imx sensors, it appears this particular error has
> been replicated a number of times but, I haven't so far really drilled into
> each sensor.

Ouch, what other driver have the same issue ?

>
> As a first pass I'm submitting the fix for the sensor I have but, I expect
> if this fix is acceptable upstream it should be pushed to most of the imx
> sensors with what seems to be copy/paste code for the exposure.
> ---
> Changes in v2:
> - Fix typo in patch 42 -> 412
> - Link to v1: https://lore.kernel.org/r/20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v1-1-4b3a9426bde8@linaro.org
> ---
>  drivers/media/i2c/imx412.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index 0efce329525e4..7d1f7af0a9dff 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -542,14 +542,13 @@ static int imx412_update_controls(struct imx412 *imx412,
>   */
>  static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
>  {
> -	u32 lpfr, shutter;
> +	u32 lpfr;
>  	int ret;
>
>  	lpfr = imx412->vblank + imx412->cur_mode->height;
> -	shutter = lpfr - exposure;
>
> -	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, shutter %u, lpfr %u",
> -		exposure, gain, shutter, lpfr);
> +	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, lpfr %u",
> +		exposure, gain, lpfr);
>
>  	ret = imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 1);
>  	if (ret)
> @@ -559,7 +558,7 @@ static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
>  	if (ret)
>  		goto error_release_group_hold;
>
> -	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, shutter);
> +	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure);

No datasheet here, can you confirm the IMX412_REG_EXPOSURE_CIT
register is actually in lines ?

Apart from that, as the CID_EXPOSURE control limit are correctly
updated when a new VBLANK is set by taking into account the exposure
margins, I think writing the control value to the register is the
right thing to do (if the register is in lines of course)

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  	if (ret)
>  		goto error_release_group_hold;
>
>
> ---
> base-commit: ff3959189f1b97e99497183d76ab9b007bec4c88
> change-id: 20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-f1fee6070641
>
> Best regards,
> --
> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
>

