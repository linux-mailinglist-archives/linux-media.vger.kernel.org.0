Return-Path: <linux-media+bounces-53332-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Pc2MYrqnmk/XwQAu9opvQ
	(envelope-from <linux-media+bounces-53332-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:26:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8F197498
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77F7F304FFB4
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 12:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC763ACA5A;
	Wed, 25 Feb 2026 12:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KjwY5ZUY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA8513A244;
	Wed, 25 Feb 2026 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022086; cv=none; b=nv+HUKquvPKDouF5PRJ5uTwaSxBoacD2i1jZ84e2U5GtVkUIUfMRfB1vsXy/T6X3Fzduzz0rCsui+T+SObh1RsLu5mwh38++HHjrR0P/cNV1JIkHDXcngqdkMNmSK141YLGUDU2peHR9jZ0weg3iZ05nFQNnU1gmfaHS4CUMc/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022086; c=relaxed/simple;
	bh=O3SZVQ+M9LG2PI2LBL6JJVkAewsKootWHqN8pcBDkPI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gq880Bror79tYyZA3kIqf56sj2juf3IdZenCQV3KEEX9+EZLESgYAD95Eg6oRVI9vi05zph+FT7p25SqwOMrO/dvUlhghSlEoAf47mrnUAj/U/zTYcJ06tg6rfQxSZdsqcDE1G7eYq+q2skfCAiK9tdJCZ+nkbPtr6WUP2ow2d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KjwY5ZUY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:cd05:b041:1dc3:f62c])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 93E1C448;
	Wed, 25 Feb 2026 13:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772022025;
	bh=O3SZVQ+M9LG2PI2LBL6JJVkAewsKootWHqN8pcBDkPI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KjwY5ZUYkckHkY/gdqU07Rs+pt3hfjpYRGJUtE+oErC8yB9owcHiOpkBmSgBGseD4
	 u0ZVRknSgKrgb+CbABdys+uw8sPbhrA2FeIBvYIo3BxzExu/slZ3e0Q08Bk1jha20V
	 UNpu0TaDkKaIRIBIusIJIwkl5b1WJfncLR5yK0BM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250301143453.GJ7342@pendragon.ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com> <20250227114558.3097101-2-stefan.klug@ideasonboard.com> <20250301010252.GI7342@pendragon.ideasonboard.com> <20250301143453.GJ7342@pendragon.ideasonboard.com>
Subject: Re: [PATCH 1/3] media: rkisp1: Set format defaults based on requested color space
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 25 Feb 2026 13:21:20 +0100
Message-ID: <177202208017.2000438.5208896949701142402@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53332-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,fastmail.com,kernel.org,sntech.de,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.klug@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1EA8F197498
X-Rspamd-Action: no action

Hi Laurent,

Thank you for the (loong ago) review. I finally came around to wrap my
head around that again.

