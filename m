Return-Path: <linux-media+bounces-23605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8439F4F5D
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 16:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E183418836A1
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 15:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074891F758D;
	Tue, 17 Dec 2024 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LCLO55ZH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4036148850
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734449087; cv=none; b=pG4JIfoxSIAbdNId9Zv82+j8YenclQAlZTkRnSbf2Q/J89T/AXBvDwYO0d4C5xuThtcS64zjSCJbj2Th7dqC/wo1rTFH4a1wxSAW2iAqJk8Xcwxha1XQs713+3z27B21l0CyZh+D0flQTwe0cfZm5k87VmTd8dyNlKV8E9H7hCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734449087; c=relaxed/simple;
	bh=tJcj122iz7Jx3wrPNt7YdMvOP8Z5lwK8MmU44L9IfCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKwQ08U3Qp+BvqjdrWn1yIkS/goNdiggrLwwqLoEGMb5zx1DgBs6GVejEytYRr7XLNKo2CKm0Xw/POonmZSnqNOU8f8m5wIgURTUjD6e9aHrOjXC226gD/OpO8cASth5oqI2o4x6ZS/4uLsdNV1tsNXfFjvlWGIERtFHrEs8r+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LCLO55ZH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-728ea1573c0so4751991b3a.0
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 07:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734449085; x=1735053885; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0H8dpphBiU338zp26XHA6XldVzXKyZfnCcMSHEK5Qec=;
        b=LCLO55ZHfWuAu4KWEmVwd0EXWLSLGI68McWkWOQ4i6wuSmU6abDxrQb5Na+yt6+k+K
         9/ZnaNtOfcU91ce6hWM5h7t78neZuj5XuGlFOi2muIjZOJxwbIQqHDjpAxhWkCWVSQ4w
         /serlUYi+RASy6qbHncExVjjgRUf7koHFil9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734449085; x=1735053885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0H8dpphBiU338zp26XHA6XldVzXKyZfnCcMSHEK5Qec=;
        b=LZ6Wz4YioRRnURQ47Qjl7yFalKlM0xxnCUcYrUCy6nfLLz/4DJkUlMFQyR8qR+vuxZ
         A9sat6wV18SRrVoh17aFq/MLojDKeB6AlkcKpMzeKJwIhJSJLnLXxjGHoseLlkvExDdo
         HhbZa36kqA1J+5BMiSZt8LE3uPhAzF80Y4b3IxbZSUZECCmeToCb6fBP5Gx7jlF45sJR
         OJoRK6KcjHNNVmUT8vaZNYKSwayWnxBV0Yn0hbm134WBwkjP0fArYxRETOGxkfMy/i5H
         cK20rBEPUmQqO8LRMjOSp5b2IITsWk8xdPQ/ENeRMbYYrnXaE/FttWXtMYwPgg5E7qZE
         0uJA==
X-Forwarded-Encrypted: i=1; AJvYcCXCTHXRdYcUQ+X6WJlrXo7pf7HkB4SDDSaAwqjJgNAEo9RcAAgdMk4gz1ce6f4i5i2vbUeGUUxPUBU56g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhOFvRePN+X7XHMYkvNp/ymWAiuqoz+aZ4P3G4VagNswGrTx8C
	WwIBHH9ibFP3084xKuW+fZuw5ciWQhQMcSA74nd5ustF2m8cgn0ylV8zHXqHsgUR+9JzD0pL7Yw
	=
X-Gm-Gg: ASbGncuoO2gJH/4CgVbQ+I3RkW58PNyHnBZVVdeXmDUYa//L+7CvGu4gu+bIBzu+ZLy
	eVzQbbvt2evK+XjUho8EDe7rwaQecKlCtw+KiurqjpLhIFr+Z/9OXgW97hgjKyYGwZqpGBCVgbU
	d9LgunDZthovEoor03sZKoJE4u7mN0t38ghqQm0QVKoYIDDQbc/vyXbhPzNsfsvRDSO5vfxySp3
	IrLlccRb7XBXl7Bh/SFonO75H2QgVgNBgjAgPy550tOqUyhuflfvZ1LDOmTkgxN/YjNu5JGGoiY
	cb9M9+/HtSPCyUExDcH08BE=
