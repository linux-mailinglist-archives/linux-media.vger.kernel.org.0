Return-Path: <linux-media+bounces-31096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B22F3A9DD93
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 00:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09383176237
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 22:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F081FF5EC;
	Sat, 26 Apr 2025 22:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gi8I83ot"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391051917FB
	for <linux-media@vger.kernel.org>; Sat, 26 Apr 2025 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745706929; cv=none; b=mVTAnytmDsKpDLGqLIw6f89+/AxMGBkDLip17y1Dj1YuDXuzTt5Jyl/2kT/CS5aYJZV4zEmzmfmatdMsdTtNalAUHEHuFJZ59Gm9xqTSpmQPTnv9T1Y2zCqyXMonOMsTrONZIVdzjcz/UxXvNWYxAgjykwI/3dqARR1wG4hZmGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745706929; c=relaxed/simple;
	bh=yY0sW+6kY7zbaaxZ/o7AcKZ79mhZjHG/DAk/FyArlD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rgn5POgyYLrrz1HfwqdQ3YNQ/Q960l2hPymclfbQvppyM196vQIAo36mCJkLZ9fbXX0PnxdaNx8UnzcslxCqzsNnPtBeUGJENgWBQxfAeWJg+IFW/3fyTE5ZRT/e93rfVDHT5wdLV7uusgXdLcevaKpdZc9iv7Zkkv9NOMKM47Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gi8I83ot; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso2123667f8f.2
        for <linux-media@vger.kernel.org>; Sat, 26 Apr 2025 15:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745706924; x=1746311724; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WNrnxhz6g4RdxB4ag2AWYSptriqYwf47OU+jpmhkkQ8=;
        b=gi8I83otDm5M6QuQhIFE5o6uonGBcEEBgnpWl8gPo5fXDx9fRqFiRDFjp9Zqov4IBE
         cvECetJ9LBgb/zclmhxQ66kVPIcthpGWh4KnkwKxL2ts13WU9+98TC2VG5wDO1i4clhj
         HR4DF7OSjFUs53WjA2yKeIf3iMuZ17Uc+56a5QAZLFHJYqPhxVHvVQ24S4HWMw5J/ZAS
         gQLSykFKVk/gEwpQBW7A940juQLUZeiD2s4ddaKKU40seOGUeSB0uT2Dcz9uQkPHuvXP
         LhmOqMIKfow38zcUPtYnu24rpfYz8RFR42tN+rJOqYksBBth7tnHvWtQpoh0VaAh9q0H
         AADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745706924; x=1746311724;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNrnxhz6g4RdxB4ag2AWYSptriqYwf47OU+jpmhkkQ8=;
        b=qe01lhyFgGoCTfpahwMZqi8+wuB9eAikQSdBcrv6FqmTMiB4hEtUbVzKCz326GnuYw
         GafQ9VdPJFuaDMxa59ZBslw71tTqdmTuaaD1uNwGTEr4pIZi7wGNtoee9rbapORhJfUo
         14ec01KJRiL3iYf0H1CLAYGYsO2isyQMy05kaZ44j9EqGNAoSH+tg/N8AwicTBQ4yVgb
         j+0i+kZMGYa6S69zYP70RQmqT+no8tHUC4BcflEBOVcB0fkePm/qrG7Q15mU4Z0vjiZP
         uc43FvFHNCksicjZTMwQfjAH0UkWSOXyEkF5+BpJfkdjQUBoLULjitCSiffk6Mv19Yp4
         QF0Q==
X-Gm-Message-State: AOJu0Yzf3VTIpMRazxdzQZkSvoSvmdHqUS9Sn7TnErwTfGL1mvqJFknJ
	0gMfFkTKvAH0acXhUTuzJatscP7kWoapQi9xyyeZ5IxGTiEroEba20/EJbPF4ps=
