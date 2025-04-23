Return-Path: <linux-media+bounces-30867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7530A9980E
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 20:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 930425A3ADA
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A017728F523;
	Wed, 23 Apr 2025 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QDaTpMqz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A24927A12D;
	Wed, 23 Apr 2025 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745433547; cv=none; b=Cg9A747WXv14Mn0U2uVwm00Mi0KrbDuPV+LCdjWiIlkDYuvJ8Q/R8adL0O+jxphAFPZV66A3l+6rcXKROnCfNzPzSDcktEFTBInTujal+efOPmgtKzlg7q1USSbbWu38IPdZCKoouGo9lWZBZ8HoxlPS+YLZYAVgy7hbvH1sV8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745433547; c=relaxed/simple;
	bh=Da5ue9RjIhJYeuVbWMwaWkO0dr6ZpvisZ9ISxZIfbVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G56eJIWTPKLZ37+CVu/EtqDjA2V3ftvSWF7R9RV+IdGk7lbUEiST1XZ+2kDZ4S46XB35C+b72hjG5+nR4hi5JNAc3V/yn6Q/tYvlKyjN+ISKGYB1MwulfMD0w9OYZDZfvcHXSuPp0hCOiQpSNyWlJieMA7jakyvWtYM26ZTrH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QDaTpMqz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 374D81AE2;
	Wed, 23 Apr 2025 20:39:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745433541;
	bh=Da5ue9RjIhJYeuVbWMwaWkO0dr6ZpvisZ9ISxZIfbVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDaTpMqzN/b1n2bKtxUVICVoZbTzPdMMuUie/WSJlauXJkcVzfAKWLP9khOhZYvAT
	 9nziZjeo7ToIeQX5gOKOHpu1ku+BWbTh63ghdP5HyeqBT5Y1IsQARXACo6+J7O7QHO
	 icQNo78xrWCsgFaGUf18hhK1VNfCdsiUkNuvFgTQ=
Date: Wed, 23 Apr 2025 21:39:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v4 4/6] media: mt9m114: Allow set_selection while
 streaming
Message-ID: <20250423183900.GF2675@pendragon.ideasonboard.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
 <20250307093140.370061-5-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307093140.370061-5-mathis.foerst@mt.com>

Hi Mathis,

Thank you for the patch.

On Fri, Mar 07, 2025 at 10:31:38AM +0100, Mathis Foerst wrote:
> The current implementation does not apply changes to the crop-
> configuration of the sensor immediately if the sensor is in
> streaming state. The user has to stop and restart the stream for
> the changes to be applied.
> The same holds for changes to the V4L2 controls HFLIP & VFLIP.

Could you please split this in two patches, one for flip, abd one for
crop ? From flipping I think it's just a driver bug that I forgot to
issue a CONFIG_CHANGE, while for cropping it was by design. The commit
message for the crop patch can explain why this has to change, while the
commit message for the flip patch can just explains it's fixing a bug.
This will also reflect all the changes in the commit subjects, while
here the subject only mentions set_selection and hides the flip change.

> This can be undesirable e.g. in a calibration usecase where the user
> wants to see the impact of his changes in a live video stream.
> 
> Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
> in streaming state and issue a CONFIG_CHANGE to apply the changes
> immediately.
> Issue a CONFIG_CHANGE when the V4L2 controls HFLIP or VFLIP are set if the
> sensor is in streaming state to apply the change immediately.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  drivers/media/i2c/mt9m114.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 9a49dab65180..65b9124e464f 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -1098,6 +1098,13 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = cci_update_bits(sensor->regmap,
>  				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
>  				      mask, ctrl->val ? mask : 0, NULL);
> +		if (ret)
> +			return ret;

Add a blank line.

But it's a bug, you'll leak a PM reference count. You need to break
instead.

> +		if (sensor->streaming) {
> +			// Changing the flip config while streaming requires a CONFIG_CHANGE

C-style comments please, and reflow at 80 columns. Or possibly better,
you could copy the code from mt9m114_ifp_s_ctrl() for consistency:


		/*
		 * A Config-Change needs to be issued for the change to take
		 * effect. If we're not streaming ignore this, the change will
		 * be applied when the stream is started.
		 */
		if (ret || !sensor->streaming)
			break;

		ret = mt9m114_set_state(sensor,
					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);

Same comments for V4L2_CID_VFLIP.

> +			ret = mt9m114_set_state(sensor,
> +						MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);

As this can be an expensive operation, I think the hflip and vflip
controls should be put in a cluster, to be able to change them both in
one go.

> +		}
>  		break;
>  
>  	case V4L2_CID_VFLIP:
> @@ -1105,6 +1112,13 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = cci_update_bits(sensor->regmap,
>  				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
>  				      mask, ctrl->val ? mask : 0, NULL);
> +		if (ret)
> +			return ret;
> +		if (sensor->streaming) {
> +			// Changing the flip config while streaming requires a CONFIG_CHANGE
> +			ret = mt9m114_set_state(sensor,
> +						MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> +		}
>  		break;
>  
>  	default:
> @@ -1286,6 +1300,7 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
>  	struct mt9m114 *sensor = pa_to_mt9m114(sd);
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
> +	int ret = 0;
>  
>  	if (sel->target != V4L2_SEL_TGT_CROP)
>  		return -EINVAL;
> @@ -1316,10 +1331,21 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
>  	format->width = crop->width;
>  	format->height = crop->height;
>  
> -	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		mt9m114_pa_ctrl_update_blanking(sensor, format);
> +	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> +		return ret;
>  
> -	return 0;
> +	mt9m114_pa_ctrl_update_blanking(sensor, format);
> +
> +	/* Apply values immediately if streaming */

Changing the crop rectangle modifies the output size of the PA. It will
not match the size the IFP expects at its input anymore. Could you
please explain how this will work and why it won't cause issues ?

> +	if (sensor->streaming) {
> +		ret = mt9m114_configure_pa(sensor, state);
> +		if (ret)
> +			return ret;
> +		// Changing the cropping config requires a CONFIG_CHANGE
> +		ret = mt9m114_set_state(sensor,	MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> +	}
> +
> +	return ret;
>  }
>  
>  static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {

-- 
Regards,

Laurent Pinchart

