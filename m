Return-Path: <linux-media+bounces-24328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 691AFA03C9A
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 11:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9244188378B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 10:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECD21E3DD0;
	Tue,  7 Jan 2025 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="csUP9/Xh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF71E3DCC
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246259; cv=none; b=jsABg9Nd2xglDExf/hYWGOlcsJadsAOouD0EaoFcgzAVo4nuOlQMFkiUEbNO2f4SYdG9mUkdGp9/tJV7RqGVfouPmLLdJ3CwyJEJqrb0V34oSTAUEau9MroiHM5zGS4QwaAzawoczCLbXiIZ1gMFyLo48Qv+raAllr2Wp0Y3IPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246259; c=relaxed/simple;
	bh=Lh+/n9HnEBEdAUCCTHJ4xwiF31BrECarqzPMxOH/DsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irf27hEe3LnXmnYWiY9erWiPPsgdhQIVP9CYGhkl2licfooO5ZuNw37c4H0XpFWzbSJRG/dg09mvj/FvLRl2Ru51jmNWZFufWO5KNBMYRm0S2AfG1qmQx8u0Hlb67Z5QBipSHloU27eNFRyXTlQ0XyOOcfQJBBjVzgZEhWEuXDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=csUP9/Xh; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54252789365so8871892e87.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 02:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736246254; x=1736851054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1O4mtrUA8xb3bKiTsY1DsUybpMpm9vxH06xb7zcVj8=;
        b=csUP9/XhLBAYQ91UobDEREUUZS6K1NPyZb05wPAG4AMP1RbeMf74jElECDMPOk3imX
         bVFgYXwzUq3XW06hRJ8J1AIxThyf4xm+xOLneEa4CeSlKnh3I/RMN6vnDddxUgDDppcn
         pF7szmKTwzBH7RkLwveitm0wRRqiY87xdbmyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736246254; x=1736851054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1O4mtrUA8xb3bKiTsY1DsUybpMpm9vxH06xb7zcVj8=;
        b=IESB8BcLVYZUlqYKPPxJvk3ly/veulXNj0aEkEphaDKM6rX0b7jRaaHHIRlLuHsscx
         zFJcSw9/pzNglxm4aA3hEtmCYW5/+jb3n/H4qe7FHhv9/4h2AjA1zax0ogX2qHXa1EuT
         Fv4ra3Uh3NBxz+OnBV9ndIEj832mfAkxd5N7xb5nNn7LHAbcrgzdG2gdUsj5Ffg0tBZZ
         wbxtG9BNms02T1dIOplu3uw1ksBiybD+OmqSn7Iy3vzek13VQsi1wqpecsmp12eHvuqj
         53jFJA4EDUyKjHak3bIx8l8BRXeu+YqEJ7ZwQcC80Ub+lZl5fc0CABe6tYPRahH/3qQ3
         WD8w==
X-Forwarded-Encrypted: i=1; AJvYcCVStEFrG9BzmvM9BQeuAgiFpnYwiNprDwKRUro1X9zB8PfcGdZj1U+q2Pywb6ELuTrvRo/jZDtAebQWVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1BGoqVLt5icVgkbKDbTFRrrfmaEIUME3ERGZMpFqJyMuQovcF
	UOq+gFTQ91PPuXUP/96CKt0IztRBI+NPwH9Ua8Y87IWrh/RoVHWvfu1LrCFxwXsjLC7PbDCuFJb
	tPw==
X-Gm-Gg: ASbGncuR2snYmScQuccd/mGk+Lglqnt98zEh01BbbciLVMFE+gnkkJph9SlwAMUKWK6
	L0Hyi7NqDoGe+1mL8KvZDMHK4RzVawR/aSFtRPldNRc+Qpnv6TVYMbECcGi+APoHkZ91r+JyiC/
	lMpgdCWpCe9243FBhH/lQae+4x+glGFbd5ctapFk6R1bzxiSGnZQcp4uBHQ8LhCDUJKHExVBPKY
	8255qU57Nq3SEkrEe4QUqcz76UhzszMFpf8X1SI2PnmjT+7nhwu1ZA/8WlVv3NQQYGWKWUqzfb5
	q4zZNrk89SX2JXdva0M=