X-Google-Smtp-Source: AGHT+IHQlJTRu8N7YRHWz5WtQdZmMzYSM9zM9pEIRsfCe6DaBby5TSta9cecyGxQRvLmEuVjBvcXuw==
X-Received: by 2002:a05:6a21:1796:b0:1e0:ca95:3cb3 with SMTP id adf61e73a8af0-1e1dfe96d96mr26459222637.37.1734449085148;
        Tue, 17 Dec 2024 07:24:45 -0800 (PST)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com. [209.85.215.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bad6f2sm6930522b3a.145.2024.12.17.07.24.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 07:24:40 -0800 (PST)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd45005a09so3346763a12.2
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 07:24:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVC+nZfut9KxAWT3pvhQukDJiOP5QfhhegnQlWfBSh+IUGTsYGHhgwrVuUlRv5HPr4IvunRlgE4MYg/Gg==@vger.kernel.org
X-Received: by 2002:a17:90b:3d4e:b0:2ef:67c2:4030 with SMTP id
 98e67ed59e1d1-2f28ffa7efamr22923781a91.27.1734449079297; Tue, 17 Dec 2024
 07:24:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org> <20241217145612.GA1652259-robh@kernel.org>
In-Reply-To: <20241217145612.GA1652259-robh@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Dec 2024 16:24:27 +0100
X-Gmail-Original-Message-ID: <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
X-Gm-Features: AbW1kvbl1RIFIvxrMQUN76wEj-BZmkCHKRl0SbByJH78c9Yqx7sfn6vg0uVQdIU
Message-ID: <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob

On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wrote:
> > For some devices like cameras the system needs to know where they are
> > mounted.
>
> Why do you need this and why only this property and not the dozens
> others ACPI has?

Userspace needs that information to correctly show it in the UI. Eg;

- User facing camera needs to be mirrored during preview.
- The user facing camera is selected by default during videoconferences
- The world facing camera is selected by default when taking a photo
- User facing camera have different parameter defaults than world facing.

Right now, the only camera driver that expose the ACPI location
information is the IPU from intel
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/pci/intel/ipu-bridge.c#n258

And they are only using the panel.

If we need more information we can consider adding more parameters in
the future.


>
> >
> > ACPI has a property for this purpose, which is parsed by
> > acpi_get_physical_device_location():
> > https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device
> >
> > In DT we have similar property for video-interface-devices called
> > orientation, but it is limited to the requirements of video devices:
> > Documentation/devicetree/bindings/media/video-interface-devices.yaml
> >
> > Add a new property for usb-devices that matches the behavior of
> > ACPI's _PLD.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-device.yaml | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > index da890ee60ce6..1ce79c1c3b31 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > @@ -42,6 +42,20 @@ properties:
> >        port to which this device is attached. The range is 1-255.
> >      maxItems: 1
> >
> > +  panel-location:
> > +    description: Describes which panel surface of the system's housing the USB
> > +      device resides on. It has the same meaning as the `ACPI`'s `_PLD` Panel
> > +      object.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum:
> > +      - 0 # Top.
> > +      - 1 # Bottom.
> > +      - 2 # Left.
> > +      - 3 # Right.
> > +      - 4 # Front (aka as User Facing).
> > +      - 5 # Back (aka as World Facing).
> > +      - 6 # Unknown.
> > +
> >    "#address-cells":
> >      description: should be 1 for hub nodes with device nodes,
> >        should be 2 for device nodes with interface nodes.
> >
> > ---
> > base-commit: eefa7a9c069908412f8f5d15833901d1b46ae1b2
> > change-id: 20241212-usb-orientation-8e3717ebb02a
> >
> > Best regards,
> > --
> > Ricardo Ribalda <ribalda@chromium.org>
> >



-- 
Ricardo Ribalda

