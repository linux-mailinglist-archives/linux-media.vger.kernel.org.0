Return-Path: <linux-media+bounces-55959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNw8FApMuGlHbwEAu9opvQ
	(envelope-from <linux-media+bounces-55959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:29:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CD529F0C6
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB41D3024A0B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4ED433D501;
	Mon, 16 Mar 2026 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="ek+kyWvV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4E83DCD86
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773685763; cv=pass; b=US7V1aKp7F3ok5sNCUD1TSE2bE07p+qdyFKjBkg7qT0KN+qYLBwHGQiqSFUykRxQ2yEDDeoOfmfqKQScnZ+0DhsyEVdJn3DSH8J5S2ZWqHyDCsWBYawYkih2VjbbauAtnSZWd54+BMGbYKPwlh9jjdp+YuI0MXGenYNYkp13emA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773685763; c=relaxed/simple;
	bh=7+sbDeFw42xnTw+3RgJyLX84c3jTiwfY3LhEKruHpks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CganUFT5emX6f6sMfPS5jgVkuubDVr0XqQQglBSb5/nVcduInLXIZ46UjtYD1mLTSOLHc8I2mps6US2Zl8QoAx1jGOdV41mNjpUOwGSiXrBLvaPtZYQqXh6KAIgowlOyeYp65T1+ZhCunFAmI47FN8PzhXb1htw31/c0s33qV54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=ek+kyWvV; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-46701f2077cso6570b6e.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 11:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773685749; cv=none;
        d=google.com; s=arc-20240605;
        b=ewLiVS9dT+2hSOeTT827BRf+686qynO8xL2fbMlVaS2ETBSoGUSvJsgtaH7jI3xSJV
         4rQUbNUAYOMJ1tghSbtPOTwH/9W0BbYn3sgciajidvV2i/rVHaVlTOXk1/nNK+CV/6KQ
         TPc68PjBW49COwEO3VOxD2UlmEJlVSM0pgozJyJEr7kwW0MmRVg4L3KQx0l7b4hq/nSq
         0It/qVomDKwB+2MGCst0nafyPKQZjr+MRorQO6d2IxPHl0f7C5dRoLHJmg0HyXHRKxS/
         e/ncWFKFLOzcTw3DbCi9/2UYS4prpw18RrlCAEXIyVc9rE9Rwa2uJ+pCKCi9Q8Cm2FK+
         zavA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rlt1uwztZbkFRd4k0/GFq25I2E9rXc5FDZm2DYEHUtw=;
        fh=SUHx3lxdVvcKTVR88pDt0PHq6iishJqJW0D71/wP8Fc=;
        b=WbDlAvp3vvhhYqSCYnwipgTrtPVqhog3Wh4q4DRhyjJVvhQ5Id6byPdmJXkr9M9vqZ
         6/7sc/yUoZp26fBdDpzMxieL4mrl/rr+H5oav3nT1zuHOW6O3TyLzUoaVeAvuA9mJ0oG
         WGHTXwvKcpCr1KWhOixmXMFjw5X9l8EnjnW5cXca7rVmYFhRwC5aATgiLMJY3NYn9ts8
         6MMd256dwSUdz1G5/zqm5ofEcmzknGZSKvtqvc3TNRKLi+H1pW93DBSPlEmdEZd6IfEZ
         KWq0b73duoshTHWkyjIwklBF93MO8Xyirgj99UP9gTSR0yJGSbpN1kXr5FC8MBDdoced
         O+tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773685749; x=1774290549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rlt1uwztZbkFRd4k0/GFq25I2E9rXc5FDZm2DYEHUtw=;
        b=ek+kyWvVmgYPJe4I2W46XkEEqNJhOXM2ie4c+vxSMD33TCgKmWq1rTwi0MMPuSCTq6
         Q2RqTeezjM82bhidPV6tWrusJJ4/cnYFEnNEau93q6RYnJ43fxhUDeRzdNtS0cDWhv2Y
         Mix+0HeuokdyrMO8Ux7/5j8tJk5nOW6uOU22AsDuqBb7c33wTnN7P8AL3vCbdmzwmMBJ
         LEn2iREbUxzq8Fo8roc9Jz3Fs4dw+88XnmNqLvOm7DzoNrsCDF6O9kSc9aOCAUzvoRVZ
         FUdOOAL56xdvcTPXCgdN84ZJa6kUL89WLPtUosRF+KUFHiNFA6IkUezM4S40LMMzE35+
         0eKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773685749; x=1774290549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rlt1uwztZbkFRd4k0/GFq25I2E9rXc5FDZm2DYEHUtw=;
        b=lVNwNeBo5Hj8ecHcwPuo09SzMSWRLhsoqXGFpmtDW9gBYlvVOnfUGgY75BPvTgcbnv
         cwK4WV2GKoeRevrniVP7yn/Sb+rmmAaN5pygeqasl1dazvkVNeO53rkzt1wUL1HuPcnQ
         MCdvkj++3h2ko2hoQqVdNj/jHWuWkRpvDVnLvbzMtbHKmQji1KZKmyZKrav/zqKobVMo
         AgzY47ThAq5ssSFeWzC67OyXoJpeoO1Q2NAZl66Lpitpf1AqEbeQblmbKOgujfvHBjJi
         f0ugrUcimkHd1CKDne6GWV1CYLT4FF+Dvsy+p46pRA/z/k1p2krSGmKLNZzSsJMiN1lO
         jTIg==
X-Gm-Message-State: AOJu0YycR1425hSU0VJV8FYzqZl75ha6Drr4DbBrnuym0JQgANp0vYa8
	M0R41awB5K+ch650wG1Z9Ia8J45z+fm2y6ePpTHuwma6EC8aMmGBqtF1j9iN+lwp2nYEbUbEKH6
	ptgReuhXpPPyAoW+E3xNSU3a6Mcswcs88S+/KfDL48ygXxgNZKk5tjpA=
X-Gm-Gg: ATEYQzxbIw73Ov7eBRZz6SNQav4nDUTSsELh5PiDpVvIHAgz5ODwTLdDHtDEWzqPx53
	mKn8Yabf9DkRUVyZgK4SQAGHcJQCHzhDRSP5Ueaj2dSVSNROs54ZN+gy7kQQvg+rPF0DwjV15E6
	fxC6BAD32d9WTgLv33hpSaTHfIqxmazUVvrc8SkMz62+ymUoqqO175g3XHiGR/pYOyaXnINtLX3
	cnGpyKJ2WjU/xpj56uaKcsmWYrsmDTyQ+yUL8COvB9vXc2s8TxGynrnsChNXIjcrM+GzrFOd8EG
	Si/O28vx
X-Received: by 2002:a05:6870:249b:b0:3e8:9b72:5cda with SMTP id
 586e51a60fabf-41bb032816dmr344683fac.11.1773685748873; Mon, 16 Mar 2026
 11:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312224915.2907539-2-brad@nextdimension.cc>
 <20260313183732.2910643-1-brad@nextdimension.cc> <4d8bc24e-c49c-48c3-a4bf-ef6eeb1e8b4b@kernel.org>
In-Reply-To: <4d8bc24e-c49c-48c3-a4bf-ef6eeb1e8b4b@kernel.org>
From: Bradford Love <brad@nextdimension.cc>
Date: Mon, 16 Mar 2026 13:28:57 -0500
X-Gm-Features: AaiRm53y2Bdgfd6KDBQT4BVhbpF2Edv3oeL5iKD2oGupZoTxd0T1K9hBrCmDG-I
Message-ID: <CAA0YaJSh4Z-wAnmdt6txozLO+v-pX7FTNY=_stzJagFrTiBS1Q@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] em28xx: Add support for Empia em2828X bridge
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55959-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nextdimension.cc:dkim,nextdimension.cc:email]
X-Rspamd-Queue-Id: 85CD529F0C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

