Return-Path: <linux-media+bounces-11054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DE48BE7FD
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 17:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6710B2694E
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B66B16D9B5;
	Tue,  7 May 2024 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HpAA+kgj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987E16D4F2
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097329; cv=none; b=OnPlwEgPmbUn0DdSrzPqQ8JsRcJ/vkLF9UEFL4+0Rh9VtX9SP3JZJZS9L3dcFu907ON/poNlnrg9HiBHcircSmCWEYU+vUUD99pjVogHUxcsVQDzY/fMhgHeVkqEYFIHdpDu42it0wiRS6NBOmbs2p0ool8lT52/IxC6PiAjdp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097329; c=relaxed/simple;
	bh=lj3Uuvfbi3ogaJj1SEB5/Jfxuor2q0oFT4UvFLlqcuQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pVsnUYAaurz1SLsMLB5QiH5D59Fe+1P+kG0qdmZ1RHcx58Hz8DlacsZsP9XLoe0FGLL+oKyEl+uEMxEHURCG3fdq+OHzwXGjtduXZLNtZqIVHoxbimqYr4xMy39LiF9iH5FdkxxprMs7AYhHKdt5brNNjIEvB76OI11OVecH0bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HpAA+kgj; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de60cd96bf3so7438639276.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715097327; x=1715702127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyhwXzsTi3iuS9VxYlKBJB4yY1r1RWRn/sVpGYW4xm0=;
        b=HpAA+kgjZ28e5uUu9/K1CjDZVmc2jF5NaQ7Y/BiRUjr6OWPoXCSxwpNQdJB0afPWrc
         73htNL+ZsVu/w/IhRbO1eepjbLPqpDohGCTibcx8leKmq3aQ6qyzA9C2T9nx0GK2exEv
         K+3kEM5F91hIXE72uck2+opIpsawARNrfiv1X0rzPSGE7fd1QyDnbQgwBXbIw52BjlFk
         oV0enIFyjztTfWollok5QQjbpBXqRGbpoAsUBQhalC0JPpPSoCI7aNhu8mXWZ+u+h0Ec
         xxkrKo5vWpJ/O71OBiYRbqGA/R7V74r/CqcouytB0CCNlr78btHqg1Zi3hgkEImO4ots
         kOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715097327; x=1715702127;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YyhwXzsTi3iuS9VxYlKBJB4yY1r1RWRn/sVpGYW4xm0=;
        b=CbjqqxGdHi7wTfSUD37aZf4MA4OGs0PbMP/ovVDYF6XOtdJqDDCwZkmzP2/lcyGuSy
         wXvpuiY0FCx5j8petIUjAaXPMYP87TzTBaR2W1k598R6BM8WSAQ/F6wLJe+dhttcihTB
         mPnpjngJTwNpcn/gEYhGZgc7qmHGmcClk15LELfgmV12pmaZNA7cuYA8YCFQ2yKRLGbp
         gIotVfQQiCX2uwo6IPZawiK1K3eqNLlnOJsfhH8AxPrzgfbhUaduT+H0FkT3fjh3TxrS
         k3+IFK9nHDI90EyRoqcMNz/vE2JoJjzRfJllUPnQsDjP9ZLw6YHrK7vrcVGMFoP22zdS
         FIGg==
X-Forwarded-Encrypted: i=1; AJvYcCUOIVFU4/BBO1LLRlwQ0e8Wtp+UDOq8LoR6DWEMFfcxf+h4tldlL0ZsnKcBV8Wy6M/hbeq2kLrzmBzhmB4VlzJROTkZuLhh1HBdoFo=
X-Gm-Message-State: AOJu0YzmMyI6oc18x8YyG63z49dwjWDZQ3Tz5SxsVh7deR6+xkB4CBbA
	/2Hmj4HlnCGSxZo/N1hvSdFhXKN8TsKrQvWF4nlgiipxSbS41w8CLNUzKRv605/Pf1bPFzqL+Sy
	wfiacfdN0zA==
X-Google-Smtp-Source: AGHT+IFXr71F6VzIV2IWcHBSYr3WsXCqqHZWMEiC5DuDYmkkVHWrNMTCKBa7KJNHIvxEbrt1NsffE8mdi7jzMQ==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a25:ed0d:0:b0:de5:a77e:f9bd with SMTP id
 3f1490d57ef6-deba36c73bamr692217276.6.1715097327282; Tue, 07 May 2024
 08:55:27 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:11 +0000
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-9-panikiel@google.com>
Subject: [PATCH v3 08/10] media: dt-bindings: Add Chameleon v3 video interface
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add dt binding for the video interface present on the Google
Chameleon v3. The Chameleon v3 uses the video interface to capture
a single video source from a given HDMI or DP connector and write
the resulting frames to memory.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../bindings/media/google,chv3-video.yaml     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/google,chv3-vid=
eo.yaml

diff --git a/Documentation/devicetree/bindings/media/google,chv3-video.yaml=
 b/Documentation/devicetree/bindings/media/google,chv3-video.yaml
new file mode 100644
index 000000000000..b8380021cd23
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/google,chv3-video.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/google,chv3-video.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chameleon v3 video interface
+
+maintainers:
+  - Pawe=C5=82 Anikiel <panikiel@google.com>
+
+properties:
+  compatible:
+    enum:
+      - google,chv3-video-it-1.0
+      - google,chv3-video-dp-1.0
+
+  reg:
+    items:
+      - description: core registers
+      - description: irq registers
+
+  interrupts:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Connection to the video receiver - optional. If this isn't present,
+      the video interface still works on its own, but EDID control is
+      unavailable and DV timing information only reports the active
+      video width/height.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video@c0060500 {
+        compatible =3D "google,chv3-video-it-1.0";
+        reg =3D <0xc0060500 0x100>,
+              <0xc0060f20 0x10>;
+        interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+  - |
+    video@c0060600 {
+        compatible =3D "google,chv3-video-dp-1.0";
+        reg =3D <0xc0060600 0x100>,
+              <0xc0060f30 0x10>;
+        interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+
+        port {
+            video_mst0_0: endpoint {
+                remote-endpoint =3D <&dprx_mst_0>;
+            };
+        };
+    };
--=20
2.45.0.rc1.225.g2a3ae87e7f-goog


