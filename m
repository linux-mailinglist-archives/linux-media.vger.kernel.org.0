Return-Path: <linux-media+bounces-23349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E07A99EFE99
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 22:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BEB3285A26
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 21:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32F91DAC95;
	Thu, 12 Dec 2024 21:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VkQlO6tm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17621D88A4
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 21:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734039890; cv=none; b=IGjRymUUfzfas2YEL9DboCuJNbkSDmGsKknd5yr5GGyUuXfSksag89Nrsy7l8gFiKPHkR+aebbL7j7wytf1/VxO7rEOlRiKN8xsHOSNPt9aMQ5Wi1B3QJ3XVaLib4fu6zR48rhc9MvTgMeByZZHzGuJhxh/2mJf2B1Ek1uw49/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734039890; c=relaxed/simple;
	bh=UlHzjt5XqlnLG109qvAxfN/sqPZY9O/xBm8dalBOFes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kgq6Yjmpgy8WX1NKHPHVpXq0LBKhe655qJ76vdDtAXJRmbhp0WEWlNDTtkN5/8Vt6LXWXp4j28fVEeodPj+GU+2xBOYTvH5sMd26OkJh5156B4jQwglfMC94CnHE8HyjXmfQlZ4kqnUzHWbypuZ8+zma9KkBSftuIcyw7Cc/sY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VkQlO6tm; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6f1be1daeso90973485a.0
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 13:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734039887; x=1734644687; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4nUbD1JwsRkblN7Almh3bMISRay2N2f9G2ZCbjGzrs4=;
        b=VkQlO6tmwHzmDGyIL58zxAAkwqunBApkd8+iiqf8uhJj2hm08/0d8uFkTL6eb7STDb
         2dAJOTgW2gbWx2UAFhitP7hWXYHP7r7AColY5UMyKf6m73NwsLoou7od9TULAs3zGGcy
         aUIrkm84NLAs8ufNybRDUjx8a2NoDijSil8Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734039887; x=1734644687;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nUbD1JwsRkblN7Almh3bMISRay2N2f9G2ZCbjGzrs4=;
        b=R+95zAGzPuUbmwqNr2sGEZ7EV3cJTkF/+X2bJmmuH8okmPvEg199i31zKQqPHyxAFV
         gfLI1f8FlKruMHDM+xxpsJ6Zx8uSj7koLViMrb5ihOheRP17pW/hHBBpsML7SQ9WGFDZ
         8R7zN5WDYZn5gt3CnIyJ3CouUG+lKm4TuJt0LJuaNog6IqRO79nnN3DJm8WLuiXhIc2m
         oPX9lDsmeseQLX8+O9VFuhhn4iUesn/o+Wn+eaSoDUMxeCbSCKX1dNjqnx1yvmLhdUtv
         JVKJ/JI9YC8Z7BmcFC1WfFNMSAYOazCxf21x6AkPWbOPIIWTgVLTEEY0caqN5aXJW00z
         sIOA==
X-Forwarded-Encrypted: i=1; AJvYcCUQDIerAmPh2MsAxH6DlwFojgJ2etd+URUIiQRWQ51DrgGcDWA8lSN5D9pwfLWBtIJPpEq+b8n0zqjsaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkzaWzzhzqwAk0XL9XFYpVRvuDGZJInE6L6Xj1B1Ddg4/SaQ5Q
	14HjPmplnLjSWzKo6GUZ7HdJHTZTUas1DhFLAxzaPJNpfN6asR8fZlkHB2DMDg==
X-Gm-Gg: ASbGncv22VbfDqgTY0MppEY5dQWUbl7YbcazUYuoiZ0JrliQuooxOF0TVTE/ly7VzF0
	WbcSJJklLEZ0bIKSJ4vlJjHeH2uvCmzrt7wifgNOhBtV9X3dJV5AM3fgRUr+PCGHkg90R0VSIH+
	oI8s3IgG1SFn4TgNjAWg6ekZ6HtGiIcfZt2aqOSX7TVMgLyB1wtglKUF9JTfk0JoeyhEzlFEqcm
	6qISXEivpUkeil73W6IK2cFIMn/XWTZJut8kFCT8a7QEP/IF3WBrmMSg6NHkEGpjdTEJpP531jN
	HdGrY0ErnrQqgEtmF/djWFSxzunPS1k=
X-Google-Smtp-Source: AGHT+IHvdlp9WmWec4jyjGHYEjbhEJReTIiwO+D5oPna4oGbIvZB1nRqpaRHFzTit+pQlCj49roNUg==
X-Received: by 2002:a05:620a:1925:b0:7b6:d5cb:43b0 with SMTP id af79cd13be357-7b6fbf3b8bdmr7344785a.39.1734039887616;
        Thu, 12 Dec 2024 13:44:47 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6f4f7b34dsm83368485a.1.2024.12.12.13.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:44:46 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 12 Dec 2024 21:44:37 +0000
Subject: [PATCH] dt-bindings: usb: usb-device: Add panel-location
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
X-B4-Tracking: v=1; b=H4sIAERZW2cC/x2MQQqAIBAAvyJ7TtAtMPpKdNDaai8WWhGIf2/pO
 DAzBTIlpgyDKpDo4cxHFLCNgnn3cSPNizCgwc6iRX3noA9J4uUvcXVPrbOOQjDoQaoz0crvfxy
 nWj9HmCL8YQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

For some devices like cameras the system needs to know where they are
mounted.

ACPI has a property for this purpose, which is parsed by
acpi_get_physical_device_location():
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device

In DT we have similar property for video-interface-devices called
orientation, but it is limited to the requirements of video devices:
Documentation/devicetree/bindings/media/video-interface-devices.yaml

Add a new property for usb-devices that matches the behavior of
ACPI's _PLD.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index da890ee60ce6..1ce79c1c3b31 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -42,6 +42,20 @@ properties:
       port to which this device is attached. The range is 1-255.
     maxItems: 1
 
+  panel-location:
+    description: Describes which panel surface of the system's housing the USB
+      device resides on. It has the same meaning as the `ACPI`'s `_PLD` Panel
+      object.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # Top.
+      - 1 # Bottom.
+      - 2 # Left.
+      - 3 # Right.
+      - 4 # Front (aka as User Facing).
+      - 5 # Back (aka as World Facing).
+      - 6 # Unknown.
+
   "#address-cells":
     description: should be 1 for hub nodes with device nodes,
       should be 2 for device nodes with interface nodes.

---
base-commit: eefa7a9c069908412f8f5d15833901d1b46ae1b2
change-id: 20241212-usb-orientation-8e3717ebb02a

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


