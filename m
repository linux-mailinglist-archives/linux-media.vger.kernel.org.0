Return-Path: <linux-media+bounces-61583-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNE5JNiMBWo5YQIAu9opvQ
	(envelope-from <linux-media+bounces-61583-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:50:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D0353F7AE
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA09330378A4
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D914B3DDDBA;
	Thu, 14 May 2026 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cfd9EIiR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060063D8917;
	Thu, 14 May 2026 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748610; cv=none; b=dmql2dOAUBIv6Wail5r8+wGapfdzz/LFPynOCLIIZSuKMnbX/m3OYDRMMw+fSJBfUYJThFueAD8v24M7aiGJnqbACJ77qm4lVtxxwiocTEX4mr24glHd86IED3ApUYyXin4WQu5vCjhw9GsfooUatEPwF/P3ubiHboBcXdacM1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748610; c=relaxed/simple;
	bh=fRJ/eiSnex/EVrqC+bEUEjQYjdCDDLzZlBQVGuiYs7o=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NkjoIBhaEBEQFcvBNuAQoPHpjTS/m5dYuKlG6YRB0TU61WsfH0L6q0WCdhHZxoY5jchfuvktZR8xt6dCrgMtEDz5ij51Zb8u1VYD03DlfQTeLK0WwfB8qzL8BngnypqakZFeIK3kZWtJVFd1LYsju8qgYu2WEFwokjXKEVX5jUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cfd9EIiR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 934F9454;
	Thu, 14 May 2026 10:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778748598;
	bh=fRJ/eiSnex/EVrqC+bEUEjQYjdCDDLzZlBQVGuiYs7o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Cfd9EIiRq8XjqDzbk/e7rRyE1dXirDfos1YUb+Uix9h7qE+dEwBk0xcC6v4sqQjax
	 2oITDGO9MFiyPbXus6hqt78Wo9V6/zX/nlGcKilLIhHQCEPwQcdyMxxbEEQduBxDeR
	 azr/upnZHSoJltgcM6IBDmepw/VgIrxb2y3rAWBw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <agV9sFGnM6soxHub@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com> <20260501-ov5640_cleanup-v1-10-0869a7802a33@ideasonboard.com> <agV9sFGnM6soxHub@zed>
Subject: Re: [PATCH 10/11] media: i2c: ov5640: Disable ISP for raw output
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 14 May 2026 09:50:04 +0100
Message-ID: <177874860405.2082999.1496444239124631882@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Queue-Id: 04D0353F7AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61583-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ping.linuxembedded.co.uk:mid]
X-Rspamd-Action: no action

