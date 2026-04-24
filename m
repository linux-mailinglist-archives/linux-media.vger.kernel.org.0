Return-Path: <linux-media+bounces-59532-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMhMIIlz62kQNAAAu9opvQ
	(envelope-from <linux-media+bounces-59532-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 15:43:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2863045F7D7
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 15:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A42F30071C2
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10893D75B1;
	Fri, 24 Apr 2026 13:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiCzbM4H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1BB19A288
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038213; cv=pass; b=H4mDZElHSyy3p6yCxwlDrLx8wADpua1CHjzKQfveG868jgIlhqWhHT4HULg4ZZIYqY/O14EbwKutHZwYLmu7Gljm04IzM9U4IfzduCIPyLhCK/ASx6jpM0fMJ+sO40dLrLk2/q8V/7TgMNbZWdquziScuty0bzRyeXhyR3301lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038213; c=relaxed/simple;
	bh=kaI1ecLDmB21FRnbJQHF6H6SFxLGIwvSurmZn3BhoTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWeOaU5NjBIswpJi+ms3xo4whiWihYJTGuWitAcjWFzNNuDgwZpZaOc1MHNyoYSFnkdULUkOkuiL2dXml1QvaJnlttpvdMROfuGtu7Xm/q9QO2wtewHUDWHE/HX2sSbp6kv/hoBOpSwQh6EuevZahq0k+LV9bE7PwDg6AcTQqb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiCzbM4H; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-69485d0e4beso2231213eaf.3
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 06:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777038210; cv=none;
        d=google.com; s=arc-20240605;
        b=A9zN3llOtZTP13RzqYaijkJDAE0Xow8ni1hzUWgHCbzdX4Eg1gtqypJ8bWC9CmF6Pd
         zVxVj5SLo7thyextZL2iEWe91q91W4FbK982acIcHH+hoYfh8HS9GwS6rmbJ1aBN5fE0
         DAJs2aln9XlauIMCC7B0SXxfCwz/tmYKGK3B+i72NJqWA0Y7iuTdkwHuXNfJFWDqRNit
         txXjm4FlVo31mD72lGfsE/ti6YU1hkjsAVSUYJp6TQrR9b51/lTZPQ3v/u63f4+7F1pw
         q3xv+kcXZVrRwBzdDKmwYwWbI/xIWyGtu69cqj7EUXQsg9MQ6nsbRUWezonwlc4vay2w
         J0fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7aiJp9I3R9BF2pvxyEvUKHqV4YfnSmPycl5+v+XFKVs=;
        fh=ydOByyKuyNjTq6CGmzE1QAYHLivumoxeWJgwXNetAsE=;
        b=cw5iOMiImUa9nFIthm6NssHPBqC50SQI3S3k7qL0qDq/K9Qi1jGmVT9kiKuih1iqZQ
         QhXE17pOBalK5/SRvZeS/lJQBqWx7OKmedamRJAkJ9CXZtUiK1zA4SpnIsIkgnD6PeQO
         OBXes4zvDyZClSr54NuAxaY8s+e/ds7YwR7Do4dHXdj+cEi1EPlb9Z+qSW+xLDpUvYz6
         VQxEYBXFm2Tip3yDle3IBLp4MhYbrIJrZSu5cpSg0WcQCm6H+yhyWhzM0yYT1ZSdDPOi
         esBgTUeXDRePa30D2loK5kKfZh9ZXxNoSMwoCLdfzcXRHbSrN0OEnwN70LsnInBew4Mz
         yGdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777038210; x=1777643010; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aiJp9I3R9BF2pvxyEvUKHqV4YfnSmPycl5+v+XFKVs=;
        b=SiCzbM4HWiiljOOdoxbmWqtprW2zxip3+a0dgLbChGmMHKhyaD4Hp7LqGJRoKPR+4o
         o7Kodmjcwln4WQvaJeaH8UAO2+M7c8/leuMJNddb3Tpai9QvqhlPBqYfeG2FJbA5tVCP
         /edF3HRTwX12YSSrDUhSkBXPNnZyZ9o+7VMe/xWTRjfyNkMJ6Su6/TvUyvhazpOC4UuI
         P7+YlQJvoTZRzJTrk4XA5m8PuVa5PkjWIdXSC6nf2RZplKbPwkch2ufPSGHru6PEqAj5
         fIzp/A1E54mLQeBkM9+hxBcgv2+I5CbyWOMqOQqnMyrDJCflehHQAYesjc0q1dNik1kd
         8HHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038210; x=1777643010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7aiJp9I3R9BF2pvxyEvUKHqV4YfnSmPycl5+v+XFKVs=;
        b=I7dVHpLLn52Agixn6GRE9yEwxoFsCER4vvMeQw8j1IXJzOUTlXPRFPQe5dbV7eY7JM
         YfEWKHPwWcN4DR6dZxNveiw1bfMeCKa8SZYE1KWkC+BI36a/NxZ0cV9MfXnMSOAl7Q5D
         vUvxkYd32Yctd+gwpwwW/Zc4xGsPqElx+1JxXbcZ7Pf0XEaIz2GjzTHf6CZ5rHfZsmpH
         9FTXOBZklpZM4SsQktyOtUwpQymfEhaiIuG9nlSenOSJGBdkHjykLtwBMCswSRbDpzLO
         0nTghx1wyOJRP/GmJ9qYEwNxLA+3rCGO/mR3MFPazschnxxo0dUYlMJ2o8cOlTXMKzH8
         NcPA==
X-Gm-Message-State: AOJu0Yyb9BBkgimWbNQ80T0ASs5T1mArPxXIak9TeilfWzJkKlrLRald
	5feNynt4bPmdMtCfcWR0tmSaDxPnkdMxN2/2c7YjigSYfueV9zNNPBJrSu5CVYkMdXDzCs8CJMt
	KilYYgTNaADmQ+il+8itYhbczUJqsz3s=
X-Gm-Gg: AeBDietdD6dKR0vHVv+vbCWSdHDMDYX0rxFxuHi32E74jQTIXRSC5Z+OcUA/+Y0RaAF
	BTcBC/tBd4OUzQmHwsqldt/2zxik2aGc81ZdfyoJr7r2f5d2No55OIqffVnoKlysxiCbvKy39pe
	wXb1kVvXnjHk19sWzfQ/fsu670fbaUEh86hB9v3QcblGKwvbCghnMwqkko+98qT1y88hl0oExAw
	b72Z/lzynIfAIEEMGNzlG8KSfX2vP8TCU1mo+LNN/GqDFCFY0QTBEKGsVBAJcx+/ziVmNZYhQs4
	V5i7Ag/JmGMYfr6uKT0ox1hcx3W4Xrc3GIrbn0ljyw1AK+iW7L0UfQHuxNermsagkN9PoqynyjJ
	C72oyi+tySBohVA==
X-Received: by 2002:a05:6820:3092:b0:696:22bd:8576 with SMTP id
 006d021491bc7-69622bd90c6mr2507735eaf.56.1777038210277; Fri, 24 Apr 2026
 06:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214050943.6306-1-arash.golgol@gmail.com> <CAMxPZkhkjqd2Y91TUpZsTJT2SppPqLrQpdYi5LWmzM8tLxV8Tg@mail.gmail.com>
 <aejCrrf_XA7CkINS@shepard>
In-Reply-To: <aejCrrf_XA7CkINS@shepard>
From: arash golgol <arash.golgol@gmail.com>
Date: Fri, 24 Apr 2026 17:13:41 +0330
X-Gm-Features: AQROBzCXhOcEQ1gkBq8YLMpRsGBY1CFkoAUviaNK7AqHpionfqklCsm_mrtbdl0
Message-ID: <CAMxPZkjyW_FOFvHFT-WSMLYY=PcKDTH2k8Nd=ai-Ct9u9cn4Dg@mail.gmail.com>
Subject: Re: [PATCH v3] media: sun6i-mipi-csi2: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, linux-sunxi@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2863045F7D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59532-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,sholland.org,lists.linux.dev,ideasonboard.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,paulk.fr:url]

