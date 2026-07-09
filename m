Return-Path: <linux-media+bounces-67094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L3wgE9okT2qRbAIAu9opvQ
	(envelope-from <linux-media+bounces-67094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 06:34:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D0272C90F
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 06:34:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lWfj69Q1;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67094-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67094-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9D9F302EA8C
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 04:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752BA3A1E81;
	Thu,  9 Jul 2026 04:34:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420D62701D9
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 04:34:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783571665; cv=pass; b=IC+A3nxe3tUkvVGYFSGqV0FWrl8BVgK+femXhblAvroujHOyn1e09PwWQSLy/T6ExtK61sbSR6crNzq5yRLM1vHMKdYKGtu6oyqm6ItGZYMEcQ8ur3uCM4H2/x0dGlxPK/3kSQd6NjGE8So+GSDAXmUcSqaI79CTY7l73H2dDGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783571665; c=relaxed/simple;
	bh=Xb/+x0K2HXIg+20+Or3W3rwEtW/sdi5K90Jo0JKmC08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBXXMJGd3HLhENpRSHaFhBDClti6CtRYxd+rfaV/n8IOu04yQIm49MqYUlVBEgDcsrahNt28o9hCJGG0Yfn5xr+0c2La+wy+YS3eb36pEb3cDDe7OdXmOjGzlA3cHUbVfELo11zttW7lhwzJBehSpZz19Fg+duepFnpggl9novQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWfj69Q1; arc=pass smtp.client-ip=209.85.161.49
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6a1840edbabso249739eaf.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 21:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783571663; cv=none;
        d=google.com; s=arc-20260327;
        b=OMK13UlxhffTN/BbUGhm4HjozY5QOBd1QRqQ+09+ZOP64d6TKZyzSZPegj/RIb/XTk
         9jY4ZO6ttCASCzjWUYvELefR81p+6moAAXerDZhcWd+1LuXCuS+slPnAHJmfHLt1nGOC
         r/vTuLnxZH+1hEA3Tu38WXMEgh+yZNTEsrfMLTWVMySzulKXGPAbSbHZnynmB0VuL0z/
         3O7p+DrVmf7atQNbNxMqClMwsJTd/Fij1PGGDodcIbekzTGovqz19egwhj26dhoeI1LY
         KHeyJ/wSE0+LzJwsdv4SPz4sc1sZtf6KDf2NyZxJ0kL5cYbh9g54ABs+mLsfTEvcjMkd
         DV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y+5mi5LqTF73iewEa2F/cq/mCI++zy608mfHssXjHys=;
        fh=NXDP5mrkTbBNzIl3CSB4DYq1eVPy83LvLeCmswdiENg=;
        b=GWccbX2VZA7crvf0910NRhBgmi78g6ahTWo3UapjYSRIMY5bEgmn40PkzLcUc62iw2
         zQDqfMAP5C8WhQQ4m6pxbpeFAaUWx5CI7osDzl4C1ThNDIlHaLEE4fvcFOAGcoCn0S2y
         40IkBRZcGComNSoWzhqxBpdk1uK/GvhY20o8OvNz5UYd2dQednCS7adk7WWqlfpBo14k
         E6n4VLQd/1xnpJoEtY/B4VMmnEFYV5Wzu1QSREqNeVR/TicdczQUKkTEx9beLESZzk9J
         8bIJ8in1GJGvAzj4RVUbBD+HIGbSXwHK6YmpMMt1yTFD2jyFSKZG6RxJEbS9uFhYwGf0
         krRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783571663; x=1784176463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+5mi5LqTF73iewEa2F/cq/mCI++zy608mfHssXjHys=;
        b=lWfj69Q1c4RLX/y/W9qIQBXgYBDJvhDrMX+jzfkfdv4iAjezimMZWSBA8MUZddMJrD
         W6HJMbaRZLXuIM7dsxTCQpRQUapz0SfIBhNeeF3WwXrQNIKuZgWdt83YZj61LWIwodVL
         kgVjdW7nZ7W+w9VuG+ZFBtA8VVmcFtjAFL8qywThuKMslDyjLqAS1eL40GxqtnxvhT/T
         F0yu42J3cb68UMEFtF/EGyTNjbAKkrRXTr20sdv0W2QYnCBTmOALsLvppd58WaOQosag
         rVIeDf4ZsjmWXJbxs2OaY4VX2ej27zZvsZY9hRsNCOwEljQgxp8wWLzR0998J1cBRpRU
         Q1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783571663; x=1784176463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+5mi5LqTF73iewEa2F/cq/mCI++zy608mfHssXjHys=;
        b=RoQsE29SEjnt+Uy2qqZwA+bzIzTv0ahfQr8L7xzwnHc24DwSngDEQKqTjLFW2oQfOS
         jxKkIXcaWysRunJFu0sybDSdo0WZEjpdIltWMV/JQjzEUg7t/L//PdlDqwojxRtL3jXQ
         p58fLaQLVTRsPoI1ZEfDAcyjs4A/f+ATvZQDOxvI3OhTsU2DYnUnsqjQRXPI4QfvEpXd
         2oBdBGCnkWwbVT1LRyT4/Hfi152d641zYdm0naDFs1B2JUOEGKlPaTcxxf0kID4QFp1w
         ooRbEOO0itvR5cP3wYCcNy211iiFEi0/JK+kCFrxeis3QkWEd0msxYUgTX8FJ5bu1Ds5
         gIzA==
X-Gm-Message-State: AOJu0YzxH5YUtY9jhof+3Ug/ZhsKLqkOx/rA8ICvamSneMueuZzTgphk
	/13867B7y/R3PiZ2jSE1Fy41jysT7ZqOqy+PxE6rNzPX76a53ND24gggyPMbAkKiQmew8TQS1JJ
	1u430ruRdf72n54wVEdb2/g853+AUC3k=
X-Gm-Gg: AfdE7ckPss0XFqMvXAikl9vLxHPo+waq2hWWi9/Flz5n1q73QaeU+L6RxK7UfmupTxU
	PDAAmhyBQgkkPqjAU5mdJ0KMMPyDWvyE0/O5QFuRlNkdgetnj5EI3ZaoDGtUAvMvuWBWNdZ0G54
	VAoMVGeQR1dA7j8zBsRpzjK4JkabD+E2/JWd1syDwPPiXvHIVaBmvpRtkSRJbhApJBTAk7HUlsm
	Zo8ijnNA6CC+JCRJ2vJkiO8FyariQuKgQrTOydR1TIixN8fqCtOrL5qJz8EPjBNZwYsbj7xz8zv
	CBiRoPt2vEZMp66zO92KdxHLWq6BGwdzrM4cyUABWY/1nvGBwKZJZz6b
X-Received: by 2002:a05:6820:1351:b0:6a1:83a4:8175 with SMTP id
 006d021491bc7-6a37d979bf7mr1046031eaf.27.1783571662872; Wed, 08 Jul 2026
 21:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214050943.6306-1-arash.golgol@gmail.com> <afx-yCUZAvWfMNEe@collins>
In-Reply-To: <afx-yCUZAvWfMNEe@collins>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 9 Jul 2026 08:04:13 +0330
X-Gm-Features: AUfX_mzXA53liaYn69cbaIPlddhq3zUcVGLrtRT5LMMElHdHeEB_6JlBdeHn1d4
Message-ID: <CAMxPZkia0_xHtaQfcfmizPz_AX-tLA7g+nC2FhgKtATiMUkfLA@mail.gmail.com>
Subject: Re: [PATCH v3] media: sun6i-mipi-csi2: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, linux-sunxi@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67094-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,sholland.org,lists.linux.dev,ideasonboard.com];
	FORGED_RECIPIENTS(0.00)[m:paulk@sys-base.io,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:linux-sunxi@lists.linux.dev,m:laurent.pinchart@ideasonboard.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7D0272C90F

Hi,

On Thu, May 7, 2026 at 3:30=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi Arash,
>
> Le Sat 14 Feb 26, 08:39, Arash Golgol a =C3=A9crit :
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
>
> Looks very good. Feel free to let me know if you'd like to do the same
> with A83T (I could test it on my side), otherwise I will take a look at
> it later. The driver has essentially exactly the same structure.
>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> Tested-by: Paul Kocialkowski <paulk@sys-base.io>

This is a gentle ping for this patch.
As far as I understand, the patch has received the required reviews and tes=
ting.
If there are no remaining issues, could it be considered for merging?

> All the best,
>
> Paul
>
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
> >                          SUN6I_MIPI_CSI2_CTL_EN, 0);
> >  }
> >
> > -static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *c=
si2_dev)
> > +static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *c=
si2_dev,
> > +                                    const struct v4l2_mbus_framefmt *m=
bus_format)
> >  {
> >       struct regmap *regmap =3D csi2_dev->regmap;
> >       unsigned int lanes_count =3D
> >               csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus=
_format;
> >       const struct sun6i_mipi_csi2_format *format;
> >       struct device *dev =3D csi2_dev->dev;
> >       u32 version =3D 0;
> > @@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >       struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source_sub=
dev;
> >       union phy_configure_opts dphy_opts =3D { 0 };
> >       struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mipi=
_dphy;
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus=
_format;
> > +     struct v4l2_subdev_state *state;
> > +     const struct v4l2_mbus_framefmt *mbus_format;
> >       const struct sun6i_mipi_csi2_format *format;
> >       struct phy *dphy =3D csi2_dev->dphy;
> >       struct device *dev =3D csi2_dev->dev;
> > @@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_su=
bdev *subdev, int on)
> >       unsigned long pixel_rate;
> >       int ret;
> >
> > -     if (!source_subdev)
> > -             return -ENODEV;
> > +     state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> > +
> > +     if (!source_subdev) {
> > +             ret =3D -ENODEV;
> > +             goto unlock;
> > +     }
> >
> >       if (!on) {
> >               v4l2_subdev_call(source_subdev, video, s_stream, 0);
> > @@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >
> >       ret =3D pm_runtime_resume_and_get(dev);
> >       if (ret < 0)
> > -             return ret;
> > +             goto unlock;
> >
> >       /* Sensor Pixel Rate */
> >
> > @@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >               goto error_pm;
> >       }
> >
> > +     mbus_format =3D v4l2_subdev_state_get_format(state,
> > +                                                SUN6I_MIPI_CSI2_PAD_SI=
NK);
> >       format =3D sun6i_mipi_csi2_format_find(mbus_format->code);
> >       if (WARN_ON(!format)) {
> >               ret =3D -ENODEV;
> > @@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >
> >       /* Controller */
> >
> > -     sun6i_mipi_csi2_configure(csi2_dev);
> > +     sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
> >       sun6i_mipi_csi2_enable(csi2_dev);
> >
> >       /* D-PHY */
> > @@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >       if (ret && ret !=3D -ENOIOCTLCMD)
> >               goto disable;
> >
> > -     return 0;
> > +     ret =3D 0;
> > +     goto unlock;
> >
> >  disable:
> >       phy_power_off(dphy);
> > @@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
> >  error_pm:
> >       pm_runtime_put(dev);
> >
> > +unlock:
> > +     v4l2_subdev_unlock_state(state);
> >       return ret;
> >  }
> >
> > @@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_m=
bus_framefmt *mbus_format)
> >  static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
> >                                     struct v4l2_subdev_state *state)
> >  {
> > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(s=
ubdev);
> > -     unsigned int pad =3D SUN6I_MIPI_CSI2_PAD_SINK;
> > -     struct v4l2_mbus_framefmt *mbus_format =3D
> > -             v4l2_subdev_state_get_format(state, pad);
> > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > +     unsigned int pad;
> >
> > -     mutex_lock(lock);
> > +     /*
> > +      * This subdev does not perform format conversion,
> > +      * initialize both pads identically.
> > +      */
> > +     for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> > +             struct v4l2_mbus_framefmt *mbus_format;
> >
> > -     mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_code;
> > -     mbus_format->width =3D 640;
> > -     mbus_format->height =3D 480;
> > +             mbus_format =3D v4l2_subdev_state_get_format(state, pad);
> >
> > -     sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > +             mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_cod=
e;
> > +             mbus_format->width =3D 640;
> > +             mbus_format->height =3D 480;
> >
> > -     mutex_unlock(lock);
> > +             sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > +     }
> >
> >       return 0;
> >  }
> > @@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev=
 *subdev,
