Return-Path: <linux-media+bounces-66997-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nWB2K6NVTmqGKwIAu9opvQ
	(envelope-from <linux-media+bounces-66997-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:50:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48453726F5E
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:50:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66997-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66997-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C85C3010918
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 13:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317443803DA;
	Wed,  8 Jul 2026 13:50:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D51C34104B;
	Wed,  8 Jul 2026 13:50:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518621; cv=none; b=ZF2+YE9MYSUZBltukomTsV8T/ZG2AqLC3qbS6bquezXIj0i0QDEwtqxvPwlsexJ/cnPBoSbVpLeVu0MIgL8nwFQSNfXqyfO2cq0k/pwkSKaG6bHTBikDPziWgCz1mOITWIjb6aSOsRdz1lXr//4y//PVC+S6dN7UDVgS1zoOSOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518621; c=relaxed/simple;
	bh=zPzVX+xY+trlqL7aSLB9ez06OleQF78MNVG0w6jm7nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0LZUdHKMdBbhrUejv0tA+vqWFQxLVI5hM30FzvQxyQeOoC66REYeI7ATbgm1u9MY59JN904bOdYC+NX8jiUChjBq5WEpW84WcwZNUyFY+TGqpzJrtvS9J5lUcSXPSfeC3xVJHetGHFRGRXPXs1PUuHzI9XoAHCFILpOOLhOR4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id EC42037002FF;
	Wed,  8 Jul 2026 13:50:11 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 84FCEAE6676; Wed,  8 Jul 2026 13:50:09 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 70E68AE666A;
	Wed,  8 Jul 2026 13:50:07 +0000 (UTC)
Date: Wed, 8 Jul 2026 15:50:05 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: arash golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 01/16] media: sun6i-csi: bridge: Use V4L2 subdev active
 state
Message-ID: <ak5Vje0qvYzZ7a74@shepard>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518102451.417971-2-paulk@sys-base.io>
 <CAMxPZkjeCL=kdpj2V-9b-C68kOsrAv1dPKq4iHn2PEpn2pYEuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gBp5EPL8J0LpdCpa"
