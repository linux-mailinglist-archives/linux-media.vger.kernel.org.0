Return-Path: <linux-media+bounces-67350-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QFSZITE2UmqTNAMAu9opvQ
	(envelope-from <linux-media+bounces-67350-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 14:25:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBB17417E0
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 14:25:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Z8nyOeLe;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67350-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67350-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F031530137B1
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 12:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78E33C10AA;
	Sat, 11 Jul 2026 12:25:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6103A5E7B
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 12:25:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772715; cv=pass; b=HjjhiQ2kltDQNPMM6/O2k5GH2dPoX1OSJy6mCkgwF+E2Y517vCgFV56v8Z9dxYGyQFxiocM8fqbfGLpNcebVngzOWDSKvkwe+mtVmKrMecw38xut8Mniz7nXtF18iBPZ01xoYlSrrfXAa/r6oG8F+VxWQY2RbRsH2fYmtQXRyIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772715; c=relaxed/simple;
	bh=eXS2K1ZOIg4i0JyO+8HG0S1D3oCOCAXtk2WC8NBtWZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GevYDKYk/GrTA07YLLsp4DUftVvwZT3vr134Vu9LNzqzvJKRrU6H3C2fhfDBCMEG1WMfrnDUpojQVYNLpVOu0J/Nsf1prEdsKA5WmtS9Ee0C4DuPN6xj7IFGPjlaN/YuMJ3xR+Jv9tDob3HP/wi4KicMd+UDPBvlUVdyAtcmGuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8nyOeLe; arc=pass smtp.client-ip=209.85.167.171
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4960fb63c75so1034586b6e.2
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 05:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783772711; cv=none;
        d=google.com; s=arc-20260327;
        b=fK+da54Cx1ykQa9J9QOVGomsz+3D/Uba8GpF2FSogHl6oPHd8kqjX9ur9/7QsQ1oWe
         dlrVU7c3AgfiIzTQnXJzhpth1cXSAs5FyClyZEC7mLlzWoNhP8YpfZI7RfIDtxG40Lt8
         Fx2h/pGtQRVVax0QnHTFnF1bKDdInuGO3U5ZA0AfusrkMV9MwNGk+u5sjrNb8v0JU4th
         TnnFalrySWXhlYJI+dRKaCB7QUxq01n0KAyxWsHyNwdT15zHUFSeJA8zjDhNnIP8gWnj
         8cEObO79KI1ay4B8CcljawJmgz3c6lJBFLgM1DLhYu1mH1QZ8nyEtim4J1VuvvKTPGYj
         yGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGRyG/0ys0P2Ahtr58LtuFXAaoT80IRB3dXSGZ/SVSo=;
        fh=6mEJzTVR3J3nDe5d3hMZ7TImkCWk8O/DJ1J0GpKZxGs=;
        b=siHLLBrxB9XEUxSe+w4wYHb6qtL23C5ZwtRgWTd2MkyTuF6tJyQtvWbEvM/InOI4i1
         YM+kwW0sVooWV8OWac3Hzp/rHx9L4o9V5KLx0rpyOoX1N5eHE5Ni0gXN7d56Y2CWfHHV
         9/Sh8njyCtez284b+MIrFnDtfULMoQBeWZwLAEyIVJD0rTFepLwoZSRZhUTglE8MKglz
         9ugmcrA5ppfPjPInD8TTV70fFpY2sYCV5NjATYYaPKEAfZBDfk5DTNYxsTmQE5SNM8Lr
         bpVVBDWvMmulI/Nax6zDPJrzEQsA+8JCNcWf8zKiSQTkZneRvQ9RYak4EcGziWaSAmr2
         rs7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772711; x=1784377511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGRyG/0ys0P2Ahtr58LtuFXAaoT80IRB3dXSGZ/SVSo=;
        b=Z8nyOeLe2kj2cqOlSh5F0MDs8VZoUYSVvQ+oDrByP1CpifMPceGP2D0a3oWnnZFqnu
         LyDWt9vgA5Qwbd3vtTvNTRVen0M5SbCDqyrNEejN5taR/l1B8a7yl6h+i0XKT4pm4jPq
         klrOrm7lZBKLIL9JFWHsMSMj1/cH7eArYWGD9D2/FRziEJ31WSyt1zcijn/rSmoN6ttM
         Mjmcm463ac8g0/3X+Z0fdI+i81F4MkLvnRXa1+M8iUYcZk+I00GWMhtW8yem95IjGhFG
         VnKfx41MQdH6Y1u4iuxaVjJq9W969jUd8eMiYUyivLCc/1TEOPTuK3FIbFp02Ukq73Eg
         kPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772711; x=1784377511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGRyG/0ys0P2Ahtr58LtuFXAaoT80IRB3dXSGZ/SVSo=;
        b=M6BDgKzHVLTpOgYJSIvcSvKND1JogxcBVTjgofujuAXDBlqTE4zNfz7QZo3ASyrH6j
         v81W+FhDMOqmYKYtCzl75Ga+RmJlpM2BxOvJGNVjHmcr5ILfzXJ/t6rXcGifKKxnIyui
         yD/O9cyM1u4QEC+oG/kgV9VziYkanCtJBAG1v8XSUTX6ZAiqUoeC6OuOWunvWaS1MHZB
         ET0Onh1PoY2moIsLdyg9DYvHOn1unAzxrrYd/C+KtblTzpA2+eZAj23zkqcxGTIrQDY4
         GoMYSPJTYpqMH4IkVeDIL3l/4qqexNiYS1gx/VMrrFS49rndnPDjhnhfw0F1cSnWk9kw
         Fnww==
X-Gm-Message-State: AOJu0YzFQj4/+zk2i4ign0DxrdWC+lIvwpBxsOhA8ayHtKFBAQS6nubd
	dfKv6ulX1SfX87rPTbM+irSHBs1lg/ApMT14McHdFv734pg2/nFJLO92wtPl0ibsDFIORb1VKhT
	Z4zCV27W7JTTe+DXH5+KrMs4Oaibgo4k=
X-Gm-Gg: AfdE7cmKbuJm62KrGYsk5j8f+NS+wt/fH4QWZbUubgOO2wH06SG3UF8Bje6ONxtBWm9
	JurcTrcA9x1ecO24dkEVI2FeXEOzoUfOyFQaWErbz6qqf1G8ez6xyaxzyYVbR4oVTx0IGGZBq/6
	Sw/gb1xJS6yWGD04i/V8GjVQjeELcm5h9waxdX1R0PERibbLVqJcCtm/Uuzk8tedJC+hk4NRBe8
	DfVTGBcigrWQ4KhMBKhXmQVPvj7rlz03yhAxq3A92FNj02VHx9fvy4ulBZUqbiPDuXZ+JRvpzaz
	raEckWk3mA4AoNDKBQz9w923CKaHz2o92+KnT51u4/NSALPf+2frVi5jAQ==
X-Received: by 2002:a05:6808:120b:b0:487:61da:70fb with SMTP id
 5614622812f47-4a42ad68ed8mr1719757b6e.10.1783772711465; Sat, 11 Jul 2026
 05:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515173101.8978-1-arash.golgol@gmail.com> <agowixYIRIB7D3J3@collins>
In-Reply-To: <agowixYIRIB7D3J3@collins>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 11 Jul 2026 15:54:59 +0330
X-Gm-Features: AUfX_mzm-LNAe1Hj9LjE4lheklMeFv48h1ivIxDbQ5HN67cH33p6CC2n6a3BTpY
Message-ID: <CAMxPZkgMMQf52aOcPUkanhEOrNJnecNgppVmJ5044SDhWUPAaA@mail.gmail.com>
Subject: Re: [PATCH v3] media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67350-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:paulk@sys-base.io,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:laurent.pinchart@ideasonboard.com,m:linux-sunxi@lists.linux.dev,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,paulk.fr:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEBB17417E0

Hi,

On Mon, May 18, 2026 at 12:48=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Arash,
>
> Le Fri 15 May 26, 21:01, Arash Golgol a =C3=A9crit :
> > Use the V4L2 subdev active state API to store the active format.
> > This simplifies the driver not only by dropping the bridge mbus_format
> > field, but it also allows dropping the bridge lock, replaced with
> > the state lock.
> >
> > The sun8i-a83t-mipi-csi2 hardware does not perform any format
> > conversion. Enforce identical formats on the sink and source pads in
> > the set_fmt() and init_state() callbacks.
>
> Looks good to me and works well on the hardware!
> Thanks again for your work.
>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> Tested-by: Paul Kocialkowski <paulk@sys-base.io>

I'd like to gently follow up on this patch.

> All the best,
>
> Paul
>
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > ---
> > Changes in v3:
> >  - Fix active state lock leak on runtime PM error path
> >
> > Changes in v2:
> >  - Initialize active state before calling v4l2_subdev_state_get_format(=
)
> >  - Fix line wrapping reported by checkpatch
> >  - Link to media-ci report: https://linux-media.pages.freedesktop.org/-=
/users/patchwork/-/jobs/99865145/artifacts/report.htm
> >
> >  .../sun8i_a83t_mipi_csi2.c                    | 113 +++++++++---------
> >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> >  2 files changed, 56 insertions(+), 59 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a8=
3t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a8=
3t_mipi_csi2.c
> > index dbc51daa4fe3..2b7635f3952d 100644
> > --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi=
_csi2.c
> > +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi=
_csi2.c
> > @@ -144,12 +144,12 @@ sun8i_a83t_mipi_csi2_disable(struct sun8i_a83t_mi=
pi_csi2_device *csi2_dev)
> >  }
> >
> >  static void
> > -sun8i_a83t_mipi_csi2_configure(struct sun8i_a83t_mipi_csi2_device *csi=
2_dev)
> > +sun8i_a83t_mipi_csi2_configure(struct sun8i_a83t_mipi_csi2_device *csi=
2_dev,
> > +                            const struct v4l2_mbus_framefmt *mbus_form=
at)
> >  {
> >       struct regmap *regmap =3D csi2_dev->regmap;
> >       unsigned int lanes_count =3D
> >               csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus=
_format;
> >       const struct sun8i_a83t_mipi_csi2_format *format;
> >       struct device *dev =3D csi2_dev->dev;
> >       u32 version =3D 0;
> > @@ -205,7 +205,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >       struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source_sub=
dev;
> >       union phy_configure_opts dphy_opts =3D { 0 };
> >       struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mipi=
_dphy;
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.mbus=
_format;
> > +     struct v4l2_subdev_state *state;
> > +     const struct v4l2_mbus_framefmt *mbus_format;
> >       const struct sun8i_a83t_mipi_csi2_format *format;
> >       struct phy *dphy =3D csi2_dev->dphy;
> >       struct device *dev =3D csi2_dev->dev;
> > @@ -215,8 +216,12 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4=
l2_subdev *subdev, int on)
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
> > @@ -228,7 +233,7 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >
> >       ret =3D pm_runtime_resume_and_get(dev);
> >       if (ret < 0)
> > -             return ret;
> > +             goto unlock;
> >
> >       /* Sensor pixel rate */
> >
> > @@ -254,6 +259,9 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >               goto error_pm;
> >       }
> >
> > +     mbus_format =3D
> > +             v4l2_subdev_state_get_format(state,
> > +                                          SUN8I_A83T_MIPI_CSI2_PAD_SIN=
K);
> >       format =3D sun8i_a83t_mipi_csi2_format_find(mbus_format->code);
> >       if (WARN_ON(!format)) {
> >               ret =3D -ENODEV;
> > @@ -292,7 +300,7 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >
> >       /* Controller */
> >
> > -     sun8i_a83t_mipi_csi2_configure(csi2_dev);
> > +     sun8i_a83t_mipi_csi2_configure(csi2_dev, mbus_format);
> >       sun8i_a83t_mipi_csi2_enable(csi2_dev);
> >
> >       /* D-PHY */
> > @@ -309,7 +317,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >       if (ret && ret !=3D -ENOIOCTLCMD)
> >               goto disable;
> >
> > -     return 0;
> > +     ret =3D 0;
> > +     goto unlock;
> >
> >  disable:
> >       phy_power_off(dphy);
> > @@ -318,6 +327,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
> >  error_pm:
> >       pm_runtime_put(dev);
> >
> > +unlock:
> > +     v4l2_subdev_unlock_state(state);
> >       return ret;
> >  }
> >
> > @@ -341,22 +352,24 @@ sun8i_a83t_mipi_csi2_mbus_format_prepare(struct v=
4l2_mbus_framefmt *mbus_format)
> >  static int sun8i_a83t_mipi_csi2_init_state(struct v4l2_subdev *subdev,
> >                                          struct v4l2_subdev_state *stat=
e)
> >  {
> > -     struct sun8i_a83t_mipi_csi2_device *csi2_dev =3D
> > -             v4l2_get_subdevdata(subdev);
> > -     unsigned int pad =3D SUN8I_A83T_MIPI_CSI2_PAD_SINK;
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
> > -     mbus_format->code =3D sun8i_a83t_mipi_csi2_formats[0].mbus_code;
> > -     mbus_format->width =3D 640;
> > -     mbus_format->height =3D 480;
> > +             mbus_format =3D v4l2_subdev_state_get_format(state, pad);
> > +
> > +             mbus_format->code =3D sun8i_a83t_mipi_csi2_formats[0].mbu=
s_code;
> > +             mbus_format->width =3D 640;
> > +             mbus_format->height =3D 480;
> >
> > -     sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
> > +             sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
> > +     }
> >
> > -     mutex_unlock(lock);
> >
> >       return 0;
> >  }
> > @@ -375,55 +388,33 @@ sun8i_a83t_mipi_csi2_enum_mbus_code(struct v4l2_s=
ubdev *subdev,
> >       return 0;
> >  }
> >
> > -static int sun8i_a83t_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> > -                                     struct v4l2_subdev_state *state,
> > -                                     struct v4l2_subdev_format *format=
)
> > -{
> > -     struct sun8i_a83t_mipi_csi2_device *csi2_dev =3D
> > -             v4l2_get_subdevdata(subdev);
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
> >  static int sun8i_a83t_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
> >                                       struct v4l2_subdev_state *state,
> >                                       struct v4l2_subdev_format *format=
)
> >  {
> > -     struct sun8i_a83t_mipi_csi2_device *csi2_dev =3D
> > -             v4l2_get_subdevdata(subdev);
> > -     struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > -     struct mutex *lock =3D &csi2_dev->bridge.lock;
> > +     struct v4l2_mbus_framefmt *fmt;
> >
> > -     mutex_lock(lock);
> > +     /* The format on the source pad always matches the sink pad. */
> > +     if (format->pad !=3D SUN8I_A83T_MIPI_CSI2_PAD_SINK)
> > +             return v4l2_subdev_get_fmt(subdev, state, format);
> >
> > -     sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
> > +     sun8i_a83t_mipi_csi2_mbus_format_prepare(&format->format);
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
> > +     fmt =3D v4l2_subdev_state_get_format(state,
> > +                                        SUN8I_A83T_MIPI_CSI2_PAD_SOURC=
E);
> > +     *fmt =3D format->format;
> >
> >       return 0;
> >  }
> >
> >  static const struct v4l2_subdev_pad_ops sun8i_a83t_mipi_csi2_pad_ops =
=3D {
> >       .enum_mbus_code =3D sun8i_a83t_mipi_csi2_enum_mbus_code,
> > -     .get_fmt        =3D sun8i_a83t_mipi_csi2_get_fmt,
> > +     .get_fmt        =3D v4l2_subdev_get_fmt,
> >       .set_fmt        =3D sun8i_a83t_mipi_csi2_set_fmt,
> >  };
> >
> > @@ -540,8 +531,6 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t=
_mipi_csi2_device *csi2_dev)
> >       bool notifier_registered =3D false;
> >       int ret;
> >
> > -     mutex_init(&bridge->lock);
> > -
> >       /* V4L2 Subdev */
> >
> >       v4l2_subdev_init(subdev, &sun8i_a83t_mipi_csi2_subdev_ops);
> > @@ -570,6 +559,12 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83=
t_mipi_csi2_device *csi2_dev)
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
> > @@ -603,6 +598,9 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t=
_mipi_csi2_device *csi2_dev)
> >  error_v4l2_notifier_cleanup:
> >       v4l2_async_nf_cleanup(notifier);
> >
> > +     v4l2_subdev_cleanup(subdev);
> > +
> > +error_media_entity_cleanup:
> >       media_entity_cleanup(&subdev->entity);
> >
> >       return ret;
> > @@ -617,6 +615,7 @@ sun8i_a83t_mipi_csi2_bridge_cleanup(struct sun8i_a8=
3t_mipi_csi2_device *csi2_dev
> >       v4l2_async_unregister_subdev(subdev);
> >       v4l2_async_nf_unregister(notifier);
> >       v4l2_async_nf_cleanup(notifier);
> > +     v4l2_subdev_cleanup(subdev);
> >       media_entity_cleanup(&subdev->entity);
> >  }
> >
> > diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a8=
3t_mipi_csi2.h b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a8=
3t_mipi_csi2.h
> > index f1e64c53434c..819527bcd64d 100644
> > --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi=
_csi2.h
> > +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi=
_csi2.h
> > @@ -33,8 +33,6 @@ struct sun8i_a83t_mipi_csi2_bridge {
> >       struct media_pad                pads[SUN8I_A83T_MIPI_CSI2_PAD_COU=
NT];
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

