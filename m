Return-Path: <linux-media+bounces-26171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A0A368F9
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 00:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADF871723F5
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 23:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872781FDE05;
	Fri, 14 Feb 2025 23:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTUGZ7tR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2691FDA62;
	Fri, 14 Feb 2025 23:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739575107; cv=none; b=up1/Rv6ppZSxPII+xJbTn/trBdL3ybf85YuTXwhuqoW3p2qMa/XNdOS9f/2FIf8KEotcWu7QPTuWz/DKHIK3D3++fADaRRWyGL1/mIm40+V5yiUFkCHAjLPD4V0p2T1AYtBGEbXiKM1CgzjrdZ+YQglCp08Cwxdo8ofKXVXsnfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739575107; c=relaxed/simple;
	bh=Vhn3QGHE1MLEzmoNMXFb1/tc8Q7VKmv1LdtWM8MWBxc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YvRQmtoxP42511TcxZmmCg6kRwGyY3Xg5yPrEMvtEOzyszF+NcX0QEbdmLCsaye8pAjgACRDurHwy86ir+LFj3RYuJEPKedjMG/X9EfAt1wCqxNZ2j3kjmt7HNxZ/PznAMOna3ssgbra2LiF/JkIVD2d67ccjC1BMMdEMoJ8kaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTUGZ7tR; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e66cd2704bso409196d6.3;
        Fri, 14 Feb 2025 15:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739575104; x=1740179904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icOWIv/es9uutoyRB9kkQJTmmKKERue49bJNnCoF7Oc=;
        b=FTUGZ7tRLXTW2XDTLE6W7WcUfQDW685zWOygsIDXft/xEOSIjbX5KfOAhkDuNG9q7u
         repoAWj/DwnZn+BXBJ1d+Q7cftLfF63/yMNxK8JlvmhE6cpGlxWYtXHjH0wqJxduXFKU
         5TFAS1yNa7LlLFKetPPakv1mb1p1XPw7siVi0SJuJQt2q3UCYUlZiSI3FasdTansIg7m
         ol/mUAqDmVJH4L6IYZuqASv9DE9uWGU2NN68txZGj+SicqmNNOAM5NyHK/QCGyrK1rrj
         BLyh6zVb5iYSrah3xZxl28xltjdmiA7x2mHuuxFf/0kMrCZOOgipFqQITabswxpElf3T
         sdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739575104; x=1740179904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icOWIv/es9uutoyRB9kkQJTmmKKERue49bJNnCoF7Oc=;
        b=BHWO2cPZjPXWfubGlXHvrL1Nm5+MeaNrk33mv640IP3iIT5cDO5nODJ25pfKqK88RV
         oHFVwg7SZ/3M23K/ekT+c5tdcw26H1QDF9aUXdRPFTgyMFxfxwbcG4kAa/uiKUCaXA2R
         n5H7YwIqaf5zzcXDMMoF89+8dvzBAKu2tLsuCVhD+5V9GMjnuT49OceuVnlJ8NQ/AZjZ
         hggxQrL/Eb2HA0ixhGffGeLuPLAByPNrlz6ojA5CB+gsZQn5541ckSkdZ7mTXSTm8yeV
         JjLVr9/FMcTI7m0Vw/OobxQDngq1199IMkuqGKGyC4SeDjGIQ04wvEYkzwXv8NhFglp+
         eVXw==
X-Forwarded-Encrypted: i=1; AJvYcCWiq1+xNlAJHzfSuefrssWIQLLnLQGYoYmGZpFiyUBj8NDIsHJ66M2U/iK+RundrKt5esKZk4xLX8OZDMw=@vger.kernel.org, AJvYcCXIME3ilP+2SUSB5lryStFRgaiKvuaL91rk6vNdh1C/u4MuXICJVvBBeDZnUqy1+EvzYOzCaWyn8ylSlKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcwjUe7JhLPiOKuw/CskAwuyYEND685nUFZQwqnehujnCWQuk0
	Pt+abMAJsJMcX84Zvp0iOTAV8W6faZ64ZmfP96I6s9Nqgc81+dVq
X-Gm-Gg: ASbGncvtVrC1hg0avw8uI7fS7d5/lNWcpa1ruXImWBNyfy6LZQuNG9fKKHy0EsxR92e
	0PT85E9rd1vaghpFQhEnEeKAR3NBZ4uUVO4hrYijKjB4hWvb4k0pK0q0qD7huptIiakuETMkRJD
	67oj2+WSDDBfj+jUGsxjjBT2Y9ytqa22STh9gMKlzAawkShmpxdy1V5SM51wcjkgMNVY/Etx6d7
	+9uCLLpF9a4r0/nA2BJT7HinSi4CridQxmwsmkjYGyMQY94vM432ou4ioie1bhOzRbyehvl1MhW
	NwmS85OskVP2BBn7Ys30fn7Aztl3dxds/QE3oMQV5sKnQCAqrGDknuEC
X-Google-Smtp-Source: AGHT+IHsvQOy3EtPCYjWxJ334ARhTra6bGLz2x2Itznpk7vAmcxyLOAOHevQQxhDLLWS0ommznhlqg==
X-Received: by 2002:a05:620a:46a1:b0:7c0:7e8d:e430 with SMTP id af79cd13be357-7c08a9d7c52mr78025385a.8.1739575104315;
        Fri, 14 Feb 2025 15:18:24 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:94a2:4db7:5f35:9da:d13a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07c861221sm257829785a.85.2025.02.14.15.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 15:18:23 -0800 (PST)
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"Uwe Kleine-Konig" <u.kleine-koenig@baylibre.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Majewski <mattwmajewski@gmail.com>
Subject: [PATCH v2 1/2] media: dt-bindings: Add dt bindings for m2m-deinterlace device
Date: Fri, 14 Feb 2025 18:17:58 -0500
Message-Id: <20250214231759.119481-2-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214231759.119481-1-mattwmajewski@gmail.com>
References: <20250214231759.119481-1-mattwmajewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a new yaml schema file to describe the device tree bindings for
generic m2m-deinterlace device.

This device is supported on any hardware that provides a MEM_TO_MEM
capable dma channel with interleaved trasfer support. Device tree
bindings are for providing appropriate dma channel to device.

Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
---
 .../bindings/media/m2m-deinterlace.yaml       | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/m2m-deinterlace.yaml

diff --git a/Documentation/devicetree/bindings/media/m2m-deinterlace.yaml b/Documentation/devicetree/bindings/media/m2m-deinterlace.yaml
new file mode 100644
index 000000000000..e39599d7d07b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/m2m-deinterlace.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/m2m-deinterlace.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: M2M Deinterlacer
+
+maintainers:
+  - Mauro Carvalho Chehab <mchehab@kernel.org>
+
+description: |-
+  A generic memory2memory device for deinterlacing video using dmaengine. It can
+  convert between interlaced buffer formats and can convert interlaced to
+  progressive using a simple line-doubling algorithm. This device can be used on
+  any hardware that provides a MEM_TO_MEM capable dma controller that supports
+  interleaved transfers.
+
+properties:
+  compatible:
+    const: m2m-deinterlace
+
+  dma-names:
+    items:
+      - const: rxtx
+
+  dmas:
+    items:
+      - description: MEM_TO_MEM capable DMA channel
+
+required:
+  - compatible
+  - dma-names
+  - dmas
+
+additionalProperties: false
+
+examples:
+  - |
+    m2m-deinterlace {
+        compatible = "m2m-deinterlace";
+        dma-names = "rxtx";
+        dmas = <&edma 20 0>;
+    };
-- 
2.25.1