Content-Disposition: inline
In-Reply-To: <CAMxPZkjeCL=kdpj2V-9b-C68kOsrAv1dPKq4iHn2PEpn2pYEuA@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-66997-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FORGED_RECIPIENTS(0.00)[m:arash.golgol@gmail.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:gregkh@linuxfoundation.org,m:laurent.pinchart@ideasonboard.com,m:nicolas.dufresne@collabora.com,m:arashgolgol@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48453726F5E

--gBp5EPL8J0LpdCpa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

On Thu 02 Jul 26, 11:08, arash golgol wrote:
> Hi Paul,
>=20
> On Mon, May 18, 2026 at 1:55=E2=80=AFPM Paul Kocialkowski <paulk@sys-base=
=2Eio> wrote:
> >
> > From: Arash Golgol <arash.golgol@gmail.com>
> >
> > Use the V4L2 subdev active state API to store the active format.
> > This simplifies the driver not only by dropping the bridge mbus_format
> > field, but it also allows dropping the bridge lock, replaced with
> > the state lock.
> >
> > Previously, capture accessed bridge private state directly. After
> > moving to framework-managed state, resolve the format through the
> > subdev pad API.
> >
> > The sun6i-csi-bridge hardware does not perform any format conversion.
> > Enforce identical formats on the sink and source pads in the set_fmt()
> > and init_state() callbacks.
> >
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> > Tested-by: Paul Kocialkowski <paulk@sys-base.io>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> I noticed this series didn't make it into the v7.2 merge window.
> Is there anything still pending on my side before it can be picked up,
> or is it just a matter of timing for the next cycle?

No I still need to respin this series, the changes to the v4l2 format info
tables were wrong and this is needed for the sun6i-csi rework.

Your patches on the other hand are all good to go, I think they have receiv=
ed
all the necessary review.

Unless I am mistaken, they have not been picked up yet.=20

If that's correct, feel free to reply to your series and ask for the patches
to be picked up. This will make it easier for me to rebase this series, sin=
ce
it is based on your series.

All the best,

Paul

> Happy to help however I can.
>=20
> > ---
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
> >  3 files changed, 86 insertions(+), 105 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c =
b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > index d006d9dd0170..43a85bcc2ba2 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > @@ -13,26 +13,6 @@
> >  #include "sun6i_csi_bridge.h"
> >  #include "sun6i_csi_reg.h"
> >
> > -/* Helpers */
> > -
> > -void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> > -                                unsigned int *width, unsigned int *hei=
ght)
> > -{
> > -       if (width)
> > -               *width =3D csi_dev->bridge.mbus_format.width;
> > -       if (height)
> > -               *height =3D csi_dev->bridge.mbus_format.height;
> > -}
> > -
> > -void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> > -                            u32 *mbus_code, u32 *field)
> > -{
> > -       if (mbus_code)
> > -               *mbus_code =3D csi_dev->bridge.mbus_format.code;
> > -       if (field)
> > -               *field =3D csi_dev->bridge.mbus_format.field;
> > -}
> > -
> >  /* Format */
> >
> >  static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[]=
 =3D {
> > @@ -226,7 +206,8 @@ static void sun6i_csi_bridge_disable(struct sun6i_c=
si_device *csi_dev)
> >  }
> >
> >  static void
> > -sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
> > +sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev,
> > +                                   const struct v4l2_mbus_framefmt *mb=
us_format)
> >  {
> >         struct device *dev =3D csi_dev->dev;
> >         struct regmap *regmap =3D csi_dev->regmap;
> > @@ -234,11 +215,9 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_c=
si_device *csi_dev)
> >                 &csi_dev->bridge.source_parallel.endpoint;
> >         unsigned char bus_width =3D endpoint->bus.parallel.bus_width;
> >         unsigned int flags =3D endpoint->bus.parallel.flags;
> > -       u32 field;
> > +       u32 field =3D mbus_format->field;
> >         u32 value =3D SUN6I_CSI_IF_CFG_IF_CSI;
> >
> > -       sun6i_csi_bridge_format(csi_dev, NULL, &field);
> > -
> >         if (field =3D=3D V4L2_FIELD_INTERLACED ||
> >             field =3D=3D V4L2_FIELD_INTERLACED_TB ||
> >             field =3D=3D V4L2_FIELD_INTERLACED_BT)
> > @@ -317,13 +296,12 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_=
csi_device *csi_dev)
> >  }
> >
> >  static void
> > -sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
> > +sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev,
> > +                                    const struct v4l2_mbus_framefmt *m=
bus_format)
> >  {
> >         struct regmap *regmap =3D csi_dev->regmap;
> >         u32 value =3D SUN6I_CSI_IF_CFG_IF_MIPI;
> > -       u32 field;
> > -
> > -       sun6i_csi_bridge_format(csi_dev, NULL, &field);
> > +       u32 field =3D mbus_format->field;
> >
> >         if (field =3D=3D V4L2_FIELD_INTERLACED ||
> >             field =3D=3D V4L2_FIELD_INTERLACED_TB ||
> > @@ -335,19 +313,20 @@ sun6i_csi_bridge_configure_mipi_csi2(struct sun6i=
_csi_device *csi_dev)
> >         regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
> >  }
> >
> > -static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device =
*csi_dev)
> > +static void
> > +sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev,
> > +                                 const struct v4l2_mbus_framefmt *mbus=
_format)
> >  {
> >         struct regmap *regmap =3D csi_dev->regmap;
> >         bool capture_streaming =3D csi_dev->capture.state.streaming;
> >         const struct sun6i_csi_bridge_format *bridge_format;
> >         const struct sun6i_csi_capture_format *capture_format;
> > -       u32 mbus_code, field, pixelformat;
> > +       u32 pixelformat;
> > +       u32 field =3D mbus_format->field;
> >         u8 input_format, input_yuv_seq, output_format;
> >         u32 value =3D 0;
> >
> > -       sun6i_csi_bridge_format(csi_dev, &mbus_code, &field);
> > -
> > -       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> > +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_format->cod=
e);
> >         if (WARN_ON(!bridge_format))
> >                 return;
> >
> > @@ -391,16 +370,17 @@ static void sun6i_csi_bridge_configure_format(str=
uct sun6i_csi_device *csi_dev)
> >  }
> >
> >  static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_de=
v,
> > -                                      struct sun6i_csi_bridge_source *=
source)
> > +                                      struct sun6i_csi_bridge_source *=
source,
> > +                                      const struct v4l2_mbus_framefmt =
*mbus_format)
> >  {
> >         struct sun6i_csi_bridge *bridge =3D &csi_dev->bridge;
> >
> >         if (source =3D=3D &bridge->source_parallel)
> > -               sun6i_csi_bridge_configure_parallel(csi_dev);
> > +               sun6i_csi_bridge_configure_parallel(csi_dev, mbus_forma=
t);
> >         else
> > -               sun6i_csi_bridge_configure_mipi_csi2(csi_dev);
> > +               sun6i_csi_bridge_configure_mipi_csi2(csi_dev, mbus_form=
at);
> >
> > -       sun6i_csi_bridge_configure_format(csi_dev);
> > +       sun6i_csi_bridge_configure_format(csi_dev, mbus_format);
> >  }
> >
> >  /* V4L2 Subdev */
> > @@ -415,6 +395,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_su=
bdev *subdev, int on)
> >         struct sun6i_csi_bridge_source *source;
> >         struct v4l2_subdev *source_subdev;
> >         struct media_pad *remote_pad;
> > +       struct v4l2_subdev_state *state;
> > +       const struct v4l2_mbus_framefmt *mbus_format;
> >         int ret;
> >
> >         /* Source */
> > @@ -433,6 +415,10 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> >         else
> >                 source =3D &bridge->source_mipi_csi2;
> >
> > +       /* Active State */
> > +
> > +       state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> > +
> >         if (!on) {
> >                 v4l2_subdev_call(source_subdev, video, s_stream, 0);
> >                 ret =3D 0;
> > @@ -443,7 +429,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_su=
bdev *subdev, int on)
> >
> >         ret =3D pm_runtime_resume_and_get(dev);
> >         if (ret < 0)
> > -               return ret;
> > +               goto unlock;
> >
> >         /* Clear */
> >
> > @@ -451,7 +437,9 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_su=
bdev *subdev, int on)
> >
> >         /* Configure */
> >
> > -       sun6i_csi_bridge_configure(csi_dev, source);
> > +       mbus_format =3D v4l2_subdev_state_get_format(state,
> > +                                                  SUN6I_CSI_BRIDGE_PAD=
_SINK);
> > +       sun6i_csi_bridge_configure(csi_dev, source, mbus_format);
> >
> >         if (capture_streaming)
> >                 sun6i_csi_capture_configure(csi_dev);
> > @@ -472,7 +460,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_su=
bdev *subdev, int on)
> >         if (ret && ret !=3D -ENOIOCTLCMD)
> >                 goto disable;
> >
> > -       return 0;
> > +       ret =3D 0;
> > +       goto unlock;
> >
> >  disable:
> >         if (capture_streaming)
> > @@ -482,6 +471,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_su=
bdev *subdev, int on)
> >
> >         pm_runtime_put(dev);
> >
> > +unlock:
> > +       v4l2_subdev_unlock_state(state);
> >         return ret;
> >  }
> >
> > @@ -504,21 +495,23 @@ sun6i_csi_bridge_mbus_format_prepare(struct v4l2_=
mbus_framefmt *mbus_format)
> >  static int sun6i_csi_bridge_init_state(struct v4l2_subdev *subdev,
> >                                        struct v4l2_subdev_state *state)
> >  {
> > -       struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev=
);
> > -       unsigned int pad =3D SUN6I_CSI_BRIDGE_PAD_SINK;
> > -       struct v4l2_mbus_framefmt *mbus_format =3D
> > -               v4l2_subdev_state_get_format(state, pad);
> > -       struct mutex *lock =3D &csi_dev->bridge.lock;
> > +       unsigned int pad;
> >
> > -       mutex_lock(lock);
> > +       /*
> > +        * This subdev does not perform format conversion,
> > +        * initialize both pads identically.
> > +        */
> > +       for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> > +               struct v4l2_mbus_framefmt *mbus_format;
> >
> > -       mbus_format->code =3D sun6i_csi_bridge_formats[0].mbus_code;
> > -       mbus_format->width =3D 1280;
> > -       mbus_format->height =3D 720;
> > +               mbus_format =3D v4l2_subdev_state_get_format(state, pad=
);
> >
> > -       sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> > +               mbus_format->code =3D sun6i_csi_bridge_formats[0].mbus_=
code;
> > +               mbus_format->width =3D 1280;
> > +               mbus_format->height =3D 720;
> >
> > -       mutex_unlock(lock);
> > +               sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> > +       }
> >
> >         return 0;
> >  }
> > @@ -536,53 +529,32 @@ sun6i_csi_bridge_enum_mbus_code(struct v4l2_subde=
v *subdev,
> >         return 0;
> >  }
> >
> > -static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
> > -                                   struct v4l2_subdev_state *state,
> > -                                   struct v4l2_subdev_format *format)
> > -{
> > -       struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev=
);
> > -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > -       struct mutex *lock =3D &csi_dev->bridge.lock;
> > -
> > -       mutex_lock(lock);
> > -
> > -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > -               *mbus_format =3D *v4l2_subdev_state_get_format(state,
> > -                                                            format->pa=
d);
> > -       else
> > -               *mbus_format =3D csi_dev->bridge.mbus_format;
> > -
> > -       mutex_unlock(lock);
> > -
> > -       return 0;
> > -}
> > -
> >  static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
> >                                     struct v4l2_subdev_state *state,
> >                                     struct v4l2_subdev_format *format)
> >  {
> > -       struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev=
);
> > -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > -       struct mutex *lock =3D &csi_dev->bridge.lock;
> > +       struct v4l2_mbus_framefmt *fmt;
> >
> > -       mutex_lock(lock);
> > +       /* The format on the source pad always matches the sink pad. */
> > +       if (format->pad !=3D SUN6I_CSI_BRIDGE_PAD_SINK)
> > +               return v4l2_subdev_get_fmt(subdev, state, format);
> >
> > -       sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> > +       sun6i_csi_bridge_mbus_format_prepare(&format->format);
> >
> > -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > -               *v4l2_subdev_state_get_format(state, format->pad) =3D
> > -                       *mbus_format;
> > -       else
> > -               csi_dev->bridge.mbus_format =3D *mbus_format;
> > +       /* Set the format on the sink pad. */
> > +       fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> > +       *fmt =3D format->format;
> >
> > -       mutex_unlock(lock);
> > +       /* Propagate the format to the source pad. */
> > +       fmt =3D v4l2_subdev_state_get_format(state, SUN6I_CSI_BRIDGE_PA=
D_SOURCE);
> > +       *fmt =3D format->format;
> >
> >         return 0;
> >  }
> >
> >  static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops =3D {
> >         .enum_mbus_code =3D sun6i_csi_bridge_enum_mbus_code,
> > -       .get_fmt        =3D sun6i_csi_bridge_get_fmt,
> > +       .get_fmt        =3D v4l2_subdev_get_fmt,
> >         .set_fmt        =3D sun6i_csi_bridge_set_fmt,
> >  };
> >
> > @@ -780,8 +752,6 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device =
*csi_dev)
> >         };
> >         int ret;
> >
> > -       mutex_init(&bridge->lock);
> > -
> >         /* V4L2 Subdev */
> >
> >         v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
> > @@ -809,6 +779,12 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device=
 *csi_dev)
