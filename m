Return-Path: <linux-media+bounces-52879-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPL3I14qk2kI2AEAu9opvQ
	(envelope-from <linux-media+bounces-52879-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:31:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7559144B2F
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E6F3303FAAC
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD7D311946;
	Mon, 16 Feb 2026 14:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nyWsdd7S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEC32EE607;
	Mon, 16 Feb 2026 14:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771252077; cv=none; b=bk6tMHg6WrE4vSNZjiv/wDxEUvRpoZOgZgMOlBaHfk5TbzjbhsRI2T3ApTzFOOb6XI9v2M6OMv4SQeNW0BM75RC3NpKXvsauKFsXxKjQ+4lfDIhtKvGMGqf1yZbzr3EpU0pKy6fL9f3nujKXOwAJX/pHl68jlURQQGDlcmJQK0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771252077; c=relaxed/simple;
	bh=rmytQL0ISxsnJnIAg08SCA0ksSqpVqiCoNANZfBR/y4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oofbuoHxJ083vfR8VKKdEiMaWxM50PIQIffulK78qYg8AW/kpWy7m1Xw3dR9rSVPtPMLH+IcGq7J0SNvS+kDBYAXx2GfBy9lRGvIGfzIOnF2PRa9mO62hfOzdw4q2hIrTyzyoV8TKqD34Da8CCmUaBdoEyXz16TT28Ggqh/LxlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nyWsdd7S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E156DA8;
	Mon, 16 Feb 2026 15:27:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771252023;
	bh=rmytQL0ISxsnJnIAg08SCA0ksSqpVqiCoNANZfBR/y4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nyWsdd7ScpNoeNzNWjTfvLg269MsCFrmsKxXFwC19dZMB5wqN9zQxzR4q2CTpn4II
	 woSGNmosPkiekuprjeNpqwbgo9l+iEtGIZ/hbnR84ZZ81Lbf0VM6rBTVVW9pWTce/G
	 EseKNi74p2k9ofSgvFI53bKutWO8QHE6HLJX80cs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-23-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-23-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 23/25] media: i2c: imx283: Fix binned mode blanking timings
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 19:57:48 +0530
Message-ID: <177125206846.14753.10306143294418039971@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52879-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7559144B2F
X-Rspamd-Action: no action

Hi Kieran,

Thanks for the patch!