X-Gm-Gg: ASbGncvfjMv+GA38hFpXvnBOZdyMiCOqg9wvgb2/ebREBVjBbOj4gGrWw1Ohqncxh/2
	MAKW+DZaZIAgFD5Ia7JQPulaKZzfRj9ZTX45I092nZHTvmzQcig2uOFnJSkv2xK9mHawqSgefo0
	fRuqvGTCXgMhHnP4T7ATo/YHSAF2DzVhzUIEESMtDprjq1oyVZS7mlTh5QtNEBIy2bgNV5KAu1O
	3YyjWiC7m2io7gOKC2RPW7WEAngcQsgYj8yqrmi5RaICUgcJqEYMahL9ReqlUwsjaBjyv+ZMHev
	O8AccL6Ig7K1yKNuToPX+ArK9P0GNItK0UHcaGlce1EZhNKh61EJXYGko6M12um96t8lWYYAeqK
	Vjaf4vbH1bOC2mXnx
X-Google-Smtp-Source: AGHT+IHksr9oz6ICNBggkESZpybwGKJ3RYgoiYZEZ1vMXPzCTT7AMNN7ENOfnvoEl96SRJxZIesvGA==
X-Received: by 2002:a05:6000:40df:b0:39e:e3ef:5cbf with SMTP id ffacd0b85a97d-3a074e1dcf9mr5070496f8f.24.1745706924505;
        Sat, 26 Apr 2025 15:35:24 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e1c6sm6885212f8f.98.2025.04.26.15.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 15:35:23 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 26 Apr 2025 23:35:21 +0100
Subject: [PATCH] media: dt-bindings: Add OminiVision 0V02C10
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-b4-sailusfor-6-16-1-5-signed-ov02c10-yaml-v1-1-9a46124fae7b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKhfDWgC/x2NQQqDMBAAvyJ77kISNUi/UnqIya4u2KRkUVrEv
 zcU5jKXmROUqpDCvTuh0iEqJTextw7iGvJCKKk5OONGMziP84AaZNuVS0WPtoEjqiyZEpbDuGg
 NfsNrQz/Ffu6Tj8wMrfeuxPL5vx7P6/oBJiRzr3sAAAA=
X-Change-ID: 20250426-b4-sailusfor-6-16-1-5-signed-ov02c10-yaml-68c3b3d6cfff
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4029;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=yY0sW+6kY7zbaaxZ/o7AcKZ79mhZjHG/DAk/FyArlD0=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoDV+qWAdHyuODYB7TozuWJs/pPl7CKF7Q38Mht
 aAb25wXsICJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaA1fqgAKCRAicTuzoY3I
 OlwGD/9W9Rw7Ud+R4f7DLU2y+37JAIKFk0dLdy3s/kL8eRlltEhiMig+SaXmeCb4qQ+PRvwrgb6
 jxYg/VgsyRLlbMtYnmFTyZX2JN/QR+wpWCSbj3I672lsHFjv1Gng4RqyMHAORr8eMXNT7BkWdoQ
 4TYc3ptwErCymPT560vM0557oLBUv4OgXFANxh8ZWVxc1bsymGEEUBtsDOj+tDvscoby1uJVDZj
 iptyisFQPuq+4s6F1GmF3gS2Eo+VHOHbOWjVrT28os8PjrlbcJE5B+Z2KaEKWVXqd3F+p76/3Mb
 1BBbb2tSGId2wLb/VhpmKehTCuQFbh9ocqdcFI8xqa9h70LKXD3qp0gDHWNeDfs/2sQaSN5Nsn5
 k9qvWJgxBRbmGBzF75/k3AsQBlLPgG9AKknuYpfqNh8PvHLiSSP919aeuC2XYjF+ZhaxTKirwhF
 /WaopTqCTWzchcg4GuQdz0YNYROZOw6hRZTda7zK43FXqhs1zU2DXjy7b3Zqnw5MST8BSBqXx88
 iLw/oK7Cg5SisWTswwUA7tkF0FcKwbFwJJEkT9kwWX0lpPI1SDnuPqvcIbiDGlkavWwmOpCF+oK
 BLLsHBbvorWp9O28fjNukTTB2b6XtE7NCsRXBA6xwFnam5vuyJZExZe3RSTC9XytPXfFmE4qdEk
 zim/xYHu+meOJ8w==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Extend the ov02e10 bindings yaml to describe the ov02c10 sensor which has
