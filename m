Return-Path: <linux-media+bounces-54427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKduCtbwp2mWlwAAu9opvQ
	(envelope-from <linux-media+bounces-54427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 09:44:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF0C1FCCA6
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 09:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38693308BCDA
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 08:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BB537F72F;
	Wed,  4 Mar 2026 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzR/VolI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2E4392C58
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613621; cv=pass; b=dbySBco/wbn/uI4KuvoQLiWdnu8Zw0Qu5NmcCP6zzPxwVGXTq6ANmzpWi7oNIAsa6BBnVT7p0Ab+L2vC83jC6VB5otbgh+wtbf5VPxgECqdSHpy22pYaz5i379WL+IiogiUTe+f6EK1PltT9Q1ny6J1EsdlCSALD1dllbUa6dZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613621; c=relaxed/simple;
	bh=BjJ6xJV0OvlriaqNkucLEaU/Z9qFOGjZ/IGwRvxOUDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1KVsFu/QVpuW7uulwJzy4Es18DnIU9PnibH2M4QPZjuq6DcnDylOeoku7NobWD9HBby0JtMC8OzTgIXBv04D1PERaVVAFn+ATd/NM1lbAK8hoeg5aswQuUXK67QxzEiS6l6XV3A/chGAPk7Nt4wSJEKLqW6mVDNsuY0py8xQcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzR/VolI; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483a233819aso64230185e9.3
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 00:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772613617; cv=none;
        d=google.com; s=arc-20240605;
        b=iGMLluJL7cF/tKDHgG3DJf5Zf9DFVA4VLiWYU+6niqAKV8ooIkF1/bjVbtSHsGOjqE
         QWXo/HwWplvleIf8tN4aKI5i1M3DJSXR23k/NloGUoouGmM/4MTbtuHSXCuC9aKI/uYl
         mYkUpo4UAShe4t+gmZJ/ydYNF5NRdH5/0Pz/5cKleQmUbqBm7w4RU5dJXsN7DLXhnUiv
         QYtijdj44HgQgts1s4PTk1NgksnSbiHvC1OrXigIxdKsgCRHlej+CsWd16vo0T1gy+p/
         fc2sblP8pVDauu69UJoovaaaUVyo5ZgfneDMHIz4+yvamjGbxr8tTRgRmreCE2l0LmCT
         QRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PToNCG/C8hBrD2f8Fqj5gn5SsgI35QaMUla9CaktgXY=;
        fh=sN+CrSyyHu9paViUTisFpGpqz+7UZu0mxegcG4QcCaA=;
        b=ivi1OOjt907En2v9PnlwAJlPEKcQ4eTj+qWzPDD0G97T4QR0W+jTwU9GhB3Ytae39n
         C6Z7W3OQEv34feLshl/lFIWIoYfMbnaMWbF6rnrlCuSBxvnvQaNCHJxuxGZvGFWRF3Ue
         jvzrT1kiYlsUJ3CLg+xqkSDGI5XtpnvWH0ETkdYxYXFyUMu28AJgtuNiRGBNq/ybsdbN
         OJxy47D6Ua0TGSQjCJ7jAv38Lw5OL+eRAxwKICLYfcuo/PJrTTj1kpgwBEVm943git+V
         DiDupZYj7j+8p6d4sH+hAcy0nvYRUUkTJQwAmA3KipBR/p73Cef5jyFNM+2V5Lyo6msl
         DE0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613617; x=1773218417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PToNCG/C8hBrD2f8Fqj5gn5SsgI35QaMUla9CaktgXY=;
        b=HzR/VolI3B38dUjo5bkIV4Zv8a0lmKjnpz3yBzzs14v2y3yWJ27PlFgfwzwbkx0iHj
         9R5xt2aIk9rc4L1b5nltlEaQgqID4ivyPrf92AFPO6nqn/iwPRXp02r+WlpWwS8ImKhS
         DmMoXXrRZ//JO+SsGdoFl5DndabEnGmGcwkDfL/40aX/AT107yk13mkDAHtmhtynZtmk
         ruj1cEwhmJATVluVDdaCox4h5Qsh1873qhSvPSbnQNWVZU8qq6ZbyVNe0F3ndEWInmri
         /3huvUFwmhUJNQqLTYQgUT+N2aTtRO9Okb7GeRIhIV0LzJf/5Q4wKElnk19ExOzbZDbr
         AqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613617; x=1773218417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PToNCG/C8hBrD2f8Fqj5gn5SsgI35QaMUla9CaktgXY=;
        b=rCR+VqN8HV8H15hk4XccC8zj1iF9IXlOdPc6jfZhy61+QfdhJyZsW41OrQk/svWAjc
         1RzXLvakR/ohh0kpov5dabLXjmNOr9yuNXp6RTAfeAJ9YZEGJP102n2IuZdogGHa5tCN
         BSPdP1RK77tlcjIwkIN2MODCA4zMV5ZUfEJSjTs0/3OVwnX19BgwWTt6WU5FdmgKwN8Z
         nAZmvp1c8jCtIX40Ei9WivpH023tQ2tIm5r858D7tZ91us15AHqHrQ9vulAC4IZFXZKI
         lXiAtGgJ6SLgXzHoMSPzwZMYs1fnjO2krfLU2OWmI6b+OXs5Y3qaA+T8GjZflPbXhcXW
         tsSg==
X-Forwarded-Encrypted: i=1; AJvYcCXenVwCEbce1X+wdXEA4TzeGke8ShFo7taCJ5POyKV1RERbXF5t4VPY3dsDqqSWgqElw4xrHDuiei8pSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPzICT84pXZ0yic5xC4l5ZIw0vWUpxaMdu9lgADFcCprHDQN57
	yFBnH1gEoRkosN3Y1iYnaVnxjznL4GKjZobTVGqi93+fdhOkOE/qqVETjiISLUv8JVk320DD49W
	NFMt0piSUVpoEd0WJuzoIUwAYQ/W3y8A=
X-Gm-Gg: ATEYQzxIw0nSzcV4GUZx/XoAGf7topf8oXSjXyDrFTxq639Twam2eT02v31IiFGOuI4
	3TAQQ7lTw0VuUA+Z64lFPoNhs394OXslm/dAn3nlUIN+0bgrPIh03nT9VxxzYRQH/XjYqj+uE9z
	KSHWqm7aLuRUgd16Xpyzk42fhRDd8Hiv6CS2woM4o7jKPI1EpQVZyatzUOBvO3h7/dhhok57GDA
	ZjP4CX6fD9aZ+zVk2GAO1q1r/ewUX+m67XDie6YOFIwzoD4paCOpNyHdCEbr/a1tEjT9qZuzqu0
	YzXGpLp9pnrokwyJlTQ=
X-Received: by 2002:a05:600c:348c:b0:477:5b0a:e616 with SMTP id
 5b1f17b1804b1-4851983beafmr17136285e9.5.1772613616974; Wed, 04 Mar 2026
 00:40:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212122302.29211-1-clamor95@gmail.com> <20260212122302.29211-3-clamor95@gmail.com>
 <1cb955d5-c813-4b52-8f0a-51e4635d7b27@oss.qualcomm.com> <CAPVz0n0CSFhYKnzLWsSo_7kE_nDsBKJ1cS+A5ZQ6gt9DWLtxAg@mail.gmail.com>
 <aafuPQ171Jwo12D-@kekkonen.localdomain>
In-Reply-To: <aafuPQ171Jwo12D-@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 4 Mar 2026 10:40:04 +0200
X-Gm-Features: AaiRm501RsxWyL5sfj2qe_GSU5MTvwMpcXbGWTlrKFBEqfbE3BqOJ9UScvPBd4o
Message-ID: <CAPVz0n0moFZkubOwDnXGpMLg8S4LW9KEFgnFMH5PmrEzExH6bg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: mt9m114: add support for Aptina MI1040
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: johannes.goede@oss.qualcomm.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7AF0C1FCCA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54427-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Action: no action

=D1=81=D1=80, 4 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 10:32 Sakar=
i Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav, Hans,
>
> On Thu, Feb 12, 2026 at 06:44:06PM +0200, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 12 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:53 =
<johannes.goede@oss.qualcomm.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Hi,
> > >
> > > On 12-Feb-26 13:23, Svyatoslav Ryhel wrote:
> > > > Slightly different version of MT9M114 camera module is used in a se=
veral
> > > > devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 an=
d is
> > > > called Aptina MI1040. The only difference found so far is lacking a=
bility
> > > > to poll STATE register during power on sequence, which causes drive=
r to
> > > > fail with time out error. Add state_polling flag to diverge models =
and
> > > > address quirk found in MI1040.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/media/i2c/mt9m114.c | 29 ++++++++++++++++++++++++-----
> > > >  1 file changed, 24 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m11=
4.c
> > > > index d5b142fe68a9..a4b021702a1f 100644
> > > > --- a/drivers/media/i2c/mt9m114.c
> > > > +++ b/drivers/media/i2c/mt9m114.c
> > > > @@ -373,6 +373,10 @@ enum {
> > > >   * Data Structures
> > > >   */
> > > >
> > > > +struct mt9m114_model_info {
> > > > +     bool state_polling;
> > > > +};
> > > > +
> > > >  enum mt9m114_format_flag {
> > > >       MT9M114_FMT_FLAG_PARALLEL =3D BIT(0),
> > > >       MT9M114_FMT_FLAG_CSI2 =3D BIT(1),
> > > > @@ -422,6 +426,8 @@ struct mt9m114 {
> > > >
> > > >               struct v4l2_ctrl *tpg[4];
> > > >       } ifp;
> > > > +
> > > > +     const struct mt9m114_model_info *info;
> > > >  };
> > > >
> > > >  /* ---------------------------------------------------------------=
--------------
> > > > @@ -2279,9 +2285,11 @@ static int mt9m114_power_on(struct mt9m114 *=
sensor)
> > > >        * reaches the standby mode (either initiated manually above =
in
> > > >        * parallel mode, or automatically after reset in MIPI mode).
> > > >        */
> > > > -     ret =3D mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY)=
;
> > > > -     if (ret < 0)
> > > > -             goto error_clock;
> > > > +     if (sensor->info->state_polling) {
> > > > +             ret =3D mt9m114_poll_state(sensor, MT9M114_SYS_STATE_=
STANDBY);
> > > > +             if (ret < 0)
> > > > +                     goto error_clock;
> > > > +     }
> > >
> > > So I would expect a flag called state_polling to be checked
> > > in mt9m114_poll_state(). It looks like you are only disabling
> > > one specific case of state polling, not all of them.
>
> There's a single user for mt9m114_poll_state()... I think the current nam=
e
> is fine.
>

I will name the flag `state_standby_polling` if everyone is fine with
it since the case below requires resending anyway.

> > >
> > > Please rename the flag to reflect this.
> > >
> >
> > And which name you see fitting? There is only one instance of using
> > mt9m114_poll_state in this driver, I see no controversy in naming.
> >
> > > >
> > > >       return 0;
> > > >
> > > > @@ -2527,6 +2535,8 @@ static int mt9m114_probe(struct i2c_client *c=
lient)
> > > >       if (ret < 0)
> > > >               return ret;
> > > >
> > > > +     sensor->info =3D device_get_match_data(dev);
> > > > +
> > >
> > > This can return NULL when the driver is manually bound through
> > > sysfs, which will result in a crash later on when checked in
> > > mt9m114_power_on()
>
> Svyatoslav, can you add a check for this?
>
> I guess a few other drivers also suffer from this...
>

Yes, sure. Should I set it to return neg error or fallback to default entry=
?

> --
> Regards,
>
> Sakari Ailus

