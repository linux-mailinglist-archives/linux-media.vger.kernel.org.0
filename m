Return-Path: <linux-media+bounces-18148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA45974A41
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 08:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 117C51F267F5
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 06:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0369D5B1FB;
	Wed, 11 Sep 2024 06:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hai54wO/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116011DA5E
	for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 06:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726035366; cv=none; b=IUYxuD21Deo49FwczY1e7zu90zbXmFTTb8GdZa1MW2xJV0ixKU8GTytCGTlR4tzzseU4sI9oxe44y/eosAxJ/1y8Wjgj7PVMxJsJxIoj76GEDrE30Txs5Z7zaOxrn/w1duZT2tL3TF6L2tEbUJ78p1WBgdKDpUp3OIJ293ZVODg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726035366; c=relaxed/simple;
	bh=22NwbrwLilLX1ij3+e1y8Ps50vp1kmTaPjfrXHxUHXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxzzKcif3tAxib9qn5nI1r2kbaegQ1I4Zwk5h6zewrF8S0ERHb/SEqmchMdCS9NRERaAU5ZMC3qKMdEitTQUDtQKCZVE1h32ccCrhcrU2Vl3xVEwfxmSY/4neagqz+BiCbNsRoYgQU43zX0cXpsRzYvr44ue4W7Y6rryFbIS8dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hai54wO/; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718d6ad6050so3992043b3a.0
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 23:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726035364; x=1726640164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT9VUWsdupioPMRSAIzj2A9KBlhlfYOO4mV1j7vhLX4=;
        b=Hai54wO/4oOtjEeUs+ibBeGagCcm7UWJS/nh0OW1tKfCtNWjEqecnup2BZmpPwob8+
         Hf/7SE0JqpZgdYukJ3awwSccnIONv2BKgyX5tbJm+NK1wS9YH2nN3ODG8ft/sfAqGVXV
         KR3DaScCVyotihte5jwpJJPI8q5ILf84P3GKXVK1nLutER/uNOOmEFSxf3vhhuBpN8zx
         goeHn1rESkjEfGIZPWVxX1H8qdsDY7Hcsa0KiL0ZOQUhJxpE3qCO30fk/GW4kZS6NErr
         5r+L0OvWr3TQN9o4kMRUUqllGKvC3N4pLaA3ev0i/vY17TJLbB1JAEC3QHcs+CLG8Dnp
         ajiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726035364; x=1726640164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT9VUWsdupioPMRSAIzj2A9KBlhlfYOO4mV1j7vhLX4=;
        b=EtA0O75cWtwRDIw1NpgsBfeAkOADzGtO7rzvlLyVoBLIesftkPWhU+BEUpOR4E20at
         optpoKBiJAfkjg8Bi/wf1HL51HM+vPaT8AYkPyb/lV4SJrNjGSlXmtg3WmiBijHDqs2t
         f20sHsO6J8vyuT+fM95B4iRTCB98NlDAMyCuuc+0MzyWjARCiEl0CVQP41jw24JDPtdA
         LgkeJ4I+PB4WRStzEO0YAlfsM9ml72pL4oaw7xmQhLt/c7oRbjdHk0zAebAq4oCTgA5U
         Hzo7uvwVXdJTsq4P4zSfOCwW9A4uc2SNe6lO4VQh3kGE+0IFKHwCFwjQAgyDC1t9Unjb
         HytQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXV1vxxo3/HyhjGzm/oZTCDRuK/iUPHk0ECdPuOF5dy3rJ7++TSlk6uSR18GXIsILKrK8Ovr6JKDB+bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDokB/pcz8WM9sOHxSCCDfHsj4H/PiXsv0tcOgE04iWHv5Bg73
	7cDfidZN0hE/8ezZnv8MR6nurw8EhiMui42OAFMROPEeeiy0+ejLMXeMxqxhO32GZlhezSDvhdT
	4WnwnUXP/U8aFpLplSv/4+WCP8mLlVQQpyDiQjw==
X-Google-Smtp-Source: AGHT+IEYU0txbYuExhXbpDh6StpYjlm+MAxF2oCmsBt5EDhoQqJZk2/xXHCJFfctBvkemoLdIGZg39F2IjNWVzTzmA4=
X-Received: by 2002:a05:6a21:39b:b0:1cf:3a4f:6710 with SMTP id
 adf61e73a8af0-1cf5e1cf3a4mr4721613637.45.1726035363990; Tue, 10 Sep 2024
 23:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070008.9486-1-eagle.alexander923@gmail.com>
 <20240830070008.9486-2-eagle.alexander923@gmail.com> <25fc667c-1170-4b8b-b2ba-578758c78804@ideasonboard.com>
In-Reply-To: <25fc667c-1170-4b8b-b2ba-578758c78804@ideasonboard.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Wed, 11 Sep 2024 09:15:52 +0300
Message-ID: <CAP1tNvQ2bXA9QAo2-PEGOkigctEGmFhLkEYabzBJY3ZyEdtqNA@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: ds90ub960: Add DS90UB954 support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

=D0=B2=D1=82, 10 =D1=81=D0=B5=D0=BD=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 11:4=
0, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>:
> On 30/08/2024 10:00, Alexander Shiyan wrote:
> > Add support for TI DS90UB954 FPD-Link III Deserializer.
...
> > @@ -1419,7 +1427,7 @@ static void ub960_rxport_config_eq(struct ub960_d=
ata *priv, unsigned int nport)
> >
> >       if (priv->strobe.manual)
> >               ub960_rxport_set_strobe_pos(priv, nport, rxport->eq.strob=
e_pos);
> > -     else
> > +     else if (priv->hw_data->chip_type !=3D UB954)
> >               ub960_rxport_set_strobe_pos(priv, nport, 0);
>
> This looks odd. Manually set strobe pos is ok, but not the default?
> What is the reason for this if?

In fact, these registers are described as reserved in the datasheet.
(We are speaking about indirect page 1).
Here is an excerpt from datasheet UB960:
Indirect Access Register Select:
Selects target for register access
0000: Pattern Generator and CSI-2 Timing (PATGEN_AND_CSI-2) Registers
xxxx: RESERVED

In UB954 datasheet this area is described as "FPD-Link III Channel 0
Reserved Registers: Test and Debug registers".

I tested the UB954 and when writing to this area an error occurs and
the chip no longer responds.
When disabling ub960_rxport_set_strobe_pos() everything works as expected.

