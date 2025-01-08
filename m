Return-Path: <linux-media+bounces-24382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6418CA055CD
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 09:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E87E418886A4
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 08:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170D61F03C9;
	Wed,  8 Jan 2025 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EAvvXVtY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89DB1D47A2
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736326312; cv=none; b=cgwzq4k1hty9NFREQOq59I/QM/MDOfFXw9tea11LAdP1arUEWqlupO2VG8r9u0SKrBKKp2/4f592TihB1DZ3vnbBRX0Q2Ql7/kJc9Wgc4wtoduLdA672tVaHQ6nXm1DbK1baTsiw7LlIwlnikDeD3lKSF9zjjCFn/SCliPByXFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736326312; c=relaxed/simple;
	bh=fJq7ros3YcEqXnW8lhic7CNgUrTijyQuFS6oBYRXqyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3/Trkh/lMRKdwI7veyn+tGjG3mhJxNTojyMEYBN3x+tnMLYFwwUjy6QKzbR/d846kAHARdETaaqkENrUoY7LsHmilLWqbQznBqfVZbz4T9hOxbgjLtaOFtgbJzJ0Gqbar57jPqwvKVmcIUSC8CZfUHj9AJEh1k19/5yoxFynIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EAvvXVtY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401c52000fso16368813e87.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 00:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736326309; x=1736931109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbZVTJDWZ7xlQNj3S58PwFTZA9cCGUupjUxBClEpIns=;
        b=EAvvXVtYLg52czkbUTKtD++4PMlyt+f98gZ1u/rCt1MVjwo4s2SZn35sNKcPKDR1+G
         41Yk4gJ2C49CWwEvsaakUI2YGHFhr7NQz32SjRsVJ36d7LESO9a1VJZFQv/K24D/29AX
         i5m5aMUM5AscpkVlz58eym9/ISthqugGD8Vj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736326309; x=1736931109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbZVTJDWZ7xlQNj3S58PwFTZA9cCGUupjUxBClEpIns=;
        b=U5BBwJatYa1IKo0OpbxNVHZG4nNxrsBxnQkKkk0ys9rGPNrZTAhvGTKZT8nNE6m3TD
         dMt4j5YT/y9FvAi0DdsqzaLVY+YTHcKk7OBg8/qCP8eC0VDI5pavWgoe2YDbILt6BH5I
         EbgqAhUUGwKY43PtoRuTuh2XIM4dH0knyauDuecPUoMYvfrXs7OBpqDbQt64iAszK0j7
         cRq8gdEunPknm+L5wtkntg+tyi91nYmgyefR3fnaxQH/xkl+JxmQ7MtxIs3bfmb1pMzw
         T/FbUc/P/JgNLpMX4RXrVXtpGZsBeM+drhUW+/FrKa5ju0Ar23frRddwjSduzVdzxV6F
         /59g==
X-Forwarded-Encrypted: i=1; AJvYcCVsvhzU5nWWOcgIYcv08jcf2xtzrthvjvbwZ+eKDNVIRCv7J4W3nHa+tlNUZtrzPmSejd9R0ITU4viOag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaQ139Jny9CT3+eZbh2Sk9GnlQTUqLlmmsGqvfSjF6X9ibyJyT
	2emgUbGppa8dkA5rpojd/VORYklEP6S1AD6q01lEsArJoCwCjKG+Ph5p1XLHmL3UN7RwzDRvDPw
	4WA==
X-Gm-Gg: ASbGncsILwdTA2UKRykE1fNFfIdVsh7+OvOVc1jQ/X4oJ7tlE4QsWAKIrSoQtymzcsX
	PH2n7GIbdq8i5Ztxer6VkvGT2nBIDPO/rXdizXf+FTz0aOsmdYk/NxDKlLloE6o0spCP8OWUMGT
	450rygbjBrNFc/k3CHf87NKOA6OHy2qWnkF7wxHyb/3Xu7hRBTZKEJixnKjijNwbsLRsPXA6Jjv
	Q2hhnDYguuTeq5gG2AZAMVAikOhqetWO3le72UHhD50iXcOv0q1wZNcYAh6nWnDn3bll19cF7Gk
	7IrlG3dKQuv9JYPEiAo=
X-Google-Smtp-Source: AGHT+IE5f9Hn/ybj+Ez66S+qC9NS4HB7J/hWrkxelx+oQZo8H1DmdjeEaESwHjufX5iGv6h6OvxlCQ==
X-Received: by 2002:a05:6512:68b:b0:53f:231e:6fa2 with SMTP id 2adb3069b0e04-542845d73e1mr445702e87.26.1736326308817;
        Wed, 08 Jan 2025 00:51:48 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c26sm5461589e87.279.2025.01.08.00.51.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 00:51:47 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401e6efffcso19052465e87.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 00:51:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9lB+WmfQQZncKwmUmqfe5+m2KCTEUpQzK6wcmrKlRaqMhxbQKep8HxnhgacDHTC83YtHMYuO0gW/gTg==@vger.kernel.org
