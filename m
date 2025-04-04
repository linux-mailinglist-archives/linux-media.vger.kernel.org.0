Return-Path: <linux-media+bounces-29424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D659A7C4F1
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 22:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0AAB189F95C
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 20:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A228822068D;
	Fri,  4 Apr 2025 20:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BpegDKBt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5465B21C9F9
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 20:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743798691; cv=none; b=BbAun6EgkWfNaRN4q/QxKx4TlN7h7zgleSIaLUndXLIHVOwMvb2TJCeYQWN9EH4nh7dRpeIMeBNPR/BgwRIIUv2K8mqI2VF0zcGchshBR+XOXEs+oB6+0aEXQMwsrD1j6sim4v/KU/+/OtwuHteOjA42OlU0PitnJguK7Hopy5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743798691; c=relaxed/simple;
	bh=K+GdwcY2qpId+FVrrOCPmblpwWNGwzjXOxhMwE/cWk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I6ZV8pv6vlZXTqSxRyh9N7m/4MidT1Sw9N+6WF8kdL5uUnx/3uKlef4PWkHm4RqzfQ/zx/EuUcTnUezHJHvRSRuZt82n7b4QpEMCF1X1l+lGl/0eITCVITZqjx6Xs65ZKinCMk6BohbeiMhl5VgAx8/VQ8fa/zHRUyBIT1ZOeEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BpegDKBt; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-307325f2436so24763221fa.0
        for <linux-media@vger.kernel.org>; Fri, 04 Apr 2025 13:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743798687; x=1744403487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IJt1e+3GaxJCHQhJ/qyD9KJwcLWIhx1/tmMP/uk1paM=;
        b=BpegDKBtUvmMIDHI2V9LL1TsQ1ZgZBVYVrml0LwKEOeWFgCkvfneHAFe72JRNkpl5f
         jrOWwx2rCD3uP6675+OWJf5n2nKaafD6LBXVCRYNAjuz9Q7goakdJg7NSVGBg/nzcJZC
         0O3ogYgO+nXUwKzHGw8bIfxUEj5/BlEv337hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798687; x=1744403487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJt1e+3GaxJCHQhJ/qyD9KJwcLWIhx1/tmMP/uk1paM=;
        b=SfOLmEfw/YbRw9okWprP07S7W222Eo/BVeKYBb7aIvQQwXrvGDo6QsAj5+b+AA0BfQ
         jpKFqpCQpHZEmvxzywMNKJYa85/cH7sF3ubYd68uCuUZF+2r0pZEqtVDOhKGgk5YwtDM
         Kot/96g83jY577I/HIWWSlw+5AejaS12VcriZhV5+KDRaG5HZ+3wHm4DNUzjQXX8+9jr
         v5erJTFdjHb7gMW6j2wWY18MaHFrBEw4aV7GLdl+B9msjWJ2fJztCcCivZhMQX5BXPK3
         SbUq+JTfkcTs6w8zVWjF3T8ogDNF1FxDVvE4tqziZgxFUX/VCu/Rk9pvf6JqiBl61ZXN
         lGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWxawk4HfQxF334Jn8f2gSiZXOLeNx2/wtEZrp+HK0Zdl/I+olBggCBzb/MmGKYgDJMSoSG3onJ5GltQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycyi0GdCi+jXNDTyIdkWzLTsfAichZI9tMmV/35iaz9QMnNidK
	Jz6hgcw00ocWncFWnS2+/p/d4bPqOMdTgf/39lMZaAfyhoFAHBMrZwekl5j9OifO3CJOL7Ey0Wo
	=
X-Gm-Gg: ASbGncvX3smf0/z/BIP1N4fCapMwsYU1KLvVA82jgImhsaWbU+DNXUcXemijpFCiUK1
	9uMDyZeaHNvQkhHuaPIXLQ8H+y1l8OIseKIXXwku1Lef0Mj342zff50ZCj4PB9mlPEXiM8voQGm
	o+2/d+480DJYJKo2P8yuoSf0IfG/7u15i30Te3lk8V91q6eU+jL1Pxicv2Dw8ctqGEGcYmJA8WX
	ReE0wHnGpTu2wGw1/IFttAVzhXGfZZYwKllYWsSHHdReaeoHSlsahx42blC1hD8iH1WT7lYV7ti
	vp3r/dXz3CNuT3Amj1VBTmnYw8sI3E41dYJaVVsSh0gZi0baaa+5ZUjBI+n6Jv5zbNtVTDTyZxt
	g1LJ154Bn8Bo=