X-Google-Smtp-Source: AGHT+IGNN9u9/VIOspZGVNeiOz2rWEuqlqXCLrt3rjVOSy/eox9zSqfb5NFvyEz8X2kPWEVUJsz50g==
X-Received: by 2002:a05:6512:1193:b0:540:1d0a:581e with SMTP id 2adb3069b0e04-542295492ecmr19161680e87.28.1736246253766;
        Tue, 07 Jan 2025 02:37:33 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238214a6sm5126436e87.195.2025.01.07.02.37.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 02:37:32 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-540215984f0so15900626e87.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 02:37:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYASe8lFgM+N2zSpzDLj/A8Pdrq4hxOrq8IUA3dle+XjgEu14JnI4ZySL3hKanOH2rmjY/Dr0WMST5Pw==@vger.kernel.org
X-Received: by 2002:ac2:4c47:0:b0:542:22a0:9b35 with SMTP id
 2adb3069b0e04-5422959cf96mr17743735e87.53.1736246250788; Tue, 07 Jan 2025
 02:37:30 -0800 (PST)
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
In-Reply-To: <CAL_JsqLON5xKoYtowKdk49s-YHbk9bq9akZSH1kHdQ_9vxKSQQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 7 Jan 2025 11:37:18 +0100
X-Gmail-Original-Message-ID: <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com>
X-Gm-Features: AbW1kvaLMLtXTjaById0Tmpn7DhVioJNoXfnhWB6MVdCLMx7bGwuyZWBT_mX3CM
Message-ID: <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Dec 2024 at 23:00, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 19, 2024 at 6:42=E2=80=AFAM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > On Thu, 19 Dec 2024 at 13:24, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Dec 17, 2024 at 04:24:27PM +0100, Ricardo Ribalda wrote:
> > > > Hi Rob
> > > >
> > > > On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wrote:
> > > > > > For some devices like cameras the system needs to know where th=
ey are
> > > > > > mounted.
> > > > >
> > > > > Why do you need this and why only this property and not the dozen=
s
> > > > > others ACPI has?
> > > >
> > > > Userspace needs that information to correctly show it in the UI. Eg=
;
> > > >
> > > > - User facing camera needs to be mirrored during preview.
> > > > - The user facing camera is selected by default during videoconfere=
nces
> > > > - The world facing camera is selected by default when taking a phot=
o
> > > > - User facing camera have different parameter defaults than world f=
acing.
> > >
> > > We already have "orientation" defined for this purpose.
> >
> > Do you mean orientation from
> > bindings/media/video-interface-devices.yaml ?
> >
> > I see a couple of issues:
> > - Orientation has a very specific meaning for USB typeC. I'd prefer if
> > we could avoid using that word.
>
> Yes, but this is tied to the class of the device, not the bus. I find
> defining the position for USB devices confusing.
>
> > - For other applications different than cameras it might be useful to
> > know the positions top, bottom, left, right, which are not available
> > in video-interface-devices
>
> Other devices may need some of the 20 other properties in the ACPI
> table as well.
>
> > - The value "external" does not makes too much sense for listed usb dev=
ices
>
> Then don't use it.
>
> > - It makes our lives easier if dt and acpi have the same meaning (less
> > conversion)
>
> We have little to no input into what ACPI does. If we're just going to
> copy ACPI, then just use ACPI instead.
>
> > All that said, for my specific usecase, reusing orientation from
> > bindings/media/video-interface-devices.yaml works... So if that is
> > what you all prefer I can send a v2 with that.
> > Let me know what you think
>
> We already have something for cameras. Use it.

So you are proposing a change like this?

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
b/Documentation/devicetree/bindings/usb/usb-device.yaml
index da890ee60ce6..5322772a4470 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -37,6 +37,10 @@ properties:
       but a device adhering to this binding may leave out all except
       for "usbVID,PID".

+  orientation:
+    description: If present, specifies the orientation of the usb device.
+    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientat=
ion
+


   reg:
     description: the number of the USB hub port or the USB host-controller
       port to which this device is attached. The range is 1-255.



>
> Rob



--=20
Ricardo Ribalda

