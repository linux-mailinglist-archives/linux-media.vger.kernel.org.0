Return-Path: <linux-media+bounces-39442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F60B20C81
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 16:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C85A160B5A
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 14:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47632E174C;
	Mon, 11 Aug 2025 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org header.b="fRYW9HR9"
X-Original-To: linux-media@vger.kernel.org
Received: from mailo.com (msg-3.mailo.com [213.182.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8832E0B79;
	Mon, 11 Aug 2025 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.182.54.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923262; cv=none; b=RNVZtBe7AMPm7U9DW5uEL193t9RIxaZfjp7MdUSjF0eGiCOYDnj9u7WmAEOnTINEKeBY4Sqcpyb5tlzWm2DzkA/xdZIOSAWZ85og9nzKGprAHbfRKiQFvgENBBnI7KnLmk0YPWSY+Hmr8lOE2GCTlHcG4jOd04giSshUuq/xq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923262; c=relaxed/simple;
	bh=WcbLtLQBy91cBUeeDQnn5F397N+v9eItLBsxZhKw2/A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bNjkGENJ/HW7q9Ksev+PwJgFoAHdU+plhalAKLsvpSvE6J+OW55r2fAEU9Vl71YHQEI26GLfIgP8f0w6XIqB+cJczdZjXe9LA2rjEGej8OQ0mB+9wY5mXj4xysLaZLRBsp7RNo3o/pzJyDE546a3BFVfBbm0HGZAEklRNaOo3ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailoo.org; spf=pass smtp.mailfrom=mailoo.org; dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org header.b=fRYW9HR9; arc=none smtp.client-ip=213.182.54.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailoo.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
	t=1754922631; bh=WcbLtLQBy91cBUeeDQnn5F397N+v9eItLBsxZhKw2/A=;
	h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fRYW9HR9yCyYZB8EAkEWKgb2fGUrajHuXntl6PB9kwHOCW+NTyKiOHot+bu8FVi+Z
	 uM6FZzrOv3VOPv53jOGriUjMyEk0VHFcY+xNV1lX5IGsS/IT+53AnTgllzi3TG3bEd
	 4EV1pHsvmRlerk2o4/ZzW/IL4nmqW4Kwku08tFss=
Received: by b221-5.in.mailobj.net [192.168.90.25] with ESMTP
	via ip-22.mailoo.org [213.182.54.22]
	Mon, 11 Aug 2025 16:30:31 +0200 (CEST)
X-EA-Auth: Hg/exFp/+pX8QNqmfMA6P7RGU73U9i67bK+qYwUzVyHuqb3BttX1KbhCvRFdjjtEi5ZZJghPIEtv0vvHIQJLHDWolXoFlwutM0PrVXB5LYk=
Message-ID: <bd5aec71222a98e51e6f0602b85d04d6ff3d6885.camel@mailoo.org>
Subject: Re: [PATCH] media: i2c: ov8858: Add sensor's pixel matrix size
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth	
 <nicholas@rothemail.net>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Date: Mon, 11 Aug 2025 16:30:30 +0200
In-Reply-To: <20250509-ov8858-crop-v1-1-403a0993c1de@mailoo.org>
References: <20250509-ov8858-crop-v1-1-403a0993c1de@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42app2) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 09 mai 2025 =C3=A0 09:33 +0200, Vincent Knecht via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
>=20
> The OV8858 pixel array is composed as:
> - vertically: 16 dummy columns, 3264 valid ones and 16 dummy columns for
> =C2=A0 a total of 3296 columns
> - horizontally: 24 optical black lines, 16 dummy ones, 2448 valid, 16
> =C2=A0 dummies and 24 optical black lines for a total of 2528 lines
>=20
> Set native and active sensor pixel sizes.
>=20
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> =C2=A0drivers/media/i2c/ov8858.c | 37 +++++++++++++++++++++++++++++++++++=
++
> =C2=A01 file changed, 37 insertions(+)
>=20
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> index 95f9ae7948463e95ce0b2cb58195de02ee72c02a..9a86aa46e20b48ef4bae7d70c=
e485985c1ba886a 100644
> --- a/drivers/media/i2c/ov8858.c
> +++ b/drivers/media/i2c/ov8858.c
> @@ -77,6 +77,14 @@
> =C2=A0
> =C2=A0#define REG_NULL			0xffff
> =C2=A0
> +/* OV8858 native and active pixel array size */
> +#define OV8858_NATIVE_WIDTH		3296U
> +#define OV8858_NATIVE_HEIGHT		2528U
> +#define OV8858_PIXEL_ARRAY_LEFT		16U
> +#define OV8858_PIXEL_ARRAY_TOP		40U
> +#define OV8858_PIXEL_ARRAY_WIDTH	3264U
> +#define OV8858_PIXEL_ARRAY_HEIGHT	2448U
> +
> =C2=A0static const char * const ov8858_supply_names[] =3D {
> =C2=A0	"avdd",		/* Analog power */
> =C2=A0	"dovdd",	/* Digital I/O power */
> @@ -1492,11 +1500,40 @@ static int ov8858_init_state(struct v4l2_subdev *=
sd,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int ov8858_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		sel->r =3D *v4l2_subdev_state_get_crop(sd_state, 0);
> +		return 0;
> +
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.top =3D 0;
> +		sel->r.left =3D 0;
> +		sel->r.width =3D OV8858_NATIVE_WIDTH;
> +		sel->r.height =3D OV8858_NATIVE_HEIGHT;
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.top =3D OV8858_PIXEL_ARRAY_TOP;
> +		sel->r.left =3D OV8858_PIXEL_ARRAY_LEFT;
> +		sel->r.width =3D OV8858_PIXEL_ARRAY_WIDTH;
> +		sel->r.height =3D OV8858_PIXEL_ARRAY_HEIGHT;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> =C2=A0static const struct v4l2_subdev_pad_ops ov8858_pad_ops =3D {
> =C2=A0	.enum_mbus_code =3D ov8858_enum_mbus_code,
> =C2=A0	.enum_frame_size =3D ov8858_enum_frame_sizes,
> =C2=A0	.get_fmt =3D v4l2_subdev_get_fmt,
> =C2=A0	.set_fmt =3D ov8858_set_fmt,
> +	.get_selection =3D ov8858_get_selection,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct v4l2_subdev_ops ov8858_subdev_ops =3D {
>=20
> ---
> base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
> change-id: 20250509-ov8858-crop-9c307bc9d5b6
>=20
> Best regards,

Hi Sakari,

I got no feedback about this patch, is it okay ?

Thank you



