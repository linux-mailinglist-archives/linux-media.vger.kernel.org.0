Return-Path: <linux-media+bounces-29345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8CA7AE5F
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 22:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E0D83A67EA
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 20:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEF6204F84;
	Thu,  3 Apr 2025 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dA+tqKgx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490BF2010E3
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 19:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707793; cv=none; b=s5D2aahFyQNAr70AeK+3w+MWc6L4wCvDRBTez/Lwp8kYjUKYgcl2OhHm8o2Qu+NKMMpWLVN+I/eL8RxIL4uckwhT0BcXz3FdrKsHSt7nkuXHt7/T2arQqTn+BOWqQAT87T4Twzknymxh4lZyTdLwiOGPG05KeLbw2erde6vQEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707793; c=relaxed/simple;
	bh=rQ2v20Ddln+4BwZ1YiM0h0pDo1Qau2cCuH+bpTFZT9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WxTi+ql8NmyIm3qMJbELhI4C976Lf9D64VpsT03uOjK2ZtuUN6zpOhqK+gpC8tINZ0lRMdnfeuDC06HNR9lCZAJFdG9To8EOtDWCNdLXQljKwnySnLIKeatCNQ7wcyDYsO5gfT9rBrEocf8rHL14utCsIhb/eH9o29RUV9AR8+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dA+tqKgx; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5497590ffbbso1354864e87.1
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 12:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707788; x=1744312588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTsIlDstX0o+Mbqya+IkMyfr6mBLbjzx0t4rQvZShfQ=;
        b=dA+tqKgxMEyaBrWTZ+T7TXv+rs/eoD44/x4t7aWao13O3Gd7wAUFM4j25zZwpfUHFu
         ZQXUUs0mPlvA5pz1LwM3Ua+rHXzFoZH4XJ2e1gHhsQ7izxa1P3QgR3MdVLokoebMRP0f
         vCvsIUMwhvQWEHM5tPZl/sRAGTwB51FeYmlvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707788; x=1744312588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTsIlDstX0o+Mbqya+IkMyfr6mBLbjzx0t4rQvZShfQ=;
        b=n8C2eFh4VSEcsO1bzVH2+rkriuqUtnWS/bk+3ZxJFWp+UY1bhxiJEXyqgIQ1N4/HT1
         YeHrfRfPqJYzRNNNhj6oJ49fBpaOnkvKuHWhDdJBGh3YM3tqXK86yq57Sejxb54yelwz
         8EXcxJ+uCkRVGTOWB9AYYUapKHyQdYDTRyfmKLwCcW8CFt2gG1+hDen5c01ZjOXkhwz0
         Piy+jdsTdXCU/k5a++7QsB72FHleXmqNe0m2K67TDof41ulqzNJQpE8nK6tfn2qDBemU
         jkIlcg6iwn02SsbVliOEFh32wxQOGgkbND6cde6PzHdsQiA+rFxJjiKtFHpKteuAirjQ
         bP1g==
X-Gm-Message-State: AOJu0YzeV7xi9opibxtQe2F96n75jdmD3cnEHW5Oer9BYhMmXuzHVm4x
	yDfgx5FHVt9hdJ+rTLxJkoG/3JGTAi4UBdS1vvPiVYtz6bXFg8Ti9NjdLTD6Jg==
X-Gm-Gg: ASbGncs3NLiLCoB3UsBecuSQrS7vt1BH6eMXLfz55isSZe5d9d8KlQrC00M3X49HvTC
	EQob6gz8WXcjwc1x0IOXmLteIqWY8nDc91goZ9l8pKvQQXA0eHGN+IDZxl4BdhsVulEKERv6McN
	L55DDKwP3ejv4nmvilEb8zLenqKKWorW2Ori8zrYA+M1ZJDdB5vaZNABH4Cv1mHUxftDThJRlVm
	3CKB6BVFOxjbuPkekpH6H7608UE0687/sbT3/GKqvxNQKa/Pw8nyrL9i6UMrDIir7VKutgDlar9
	W9k9AHG7i3jFN9GKErNoIsMCaiRrsLm2HTLVIML6QMj2ZgX5MmXAu7vLuABgx6XJT9o0zB6YcY+
	qNYJZYolu7dQzxXfXFYRi/c9B
X-Google-Smtp-Source: AGHT+IHCXI3V2p507FEESs4oxanJZZsNHxyB6fAQHEoPMaOLxvmQtP8ckbT8u/hI65VR8pFcvY0x2A==
X-Received: by 2002:a05:6512:2253:b0:549:7c13:e88f with SMTP id 2adb3069b0e04-54c22795803mr113406e87.30.1743707787714;
        Thu, 03 Apr 2025 12:16:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:16 +0000
Subject: [PATCH 5/8] dt-bindings: usb: usb-device: Add orientation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-5-1a0cc595a62d@chromium.org>
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
In-Reply-To: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

For some devices, such as cameras, the OS needs to know where they are
mounted.

ACPI has a property for this purpose, which is parsed by
acpi_get_physical_device_location():
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device

In DT we have similar property for video-interface-devices called
orientation:
Documentation/devicetree/bindings/media/video-interface-devices.yaml

Add a new property orientation for usb-devices that matches the already
existing orientation property of video-interface-devices.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index da890ee60ce6e71a11910c565b6f805470782e4f..bbcda28ec7d5695307efa797f57180044afda77f 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -42,6 +42,10 @@ properties:
       port to which this device is attached. The range is 1-255.
     maxItems: 1
 
+  orientation:
+    description: If present, specifies the orientation of the usb device.
+    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
+
   "#address-cells":
     description: should be 1 for hub nodes with device nodes,
       should be 2 for device nodes with interface nodes.
@@ -101,6 +105,7 @@ examples:
         device@2 {
             compatible = "usb123,4567";
             reg = <2>;
+            orientation = <0>;
         };
 
         device@3 {

-- 
2.49.0.504.g3bcea36a83-goog