Quoting Laurent Pinchart (2025-03-01 15:34:53)
> On Sat, Mar 01, 2025 at 03:02:54AM +0200, Laurent Pinchart wrote:
> > On Thu, Feb 27, 2025 at 12:44:59PM +0100, Stefan Klug wrote:
> > > When color space JPEG is requested, the ISP sets the quantization
> > > incorrectly to limited range. To fix that, set the xfer_func, ycbcr_e=
nc
> > > and quantization to the defaults for the requested color space if they
> > > are not specified explicitly.
> >=20
> > The commit message fails to explain why you're addressing xfer_func and
> > ycbcr_enc to fix the quantization issue.
> >=20
> > > Do this only in case we are converting
> > > from RAW to YUV.
> >=20
> > And this should explain why.
> >=20
> > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > ---
> > >  .../media/platform/rockchip/rkisp1/rkisp1-isp.c   | 15 +++++++++++++=
+-
> > >  1 file changed, 14 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/dr=
ivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > > index d94917211828..468f5a7d03c7 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > > @@ -680,10 +680,23 @@ static void rkisp1_isp_set_src_fmt(struct rkisp=
1_isp *isp,
> >=20
> > Adding a bit more context:
> >=20
> >       set_csc =3D format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC;
> >=20
> >       if (set_csc && src_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_YUV) {
> >=20
> > If V4L2_MBUS_FRAMEFMT_SET_CSC isn't set, the colorspace fields on the
> > source pad will be copied from the sink pad, which doesn't seem right.
>=20
> Thinking some more about it, it's not wrong either. The colorspace and
> xfer_func fields are not used by the driver, as the related ISP
> processing blocks are configured through ISP parameters. Without
> userspace providing the value of the fields on the source pad, the
> driver can't know what colorspace and xfer_func is produced. Copying the
> values from the sink pad is as good of a guess as we can make.
>=20
> The ycbcr_enc and quantization fields are different, as they are taken
> into account by the driver to configure the ISP. Copying ycbcr_enc from
> the sink pad means that it will be set to V4L2_YCBCR_ENC_601 when the
> sink format is bayer and the source format is YUV. As the sink
> colorspace is most likely going to be V4L2_COLORSPACE_RAW in that case,
> that's a fine default, and is identical to what we would get from
> V4L2_MAP_YCBCR_ENC_DEFAULT(). Setting the quantization to
> V4L2_QUANTIZATION_LIM_RANGE also seems fine as a default, and it what
> V4L2_MAP_QUANTIZATION_DEFAULT() would give us.
>=20
> TL;DR: there's probably no need to change the current behaviour when
> V4L2_MBUS_FRAMEFMT_SET_CSC isn't set.

I partially agree. Basically we don't care about colorspace and
xfer_func because we know that it is not used by the driver. But
src_fmt->colorspace is now V4L2_COLORSPACE_RAW and that could also be
queried by the user if I'm not mistaken. Wouldn't it be better (and
clearer code wise) to explicitly set the defaults in case we are
converting from RAW to YUV? Something like

	/*
	 * Copy the color space for the sink pad. When converting from Bayer to
	 * YUV, set proper defaults.
	 */
	if (sink_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_BAYER &&
	    src_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_YUV) {
		src_fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
		src_fmt->xfer_func =3D V4L2_XFER_FUNC_SRGB;
		src_fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
		src_fmt->quantization =3D V4L2_QUANTIZATION_LIM_RANGE;
	} else {
		src_fmt->colorspace =3D sink_fmt->colorspace;
		src_fmt->xfer_func =3D sink_fmt->xfer_func;
		src_fmt->ycbcr_enc =3D sink_fmt->ycbcr_enc;
		src_fmt->quantization =3D sink_fmt->quantization;
	}

Functionality wise it is the same, but it makes the following code easier
to understand without the need to remember that we can safely copy
colorspace as it won't be used anyways.

>=20
> > It's a separate issue, but fixing both together may lead to better code.
> >=20
> > >             if (sink_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_BAYER) {
> > >                     if (format->colorspace !=3D V4L2_COLORSPACE_DEFAU=
LT)
> > >                             src_fmt->colorspace =3D format->colorspac=
e;
> > > -                   if (format->xfer_func !=3D V4L2_XFER_FUNC_DEFAULT)
> > > +
> > > +                   if (format->xfer_func =3D=3D V4L2_XFER_FUNC_DEFAU=
LT)
> >=20
> > Are you sure the condition should be inverted ?

That really looks quite wrong.

> >=20
> > >                             src_fmt->xfer_func =3D format->xfer_func;
> > > +                   else
> > > +                           src_fmt->xfer_func =3D
> > > +                                   V4L2_MAP_XFER_FUNC_DEFAULT(format=
->colorspace);
> > > +
> > >                     if (format->ycbcr_enc !=3D V4L2_YCBCR_ENC_DEFAULT)
> > >                             src_fmt->ycbcr_enc =3D format->ycbcr_enc;
> > > +                   else
> > > +                           src_fmt->ycbcr_enc =3D
> > > +                                   V4L2_MAP_YCBCR_ENC_DEFAULT(format=
->colorspace);
> > > +
> > > +                   if (format->quantization =3D=3D V4L2_QUANTIZATION=
_DEFAULT)
> > > +                           src_fmt->quantization =3D
> > > +                                   V4L2_MAP_QUANTIZATION_DEFAULT(fal=
se,
> > > +                                           format->colorspace, forma=
t->ycbcr_enc);
> >=20
> > Shouldn't this use src_fmt instead of format ?

The outcome is the same. It felt more symmetrical to base the default
value on format->... as we do for the other fields.

> >=20
> > I think quantization handling could be moved below.
> >=20
> > >             }
> > > =20
> > >             if (format->quantization !=3D V4L2_QUANTIZATION_DEFAULT)
>=20
> Now I'm wondering if this is right. As far as I can tell, the
> quantization isn't taken into account by the driver when the ISP is
> bypassed (capturing raw bayer data, or capturing YUV data from a YUV
> sensor).

Are you sure about the YUV to YUV case? We pass src_fmt->quatization
into rkisp1_params_pre_configure() which is then used to initializ the
remaining blocks. Iam however unsure if *any* of these blocks is active
in YUV to YUV mode.

>=20
> How about something like this ?
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/driver=
s/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index d94917211828..9c215c9bb30f 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -659,11 +659,10 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_is=
p *isp,
>                 src_fmt->quantization =3D sink_fmt->quantization;
>=20
>         /*
> -        * Allow setting the source color space fields when the SET_CSC f=
lag is
> -        * set and the source format is YUV. If the sink format is YUV, d=
on't
> -        * set the color primaries, transfer function or YCbCr encoding a=
s the
> -        * ISP is bypassed in that case and passes YUV data through witho=
ut
> -        * modifications.
> +        * Allow setting the source color space fields when the SET_CSC f=
lag.
> +        * This is restricted to the case where the sink format is raw an=
d the
> +        * source format is YUV, as in other cases the ISP is bypassed an=
d the
> +        * input data is passed through without modifications.

Yes, that seems legit and makes the logic easier to follow. Only concern
is the YUV to YUV mode.

>          *
>          * The color primaries and transfer function are configured throu=
gh the
>          * cross-talk matrix and tone curve respectively. Settings for th=
ose
> @@ -676,18 +675,30 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_is=
p *isp,
>          */
>         set_csc =3D format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC;
>=20
> -       if (set_csc && src_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_YUV) {
> -               if (sink_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_BAYER) {
> -                       if (format->colorspace !=3D V4L2_COLORSPACE_DEFAU=
LT)
> -                               src_fmt->colorspace =3D format->colorspac=
e;
> -                       if (format->xfer_func !=3D V4L2_XFER_FUNC_DEFAULT)
> -                               src_fmt->xfer_func =3D format->xfer_func;
> -                       if (format->ycbcr_enc !=3D V4L2_YCBCR_ENC_DEFAULT)
> -                               src_fmt->ycbcr_enc =3D format->ycbcr_enc;
> -               }
> +       if (set_csc && sink_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_BAYER &&
> +           src_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_YUV) {
> +               if (format->colorspace !=3D V4L2_COLORSPACE_DEFAULT)
> +                       src_fmt->colorspace =3D format->colorspace;
> +
> +               if (format->xfer_func !=3D V4L2_XFER_FUNC_DEFAULT)
> +                       src_fmt->xfer_func =3D format->xfer_func;
> +               else
> +                       src_fmt->xfer_func =3D
> +                               V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->color=
space);
> +
> +               if (format->ycbcr_enc !=3D V4L2_YCBCR_ENC_DEFAULT)
> +                       src_fmt->ycbcr_enc =3D format->ycbcr_enc;
> +               else
> +                       src_fmt->ycbcr_enc =3D
> +                               V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->color=
space);
>=20
>                 if (format->quantization !=3D V4L2_QUANTIZATION_DEFAULT)
>                         src_fmt->quantization =3D format->quantization;
> +               else
> +                       src_fmt->quantization =3D
> +                               V4L2_MAP_QUANTIZATION_DEFAULT(false,
> +                                                             src_fmt->co=
lorspace,
> +                                                             src_fmt->yc=
bcr_enc);
>         }
>=20
>         *format =3D *src_fmt;
>=20
> Can I let you write a commit message ? :-)

I try to get bak to it :-)

Best regards,
Stefan

>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
>

