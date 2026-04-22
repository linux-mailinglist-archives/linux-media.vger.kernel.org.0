Return-Path: <linux-media+bounces-59333-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K7rHZXD6Gm9PwIAu9opvQ
	(envelope-from <linux-media+bounces-59333-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:48:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C908B446296
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1AEB3074043
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516553E0241;
	Wed, 22 Apr 2026 12:45:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCC03DEFF3
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861908; cv=none; b=hPb62NJwFusBseD0y8xb96kCbzSAXRxJ1PO3eTmNseLR2qqHR1m8avJokvv9SKahiKfuJF1jgZYTB37dOvIh99QzQe3OxzCD1+Mbw8rR80TJoNVWQC33hRkr0wQkQCmZ30jlFUXXzD+LPhW7uOWBSgZpwhIghQjbWza+TMYY4jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861908; c=relaxed/simple;
	bh=iw3FG5WuY0XKB8Biup0LHt0wl9hIxDqW6EnLTXSblJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgiMxrdhUfcbb4jXVe1pcy98ZfBimITI8RMRavIKzIUVI7MgzQR9OdVf2cys2BaBOZU3bL7YYON0XazhPEKtJDAaKHqbLBnLxpMIXxzZdK/Vy7rKSQuTKPSNGGgpihRFWyNUZka3uaUFZd/gO3VhgYSeHpkiX+J12iFdaaUhPxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 223651F80060
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:44:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 3A7AEB40345; Wed, 22 Apr 2026 12:44:52 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id A1C01B40338;
	Wed, 22 Apr 2026 12:44:50 +0000 (UTC)
Date: Wed, 22 Apr 2026 14:44:30 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: arash golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-sunxi@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3] media: sun6i-mipi-csi2: Use V4L2 subdev active state
Message-ID: <aejCrrf_XA7CkINS@shepard>
References: <20260214050943.6306-1-arash.golgol@gmail.com>
 <CAMxPZkhkjqd2Y91TUpZsTJT2SppPqLrQpdYi5LWmzM8tLxV8Tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PipqgRqYHm31EQRR"
Content-Disposition: inline
In-Reply-To: <CAMxPZkhkjqd2Y91TUpZsTJT2SppPqLrQpdYi5LWmzM8tLxV8Tg@mail.gmail.com>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,sholland.org,lists.linux.dev,ideasonboard.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-59333-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C908B446296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--PipqgRqYHm31EQRR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

On Wed 22 Apr 26, 08:23, arash golgol wrote:
> I was hoping this patch would make its way into media-tree, but it seems
> it hasn't been applied yet.
>=20
> Is there anything missing or any modifications needed from my side?
> I'd appreciate any feedback.

I would like to test this patch before it gets in, but didn't manage to find
the time. The same should probably also apply to the a83t mipi csi-2 driver,
which is structured the same way.

Thanks for your work,

Paul