Quoting Kieran Bingham (2026-02-13 19:32:02)
> The IMX283 supports binning modes which combine multiple measured pixels
> into a single output pixel.
>=20
> The minimum timings for this must account for the operations on all
> measured pixels, not the output pixel sizes.
>=20
> Determine and calculate all hmax and vmax values in respect of the
> HBLANK and VBLANK controls against the native resolution of the mode as
> specified in the mode crop rectangle as opposed to the output mode width
> and height.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/imx283.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 7fb654512c20..25e669370751 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -875,7 +875,7 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
>                 /* Honour the VBLANK limits when setting exposure. */
>                 s64 current_exposure, max_exposure, min_exposure;
> =20
> -               imx283->vmax =3D mode->height + ctrl->val;
> +               imx283->vmax =3D mode->crop.height + ctrl->val;
> =20
>                 imx283_exposure_limits(imx283, mode,
>                                        &min_exposure, &max_exposure);
> @@ -905,7 +905,7 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
> =20
>         case V4L2_CID_HBLANK:
>                 pixel_rate =3D imx283_pixel_rate(imx283, mode);
> -               imx283->hmax =3D imx283_internal_clock(pixel_rate, mode->=
width + ctrl->val);
> +               imx283->hmax =3D imx283_internal_clock(pixel_rate, mode->=
crop.width + ctrl->val);
>                 dev_dbg(imx283->dev, "V4L2_CID_HBLANK : %d  HMAX : %u\n",
>                         ctrl->val, imx283->hmax);
>                 ret =3D cci_write(imx283->cci, IMX283_REG_HMAX, imx283->h=
max, NULL);
> @@ -917,7 +917,7 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
> =20
>         case V4L2_CID_VBLANK:
> -               imx283->vmax =3D mode->height + ctrl->val;
> +               imx283->vmax =3D mode->crop.height + ctrl->val;
>                 dev_dbg(imx283->dev, "V4L2_CID_VBLANK : %d  VMAX : %u\n",
>                         ctrl->val, imx283->vmax);
>                 ret =3D cci_write(imx283->cci, IMX283_REG_VMAX, imx283->v=
max, NULL);
> @@ -1042,6 +1042,9 @@ static void imx283_set_framing_limits(struct imx283=
 *imx283,
>         u64 pixel_rate =3D imx283_pixel_rate(imx283, mode);
>         u64 min_hblank, max_hblank, def_hblank;
> =20
> +       /* Use crop for timings from native sensor units */
> +       const struct v4l2_rect *crop =3D &mode->crop;
> +
>         /* Initialise hmax and vmax for exposure calculations */
>         imx283->hmax =3D imx283_internal_clock(pixel_rate, mode->default_=
hmax);
>         imx283->vmax =3D mode->default_vmax;
> @@ -1050,18 +1053,18 @@ static void imx283_set_framing_limits(struct imx2=
83 *imx283,
>          * Horizontal Blanking
>          * Convert the HMAX_MAX (72MHz) to Pixel rate values for HBLANK_M=
AX
>          */
> -       min_hblank =3D mode->min_hmax - mode->width;
> -       max_hblank =3D imx283_iclk_to_pix(pixel_rate, IMX283_HMAX_MAX) - =
mode->width;
> -       def_hblank =3D mode->default_hmax - mode->width;
> +       min_hblank =3D mode->min_hmax - crop->width;
> +       max_hblank =3D imx283_iclk_to_pix(pixel_rate, IMX283_HMAX_MAX) - =
crop->width;
> +       def_hblank =3D mode->default_hmax - crop->width;
>         __v4l2_ctrl_modify_range(imx283->hblank, min_hblank, max_hblank, =
1,
>                                  def_hblank);
>         __v4l2_ctrl_s_ctrl(imx283->hblank, def_hblank);
> =20
>         /* Vertical Blanking */
> -       __v4l2_ctrl_modify_range(imx283->vblank, mode->min_vmax - mode->h=
eight,
> -                                IMX283_VMAX_MAX - mode->height, 1,
> +       __v4l2_ctrl_modify_range(imx283->vblank, mode->min_vmax - crop->h=
eight,
> +                                IMX283_VMAX_MAX - crop->height, 1,
>                                  mode->default_vmax - mode->height);

Shouldn't this be `- crop->height` too?

> -       __v4l2_ctrl_s_ctrl(imx283->vblank, mode->default_vmax - mode->hei=
ght);
> +       __v4l2_ctrl_s_ctrl(imx283->vblank, mode->default_vmax - crop->hei=
ght);
>  }
> =20
>  static int imx283_set_pad_format(struct v4l2_subdev *sd,
> @@ -1509,13 +1512,13 @@ static int imx283_init_controls(struct imx283 *im=
x283)
>         /* Initialise vblank/hblank/exposure based on the current mode. */
>         imx283->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx283_ctrl_ops,
>                                            V4L2_CID_VBLANK,
> -                                          mode->min_vmax - mode->height,
> +                                          mode->min_vmax - mode->crop.he=
ight,
>                                            IMX283_VMAX_MAX, 1,
> -                                          mode->default_vmax - mode->hei=
ght);
> +                                          mode->default_vmax - mode->cro=
p.height);
> =20
> -       min_hblank =3D mode->min_hmax - mode->width;
> -       max_hblank =3D imx283_iclk_to_pix(pixel_rate, IMX283_HMAX_MAX) - =
mode->width;
> -       def_hblank =3D mode->default_hmax - mode->width;
> +       min_hblank =3D mode->min_hmax - mode->crop.width;
> +       max_hblank =3D imx283_iclk_to_pix(pixel_rate, IMX283_HMAX_MAX) - =
mode->crop.width;
> +       def_hblank =3D mode->default_hmax - mode->crop.width;
>         imx283->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx283_ctrl_ops,
>                                            V4L2_CID_HBLANK, min_hblank, m=
ax_hblank,
>                                            1, def_hblank);
>=20
> --=20
> 2.52.0
>=20

Testing this series on Pi 5, I notice that this patch causes a regression.

Before this patch I could get ~45 and ~60fps for the 2x and 3x binned
modes, while now I only get ~20fps.

----- thinking out loud -------
The sensor expects HMAX to be programmed in units of sensor's internal
readout clock @ 72MHz.

This is the supported minimum for HMAX for various readout modes:

No binning:     887 units per line
2x2 binning:    362 ..
3x3 binning:    284 ..

Scaling these up from "72 Mhz" units to the pixel rate with 720Mhz link
frequency on Pi 5 (that is 480Mpixels/sec), I get:

No binning:     5914 pixels per line
2x2 binning:    2414 .. (*)
3x3 binning:    1894 ..

Which matches the min_hmax described in the mode table.

(*) 2414 < 2736 (width of the 2x2 mode) explains why I can only capture
max 45fps instead of intended 50fps. The sensor might be able to read a
line faster than what the link rate of 720Mhz supports.
------------------------------

Looking at the patch again

> -       min_hblank =3D mode->min_hmax - mode->width;
> +       min_hblank =3D mode->min_hmax - crop->width;

hblank =3D min_hmax (1894 for 3x binning) - crop.width (5472) is negative

> -               imx283->hmax =3D imx283_internal_clock(pixel_rate, mode->=
width + ctrl->val);
> +               imx283->hmax =3D imx283_internal_clock(pixel_rate, mode->=
crop.width + ctrl->val);

Passing "pixels" in crop dimensions to the internal_clock function seems
wrong to me.

What exactly do we get by representing HMAX/VMAX in "full resolution" pixel
units?

TBH both this new approach and the older one make it too confusing. The
sensor's HMAX is in the unit of "time" w.r.t the 72Mhz internal clock,
regardless of the pixel rate/link frequency.

IMHO the mode table should store that information directly, instead of in
units of pre or post-binned pixels, that too for an arbitrary link
frequency.

Thanks,
    Jai