X-Received: by 2002:a05:6512:1392:b0:542:24c8:e062 with SMTP id
 2adb3069b0e04-54284815bc4mr514545e87.44.1736326306832; Wed, 08 Jan 2025
 00:51:46 -0800 (PST)
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
 <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com> <Z347NA00DMiyl1VN@kekkonen.localdomain>
In-Reply-To: <Z347NA00DMiyl1VN@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 8 Jan 2025 09:51:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCs37N79MnFZxvBJn2Jw3062EdLRuVP4EkJVfJcfMMuPAg@mail.gmail.com>
X-Gm-Features: AbW1kvan1zyHFQY9XbZwCJKxWjOop6P67-eXGqvGZTUi5VkdEAJc4fptoroNTdc
Message-ID: <CANiDSCs37N79MnFZxvBJn2Jw3062EdLRuVP4EkJVfJcfMMuPAg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jan 2025 at 09:45, Sakari Ailus <sakari.ailus@linux.intel.com> wr=
ote:
>
> Hi Ricardo,
>
> On Tue, Jan 07, 2025 at 11:37:18AM +0100, Ricardo Ribalda wrote:
> > On Fri, 20 Dec 2024 at 23:00, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, Dec 19, 2024 at 6:42=E2=80=AFAM Ricardo Ribalda <ribalda@chro=
mium.org> wrote:
> > > >
> > > > On Thu, 19 Dec 2024 at 13:24, Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Tue, Dec 17, 2024 at 04:24:27PM +0100, Ricardo Ribalda wrote:
> > > > > > Hi Rob
> > > > > >
> > > > > > On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wro=
te:
> > > > > > >
> > > > > > > On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wro=
te:
> > > > > > > > For some devices like cameras the system needs to know wher=
e they are
> > > > > > > > mounted.
> > > > > > >
> > > > > > > Why do you need this and why only this property and not the d=
ozens
> > > > > > > others ACPI has?
> > > > > >
> > > > > > Userspace needs that information to correctly show it in the UI=
. Eg;
> > > > > >
> > > > > > - User facing camera needs to be mirrored during preview.
> > > > > > - The user facing camera is selected by default during videocon=
ferences
> > > > > > - The world facing camera is selected by default when taking a =
photo
> > > > > > - User facing camera have different parameter defaults than wor=
ld facing.
> > > > >
> > > > > We already have "orientation" defined for this purpose.
> > > >
> > > > Do you mean orientation from
> > > > bindings/media/video-interface-devices.yaml ?
> > > >
> > > > I see a couple of issues:
> > > > - Orientation has a very specific meaning for USB typeC. I'd prefer=
 if
> > > > we could avoid using that word.
> > >
> > > Yes, but this is tied to the class of the device, not the bus. I find
> > > defining the position for USB devices confusing.
> > >
> > > > - For other applications different than cameras it might be useful =
to
> > > > know the positions top, bottom, left, right, which are not availabl=
e
> > > > in video-interface-devices
> > >
> > > Other devices may need some of the 20 other properties in the ACPI
> > > table as well.
> > >
> > > > - The value "external" does not makes too much sense for listed usb=
 devices
> > >
> > > Then don't use it.
> > >
> > > > - It makes our lives easier if dt and acpi have the same meaning (l=
ess
> > > > conversion)
> > >
> > > We have little to no input into what ACPI does. If we're just going t=
o
> > > copy ACPI, then just use ACPI instead.
> > >
> > > > All that said, for my specific usecase, reusing orientation from
> > > > bindings/media/video-interface-devices.yaml works... So if that is
> > > > what you all prefer I can send a v2 with that.
> > > > Let me know what you think
> > >
> > > We already have something for cameras. Use it.
> >
> > So you are proposing a change like this?
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > index da890ee60ce6..5322772a4470 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > @@ -37,6 +37,10 @@ properties:
> >        but a device adhering to this binding may leave out all except
> >        for "usbVID,PID".
> >
> > +  orientation:
> > +    description: If present, specifies the orientation of the usb devi=
ce.
> > +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orie=
ntation
>
> Do you need this for a camera or for other kinds of USB devices, too?
>
> What about e.g. the rotation property?

I need it for cameras. I do not have a usecase for rotation now, but I
might have in the future.

>
> > +
> >
> >
> >    reg:
> >      description: the number of the USB hub port or the USB host-contro=
ller
> >        port to which this device is attached. The range is 1-255.
>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda

