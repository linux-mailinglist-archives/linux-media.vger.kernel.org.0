Return-Path: <linux-media+bounces-24385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1215A0574C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 10:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79C767A27BC
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 09:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC95A1A8403;
	Wed,  8 Jan 2025 09:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dGlEkGEM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562D079FE
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329732; cv=none; b=EhMM+Ylwbz5KyvJGhIeE+LtzYV6X/y+3q0khgtLMvJLxu0K++K/LdtVpUJLsJ8tXZx1GQEBrMyRkHNgL50QtKEk/ADXaj1RykST633GFgPrE8bRi0sojfMTDDcasuzZmfHrjIu8ma21GStAK9qR8HOPUtttJ2Hc0n3lPlRsCVm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329732; c=relaxed/simple;
	bh=dQncI0ktjel5xSqHF4JOm7H0UK94916iCb8DNc4ymJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWyGXehgCwAh73uqNSvk9wFU0reIlqDv2XVi2OdCPYMBWkWq507N5ndmDT3jS68vX66iFlV/xTtCxK0O1CHIg08s+1k5g34IigRbwAp0RLc1BOf+MgVYkTCQLueJsS/U4sXZIplhq3qMH8z7TpqCTeu+Ii38JZZFtX/pOxMJyhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dGlEkGEM; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3a227b82so14950440e87.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 01:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736329728; x=1736934528; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Flo+9iY1gDry166LdLpjdtxxxCGnY5ixUXhDKm+YgbI=;
        b=dGlEkGEMVbMP9IS+MDbsXrQ0l65Wr/y5IfLcGzwqP4eGc0/IBdvYU/+cphFunVEsT6
         s2BiOSPAOwSI8JOqgJno43RCjuBZtTxLoujUsGpVe8ZyIaBV0poMv0dxp7FhSOYLrlFH
         6e9PSKpR2KQrWWuh38PgRqzv7nmDt+xehtNmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329728; x=1736934528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Flo+9iY1gDry166LdLpjdtxxxCGnY5ixUXhDKm+YgbI=;
        b=DqMztKVuMu3npo+gIMgXExhEz1cqzsBuwfeKo7L5dNEDz8lv2hNWFVOMiuZCBBSyr+
         e++/Jz+ro9osAQm1S7Hl+6yKzK9HRe+k1BdvvHWLXEPwtSxyzevjWDRG5v8e7l82n/45
         hDbrKvMYEXilCMoHWe3+yU29pnnvkpq4g557wZRkdMZa47oZNny3hnpwoAdNx36r2aGi
         W/x4m1vv2ESyjS16bhmTLv5F28B+4w0tAEypehDeyNtnPjyQX5CXQh1fg9CiwueajeTq
         JpR5Hw+DbzkbJh+gyTU2+dMoh77CA1LperZeYgZ7L4D+uOml+xYPouLVJ7ENaGTA180j
         9Rdg==
X-Forwarded-Encrypted: i=1; AJvYcCVFQSO9KwCnKiqBw5a1PG69Y4tkZ4b7l1EX5eoqkcNkRPRSZTmmJ2PgCyhfbOz79HrxUXyEpHpsRblHng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/69vCyrJtS3+4xk4wu1TdVgNOuiM0FGwpr7qfvl0UCNyPwDI
	uNsGmh717dohiFPgOO088n8mmmrGDVQI8GIpVJSWjzuCKpW9vCOQ02i6EcV18g82vzNXmO3je1s
	YEA==
X-Gm-Gg: ASbGnctUn65ZAMcexKGC2rHy7xcBr4I0Iq2aBGzct4zH8uN/3ktRfA+ddsCFPINLrYw
	bXQxd0QBZpym5UWmVYix/b8M3ECHPj0L5J+wh0bNXFWpm59nOwvXxDIschIoFZNoW2EtOlmlNVZ
	xsSpiaUaHeLTvEqO8dLCeKWjP6fEJcEDd2ITTKbeueR9H4DKYMmzX/uktg9qyMupqHH96Ml1dxz
	LTTJZF4sCAoaVig7OTnPSWBo9pefqZQZrhcKmYbikHlHVpsMKmomWx6by6AtKVC6PISsoSqhVvF
	t2KCQXl8Ljwiyx2inpA=
X-Google-Smtp-Source: AGHT+IFM13DK4kD+xryn4fPuprxqCdAGhpCXzPQgoVyzB6Huz+oksZ5ISQCGHbPMzfLwtpNM4c9r6w==
X-Received: by 2002:a05:6512:10d2:b0:53e:df2b:df25 with SMTP id 2adb3069b0e04-542845b6298mr619671e87.16.1736329728311;
        Wed, 08 Jan 2025 01:48:48 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b069f26sm60037081fa.87.2025.01.08.01.48.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:48:47 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so16791236e87.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 01:48:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVej1JMSQTlmEHm6dTBeHyWVlwxFgf5CqOWvEhBwHlhxfd6DU/wPLkUcyC+GLy5z7E3SebFUtPNs1qmKw==@vger.kernel.org
X-Received: by 2002:a05:6512:b98:b0:53e:94f9:8c86 with SMTP id
 2adb3069b0e04-542848162f1mr595357e87.35.1736329726841; Wed, 08 Jan 2025
 01:48:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
 <20241217145612.GA1652259-robh@kernel.org> <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
 <20241219122453.GA4008177-robh@kernel.org> <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
 <CAL_JsqLON5xKoYtowKdk49s-YHbk9bq9akZSH1kHdQ_9vxKSQQ@mail.gmail.com>
 <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com>
 <Z347NA00DMiyl1VN@kekkonen.localdomain> <CANiDSCs37N79MnFZxvBJn2Jw3062EdLRuVP4EkJVfJcfMMuPAg@mail.gmail.com>
 <Z35BnplCOVyboSBs@kekkonen.localdomain>
In-Reply-To: <Z35BnplCOVyboSBs@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 8 Jan 2025 10:48:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCteoJ_Lk_G6KQKyK1MWikEHF36bYaSHwFEhJh0BFxb6Dw@mail.gmail.com>
X-Gm-Features: AbW1kvbkaO87sj3WnOUVmKsmBXbh4rZ7j_XWg9A-agvWreDOsdce04sffPDW3Wg
Message-ID: <CANiDSCteoJ_Lk_G6KQKyK1MWikEHF36bYaSHwFEhJh0BFxb6Dw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Wed, 8 Jan 2025 at 10:13, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Jan 08, 2025 at 09:51:34AM +0100, Ricardo Ribalda wrote:
> > > > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > index da890ee60ce6..5322772a4470 100644
> > > > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > @@ -37,6 +37,10 @@ properties:
> > > >        but a device adhering to this binding may leave out all except
> > > >        for "usbVID,PID".
> > > >
> > > > +  orientation:
> > > > +    description: If present, specifies the orientation of the usb device.
> > > > +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
> > >
> > > Do you need this for a camera or for other kinds of USB devices, too?
> > >
> > > What about e.g. the rotation property?
> >
> > I need it for cameras. I do not have a usecase for rotation now, but I
> > might have in the future.
>
> If it's specific for cameras (UVC kind I presume?), wouldn't it be
> reasonable to add specific bindings for it?
Yes, they are uvc cameras

Do you mean something like this:

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
b/Documentation/devicetree/bindings/usb/usb-device.yaml
index da890ee60ce6..bc80c1e7360f 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -75,6 +75,12 @@ patternProperties:
           configuration value.
         maxItems: 1

+      image-sensor:
+        description: Video interface properties associated to USB cameras,
+          typically UVC compliant.
+        allOf:
+          - $ref: /schemas/media/video-interface-devices.yaml#
+
 required:
   - reg

@@ -113,6 +119,9 @@ examples:
             interface@0 {
                 compatible = "usbif123,abcd.config1.0";
                 reg = <0 1>;
+                image-sensor {
+                  orientation: 0;
+                };
             };

             interface@0,2 {
>
> --
> Sakari Ailus



--
Ricardo Ribalda

