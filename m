Return-Path: <linux-media+bounces-60823-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPLNFyan/GmwSQAAu9opvQ
	(envelope-from <linux-media+bounces-60823-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:52:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB254EA958
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08BB93052CBF
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 14:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BD642314F;
	Thu,  7 May 2026 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XyzpgjOf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5C402BA4;
	Thu,  7 May 2026 14:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164974; cv=none; b=mqHcgmwmmaBlwx4o/liah3gUFlIm8E3mDyVVZLj0zL783X0LPrwNlDoJLqeXB06F3i5oFUyiwutGOiM9mcCpWzXOqG2chU+Z1JKtLT8UtRoz5cD2+/+sMIuYtcyJ3bkbQUMw8nMRFafGfB9DMiWoiMvcvtWc3gUZRQLc9s0TjmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164974; c=relaxed/simple;
	bh=v+MCQ+nCn03XkGH4i4b8e5HTEJKf5APF+btAKzvLZsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNWQ8DXQT9GEewY2cbKv7c064PAY3tjPM2wtAxIZA3YkAxw79b9o9IXurJCqVNsNEhFpLNOE6sCKnXhBKL6Id/Y00rb4joAQvIqTNUrtMNH7iU2gbavB1+o/508lyOF0emdwprfHpl5cXP57fhynXmTu5AJNScrprcfSO7tGUzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XyzpgjOf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DF6B664;
	Thu,  7 May 2026 16:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778164964;
	bh=v+MCQ+nCn03XkGH4i4b8e5HTEJKf5APF+btAKzvLZsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XyzpgjOfmQnCpp5RWaogSPPzRn3/ynmndfqB9kiauRXHkH1IsiwB3dWqlTcI1wmFT
	 eJT8sMXfpEtn2UIa/VRiV+iYge4+pYbLckxuKr1i8ay+AwfoBO1URWoQpR9JXacG8i
	 aVdLwNt2y/hiZxkv7Tiu6ZQAeQzsIqVOVI56ykqE=
Date: Thu, 7 May 2026 16:42:46 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 10/13] media: imx355: Add support for get_selection
Message-ID: <afyjZ-wSfwm4jgnH@zed>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-10-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-10-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: DEB254EA958
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60823-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,raspberrypi.com:email]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 07:23:48PM +0100, Dave Stevenson wrote:
> Provide all the cropping information via get_selection.

I think this could be simplified if the driver is ported to use the
active state.
See df3ef05b51e02ef9386346288c1e63f366372f5b

I'm afraid usage of the active state is warmly suggested nowadays,
especially if you're adding code that has to deal with ACTIVE/TRY or
initializes per-fh data in open().

Is it too much yak shaving to ask ?

>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx355.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 5a3bfcd0f51c..d8d7cc0ceab9 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -88,6 +88,11 @@
>  /* number of data lanes */
>  #define IMX355_DATA_LANES		4
>
> +#define IMX355_PIXEL_ARRAY_TOP		0
> +#define IMX355_PIXEL_ARRAY_LEFT		0
> +#define IMX355_PIXEL_ARRAY_WIDTH	3280
> +#define IMX355_PIXEL_ARRAY_HEIGHT	2464
> +
>  struct imx355_reg {
>  	u16 address;
>  	u8 val;
> @@ -671,6 +676,7 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  	struct imx355 *imx355 = to_imx355(sd);
>  	struct v4l2_mbus_framefmt *try_fmt =
>  		v4l2_subdev_state_get_format(fh->state, 0);
> +	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(fh->state, 0);
>
>  	mutex_lock(&imx355->mutex);
>
> @@ -680,6 +686,11 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  	try_fmt->code = imx355_get_format_code(imx355);
>  	try_fmt->field = V4L2_FIELD_NONE;
>
> +	crop->left = imx355->cur_mode->x_add_start;
> +	crop->top = imx355->cur_mode->y_add_start;
> +	crop->width = imx355->cur_mode->width;
> +	crop->height = imx355->cur_mode->height;
> +
>  	mutex_unlock(&imx355->mutex);
>
>  	return 0;
> @@ -886,6 +897,52 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>
> +static void
> +__imx355_get_pad_crop(struct imx355 *imx355,
> +		      struct v4l2_subdev_state *sd_state, unsigned int pad,
> +		      enum v4l2_subdev_format_whence which, struct v4l2_rect *r)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		*r = *v4l2_subdev_state_get_crop(sd_state, pad);
> +		break;
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		r->left = imx355->cur_mode->x_add_start;
> +		r->top = imx355->cur_mode->y_add_start;
> +		r->width = imx355->cur_mode->width;
> +		r->height = imx355->cur_mode->height;
> +		break;
> +	}
> +}
> +
> +static int imx355_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		struct imx355 *imx355 = to_imx355(sd);
> +
> +		mutex_lock(&imx355->mutex);
> +		__imx355_get_pad_crop(imx355, sd_state, sel->pad, sel->which,
> +				      &sel->r);
> +		mutex_unlock(&imx355->mutex);
> +
> +		return 0;
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.top = IMX355_PIXEL_ARRAY_TOP;
> +		sel->r.left = IMX355_PIXEL_ARRAY_LEFT;
> +		sel->r.width = IMX355_PIXEL_ARRAY_WIDTH;
> +		sel->r.height = IMX355_PIXEL_ARRAY_HEIGHT;
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  /* Start streaming */
>  static int imx355_start_streaming(struct imx355 *imx355)
>  {
> @@ -1062,6 +1119,7 @@ static const struct v4l2_subdev_pad_ops imx355_pad_ops = {
>  	.get_fmt = imx355_get_pad_format,
>  	.set_fmt = imx355_set_pad_format,
>  	.enum_frame_size = imx355_enum_frame_size,
> +	.get_selection = imx355_get_selection,
>  };
>
>  static const struct v4l2_subdev_ops imx355_subdev_ops = {
>
> --
> 2.34.1
>
>