> >       return 0;
> >  }
> >
> > -static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> > -                                struct v4l2_subdev_state *state,
> > -                                struct v4l2_subdev_format *format)
> > -{
> > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(s=
ubdev);
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > -
> > -     mutex_lock(lock);
> > -
> > -     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > -             *mbus_format =3D *v4l2_subdev_state_get_format(state,
> > -                                                          format->pad)=
;
> > -     else
> > -             *mbus_format =3D csi2_dev->bridge.mbus_format;
> > -
> > -     mutex_unlock(lock);
> > -
> > -     return 0;
> > -}
> > -
> >  static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
> >                                  struct v4l2_subdev_state *state,
> >                                  struct v4l2_subdev_format *format)
> >  {
> > -     struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevdata(s=
ubdev);
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > +     struct v4l2_mbus_framefmt *fmt;
> >
> > -     mutex_lock(lock);
> > +     /* The format on the source pad always matches the sink pad. */
> > +     if (format->pad !=3D SUN6I_MIPI_CSI2_PAD_SINK)
> > +             return v4l2_subdev_get_fmt(subdev, state, format);
> >
> > -     sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > +     sun6i_mipi_csi2_mbus_format_prepare(&format->format);
> >
> > -     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > -             *v4l2_subdev_state_get_format(state, format->pad) =3D
> > -                     *mbus_format;
> > -     else
> > -             csi2_dev->bridge.mbus_format =3D *mbus_format;
> > +     /* Set the format on the sink pad. */
> > +     fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> > +     *fmt =3D format->format;
> >
> > -     mutex_unlock(lock);
> > +     /* Propagate the format to the source pad. */
> > +     fmt =3D v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_S=
OURCE);
> > +     *fmt =3D format->format;
> >
> >       return 0;
> >  }
> >
> >  static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops =3D {
> >       .enum_mbus_code =3D sun6i_mipi_csi2_enum_mbus_code,
> > -     .get_fmt        =3D sun6i_mipi_csi2_get_fmt,
> > +     .get_fmt        =3D v4l2_subdev_get_fmt,
> >       .set_fmt        =3D sun6i_mipi_csi2_set_fmt,
> >  };
> >
> > @@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6=
i_mipi_csi2_device *csi2_dev)
> >       bool notifier_registered =3D false;
> >       int ret;
> >
> > -     mutex_init(&bridge->lock);
> > -
> >       /* V4L2 Subdev */
> >
> >       v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> > @@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun=
6i_mipi_csi2_device *csi2_dev)
> >       if (ret)
> >               return ret;
> >
> > +     /* V4L2 Subdev finalize */
> > +
> > +     ret =3D v4l2_subdev_init_finalize(subdev);
> > +     if (ret < 0)
> > +             goto error_media_entity_cleanup;
> > +
> >       /* V4L2 Async */
> >
> >       v4l2_async_subdev_nf_init(notifier, subdev);
> > @@ -565,6 +560,9 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6=
i_mipi_csi2_device *csi2_dev)
> >  error_v4l2_notifier_cleanup:
> >       v4l2_async_nf_cleanup(notifier);
> >
> > +     v4l2_subdev_cleanup(subdev);
> > +
> > +error_media_entity_cleanup:
> >       media_entity_cleanup(&subdev->entity);
> >
> >       return ret;
> > @@ -579,6 +577,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_cs=
i2_device *csi2_dev)
> >       v4l2_async_unregister_subdev(subdev);
> >       v4l2_async_nf_unregister(notifier);
> >       v4l2_async_nf_cleanup(notifier);
> > +     v4l2_subdev_cleanup(subdev);
> >       media_entity_cleanup(&subdev->entity);
> >  }
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_cs=
i2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > index 24b15e34b5e8..d72dfbd6a993 100644
> > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > @@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
> >       struct media_pad                pads[SUN6I_MIPI_CSI2_PAD_COUNT];
> >       struct v4l2_fwnode_endpoint     endpoint;
> >       struct v4l2_async_notifier      notifier;
> > -     struct v4l2_mbus_framefmt       mbus_format;
> > -     struct mutex                    lock; /* Mbus format lock. */
> >
> >       struct v4l2_subdev              *source_subdev;
> >  };
> > --
> > 2.34.1
> >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

--=20
Regards,
Arash Golgol

