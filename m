Return-Path: <linux-media+bounces-59233-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKJKEeO052lU/wEAu9opvQ
	(envelope-from <linux-media+bounces-59233-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 19:33:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B543E044
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 19:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C7E7B3015318
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 17:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2AD31D362;
	Tue, 21 Apr 2026 17:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXtnpz+v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54032BDC2A
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792751; cv=pass; b=EeUtP+Bwqz00vOO00Rc/+BYX16m/dY2d2W0BUBzEN1cemL3WbhxA3fgEyF5iOCN3zIbISo0WHiBqKcaYRDQ601dr+9h2NaGOjZMEbVTcE9iWc7/QxTQgzlRI03JXkVndUrbvwttYC9MnrYteVtXxvf+ZmhNCeiGF/smN66w7F8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792751; c=relaxed/simple;
	bh=3opUxn+/WZhxis9gCx5CPLMTFPxNfsZrec7JCcuzKuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ke0/M5U2C7N09WSW3V2B9G7x925lu4Gvn5TMWQGNuUmNgHNJVHOQFvNdh1QchqPS9P11Vy9BgLXSOEbyn+vWsmhTvpowMBEx0E4QWcTRQDW+x5GR62tXqnhzfYVsh5xPJ9EKTyJ8NEsVTzEeWXW+a5oSvQ7v5OPztRFPHQMt8RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXtnpz+v; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43eb012ac4fso2760812f8f.0
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 10:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776792748; cv=none;
        d=google.com; s=arc-20240605;
        b=Ih3hPickfHVJftiUCe1M1iTRNgycgCs3S8rqq9lInmBSqDNToU09tO4Yv4tOzxUd0J
         zPcxkNoYeh2efUyt9yeof1AXLDWPJ7z01oUPhErNPpTM8a78X6XQriYmoDdYI5edtMK6
         jKLhjrKPFmP+cXQu+3j82CFChotqlRuo5OIT3wic0opOKkyiDmgZfEDNTQVvLlGis1KZ
         HZwuaPIZzNAiNLlFPijLKMUSMswHHVG7RxZRO2lNsIQnxbCFbsHB/B3juD6T1jopCcRl
         TY6g1qg2zVg1SRf3T/kXG+pEEnt65PbfffQaTSJGTHLq4KnCC/1CUjL8k/+dBprsCIKo
         /ymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d9JZP9LdDUJMwW5ThoMrsAh4NFGwSHn55PSCzhU6IQw=;
        fh=mKA+iKig0LsD/cfZUnna94CyRMhXDGC96MjlLUwV3fs=;
        b=X76dZcu92Tok/M9FTmf9DWFaT0onYLpbkFtCiB6YpsA0peefKV7iXA0zXDfYBCd11+
         7MtzwPusUqyCMi8n+nX9inIqBmSbQ3uSk2XsL3qg9NopttCE9WOy1E2d+wr7Ps2WPia4
         NlJkcfBFYo1kaFD4rolkKs3XmeRvmbdyvCqc9azVRG2vXktdjtGl+fbxutA2LftLZgLX
         FAGkSdzLhsN7QhZc8tndYOEBOeCjAJXhBgy0sZRKuwvdHJBQ+U0D5n62q97tI7blh6GP
         pkaCU+WTzjI0xucpre1KDBv0B7Z9ZBKkeEe4oHHCqtQGWOWiLRrtVdLRU9LyWrLcDQay
         8NqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792748; x=1777397548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9JZP9LdDUJMwW5ThoMrsAh4NFGwSHn55PSCzhU6IQw=;
        b=RXtnpz+vVsfieKGkBLCT524hhYy58bk1vQvzrpJm5mVTZ+ffZbyMFd5NAvxBUyZ5bz
         gOtn/3Azbt27XKOtGRA3h9IDU6TDUdg7vSieHeTllDEqapXeZ8tJKuLnCHa7sHBlBXKk
         Tk9gbWGI8RZDbIthvPRYHBg9cyDsY6RLYyJ3tAN74oCagC/GSRc6jifjdgh0H1DWBQaB
         Tel9o94nHI7nmE5m8uZ0JHEgNuz8QFieOlSJCPwhsuN7OwSHgsXargSXS6geEARw9fRx
         MI2h/mEHGZamV4Rsa5x5i1UCt0X40ZuKyRND7fdlLJAAxOyrMVt0MM/sGUKMiMu82xAT
         hKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792748; x=1777397548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9JZP9LdDUJMwW5ThoMrsAh4NFGwSHn55PSCzhU6IQw=;
        b=lmDqSM764URQgay7jwUJ8tztouk+nX1/+ej50X5aXxlFMvFzrGyfE/JbizJiFL3j+T
         xVk/ZwnHasVkhJQ84l9tuJ7jZCbN4yMPiJkfCYfYbp+H+Ju96zM19Mcg6J94z04q3V3B
         SQo3gqH10i3BOQy+BVDEewrJCGeZLCe5IuhyOvAyBlnsQzYEP6R8EIdmV7sEQcKM5L9+
         GTc8rt9mUbuaK7H4XJSsvYyvcJYrD0/NBup8rOmNtQkv3zAW0yQiRKitk7E89fKqf2tT
         d321LKCHdpTAZnaRDcFNHYvNsCSVtwa9j6GduNgq/mOHHJhP9kxtmRf7SGfMpvcUtih+
         u0Bg==
X-Forwarded-Encrypted: i=1; AFNElJ/pQIDLGR88tTtPDyxlht4tNb+OZA0dMAzMxf+Ke0fZQFZveIjEvh7nlia1Ejfjm2T9ZtVO3uPgOj/o4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN3+8oc2ISoYutbnlCNfqnGoaQDokH7JgnJtUAiNL5Wci/Y9e4
	1Y+sJBKfjfqc3fVEQDfMMApGBKRM209qwKPWmVNtv5nDXsBqlH2/gJnkgxI687gaIx2oshec5O2
	Pm6WGmQSHbw2f6IWuCWCxfnfl1yiOA+Q=
X-Gm-Gg: AeBDietWbeMBdBukJ68ptedWsbLTJriJrUNvukeCvuK1REOhAkkV7STXQB69C37Rsdi
	6etFjT6qCfjldqMT7g2XjaCNdTOAvA8gXliy/OzaUnaBjKyv4ze7k+zb0FdefOLMf+tiRjj4hQi
	HyhAuoB9+g5L8K0jLM6hMj2lqdIRSS6SWFCPnHEVyz6ppzXgRGHSJtYQeou6KaWdkEOW84beHsA
	TrDCSFpsvx+Or7kL80G2ZCclBpQaL5YjcDG0OXnEB72MaxF7CaumEED93NwxAeeHTyURJLY0VG/
	aaDrR+s8g0hT2/bItM4=
X-Received: by 2002:a5d:5f87:0:b0:43d:1c21:ead4 with SMTP id
 ffacd0b85a97d-43fe3dcb248mr30377905f8f.18.1776792747978; Tue, 21 Apr 2026
 10:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain>
In-Reply-To: <aeepbB72uWDxvnE_@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 21 Apr 2026 20:32:16 +0300
X-Gm-Features: AQROBzCbB1odtYIeJLEi8nmSeUo4a_e5KdU6vNd6lzpNhb-P2paG9uccQadFGds
Message-ID: <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59233-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 736B543E044
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=B2=D1=82, 21 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:4=
4 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Shyvatoslav,
>
> On Sun, Apr 19, 2026 at 12:34:12PM +0300, Svyatoslav Ryhel wrote:
> > @@ -403,6 +423,60 @@ static int lm3560_init_device(struct lm3560_flash =
*flash)
> >       return rval;
> >  }
> >
> > +static void lm3560_power_off(struct lm3560_flash *flash)
> > +{
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > +     regulator_disable(flash->vin_supply);
> > +}
> > +
> > +static int lm3560_power_on(struct lm3560_flash *flash)
> > +{
> > +     int rval;
> > +
> > +     rval =3D regulator_enable(flash->vin_supply);
> > +     if (rval < 0) {
> > +             dev_err(flash->dev, "failed to enable vin power supply\n"=
);
> > +             return rval;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > +
> > +     rval =3D lm3560_init_device(flash);
> > +     if (rval < 0) {
> > +             lm3560_power_off(flash);
> > +             return rval;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused lm3560_pm_runtime_resume(struct device *dev)
> > +{
> > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > +
> > +     return lm3560_power_on(flash);
> > +}
> > +
> > +static int __maybe_unused lm3560_pm_runtime_suspend(struct device *dev=
)
>
> Could you change lm3560_power_o{n,ff}() take struct device pointer as the
> argument?
>

What benefit it will bring? Unless you propose to use on/off functions
in pm directly, I don't see any benefit in this change.

> > +{
> > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > +
> > +     lm3560_power_off(flash);
> > +
> > +     return 0;
> > +}
> > +
> > +static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D LM3560_LED0; i < LM3560_LED_MAX; i++) {
>
> You could define i here.
>

You mean:
 for (unsigned int i =3D LM3560_LED0; i < LM3560_LED_MAX; i++)?

If yes, I would like to keep it as is, it looks cleaner to me, and
this part was transferred from remove as is.

> > +             v4l2_device_unregister_subdev(&flash->subdev_led[i]);
> > +             v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
> > +             media_entity_cleanup(&flash->subdev_led[i].entity);
> > +     }
> > +}
> > +
> >  static int lm3560_probe(struct i2c_client *client)
> >  {
> >       struct lm3560_flash *flash;
>
> --
> Kind regards,
>
> Sakari Ailus