Hi Paul,

Thanks for your feedback.

On Wed, Apr 22, 2026 at 4:14=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Arash,
>
> On Wed 22 Apr 26, 08:23, arash golgol wrote:
> > I was hoping this patch would make its way into media-tree, but it seem=
s
> > it hasn't been applied yet.
> >
> > Is there anything missing or any modifications needed from my side?
> > I'd appreciate any feedback.
>
> I would like to test this patch before it gets in, but didn't manage to f=
ind
> the time. The same should probably also apply to the a83t mipi csi-2 driv=
er,
> which is structured the same way.

I have a Lichee-pi-zero-dock board which is connected to a Raspberry
Pi camera module (v1.3 based on OV5647) via a wrapper cable. I can
help with any test scenario you need.

I'll also start working on the a83t mipi csi2 driver and prepare a
similar patch for that as well.

--=20
Regards,
Arash Golgol


> Thanks for your work,
>
> Paul
>
>
> > Regards,
> > Arash Golgol
> >
> > On Sat, Feb 14, 2026 at 8:40=E2=80=AFAM Arash Golgol <arash.golgol@gmai=
l.com> wrote:
> > >
> > > Use the V4L2 subdev active state API to store the active format.
> > > This simplifies the driver not only by dropping the bridge mbus_forma=
t
> > > field, but it also allows dropping the bridge lock, replaced with
> > > the state lock.
> > >
> > > The sun6i-mipi-csi2 hardware does not perform any format conversion.
> > > Enforce identical formats on the sink and source pads in the set_fmt(=
)
> > > and init_state() callbacks.
> > >
> > > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes in v3:
> > >     - link to v2: https://patchwork.kernel.org/project/linux-media/pa=
tch/20260209055529.16644-1-arash.golgol@gmail.com/
> > >     - Keep error path jumping to error_v4l2_notifier_cleanup on
> > >     bridge setup failure
> > >
> > > Changes in v2:
> > >     - link to v1: https://patchwork.kernel.org/project/linux-media/pa=
tch/20260206123455.46476-1-arash.golgol@gmail.com/
> > >     - Simplify control flow by dropping the else at end of s_stream()
> > >     - Call v4l2_subdev_cleanup() on bridge setup failure before
> > >     notifier registration
> > >
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 +++++++++-------=
--
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> > >  2 files changed, 53 insertions(+), 56 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_=
csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > index b06cb73015cd..682bdd82098c 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > @@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_=
mipi_csi2_device *csi2_dev)
> > >                            SUN6I_MIPI_CSI2_CTL_EN, 0);
> > >  }
> > >
> > > -static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device =
*csi2_dev)
> > > +static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device =
*csi2_dev,
> > > +                                      const struct v4l2_mbus_framefm=
t *mbus_format)
> > >  {
> > >         struct regmap *regmap =3D csi2_dev->regmap;
> > >         unsigned int lanes_count =3D
> > >                 csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lane=
s;
> > > -       struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.=
mbus_format;
> > >         const struct sun6i_mipi_csi2_format *format;
> > >         struct device *dev =3D csi2_dev->dev;
> > >         u32 version =3D 0;
> > > @@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >         struct v4l2_subdev *source_subdev =3D csi2_dev->bridge.source=
_subdev;
> > >         union phy_configure_opts dphy_opts =3D { 0 };
> > >         struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.=
mipi_dphy;
> > > -       struct v4l2_mbus_framefmt *mbus_format =3D &csi2_dev->bridge.=
mbus_format;
> > > +       struct v4l2_subdev_state *state;
> > > +       const struct v4l2_mbus_framefmt *mbus_format;
> > >         const struct sun6i_mipi_csi2_format *format;
> > >         struct phy *dphy =3D csi2_dev->dphy;
> > >         struct device *dev =3D csi2_dev->dev;
> > > @@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
> > >         unsigned long pixel_rate;
> > >         int ret;
> > >
> > > -       if (!source_subdev)
> > > -               return -ENODEV;
> > > +       state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> > > +
> > > +       if (!source_subdev) {
> > > +               ret =3D -ENODEV;
> > > +               goto unlock;
> > > +       }
> > >
> > >         if (!on) {
> > >                 v4l2_subdev_call(source_subdev, video, s_stream, 0);
> > > @@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >
> > >         ret =3D pm_runtime_resume_and_get(dev);
> > >         if (ret < 0)
> > > -               return ret;
> > > +               goto unlock;
> > >
> > >         /* Sensor Pixel Rate */
> > >
> > > @@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >                 goto error_pm;
> > >         }
> > >
> > > +       mbus_format =3D v4l2_subdev_state_get_format(state,
> > > +                                                  SUN6I_MIPI_CSI2_PA=
D_SINK);
> > >         format =3D sun6i_mipi_csi2_format_find(mbus_format->code);
> > >         if (WARN_ON(!format)) {
> > >                 ret =3D -ENODEV;
> > > @@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >
> > >         /* Controller */
> > >
> > > -       sun6i_mipi_csi2_configure(csi2_dev);
> > > +       sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
> > >         sun6i_mipi_csi2_enable(csi2_dev);
> > >
> > >         /* D-PHY */
> > > @@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >         if (ret && ret !=3D -ENOIOCTLCMD)
> > >                 goto disable;
> > >
> > > -       return 0;
> > > +       ret =3D 0;
> > > +       goto unlock;
> > >
> > >  disable:
> > >         phy_power_off(dphy);
> > > @@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_s=
ubdev *subdev, int on)
> > >  error_pm:
> > >         pm_runtime_put(dev);
> > >
> > > +unlock:
> > > +       v4l2_subdev_unlock_state(state);
> > >         return ret;
> > >  }
> > >
> > > @@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2=
_mbus_framefmt *mbus_format)
> > >  static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
> > >                                       struct v4l2_subdev_state *state=
)
> > >  {
> > > -       struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevda=
ta(subdev);
> > > -       unsigned int pad =3D SUN6I_MIPI_CSI2_PAD_SINK;
> > > -       struct v4l2_mbus_framefmt *mbus_format =3D
> > > -               v4l2_subdev_state_get_format(state, pad);
> > > -       struct mutex *lock =3D &csi2_dev->bridge.lock;
> > > +       unsigned int pad;
> > >
> > > -       mutex_lock(lock);
> > > +       /*
> > > +        * This subdev does not perform format conversion,
> > > +        * initialize both pads identically.
> > > +        */
> > > +       for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> > > +               struct v4l2_mbus_framefmt *mbus_format;
> > >
> > > -       mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus_code;
> > > -       mbus_format->width =3D 640;
> > > -       mbus_format->height =3D 480;
> > > +               mbus_format =3D v4l2_subdev_state_get_format(state, p=
ad);
> > >
> > > -       sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > +               mbus_format->code =3D sun6i_mipi_csi2_formats[0].mbus=
_code;
> > > +               mbus_format->width =3D 640;
> > > +               mbus_format->height =3D 480;
> > >
> > > -       mutex_unlock(lock);
> > > +               sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > +       }
> > >
> > >         return 0;
> > >  }
> > > @@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subd=
ev *subdev,
> > >         return 0;
> > >  }
> > >
> > > -static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> > > -                                  struct v4l2_subdev_state *state,
> > > -                                  struct v4l2_subdev_format *format)
> > > -{
> > > -       struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevda=
ta(subdev);
> > > -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > > -       struct mutex *lock =3D &csi2_dev->bridge.lock;
> > > -
> > > -       mutex_lock(lock);
> > > -
> > > -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > > -               *mbus_format =3D *v4l2_subdev_state_get_format(state,
> > > -                                                            format->=
pad);
> > > -       else
> > > -               *mbus_format =3D csi2_dev->bridge.mbus_format;
> > > -
> > > -       mutex_unlock(lock);
> > > -
> > > -       return 0;
> > > -}
> > > -
> > >  static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
> > >                                    struct v4l2_subdev_state *state,
> > >                                    struct v4l2_subdev_format *format)
> > >  {
> > > -       struct sun6i_mipi_csi2_device *csi2_dev =3D v4l2_get_subdevda=
ta(subdev);
> > > -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > > -       struct mutex *lock =3D &csi2_dev->bridge.lock;
> > > +       struct v4l2_mbus_framefmt *fmt;
> > >
> > > -       mutex_lock(lock);
> > > +       /* The format on the source pad always matches the sink pad. =
*/
> > > +       if (format->pad !=3D SUN6I_MIPI_CSI2_PAD_SINK)
> > > +               return v4l2_subdev_get_fmt(subdev, state, format);
> > >
> > > -       sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > +       sun6i_mipi_csi2_mbus_format_prepare(&format->format);
> > >
> > > -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > > -               *v4l2_subdev_state_get_format(state, format->pad) =3D
> > > -                       *mbus_format;
> > > -       else
> > > -               csi2_dev->bridge.mbus_format =3D *mbus_format;
> > > +       /* Set the format on the sink pad. */
> > > +       fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> > > +       *fmt =3D format->format;
> > >
> > > -       mutex_unlock(lock);
> > > +       /* Propagate the format to the source pad. */
> > > +       fmt =3D v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_P=
AD_SOURCE);
> > > +       *fmt =3D format->format;
> > >
> > >         return 0;
> > >  }
> > >
> > >  static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops =3D =
{
> > >         .enum_mbus_code =3D sun6i_mipi_csi2_enum_mbus_code,
> > > -       .get_fmt        =3D sun6i_mipi_csi2_get_fmt,
> > > +       .get_fmt        =3D v4l2_subdev_get_fmt,
> > >         .set_fmt        =3D sun6i_mipi_csi2_set_fmt,
> > >  };
> > >
> > > @@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct su=
n6i_mipi_csi2_device *csi2_dev)
> > >         bool notifier_registered =3D false;
> > >         int ret;
> > >
> > > -       mutex_init(&bridge->lock);
> > > -
> > >         /* V4L2 Subdev */
> > >
> > >         v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> > > @@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct s=
un6i_mipi_csi2_device *csi2_dev)
> > >         if (ret)
> > >                 return ret;
> > >
> > > +       /* V4L2 Subdev finalize */
> > > +
> > > +       ret =3D v4l2_subdev_init_finalize(subdev);
> > > +       if (ret < 0)
> > > +               goto error_media_entity_cleanup;
> > > +
> > >         /* V4L2 Async */
> > >
> > >         v4l2_async_subdev_nf_init(notifier, subdev);
> > > @@ -565,6 +560,9 @@ static int sun6i_mipi_csi2_bridge_setup(struct su=
n6i_mipi_csi2_device *csi2_dev)
> > >  error_v4l2_notifier_cleanup:
> > >         v4l2_async_nf_cleanup(notifier);
> > >
> > > +       v4l2_subdev_cleanup(subdev);
> > > +
> > > +error_media_entity_cleanup:
> > >         media_entity_cleanup(&subdev->entity);
> > >
> > >         return ret;
> > > @@ -579,6 +577,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_=
csi2_device *csi2_dev)
> > >         v4l2_async_unregister_subdev(subdev);
> > >         v4l2_async_nf_unregister(notifier);
> > >         v4l2_async_nf_cleanup(notifier);
> > > +       v4l2_subdev_cleanup(subdev);
> > >         media_entity_cleanup(&subdev->entity);
> > >  }
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_=
csi2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > index 24b15e34b5e8..d72dfbd6a993 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > @@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
> > >         struct media_pad                pads[SUN6I_MIPI_CSI2_PAD_COUN=
T];
> > >         struct v4l2_fwnode_endpoint     endpoint;
> > >         struct v4l2_async_notifier      notifier;
> > > -       struct v4l2_mbus_framefmt       mbus_format;
> > > -       struct mutex                    lock; /* Mbus format lock. */
> > >
> > >         struct v4l2_subdev              *source_subdev;
> > >  };
> > > --
> > > 2.34.1
> > >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