> Regards,
> Arash Golgol
>=20
> On Sat, Feb 14, 2026 at 8:40=E2=80=AFAM Arash Golgol <arash.golgol@gmail.=
com> wrote:
> >
> > Use the V4L2 subdev active state API to store the active format.
> > This simplifies the driver not only by dropping the bridge mbus_format
> > field, but it also allows dropping the bridge lock, replaced with
> > the state lock.
> >
> > The sun6i-mipi-csi2 hardware does not perform any format conversion.
> > Enforce identical formats on the sink and source pads in the set_fmt()
> > and init_state() callbacks.
> >
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes in v3:
> >     - link to v2: https://patchwork.kernel.org/project/linux-media/patc=
h/20260209055529.16644-1-arash.golgol@gmail.com/
> >     - Keep error path jumping to error_v4l2_notifier_cleanup on
> >     bridge setup failure
> >
> > Changes in v2:
> >     - link to v1: https://patchwork.kernel.org/project/linux-media/patc=
h/20260206123455.46476-1-arash.golgol@gmail.com/
> >     - Simplify control flow by dropping the else at end of s_stream()
> >     - Call v4l2_subdev_cleanup() on bridge setup failure before
> >     notifier registration
> >
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 +++++++++---------
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> >  2 files changed, 53 insertions(+), 56 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_cs=
i2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > index b06cb73015cd..682bdd82098c 100644
> > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > @@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_mi=
pi_csi2_device *csi2_dev)
> >                            SUN6I_MIPI_CSI2_CTL_EN, 0);
> >  }
> >
> > -static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *c=
si2_dev)
> > +static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *c=
si2_dev,
> > +                                      const struct v4l2_mbus_framefmt =
*mbus_format)
> >  {
> >         struct regmap *regmap =3D csi2_dev->regmap;
> >         unsigned int lanes_count =3D
> >                 csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> > -       struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mb=
us_format;
> >         const struct sun6i_mipi_csi2_format *format;
> >         struct device *dev =3D csi2_dev->dev;
> >         u32 version =3D 0;
> > @@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >         struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source_s=
ubdev;
> >         union phy_configure_opts dphy_opts =3D { 0 };
> >         struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mi=
pi_dphy;
> > -       struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mb=
us_format;
> > +       struct v4l2_subdev_state *state;
> > +       const struct v4l2_mbus_framefmt *mbus_format;
> >         const struct sun6i_mipi_csi2_format *format;
> >         struct phy *dphy =3D csi2_dev->dphy;
> >         struct device *dev =3D csi2_dev->dev;
> > @@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_su=
bdev *subdev, int on)
> >         unsigned long pixel_rate;
> >         int ret;
> >
> > -       if (!source_subdev)
> > -               return -ENODEV;
> > +       state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> > +
> > +       if (!source_subdev) {
> > +               ret =3D -ENODEV;
> > +               goto unlock;
> > +       }
> >
> >         if (!on) {
> >                 v4l2_subdev_call(source_subdev, video, s_stream, 0);
> > @@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >
> >         ret =3D pm_runtime_resume_and_get(dev);
> >         if (ret < 0)
> > -               return ret;
> > +               goto unlock;
> >
> >         /* Sensor Pixel Rate */
> >
> > @@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >                 goto error_pm;
> >         }
> >
> > +       mbus_format =3D v4l2_subdev_state_get_format(state,
> > +                                                  SUN6I_MIPI_CSI2_PAD_=
SINK);
> >         format =3D sun6i_mipi_csi2_format_find(mbus_format->code);
> >         if (WARN_ON(!format)) {
> >                 ret =3D -ENODEV;
> > @@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >
> >         /* Controller */
> >
> > -       sun6i_mipi_csi2_configure(csi2_dev);
> > +       sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
> >         sun6i_mipi_csi2_enable(csi2_dev);
> >
> >         /* D-PHY */
> > @@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >         if (ret && ret !=3D -ENOIOCTLCMD)
> >                 goto disable;
> >
> > -       return 0;
> > +       ret =3D 0;
> > +       goto unlock;
> >
> >  disable:
> >         phy_power_off(dphy);
> > @@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >  error_pm:
> >         pm_runtime_put(dev);
> >
> > +unlock:
> > +       v4l2_subdev_unlock_state(state);
> >         return ret;
> >  }
> >
> > @@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_m=
bus_framefmt *mbus_format)
> >  static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
> >                                       struct v4l2_subdev_state *state)
> >  {
> > -       struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata=
(subdev);
> > -       unsigned int pad =3D SUN6I_MIPI_CSI2_PAD_SINK;
> > -       struct v4l2_mbus_framefmt *mbus_format =3D
> > -               v4l2_subdev_state_get_format(state, pad);
> > -       struct mutex *lock =3D &csi2_dev->bridge.lock;
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
> > -       mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_code;
> > -       mbus_format->width =3D 640;
> > -       mbus_format->height =3D 480;
> > +               mbus_format =3D v4l2_subdev_state_get_format(state, pad=
);
> >
> > -       sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > +               mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_c=
ode;
> > +               mbus_format->width =3D 640;
> > +               mbus_format->height =3D 480;
> >
> > -       mutex_unlock(lock);
> > +               sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > +       }
> >
> >         return 0;
> >  }
> > @@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev=
 *subdev,