> >         if (ret < 0)
> >                 return ret;
> >
> > +       /* V4L2 Subdev finalize */
> > +
> > +       ret =3D v4l2_subdev_init_finalize(subdev);
> > +       if (ret < 0)
> > +               goto error_media_entity;
> > +
> >         /* V4L2 Subdev */
> >
> >         if (csi_dev->isp_available)
> > @@ -818,7 +794,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device =
*csi_dev)
> >
> >         if (ret) {
> >                 dev_err(dev, "failed to register v4l2 subdev: %d\n", re=
t);
> > -               goto error_media_entity;
> > +               goto error_subdev_finalize;
> >         }
> >
> >         /* V4L2 Async */
> > @@ -852,6 +828,9 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device =
*csi_dev)
> >         else
> >                 v4l2_device_unregister_subdev(subdev);
> >
> > +error_subdev_finalize:
> > +       v4l2_subdev_cleanup(subdev);
> > +
> >  error_media_entity:
> >         media_entity_cleanup(&subdev->entity);
> >
> > @@ -868,5 +847,7 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_devi=
ce *csi_dev)
> >
> >         v4l2_device_unregister_subdev(subdev);
> >
> > +       v4l2_subdev_cleanup(subdev);
> > +
> >         media_entity_cleanup(&subdev->entity);
> >  }
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h =
b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> > index 44653b38f722..a5b0a6f064dd 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> > @@ -42,20 +42,11 @@ struct sun6i_csi_bridge {
> >         struct v4l2_subdev              subdev;
> >         struct v4l2_async_notifier      notifier;
> >         struct media_pad                pads[2];
> > -       struct v4l2_mbus_framefmt       mbus_format;
> > -       struct mutex                    lock; /* Mbus format lock. */
> >
> >         struct sun6i_csi_bridge_source  source_parallel;
> >         struct sun6i_csi_bridge_source  source_mipi_csi2;
> >  };
> >
> > -/* Helpers */
> > -
> > -void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> > -                                unsigned int *width, unsigned int *hei=
ght);
> > -void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> > -                            u32 *mbus_code, u32 *field);
> > -
> >  /* Format */
> >
> >  const struct sun6i_csi_bridge_format *
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c=
 b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > index 65879f4802c0..d90abba21309 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > @@ -888,14 +888,19 @@ static int sun6i_csi_capture_link_validate(struct=
 media_link *link)
