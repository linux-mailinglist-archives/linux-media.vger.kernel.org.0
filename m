Return-Path: <linux-media+bounces-11659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F38C9E09
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 15:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1289283F44
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 13:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4256136648;
	Mon, 20 May 2024 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Gi413aOO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388B2133425
	for <linux-media@vger.kernel.org>; Mon, 20 May 2024 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716211247; cv=none; b=vDfSo4qLtzpdDaRve4kva8VF2tJT/lQfrfCKN1nKH6NZQVpIcMQyVGL1KQ3FD0cNmxq2xWG6IONGFPbo2wXVHVgdG4CBOaaxGhkO14pe73pB5G3eZKq0HHivq3elKf8gbpaPSvozbG9DTA8xrxm2CtoSkREbGccH5/CbqJnh8/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716211247; c=relaxed/simple;
	bh=ZtzndvGkIGuejxzhOSScRg7IFRuZt6nV23246Vkm7LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=O0d6FUr1YfyPDqyMDU/ef8oeLBvgkSpg0PxQ+GybCNIS4bm3XFrZO2985CpAUHqWjwamu+rwXCdWf6s0E3oUYrww1BXqW7/6tp2RbEmKoI2bY24xzxsRr3ux/MnQ4cuCKvbsZgl3EQooR1rc4TMg5RNeurdbGNef9l01F2TuTlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Gi413aOO; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso2278993276.2
        for <linux-media@vger.kernel.org>; Mon, 20 May 2024 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1716211244; x=1716816044; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpoD7IfFyo0fRXVXGRhMKLv7hvGmowk4hNOwLuLBHAQ=;
        b=Gi413aOOHZC8oi/vIxiokZn6wPLk1GwKQisEgY9YXEYwHF4JEYQCv6oxrMMDZH8zxn
         sZ3pkNx+z3MffKoEv4oZo4Dug06YaSMPc7WuoBu+rDzK7es9E2GGVhNPy+VSvsK6Ipnv
         Ma7FAcwb7N/rw/jKevDJ6MUwossqrJ+maZyrTSMORnkqarhEv1MCDO4XCyGXGEX/wBIf
         FX8wY8poBv96TLV8D6Qr8xIRmCGTddAANkVJsZUvonmPWYyk7x74py7qITor9xWLLrq7
         HEE9Cu6Bf0ohpJy0xNYC9ecUaH4YA/5/L+XwKSkvmZ1kUxnLmEeiWVR6M2/sU6uE4XeI
         NJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716211244; x=1716816044;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpoD7IfFyo0fRXVXGRhMKLv7hvGmowk4hNOwLuLBHAQ=;
        b=WSmBQmxrPiyNK4K/MZfejLNK2HVok3wbELm/JXMYODWj8LqrOwdxyQwnNdORFKRIbX
         zw56rUsjqLCE5RRIJC6L+FPlN0wl1TjC0SqUGm1VCpb50xBroYwg90nM8rApG0F1U46r
         N/txoh7AI3e74/Dv5Qo50/ZWdhllbbVOEdvb6/4v501AmripK5lrSoSW/TRqoYAcjWYA
         Q4gRS1YkvnkYvX2njw5zxORJvDU5HcSicYHFYoltEaFbSROwsqdr0x14sLvNz9PkSrT0
         qCNjTb+5FXUEkITNO9ZTMj8VGJ5Yo0rY+cmsSdk/5qEHMf76jciDnzTHRoiAqEiNld6b
         8oJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrNAH5a8kyBvAmXWmu0SXrML+mtHetot4YFgwvQgQW1uMNfxA3nVXMUQGudAuzKCKFw8b1TRvLzRY8CqXjuOTuaV0syapo78tK7fw=
X-Gm-Message-State: AOJu0Ywgt2oGVDnFrAtoTzUInlVdXSNzmAIp39kkGOaxPU8K3nL7W0ln
	53g8fM+pBTH6CCObqKB1h4n/HEzS8EEituCoi49qdQHrgweuq5cLBzSaGGn2HrimkEng91e138j
	RYrfBlOQOW9Su7Ds2gFUj3Dbzcm7DVNffZmWg7g==
