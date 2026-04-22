Return-Path: <linux-media+bounces-59278-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBzNJPVq6GlZKAIAu9opvQ
	(envelope-from <linux-media+bounces-59278-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:30:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F10B442699
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E835A30193B6
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 06:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172DC30EF94;
	Wed, 22 Apr 2026 06:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7J8FV05"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596432F3C37
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839407; cv=pass; b=dbKJh+dgyWEt8U06db90plOsCcfmfUTyuGyscpdbwvNmPQgf9zUa457nC4FsMcw8wBTf5BmH/wMVoAdLR7Dh88nwz+EL6CKOX8DYvBXET6kycBfxVxHZGSjrL5m08OdlODfPE6yQ0gvO+tfupWhhl8R3Y4YQYBULXmXMeecfVpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839407; c=relaxed/simple;
	bh=N/aab0P1/zcuAtJ05K8PuDPEsKQcK5U1IySWx7B6g7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QyuQM40Ivpylbnk3ouC8guVXVcGKEu37gxZk72fdQqDD42eKiKjziFxKi4sgBQE7gf5WCG+M1HOHIMcrjVuV2SNwWgXL7ruSCXFBJY+uIkANUA4huymDPA0vW/D/uWWkzWOCX/IWGGxj5yiE5b7ztp4Zwm6kNeiPhsJCXxy4RKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7J8FV05; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d75312379so3743924f8f.1
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 23:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776839404; cv=none;
        d=google.com; s=arc-20240605;
        b=KNK2D2JRlbwHLV3fZEk6nQafp3av/5qC6udPUomNG+u1l7T6GgvzX6EWukOX3Rcnsa
         1QXv8sBeYxFWH088jLPyAh672pRhupWwFjLWJEMD9f27wKlEwEnh8kjpHQ0KyeAxFBtu
         i1cY9Ko7y9m43SOkU/Xu1UGvsDPmBQJwR0z0x5v/xIp8BuyNTQN1Z0Zu9zy65bsIbFyx
         FIldzflBwc10fg38BplZIs+FtjDufiONTakbS2U7Y1QoQ59LUDnV4UwjqFE+RMfwOXkI
         KZFdDckBDyJpPAoxIwOa2LTg6qs9ImUL86Rx1Jcscf8yfWgIOsSUkpnQweMXveEzLx9S
         uMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uA6c/hB6ZpWWtCuvOFBMWF6uspzTjy9pMfgJw70A3Jc=;
        fh=qR+GrzINWpcAkxxz59rXTdmqbdk30exedRV/30vU9Dw=;
        b=S0AZ8UOTMXtJvtq9PU9k0nl/HmlbMERBb67f1KuGRfF8fLAeyMkJNuUzXCdziJhmJ4
         B7nlJRA7550uMN5st4fdgwPWIPgjJfvakXQF/8yLz/mHQ83CeLEe+9JBPw8ntae7P9MW
         moMuCq4f7A7VMg1t3FkH/c6jHzdmRojhCGKi/vyWKyZN0M/4zIODrIkHrBnv17Wv2hoJ
         R/fuuMTU2K3WpE9G0Kv8lIqcqxZoWjF/W/PeWO53TrSF+6zgCeld77tA15ryNETZtYlu
         TNoVE+1ZT2fx6r8qGGKGekFECXHXTTQ+zeiYtPz8eAICjx8Ks4fFnRikE5LAuyzcQLEU
         +6vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776839404; x=1777444204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA6c/hB6ZpWWtCuvOFBMWF6uspzTjy9pMfgJw70A3Jc=;
        b=G7J8FV05RLy8+mWTi/dsxyKZPUPWLk2/zBOM/1xz8ByLwT/ghF4XexMUttDdX+XgfC
         IqHfpN4yhFHKSk9uJpCNM59gLroeIzTCygttourgcoCTwqyMCNXW2bVGA6I+c03QyMOF
         KDpozqQ4nO/8H/jgbaweAUqxMZHdWoZOXsiW0AelQLIU7NwBCv3aoxZVDIPuFFkS77CO
         A5Aw7+OlXLsf4kUagEH0lgIXwSqqG/yWfZPoHbBGsY5YPrYgsOPNF8NVjS3usCE51oA9
         /iwoCjwdYp1PGriYuiPuHXbdNldErYfp9FN4zxvgvnhAONLKXG/cA1dngTbi3l95PzPn
         vDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776839404; x=1777444204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA6c/hB6ZpWWtCuvOFBMWF6uspzTjy9pMfgJw70A3Jc=;
        b=S7wliRWdz+gsdXPOgjGkCThMNJ091hb2kJIMjaysYiWpGLdFf+tEBSfBO1xQrOnm/1
         LFLSnQp/lc4Sb7eJw69zwjK4VirTKAng83vfPHZYzLAXH+5Snviju1YE02wuj8luN0sh
         tPKVFRiYjenwgQ/SsQGrFqqvQ8Vucw/gbq20sH/FFlaeKInkAmGvgLSh2QOnfT/LFwfP
         9UZnggTMvhhdaY6ZysuJIFn4WkFkVkFIDnAB8TGa9f0yLL6Dpmmdmlm5SDriSg5PwlH0
         YXNFa4XU7WAPqCwRyh7JdARiabgu2DhJ6nfwHJkkDi2NFcalYcLPcU5JPkujfm2r54D+
         esGg==
X-Forwarded-Encrypted: i=1; AFNElJ8lH3SsoqXKyANEQrPF25peHPIyzBr/3mVKce/TPMAy61YCioW523daRjTPm2clr5bEevITrl/W7xYb2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXQYTw1wkv6kvcQ00Pucg0c+RAqPPKYThrUCWDGAMJ7jccN6X1
	7uN33s4ODGiFvW1aiYeikvKs+DOEuJgXrbtDQiSTHhyonJ26O5msRxgaExQsWeYe1rN9w3E2DpO
	60JiDXcU40oSdOP7pgEIuwSiB6IouRF4=
X-Gm-Gg: AeBDietZO3YAFFpLljMsT822XcSTU3Zoqt51F8cQb0hLDUcYOmIZEu2IYZwkGi58ZKb
	vyZkgNlxPrgs02F/Sla2vrejAzub6X7ABNBbYpECKhDnu/JeZOeAqJn+j5AJcaLTvKz1wvECJJC
	Omwl5pDB0rJ3hiVGcq8FcD4DR+HYWFEYa/WA4iC9pvPhQ2XL0i4MT5j1zJU+Wbfj6Du8Qa4poLu
	PUqYUdSiLFxLvO37WefQful9kODa4zVZa7ifbZW5AULzZS6ZAfXmMeTKCIkDnGdr1tfVGXbhSf4
	MZ62BHZNAd0kdH6dAq8=
X-Received: by 2002:a05:6000:208a:b0:43e:531f:720c with SMTP id
 ffacd0b85a97d-43fe407383cmr31782916f8f.11.1776839403432; Tue, 21 Apr 2026
 23:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain> <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
 <aefXJebe2F4Z193F@kekkonen.localdomain>
In-Reply-To: <aefXJebe2F4Z193F@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Apr 2026 09:29:51 +0300
X-Gm-Features: AQROBzAhN7JR2HJrSfb1mWoH-p2DrxcB5H5ma8lTP3SIqR0-3wJUIBxxFdGDYh4
Message-ID: <CAPVz0n111oHa2UdJ9LO8PTYcRuAmUem6tQdPKABRq1YHH8ZDgw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59278-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F10B442699
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=B2=D1=82, 21 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:5=
9 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Apr 21, 2026 at 08:32:16PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 21 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
19:44 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Hi Shyvatoslav,
> > >
> > > On Sun, Apr 19, 2026 at 12:34:12PM +0300, Svyatoslav Ryhel wrote:
> > > > @@ -403,6 +423,60 @@ static int lm3560_init_device(struct lm3560_fl=
ash *flash)
> > > >       return rval;
> > > >  }
> > > >
> > > > +static void lm3560_power_off(struct lm3560_flash *flash)
> > > > +{
> > > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > > > +     regulator_disable(flash->vin_supply);
> > > > +}
> > > > +
> > > > +static int lm3560_power_on(struct lm3560_flash *flash)
> > > > +{
> > > > +     int rval;
> > > > +
> > > > +     rval =3D regulator_enable(flash->vin_supply);
> > > > +     if (rval < 0) {
> > > > +             dev_err(flash->dev, "failed to enable vin power suppl=
y\n");
> > > > +             return rval;
> > > > +     }
> > > > +
> > > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > > > +
> > > > +     rval =3D lm3560_init_device(flash);
> > > > +     if (rval < 0) {
> > > > +             lm3560_power_off(flash);
> > > > +             return rval;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int __maybe_unused lm3560_pm_runtime_resume(struct device *=
dev)
> > > > +{
> > > > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > > > +
> > > > +     return lm3560_power_on(flash);
> > > > +}
> > > > +
> > > > +static int __maybe_unused lm3560_pm_runtime_suspend(struct device =
*dev)
> > >
> > > Could you change lm3560_power_o{n,ff}() take struct device pointer as=
 the
> > > argument?
> > >
> >
> > What benefit it will bring? Unless you propose to use on/off functions
> > in pm directly, I don't see any benefit in this change.
>
> You get rid of two redundant wrappers.
>

Noted. Any changes required into the other patches of the patchset?

> >
> > > > +{
> > > > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > > > +
> > > > +     lm3560_power_off(flash);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> > > > +{
> > > > +     unsigned int i;
> > > > +
> > > > +     for (i =3D LM3560_LED0; i < LM3560_LED_MAX; i++) {
> > >
> > > You could define i here.
> > >
> >
> > You mean:
> >  for (unsigned int i =3D LM3560_LED0; i < LM3560_LED_MAX; i++)?
> >
> > If yes, I would like to keep it as is, it looks cleaner to me, and
> > this part was transferred from remove as is.
>
> Works for me.
>
> --
> Regards,
>
> Sakari Ailus