> >                 media_entity_to_video_device(link->sink->entity);
> >         struct sun6i_csi_device *csi_dev =3D video_get_drvdata(video_de=
v);
> >         struct v4l2_device *v4l2_dev =3D csi_dev->v4l2_dev;
> > +       struct v4l2_subdev *src_subdev =3D
> > +               media_entity_to_v4l2_subdev(link->source->entity);
> >         const struct sun6i_csi_capture_format *capture_format;
> >         const struct sun6i_csi_bridge_format *bridge_format;
> >         unsigned int capture_width, capture_height;
> > -       unsigned int bridge_width, bridge_height;
> >         const struct v4l2_format_info *format_info;
> > +       struct v4l2_subdev_format src_fmt =3D {
> > +               .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > +               .pad =3D link->source->index
> > +       };
> >         u32 pixelformat, capture_field;
> > -       u32 mbus_code, bridge_field;
> >         bool match;
> > +       int ret;
> >
> >         sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_=
height);
> >
> > @@ -904,19 +909,22 @@ static int sun6i_csi_capture_link_validate(struct=
 media_link *link)
> >         if (WARN_ON(!capture_format))
> >                 return -EINVAL;
> >
> > -       sun6i_csi_bridge_dimensions(csi_dev, &bridge_width, &bridge_hei=
ght);
> > +       /* Resolve csi bridge format. */
> > +       ret =3D v4l2_subdev_call(src_subdev, pad, get_fmt, NULL, &src_f=
mt);
> > +       if (ret)
> > +               return ret;
> >
> > -       sun6i_csi_bridge_format(csi_dev, &mbus_code, &bridge_field);
> > -       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> > +       bridge_format =3D sun6i_csi_bridge_format_find(src_fmt.format.c=
ode);
> >         if (WARN_ON(!bridge_format))
> >                 return -EINVAL;
> >
> >         /* No cropping/scaling is supported. */
> > -       if (capture_width !=3D bridge_width || capture_height !=3D brid=
ge_height) {
> > +       if (capture_width !=3D src_fmt.format.width ||
> > +           capture_height !=3D src_fmt.format.height) {
> >                 v4l2_err(v4l2_dev,
> >                          "invalid input/output dimensions: %ux%u/%ux%u\=
n",
> > -                        bridge_width, bridge_height, capture_width,
> > -                        capture_height);
> > +                        src_fmt.format.width, src_fmt.format.height,
> > +                        capture_width, capture_height);
> >                 return -EINVAL;
> >         }
> >
> > @@ -947,7 +955,8 @@ static int sun6i_csi_capture_link_validate(struct m=
edia_link *link)
> >         /* With raw input mode, we need a 1:1 match between input and o=
utput. */
> >         if (bridge_format->input_format =3D=3D SUN6I_CSI_INPUT_FMT_RAW =
||
> >             capture_format->input_format_raw) {
> > -               match =3D sun6i_csi_capture_format_match(pixelformat, m=
bus_code);
> > +               match =3D sun6i_csi_capture_format_match(pixelformat,
> > +                                                      src_fmt.format.c=
ode);
> >                 if (!match)
> >                         goto invalid;
> >         }
> > --
> > 2.54.0
> >
>=20
> --=20
> Regards,
> Arash Golgol

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--gBp5EPL8J0LpdCpa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmpOVY0ACgkQhP3B6o/u
lQxwEhAAkGfkdUAzsoOw9fnVjJakSx0BKbQ/JqLCf3840TOZqdrRYn7rkaBRBRe+
sL8V9pK5Kg/PgaYtqe+3MwFdxbfuqn+C+osS/H+tyIc3nFVZZUz3CJzGqU/cSmSE
KdK9FJarvgqVBzgyemcWxo/dlxXuDB2+2o57qwpln46xX2j4qJQJn43dL7QFw48Q
dzJFRr2J09ZqRE2X6qIeuTH70Abvy2hPEB5GLd3ctNxjy3B6F9FbQNuCyvsN9OyP
SCCTKvlYLrTS1UD2sjBTsTLi21gPk1VnEIGRoTGy6Z/sdRbkpfmB+mIMuKQq8I0P
287ggnW8Tm8MojRzzJimU3KjZO3ag1VyRqnD5sW+tE8CxxYF5dEn+c+mFocGj8My
DkO5FkDYPW4f0774kUgw0CUKW3BSJasaCVYA/AavwYjXPn3yGSeJKjslI6rq5k/q
cBkikxebpgXrT1/YBL7/9SmcwjSGu+TCRMZqE3rsGQ2P05xEIc2tzR5jAIsrJA8M
q52csySsdp99vQ2DMWZASdY0kiyem2kDHKIjOnYBePgNE6A2r3E4hgKXYfrs3Z9k
OhmTn/MyCebZ5nKrAOx9hTXi+2+93zoK9tsDP2Bu/JHvAUwhnj3kLEmQEwst3SX8
uvE6l1COvQYPryAUNekKe/NWmtF88cSk2XHaUHxMFBf2CBoCdqw=
=pnQd
-----END PGP SIGNATURE-----

--gBp5EPL8J0LpdCpa--