X-Google-Smtp-Source: AGHT+IGLhrSKkPUoJZ62vutQInuJJOzTJYTiNFbmW3RNzAPYbVG1k0r6chzGp7BB1txzsNkSl4SqFlkWTloKih5W6g8=
X-Received: by 2002:a5b:3ce:0:b0:de5:51d0:9a8d with SMTP id
 3f1490d57ef6-dee4f334373mr26443106276.55.1716211243868; Mon, 20 May 2024
 06:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501152442.1072627-1-git@luigi311.com> <20240501152442.1072627-22-git@luigi311.com>
 <ZkcV5xWZz2jCszxA@kekkonen.localdomain> <q5nbk3qcxsjsqp4mdyx5nlrn4oie6oynunwodm7r2nwtywc2ey@kxsgcatwt5b2>
In-Reply-To: <q5nbk3qcxsjsqp4mdyx5nlrn4oie6oynunwodm7r2nwtywc2ey@kxsgcatwt5b2>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 20 May 2024 14:20:28 +0100
Message-ID: <CAPY8ntCfQvp9rCt=fqTFKYEOamLZwKmJDv9agxerQtDvsGKB0g@mail.gmail.com>
Subject: Re: [PATCH v5 21/25] dt-bindings: media: imx258: Add binding for powerdown-gpio
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, git@luigi311.com, 
	linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com, 
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	pavel@ucw.cz, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ond=C5=99ej

On Mon, 20 May 2024 at 13:55, Ond=C5=99ej Jirman <megi@xff.cz> wrote:
>
> On Fri, May 17, 2024 at 08:31:35AM GMT, Sakari Ailus wrote:
> > Hi Luis,
> >
> > On Wed, May 01, 2024 at 09:24:38AM -0600, git@luigi311.com wrote:
> > > From: Ondrej Jirman <megi@xff.cz>
> > >
> > > Add powerdown-gpio binding as it is required for some boards.
> >
> > I thought the conclusion was that this wasn't a property of the sensor?=
 If
> > it needs to be controlled, then this should take place somewhere else t=
han
> > in the sensor driver.
>
> It's a property of the sensor modules. It's just optional on
> some, eg. (pin 8):
>
>   https://assets-global.website-files.com/63b65bd4974577341e1fe194/654290=
d4d0fb173e87f754ed_IMX_258_FF_drawing.png
>
> Where else should it be so that the module is described properly in the
> DT and the powerdown signal can be used as part of powerup/down sequence
> of the sensor?

From v3 [1] Luis reported testing dropping the powerdown-gpio on a PPP
and it working fine.

I linked to the IMX258 datasheet in the same thread[2], and that
datasheet does not include such a signal on the imx258 sensor itself.

If your module has a powerdown gpio, then you'll have to ask the
module vendor what it is actually connected to. Potentially it relates
to the VCM driver rather than the sensor.

  Dave

[1] https://www.spinics.net/lists/linux-media/msg252519.html
[2] https://www.spinics.net/lists/linux-media/msg252496.html

> regards,
>         o.
>
> > >
> > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > > Signed-off-by: Luis Garcia <git@luigi311.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Reviewed-by: Pavel Machek <pavel@ucw.cz>
> > > ---
> > >  Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 +++=
+
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.=
yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > > index c978abc0cdb3..33338139e6e8 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> > > @@ -36,6 +36,10 @@ properties:
> > >    reg:
> > >      maxItems: 1
> > >
> > > +  powerdown-gpios:
> > > +    description:
> > > +      Reference to the GPIO connected to the PWDN pin, if any.
> > > +
> > >    reset-gpios:
> > >      description: |-
> > >        Reference to the GPIO connected to the XCLR pin, if any.
> >
> > --
> > Regards,
> >
> > Sakari Ailus