> >         return 0;
> >  }
> >
> > -static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> > -                                  struct v4l2_subdev_state *state,
> > -                                  struct v4l2_subdev_format *format)
> > -{
> > -       struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata=
(subdev);
> > -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > -       struct mutex *lock =3D &csi2_dev->bridge.lock;
> > -
> > -       mutex_lock(lock);
> > -
> > -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > -               *mbus_format =3D *v4l2_subdev_state_get_format(state,
> > -                                                            format->pa=
d);
> > -       else
> > -               *mbus_format =3D csi2_dev->bridge.mbus_format;
> > -
> > -       mutex_unlock(lock);
> > -
> > -       return 0;
> > -}
> > -
> >  static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
> >                                    struct v4l2_subdev_state *state,
> >                                    struct v4l2_subdev_format *format)
> >  {
> > -       struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata=
(subdev);
> > -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > -       struct mutex *lock =3D &csi2_dev->bridge.lock;
> > +       struct v4l2_mbus_framefmt *fmt;
> >
> > -       mutex_lock(lock);
> > +       /* The format on the source pad always matches the sink pad. */
> > +       if (format->pad !=3D SUN6I_MIPI_CSI2_PAD_SINK)
> > +               return v4l2_subdev_get_fmt(subdev, state, format);
> >
> > -       sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > +       sun6i_mipi_csi2_mbus_format_prepare(&format->format);
> >
> > -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > -               *v4l2_subdev_state_get_format(state, format->pad) =3D
> > -                       *mbus_format;
> > -       else
> > -               csi2_dev->bridge.mbus_format =3D *mbus_format;
> > +       /* Set the format on the sink pad. */
> > +       fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> > +       *fmt =3D format->format;
> >
> > -       mutex_unlock(lock);
> > +       /* Propagate the format to the source pad. */
> > +       fmt =3D v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD=
_SOURCE);
> > +       *fmt =3D format->format;
> >
> >         return 0;
> >  }
> >
> >  static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops =3D {
> >         .enum_mbus_code =3D sun6i_mipi_csi2_enum_mbus_code,
> > -       .get_fmt        =3D sun6i_mipi_csi2_get_fmt,
> > +       .get_fmt        =3D v4l2_subdev_get_fmt,
> >         .set_fmt        =3D sun6i_mipi_csi2_set_fmt,
> >  };
> >
> > @@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6=
i_mipi_csi2_device *csi2_dev)
> >         bool notifier_registered =3D false;
> >         int ret;
> >
> > -       mutex_init(&bridge->lock);
> > -
> >         /* V4L2 Subdev */
> >
> >         v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> > @@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun=
6i_mipi_csi2_device *csi2_dev)
> >         if (ret)
> >                 return ret;
> >
> > +       /* V4L2 Subdev finalize */
> > +
> > +       ret =3D v4l2_subdev_init_finalize(subdev);
> > +       if (ret < 0)
> > +               goto error_media_entity_cleanup;
> > +
> >         /* V4L2 Async */
> >
> >         v4l2_async_subdev_nf_init(notifier, subdev);
> > @@ -565,6 +560,9 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6=
i_mipi_csi2_device *csi2_dev)
> >  error_v4l2_notifier_cleanup:
> >         v4l2_async_nf_cleanup(notifier);
> >
> > +       v4l2_subdev_cleanup(subdev);
> > +
> > +error_media_entity_cleanup:
> >         media_entity_cleanup(&subdev->entity);
> >
> >         return ret;
> > @@ -579,6 +577,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_cs=
i2_device *csi2_dev)
> >         v4l2_async_unregister_subdev(subdev);
> >         v4l2_async_nf_unregister(notifier);
> >         v4l2_async_nf_cleanup(notifier);
> > +       v4l2_subdev_cleanup(subdev);
> >         media_entity_cleanup(&subdev->entity);
> >  }
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_cs=
i2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > index 24b15e34b5e8..d72dfbd6a993 100644
> > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > @@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
> >         struct media_pad                pads[SUN6I_MIPI_CSI2_PAD_COUNT];
> >         struct v4l2_fwnode_endpoint     endpoint;
> >         struct v4l2_async_notifier      notifier;
> > -       struct v4l2_mbus_framefmt       mbus_format;
> > -       struct mutex                    lock; /* Mbus format lock. */
> >
> >         struct v4l2_subdev              *source_subdev;
> >  };
> > --
> > 2.34.1
> >

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--PipqgRqYHm31EQRR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnowq4ACgkQhP3B6o/u
lQxSbQ//ReLiqgD1ijcw6mxqLHksOPb3NMWmYTaP6S/SF9P+LelrtSIogJKrg8JS
OwhUNWmrf8GqElza1YFe0DNHBmAEiXg1d210oXDFFU+RgX4cgsjMXXr1RpPnZ156
nfse0Vel2ieRKW08/U/+BdGo+qhEb2U2eXZWlXofkg4zg3hfDM4Nb6gs5QfFAsID
7D6LOPWzK+78CHpqTb+varpB2ktaEkZhd3nroRc0OstlFwZunaY4d/3aOPo9rPe5
jjq/QnN59xyQt+ODv/vGH4Mu86uaCpnPZpLiIOPPeGmRaKL1HfmVfQl6dq0kgUFX
V4yT9seLeyGpWcZAuXdjI8eoRPZ1uNsjPiCrfqLKX0Ribi+U4J+LjHyFRbioUMCc
jXaGjW4Ri4OEpXZyzZuSZvEuE2BsmymNWeiIQldbKigNqpPWcsMmQiVcR3IydHoh
tne3H2MrpjAPzkEUi+VAf7bdHPDBc6ysV6pbT3oKHGI5+hZRi/h0++UirqPBJqGs
w3FOd6bufYi2jk61jOqBpPxvI0DDxVqsD4TpowbkQjjoZUPoysAQFUAvfD+LIkXV
Oqlcy6iIJEP8CXwW43EIkKGI2Gvy0qtdGLvsVsseQZqxhegKWS/sp9AUCTulE6rE
urFl1/3h3sw7BPO5AdEsOxNdz7w61BeLBFSjwAibhqEjDsAnF4c=
=8gLy
-----END PGP SIGNATURE-----

--PipqgRqYHm31EQRR--