X-Google-Smtp-Source: AGHT+IEPauDedQfYltPgZrAI4PKQM3n+7xXK+un0fSMJp+6F4m0t09IY6tQcbLIvZnTIGCbz16Ijbg==
X-Received: by 2002:a2e:a58e:0:b0:30d:b25d:72d0 with SMTP id 38308e7fff4ca-30f0bf4711bmr11335771fa.17.1743798687277;
        Fri, 04 Apr 2025 13:31:27 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce93bsm6554041fa.103.2025.04.04.13.31.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:31:26 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so19505081fa.2
        for <linux-media@vger.kernel.org>; Fri, 04 Apr 2025 13:31:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXd9QzkjnpzrDSTR1uYAM8mZSNo8KRH656mV44/Vaa1Nd4vkKtt5oZUyrZmYBjs0w37LY4cw+dhIkpzpQ==@vger.kernel.org
X-Received: by 2002:a05:651c:1581:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-30f0c064658mr16422321fa.33.1743798685456; Fri, 04 Apr 2025
 13:31:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-5-1a0cc595a62d@chromium.org> <20250404193655.GA158858-robh@kernel.org>
In-Reply-To: <20250404193655.GA158858-robh@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 4 Apr 2025 22:31:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCuD=vR7xT41sdyHU4Sci+q27_5cEYUsAOT3jmHBMOfixA@mail.gmail.com>
X-Gm-Features: ATxdqUGWjyuS5jbxrI5_afZO8VPXlqKA2MK8tNbiaf5xCWtDa_Llt0RuBZ7yskM
Message-ID: <CANiDSCuD=vR7xT41sdyHU4Sci+q27_5cEYUsAOT3jmHBMOfixA@mail.gmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: usb: usb-device: Add orientation
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob

On Fri, 4 Apr 2025 at 21:36, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Apr 03, 2025 at 07:16:16PM +0000, Ricardo Ribalda wrote:
> > For some devices, such as cameras, the OS needs to know where they are
> > mounted.
>
> Do you have a usecase that's not a camera?

I personally do not have other use cases, but I suspect that it could
be useful for more people.

The original proposal was more generic and "inspired" in _PLD:
https://lore.kernel.org/linux-devicetree/20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org/

You suggested using the camera's orientation.


>
> >
> > ACPI has a property for this purpose, which is parsed by
> > acpi_get_physical_device_location():
> > https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device
> >
> > In DT we have similar property for video-interface-devices called
> > orientation:
> > Documentation/devicetree/bindings/media/video-interface-devices.yaml
> >
> > Add a new property orientation for usb-devices that matches the already
> > existing orientation property of video-interface-devices.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-device.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > index da890ee60ce6e71a11910c565b6f805470782e4f..bbcda28ec7d5695307efa797f57180044afda77f 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
>
> This is a binding for *all* USB devices. This property should only be
> added for devices where it makes sense.

Can you provide some examples of how I can do this?


>
> > @@ -42,6 +42,10 @@ properties:
> >        port to which this device is attached. The range is 1-255.
> >      maxItems: 1
> >
> > +  orientation:
> > +    description: If present, specifies the orientation of the usb device.
> > +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
>
> Reference the schema from the top level and drop
> '/properties/orientation'.
>
> What about 'rotation'? Seems like you'd want that too.

At this moment I do not have a usecase for that. But sure, once I need
it I will add it the same way.

In the last thread I proposed Sakari to use:

+      image-sensor:
+        description: Video interface properties associated to USB cameras,
+          typically UVC compliant.
+        allOf:
+          - $ref: /schemas/media/video-interface-devices.yaml#
+

But he preferred to add orientation instead. Either ways work for me.


>
> > +
> >    "#address-cells":
> >      description: should be 1 for hub nodes with device nodes,
> >        should be 2 for device nodes with interface nodes.
> > @@ -101,6 +105,7 @@ examples:
> >          device@2 {
> >              compatible = "usb123,4567";
> >              reg = <2>;
> > +            orientation = <0>;
> >          };
> >
> >          device@3 {
> >
> > --
> > 2.49.0.504.g3bcea36a83-goog
> >



-- 
Ricardo Ribalda