Thank you for the review, I'll make these changes now. The lock
control is a remnant of a customer implementation. I'll investigate
the log status ioctl and see if it makes sense to include or if I
should just remove the control.

Regards,

Bradford




On Mon, Mar 16, 2026 at 10:12=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kerne=
l.org> wrote:
>
> Hi Brad,
>
> On 13/03/2026 19:37, Bradford Love wrote:
> > The empia em2828X usb bridge contains previous functionality,
> > but also contains an embedded video decoder. The implemented
> > capabilities include composite and s-video inputs, as well as
> > analog TV. Analog TV is expected in CVBS format, it must be
> > demodulated already.
> >
> > Media controller decoder entity is included so pipeline
> > verification passes and graph is properly constructed.
> >
> > Analog TV bits based off cx231xx driver.
>
> Nice, it's been a long time since there were substantial changes to em28x=
x.
>
> Review below...
>
> >
> > Signed-off-by: Bradford Love <brad@nextdimension.cc>
> > ---
> > Changes in v2:
> >  - fixed kzalloc_obj compilation issue
> >
> > ---
> >  drivers/media/usb/em28xx/em28xx-cards.c |  27 ++-
> >  drivers/media/usb/em28xx/em28xx-core.c  | 146 ++++++++++++++--
> >  drivers/media/usb/em28xx/em28xx-dvb.c   |  15 ++
> >  drivers/media/usb/em28xx/em28xx-i2c.c   |   2 +
> >  drivers/media/usb/em28xx/em28xx-reg.h   |   3 +
> >  drivers/media/usb/em28xx/em28xx-video.c | 217 ++++++++++++++++++++++--
> >  drivers/media/usb/em28xx/em28xx.h       |  19 +++
> >  7 files changed, 405 insertions(+), 24 deletions(-)
>
> <snip>
>
> > diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb=
/em28xx/em28xx-core.c
> > index 29a7f3f19b56..303f6f10fda5 100644
> > --- a/drivers/media/usb/em28xx/em28xx-core.c
> > +++ b/drivers/media/usb/em28xx/em28xx-core.c
> > @@ -499,7 +499,8 @@ int em28xx_audio_setup(struct em28xx *dev)
> >       if (dev->chip_id =3D=3D CHIP_ID_EM2870 ||
> >           dev->chip_id =3D=3D CHIP_ID_EM2874 ||
> >           dev->chip_id =3D=3D CHIP_ID_EM28174 ||
> > -         dev->chip_id =3D=3D CHIP_ID_EM28178) {
> > +         dev->chip_id =3D=3D CHIP_ID_EM28178 ||
> > +         dev->chip_id =3D=3D CHIP_ID_EM2828X) {
> >               /* Digital only device - don't load any alsa module */
> >               dev->int_audio_type =3D EM28XX_INT_AUDIO_NONE;
> >               dev->usb_audio_type =3D EM28XX_USB_AUDIO_NONE;
> > @@ -619,6 +620,65 @@ const struct em28xx_led *em28xx_find_led(struct em=
28xx *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(em28xx_find_led);
> >
> > +void em2828X_decoder_vmux(struct em28xx *dev, unsigned int vin)
> > +{
> > +     switch (vin) {
> > +     case EM2828X_TELEVISION:
> > +             dev_dbg(&dev->intf->dev, "EM2828X_TELEVISION\n");
> > +             break;
> > +     case EM2828X_COMPOSITE:
> > +             dev_dbg(&dev->intf->dev, "EM2828X_COMPOSITE\n");
> > +             break;
> > +     default:
> > +             dev_dbg(&dev->intf->dev, "EM2828X_SVIDEO\n");
> > +             break;
> > +     };
> > +
> > +     em28xx_write_reg(dev, 0x24, 0x00);
> > +     em28xx_write_reg(dev, 0x25, 0x02);
> > +     em28xx_write_reg(dev, 0x2E, 0x00);
> > +
> > +     if (vin =3D=3D EM2828X_TELEVISION) {
> > +             em28xx_write_reg(dev, 0x7A0B, 0xfc);
> > +             em28xx_write_reg(dev, 0xB6, 0x8F);
> > +             em28xx_write_reg(dev, 0xB8, 0x01);
> > +     } else {
> > +             em28xx_write_reg(dev, 0x7A0B, 0x00);
> > +             em28xx_write_reg(dev, 0xB6, 0x8F);
> > +             em28xx_write_reg(dev, 0xB8, 0x00);
> > +     }
> > +
> > +     em28xx_write_reg(dev, 0x7A1C, 0x1E);
> > +     em28xx_write_reg(dev, 0x7A1D, 0x99);
> > +     em28xx_write_reg(dev, 0x7A1E, 0x99);
> > +     em28xx_write_reg(dev, 0x7A1F, 0x9A);
> > +     em28xx_write_reg(dev, 0x7A20, 0x3d);
> > +     em28xx_write_reg(dev, 0x7A21, 0x3e);
> > +     em28xx_write_reg(dev, 0x7A29, 0x00);
> > +     em28xx_write_reg(dev, 0x7A2F, 0x52);
> > +     em28xx_write_reg(dev, 0x7A40, 0x05);
> > +     em28xx_write_reg(dev, 0x7A51, 0x00);
> > +     em28xx_write_reg(dev, 0x7AC1, 0x1B);
> > +
> > +     if (vin =3D=3D EM2828X_COMPOSITE || vin =3D=3D EM2828X_TELEVISION=
) {
> > +             em28xx_write_reg(dev, 0x38, 0x01);
> > +             em28xx_write_reg(dev, 0xB1, 0x70);
> > +             em28xx_write_reg(dev, 0xB3, 0x00);
> > +             em28xx_write_reg(dev, 0xB5, 0x00);
> > +             em28xx_write_reg(dev, 0x7A02, 0x4f);
> > +     } else {        /* EM2828X_SVIDEO */
> > +             em28xx_write_reg(dev, 0x38, 0x00);
> > +             em28xx_write_reg(dev, 0xB1, 0x60);
> > +             em28xx_write_reg(dev, 0xB3, 0x10);
> > +             em28xx_write_reg(dev, 0xB5, 0x10);
> > +             em28xx_write_reg(dev, 0x7A02, 0x4e);
> > +     }
> > +
> > +     em28xx_write_reg(dev, 0x7A3F, 0x01);
> > +     em28xx_write_reg(dev, 0x7A3F, 0x00);
> > +}
> > +EXPORT_SYMBOL_GPL(em2828X_decoder_vmux);
> > +
> >  int em28xx_capture_start(struct em28xx *dev, int start)
> >  {
> >       int rc;
> > @@ -628,6 +688,7 @@ int em28xx_capture_start(struct em28xx *dev, int st=
art)
> >           dev->chip_id =3D=3D CHIP_ID_EM2884 ||
> >           dev->chip_id =3D=3D CHIP_ID_EM28174 ||
> >           dev->chip_id =3D=3D CHIP_ID_EM28178) {
> > +
> >               /* The Transport Stream Enable Register moved in em2874 *=
/
> >               if (dev->dvb_xfer_bulk) {
> >                       /* Max Tx Size =3D 188 * 256 =3D 48128 - LCM(188,=
512) * 2 */
> > @@ -664,26 +725,87 @@ int em28xx_capture_start(struct em28xx *dev, int =
start)
> >                       if (dev->is_webcam)
> >                               rc =3D em28xx_write_reg(dev, 0x13, 0x0c);
> >
> > -                     /* Enable video capture */
> > -                     rc =3D em28xx_write_reg(dev, 0x48, 0x00);
> > -                     if (rc < 0)
> > -                             return rc;
> > +                     if (dev->mode =3D=3D EM28XX_ANALOG_MODE) {
> > +                             /* Enable video capture */
> > +                             dev_dbg(&dev->intf->dev, "EM28XX_ANALOG_M=
ODE 1\n");
> > +                             rc =3D em28xx_write_reg(dev, 0x48, 0x00);
> > +                             if (rc < 0)
> > +                                     return rc;
> >
> > -                     if (dev->mode =3D=3D EM28XX_ANALOG_MODE)
> >                               rc =3D em28xx_write_reg(dev,
> >                                                     EM28XX_R12_VINENABL=
E,
> >                                                     0x67);
> > -                     else
> > -                             rc =3D em28xx_write_reg(dev,
> > -                                                   EM28XX_R12_VINENABL=
E,
> > -                                                   0x37);
> > +
> > +                     } else if (dev->chip_id =3D=3D CHIP_ID_EM2828X) {
> > +                             dev_err(&dev->intf->dev, "%s() CHIP_ID_EM=
2828X\n", __func__);
> > +                             /* The Transport Stream Enable Register m=
oved in em2874 */
> > +                             if (dev->dvb_xfer_bulk) {
> > +                                     /* Max Tx Size =3D 188 * 256 =3D =
48128 - LCM(188,512) * 2 */
> > +                                     em28xx_write_reg(dev, (dev->ts =
=3D=3D PRIMARY_TS) ?
> > +                                                      EM2874_R5D_TS1_P=
KT_SIZE :
> > +                                                      EM2874_R5E_TS2_P=
KT_SIZE,
> > +                                                      0xff);
> > +                             } else {
> > +                                     /* ISOC Maximum Transfer Size =3D=
 188 * 5 */
> > +                                     em28xx_write_reg(dev, (dev->ts =
=3D=3D PRIMARY_TS) ?
> > +                                                      EM2874_R5D_TS1_P=
KT_SIZE :
> > +                                                      EM2874_R5E_TS2_P=
KT_SIZE,
> > +                                                      dev->dvb_max_pkt=
_size_isoc / 188);
> > +                             }
> > +
> > +                             if (dev->ts =3D=3D PRIMARY_TS)
> > +                                     rc =3D em28xx_write_reg_bits(dev,
> > +                                                                EM2874=
_R5F_TS_ENABLE,
> > +                                                                start =
? EM2874_TS1_CAPTURE_ENABLE : 0x00,
> > +                                                                EM2874=
_TS1_CAPTURE_ENABLE | EM2874_TS1_FILTER_ENABLE | EM2874_TS1_NULL_DISCARD);
> > +                             else
> > +                                     rc =3D em28xx_write_reg_bits(dev,
> > +                                                                EM2874=
_R5F_TS_ENABLE,
> > +                                                                start =
? EM2874_TS2_CAPTURE_ENABLE : 0x00,
> > +                                                                EM2874=
_TS2_CAPTURE_ENABLE | EM2874_TS2_FILTER_ENABLE | EM2874_TS2_NULL_DISCARD);
>
> These lines are REALLY long. Try something like this:
>
>                                         rc =3D em28xx_write_reg_bits(dev,
>                                            EM2874_R5F_TS_ENABLE,
>                                            start ? EM2874_TS2_CAPTURE_ENA=
BLE : 0x00,
>                                            EM2874_TS2_CAPTURE_ENABLE |
>                                            EM2874_TS2_FILTER_ENABLE |
>                                            EM2874_TS2_NULL_DISCARD);
>
> I noticed that there were pre-existing equally long lines in this functio=
n.
> Try to do make the same change for those. At least keep it within 100 col=
umns.
>
> > +                     } else {
> > +                             /* Enable video capture */
> > +                             rc =3D em28xx_write_reg(dev, 0x48, 0x00);
> > +                             if (rc < 0)
> > +                                     return rc;
> > +                             rc =3D em28xx_write_reg(dev, EM28XX_R12_V=
INENABLE, 0x37);
> > +                     }
> > +
> >                       if (rc < 0)
> >                               return rc;
> >
> >                       usleep_range(10000, 11000);
> >               } else {
> > -                     /* disable video capture */
> > -                     rc =3D em28xx_write_reg(dev, EM28XX_R12_VINENABLE=
, 0x27);
> > +                     if (dev->mode =3D=3D EM28XX_DIGITAL_MODE && dev->=
chip_id =3D=3D CHIP_ID_EM2828X) {
> > +                             /* The Transport Stream Enable Register m=
oved in em2874 */
> > +                             if (dev->dvb_xfer_bulk) {
> > +                                     /* Max Tx Size =3D 188 * 256 =3D =
48128 - LCM(188,512) * 2 */
> > +                                     em28xx_write_reg(dev, (dev->ts =
=3D=3D PRIMARY_TS) ?
> > +                                                      EM2874_R5D_TS1_P=
KT_SIZE :
> > +                                                      EM2874_R5E_TS2_P=
KT_SIZE,
> > +                                                      0xff);
> > +                             } else {
> > +                                     /* ISOC Maximum Transfer Size =3D=
 188 * 5 */
> > +                                     em28xx_write_reg(dev, (dev->ts =
=3D=3D PRIMARY_TS) ?
> > +                                                      EM2874_R5D_TS1_P=
KT_SIZE :
> > +                                                      EM2874_R5E_TS2_P=
KT_SIZE,
> > +                                                      dev->dvb_max_pkt=
_size_isoc / 188);
> > +                             }
> > +
> > +                             if (dev->ts =3D=3D PRIMARY_TS)
> > +                                     rc =3D em28xx_write_reg_bits(dev,
> > +                                                                EM2874=
_R5F_TS_ENABLE,
> > +                                                                start =
? EM2874_TS1_CAPTURE_ENABLE : 0x00,
> > +                                                                EM2874=
_TS1_CAPTURE_ENABLE | EM2874_TS1_FILTER_ENABLE | EM2874_TS1_NULL_DISCARD);
> > +                             else
> > +                                     rc =3D em28xx_write_reg_bits(dev,
> > +                                                                EM2874=
_R5F_TS_ENABLE,
> > +                                                                start =
? EM2874_TS2_CAPTURE_ENABLE : 0x00,
> > +                                                                EM2874=
_TS2_CAPTURE_ENABLE | EM2874_TS2_FILTER_ENABLE | EM2874_TS2_NULL_DISCARD);
> > +                     }  else {
> > +                             /* disable video capture */
> > +                             rc =3D em28xx_write_reg(dev, EM28XX_R12_V=
INENABLE, 0x27);
> > +                     }
> >               }
> >       }
> >
>
> <snip>
>
> > @@ -1366,8 +1519,40 @@ static int em28xx_s_ctrl(struct v4l2_ctrl *ctrl)
> >       return (ret < 0) ? ret : 0;
> >  }
> >
> > +static int em28xx_g_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct em28xx_v4l2 *v4l2 =3D
> > +               container_of(ctrl->handler, struct em28xx_v4l2, ctrl_ha=
ndler);
> > +     struct em28xx *dev =3D v4l2->dev;
> > +     int ret =3D -EINVAL;
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_LOCK_STATUS:
> > +             if (dev->board.decoder =3D=3D EM28XX_BUILTIN) {
> > +                     ctrl->val =3D em2828X_decoder_get_lock_status(dev=
);
> > +                     ret =3D 0;
> > +             }
> > +             break;
> > +     }
> > +
> > +     return (ret < 0) ? ret : 0;
> > +}
> > +
> >  static const struct v4l2_ctrl_ops em28xx_ctrl_ops =3D {
> >       .s_ctrl =3D em28xx_s_ctrl,
> > +     .g_volatile_ctrl =3D em28xx_g_ctrl,
> > +};
> > +
> > +static const struct v4l2_ctrl_config em28xx_lock_status_config =3D {
> > +     .ops =3D &em28xx_ctrl_ops,
> > +     .id =3D V4L2_CID_LOCK_STATUS,
> > +     .name =3D "Lock Status",
> > +     .type =3D V4L2_CTRL_TYPE_BOOLEAN,
> > +     .flags =3D V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
> > +     .min =3D 0,
> > +     .max =3D 1,
> > +     .step =3D 1,
> > +     .def =3D 0,
>
> What does this control do? Why it is here? It's readonly, so I suspect it=
 is
> meant for debugging only?
>
> Driver specific controls need to define a range in v4l2-controls.h (e.g. =
search
> for V4L2_CID_USER_MALI_C55_BASE). And they need to be documented.
>
> It might be better to add support for VIDIOC_LOG_STATUS to em28xx: there =
you can
> just log the lock status. You have a lot more flexibility that way.
>
> Regards,
>
>         Hans
>
> >  };
> >
> >  static void size_to_scale(struct em28xx *dev,
> > @@ -1586,6 +1771,9 @@ static int vidioc_s_std(struct file *file, void *=
priv, v4l2_std_id norm)
> >       em28xx_resolution_set(dev);
> >       v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm=
);
> >
> > +     if (dev->board.decoder =3D=3D EM28XX_BUILTIN)
> > +             em2828X_decoder_set_std(dev, v4l2->norm);
> > +
> >       return 0;
> >  }
> >
> > @@ -1829,6 +2017,11 @@ static int vidioc_g_tuner(struct file *file, voi=
d *priv,
> >
> >       strscpy(t->name, "Tuner", sizeof(t->name));
> >
> > +     t->type =3D V4L2_TUNER_ANALOG_TV;
> > +     t->capability =3D V4L2_TUNER_CAP_NORM;
> > +     t->rangehigh =3D 0xffffffffUL;
> > +     t->signal =3D 0xffff;     /* LOCKED */
> > +
> >       v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
> >       return 0;
> >  }
> > @@ -1978,7 +2171,7 @@ static int vidioc_querycap(struct file *file, voi=
d  *priv,
> >                           V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> >       if (dev->int_audio_type !=3D EM28XX_INT_AUDIO_NONE)
> >               cap->capabilities |=3D V4L2_CAP_AUDIO;
> > -     if (dev->tuner_type !=3D TUNER_ABSENT)
> > +     if (dev->tuner_type !=3D TUNER_ABSENT || em28xx_analogtv_supporte=
d(dev))
> >               cap->capabilities |=3D V4L2_CAP_TUNER;
> >       if (video_is_registered(&v4l2->vbi_dev))
> >               cap->capabilities |=3D V4L2_CAP_VBI_CAPTURE;
> > @@ -2549,7 +2742,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> >       }
> >
> >       hdl =3D &v4l2->ctrl_handler;
> > -     v4l2_ctrl_handler_init(hdl, 8);
> > +     v4l2_ctrl_handler_init(hdl, 9);
> >       v4l2->v4l2_dev.ctrl_handler =3D hdl;
> >
> >       if (dev->is_webcam)
> > @@ -2675,7 +2868,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> >       }
> >
> >       /* set default norm */
> > -     v4l2->norm =3D V4L2_STD_PAL;
> > +     v4l2->norm =3D -1;
> >       v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm=
);
> >       v4l2->interlaced_fieldmode =3D EM28XX_INTERLACED_DEFAULT;
> >
> > @@ -2738,6 +2931,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> >                                 V4L2_CID_SHARPNESS,
> >                                 0, 0x0f, 1, SHARPNESS_DEFAULT);
> >
> > +     v4l2_ctrl_new_custom(hdl, &em28xx_lock_status_config, NULL);
> > +
> >       /* Reset image controls */
> >       em28xx_colorlevels_set_default(dev);
> >       v4l2_ctrl_handler_setup(hdl);
> > @@ -2755,10 +2950,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> >                                V4L2_CAP_STREAMING;
> >       if (dev->int_audio_type !=3D EM28XX_INT_AUDIO_NONE)
> >               v4l2->vdev.device_caps |=3D V4L2_CAP_AUDIO;
> > -     if (dev->tuner_type !=3D TUNER_ABSENT)
> > +     if (dev->tuner_type !=3D TUNER_ABSENT || em28xx_analogtv_supporte=
d(dev))
> >               v4l2->vdev.device_caps |=3D V4L2_CAP_TUNER;
> >
> > -
> >       /* disable inapplicable ioctls */
> >       if (dev->is_webcam) {
> >               v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_QUERYSTD);
> > @@ -2767,7 +2961,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> >       } else {
> >               v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_PARM);
> >       }
> > -     if (dev->tuner_type =3D=3D TUNER_ABSENT) {
> > +     if ((v4l2->vdev.device_caps & V4L2_CAP_TUNER) =3D=3D 0) {
> >               v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_G_TUNER);
> >               v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_TUNER);
> >               v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_G_FREQUENCY);
> > @@ -2778,6 +2972,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> >               v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_AUDIO);
> >       }
> >
> > +     if (dev->chip_id =3D=3D CHIP_ID_EM2828X || dev->board.decoder =3D=
=3D EM28XX_BUILTIN)
> > +             v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_ENUM_FRAMESIZES);
> > +
> >       /* register v4l2 video video_device */
> >       ret =3D video_register_device(&v4l2->vdev, VFL_TYPE_VIDEO,
> >                                   video_nr[dev->devno]);
> > @@ -2796,12 +2993,12 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> >               v4l2->vbi_dev.queue->lock =3D &v4l2->vb_vbi_queue_lock;
> >               v4l2->vbi_dev.device_caps =3D V4L2_CAP_STREAMING |
> >                       V4L2_CAP_READWRITE | V4L2_CAP_VBI_CAPTURE;
> > -             if (dev->tuner_type !=3D TUNER_ABSENT)
> > +             if ((v4l2->vdev.device_caps & V4L2_CAP_TUNER) =3D=3D 0)
> >                       v4l2->vbi_dev.device_caps |=3D V4L2_CAP_TUNER;
> >
> >               /* disable inapplicable ioctls */
> >               v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_S_PARM);
> > -             if (dev->tuner_type =3D=3D TUNER_ABSENT) {
> > +             if ((v4l2->vbi_dev.device_caps & V4L2_CAP_TUNER) =3D=3D 0=
) {
> >                       v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_G_TUNER=
);
> >                       v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_S_TUNER=
);
> >                       v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_G_FREQU=
ENCY);
> > diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28=
xx/em28xx.h
> > index f3449c240d21..b6b8c4ae93af 100644
> > --- a/drivers/media/usb/em28xx/em28xx.h
> > +++ b/drivers/media/usb/em28xx/em28xx.h
> > @@ -425,8 +425,15 @@ enum em28xx_decoder {
> >       EM28XX_NODECODER =3D 0,
> >       EM28XX_TVP5150,
> >       EM28XX_SAA711X,
> > +     EM28XX_BUILTIN,
> >  };
> >
> > +/* Built in decoder capture options */
> > +#define V4L2_CID_LOCK_STATUS V4L2_CID_LASTP1
> > +#define EM2828X_COMPOSITE    0
> > +#define EM2828X_SVIDEO               1
> > +#define EM2828X_TELEVISION   2
> > +
> >  enum em28xx_sensor {
> >       EM28XX_NOSENSOR =3D 0,
> >       EM28XX_MT9V011,
> > @@ -469,6 +476,12 @@ struct em28xx_button {
> >       bool inverted;
> >  };
> >
> > +enum em2828x_media_pads {
> > +     EM2828X_PAD_INPUT,
> > +     EM2828X_PAD_VID_OUT,
> > +     EM2828X_NUM_PADS
> > +};
> > +
> >  struct em28xx_board {
> >       char *name;
> >       int vchannels;
> > @@ -593,6 +606,7 @@ struct em28xx_v4l2 {
> >
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >       struct media_pad video_pad, vbi_pad;
> > +     struct media_pad decoder_pads[EM2828X_NUM_PADS];
> >       struct media_entity *decoder;
> >  #endif
> >  };
> > @@ -752,6 +766,8 @@ struct em28xx {
> >                                    char *buf, int len);
> >       int (*em28xx_read_reg_req)(struct em28xx *dev, u8 req, u16 reg);
> >
> > +     int (*em28xx_set_analog_freq)(struct em28xx *dev, u32 freq);
> > +
> >       enum em28xx_mode mode;
> >
> >       // Button state polling
> > @@ -763,6 +779,7 @@ struct em28xx {
> >       // Snapshot button input device
> >       char snapshot_button_path[30];  // path of the input dev
> >       struct input_dev *sbutton_input_dev;
> > +     int analog_xfer_mode;
> >
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >       struct media_device *media_dev;
> > @@ -811,6 +828,8 @@ int em28xx_write_ac97(struct em28xx *dev, u8 reg, u=
16 val);
> >  int em28xx_audio_analog_set(struct em28xx *dev);
> >  int em28xx_audio_setup(struct em28xx *dev);
> >
> > +void em2828X_decoder_vmux(struct em28xx *dev, unsigned int vin);
> > +
> >  const struct em28xx_led *em28xx_find_led(struct em28xx *dev,
> >                                        enum em28xx_led_role role);
> >  int em28xx_capture_start(struct em28xx *dev, int start);
>