the same bindings with a different compat string and different i2c
address only.

Other differences in sensor capabilities exist but are not expressed in
devicetree.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
I previously submitted a standalone ov02c10 yaml file but, it was pointed
out to me by Krzysztof that the ov02e10 yaml has exactly the same bindings
and we should therefore extend the ov02e10 yaml.

Link: https://lore.kernel.org/linux-media/da93bf6c-b4bc-4c4f-9373-583fbd0c031c@kernel.org/

The accompanying patch:

- Updates the overall description to differentiate between the two sensors
- Adds ovti,ov02c10 compat string
- Adds an example for the ov02c10

Once merged we can also merge the ov02c10 driver, which contains a compat
string requiring yaml description as precursor to merge.
---
 .../bindings/media/i2c/ovti,ov02e10.yaml           | 47 ++++++++++++++++++++--
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
index 4ac4e11a16c8bb7a53db0c44289b1004dbdc282a..1561a3e96caa8b09a4c105b87536bb0d00b2adf8 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
@@ -11,12 +11,22 @@ maintainers:
   - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 
 description: |
-  The Omnivision OV02E10 is a 2 megapixel, CMOS image sensor which supports:
+  The Omnivision OV02E10 and 0V02C10 sensors are 2 megapixel, CMOS image sensors which support:
   - Automatic black level calibration (ABLC)
   - Programmable controls for frame rate, mirror and flip, binning, cropping
     and windowing
-  - Output formats 10-bit 4C RGB RAW, 10-bit Bayer RAW
-  - 2-lane MIPI D-PHY TX @ 720 Mbps per lane
+  - OVO2C10
+    - 10 bit 1920x1080 60 fps 2-lane @ 800 Mbps/lane
+    - 10 bit 1920x1080 60 fps 1-lane @ 1500 Mbps/lane
+    - 10 bit 1280x720 60 fps cropped 1-lane @ 960 Mbps/lane
+    - 10 bit RGB/BW 640x480 60 fps bin2 or skip2 1-lane @ 800 Mbps/lane
+    - 10 bit RGB/BW 480x270 60 fps bin4 or skip4 1-lane @ 800 Mbps/lane
+  - OV02E10
+    - 10 bit 1920x1088 60 fps 2-lane @ 720 Mbps/lane
+    - 10 bit 1280x1080 60 fps 2-lane @ 720 Mbps/lane
+    - 10 bit 960x540 60 fps 2-lane 4c1 360 Mbps/lane
+    - 8 bit 480x270 1/3/5/10 fps 4c1 sub2 288 Mbps/lane
+    - 8 bit 232x132 1/3/5/10 fps 4c1 sub4 144 Mbps/lane
   - Dynamic defect pixel cancellation
   - Standard SCCB command interface
 
@@ -25,7 +35,9 @@ allOf:
 
 properties:
   compatible:
-    const: ovti,ov02e10
+    enum:
+      - ovti,ov02c10
+      - ovti,ov02e10
 
   reg:
     maxItems: 1
@@ -109,5 +121,32 @@ examples:
                 };
             };
         };
+
+        ov02c10: camera@36 {
+            compatible = "ovti,ov02c10";
+            reg = <0x36>;
+
+            reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_rgb_defaultt>;
+
+            clocks = <&ov02c10_clk>;
+
+            assigned-clocks = <&ov02c10_clk>;
+            assigned-clock-parents = <&ov02c10_clk_parent>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vreg_l7b_2p8>;
+            dvdd-supply = <&vreg_l7b_1p8>;
+            dovdd-supply = <&vreg_l3m_1p8>;
+
+            port {
+                ov02c10_ep: endpoint {
+                    remote-endpoint = <&csiphy4_ep>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                };
+            };
+        };
     };
 ...

---
base-commit: 8b5b11babc761c25602230260fb001267645b9a1
change-id: 20250426-b4-sailusfor-6-16-1-5-signed-ov02c10-yaml-68c3b3d6cfff

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