Quoting Jacopo Mondi (2026-05-14 09:39:31)
> Hi Kieran
>=20
> On Fri, May 01, 2026 at 04:39:12PM +0100, Kieran Bingham wrote:
> > The OV5640 has ISP operations that can run even when outputting RAW
> > bayer data.  These include the Lens Shading Correction, Gamma and Auto
> > white balance which need to be disabled when performing module
> > calibration using RAW data.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 45 ++++++++++++++++++++++++++++++++++++++=
-------
> >  1 file changed, 38 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index fd369a13463e..f63d81640f54 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -280,28 +280,28 @@ static const struct ov5640_pixfmt ov5640_dvp_form=
ats[] =3D {
> >       }, {
> >               /* Raw, BGBG... / GRGR... */
> >               .code           =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> > -             .colorspace     =3D V4L2_COLORSPACE_SRGB,
> > +             .colorspace     =3D V4L2_COLORSPACE_RAW,
> >               .bpp            =3D 8,
> >               .ctrl00         =3D 0x00,
> >               .mux            =3D OV5640_FMT_MUX_RAW_DPC,
> >       }, {
> >               /* Raw bayer, GBGB... / RGRG... */
> >               .code           =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> > -             .colorspace     =3D V4L2_COLORSPACE_SRGB,
> > +             .colorspace     =3D V4L2_COLORSPACE_RAW,
> >               .bpp            =3D 8,
> >               .ctrl00         =3D 0x01,
> >               .mux            =3D OV5640_FMT_MUX_RAW_DPC,
> >       }, {
> >               /* Raw bayer, GRGR... / BGBG... */
> >               .code           =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> > -             .colorspace     =3D V4L2_COLORSPACE_SRGB,
> > +             .colorspace     =3D V4L2_COLORSPACE_RAW,
> >               .bpp            =3D 8,
> >               .ctrl00         =3D 0x02,
> >               .mux            =3D OV5640_FMT_MUX_RAW_DPC,
> >       }, {
> >               /* Raw bayer, RGRG... / GBGB... */
> >               .code           =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> > -             .colorspace     =3D V4L2_COLORSPACE_SRGB,
> > +             .colorspace     =3D V4L2_COLORSPACE_RAW,
> >               .bpp            =3D 8,
> >               .ctrl00         =3D 0x03,
> >               .mux            =3D OV5640_FMT_MUX_RAW_DPC,
> > @@ -348,7 +348,7 @@ static const struct ov5640_pixfmt ov5640_csi2_forma=
ts[] =3D {
> >       }, {
> >               /* Raw, BGBG... / GRGR... */
> >               .code           =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> > -             .colorspace     =3D V4L2_COLORSPACE_SRGB,
> > +             .colorspace     =3D V4L2_COLORSPACE_RAW,
> >               .bpp            =3D 8,
> >               .ctrl00         =3D 0x00,
> >               .mux            =3D OV5640_FMT_MUX_RAW_DPC,
> > @@ -473,6 +473,7 @@ struct ov5640_dev {
> >
> >       struct v4l2_mbus_framefmt fmt;
> >       bool pending_fmt_change;
> > +     bool is_raw;
> >
> >       const struct ov5640_mode_info *current_mode;
> >       const struct ov5640_mode_info *last_mode;
> > @@ -618,8 +619,13 @@ static const struct reg_value ov5640_init_setting[=
] =3D {
> >       {0x501f, 0x00, 0, 0}, {0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
> >
> >       /* ISP Control */
> > -     {OV5640_REG_ISP_CTRL00, 0xa7, 0, 0},
> > -     {OV5640_REG_ISP_CTRL01, 0xa3, 0, 0},
> > +     {OV5640_REG_ISP_CTRL00, OV5640_ISP_00_LENC_ENABLE | OV5640_ISP_00=
_GMA_ENABLE |
> > +                             OV5640_ISP_00_BPC_ENABLE | OV5640_ISP_00_=
WPC_ENABLE |
> > +                             OV5640_ISP_00_CIP_ENABLE, 0, 0},
> > +
> > +     /* OV5640_ISP_01_UVA_ENABLE is not enabled */
> > +     {OV5640_REG_ISP_CTRL01, OV5640_ISP_01_SDE_ENABLE | OV5640_ISP_01_=
SCL_ENABLE |
> > +                             OV5640_ISP_01_CMX_ENABLE | OV5640_ISP_01_=
AWB_ENABLE, 0, 0},
>=20
> Should we avoid writing these registers at all in the init sequence ?

Oh probably. I haven't tested that yet, but indeed.

> >
> >       /* AWB Control */
> >       {OV5640_REG_AWB_CONTROL_00, 0xff, 0, 0}, /* AWB B Block */
> > @@ -3116,6 +3122,31 @@ static int ov5640_set_framefmt(struct ov5640_dev=
 *sensor,
> >       if (ret)
> >               return ret;
> >
> > +     /*
> > +      * Disable all ISP image processing (Lens Shading, Gamma, AWB...)=
 for
> > +      * RAW modes to facilitate module tuning.
> > +      */
> > +     sensor->is_raw =3D pixfmt->colorspace =3D=3D V4L2_COLORSPACE_RAW;
>=20
> Unless it is used later on, the 'is_raw' flag can be kept a local
> variable.

Haha yes, no idea why I put it in the main dev structure.

Will move. Thanks.

>=20
> > +     if (sensor->is_raw) {
> > +             ret =3D ov5640_write_reg(sensor, OV5640_REG_ISP_CTRL00, 0=
);
> > +             if (ret)
> > +                     return ret;
> > +     } else {
> > +             ret =3D ov5640_write_reg(sensor, OV5640_REG_ISP_CTRL00,
> > +                                    OV5640_ISP_00_LENC_ENABLE | OV5640=
_ISP_00_GMA_ENABLE |
> > +                                    OV5640_ISP_00_BPC_ENABLE | OV5640_=
ISP_00_WPC_ENABLE |
> > +                                    OV5640_ISP_00_CIP_ENABLE);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* OV5640_ISP_01_UVA_ENABLE is not enabled */
> > +             ret =3D ov5640_write_reg(sensor, OV5640_REG_ISP_CTRL01,
> > +                                    OV5640_ISP_01_SDE_ENABLE | OV5640_=
ISP_01_SCL_ENABLE |
> > +                                    OV5640_ISP_01_CMX_ENABLE | OV5640_=
ISP_01_AWB_ENABLE);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       /*
> >        * TIMING TC REG21:
> >        * - [5]:       JPEG enable
> >
> > --
> > 2.52.0
> >
> >

