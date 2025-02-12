Return-Path: <linux-media+bounces-26077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 525D1A32D0D
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 18:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19E201884332
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 17:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D544F25A343;
	Wed, 12 Feb 2025 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fh7c2o0a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1A62586E2;
	Wed, 12 Feb 2025 17:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380166; cv=none; b=aBg0w8e8NqenZOH2z2h+oAy8tF8La6NU5dEbriwCQCI8HBbcFxKzz+cCUVc8+/8SXBINKu4Qpxtkj8PLTsm54inw0Oh2c9JksFvwEagRCSI/qEaYEh0Zeve9YpWo8OhOqHftzqYV9WIncdCjOKs2qvKg9kttpMYk0D7Ybulu7do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380166; c=relaxed/simple;
	bh=LpvD4GRKt56iJUYjxt5c/loK033MF5rI2aRsrq6XDOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=naycj09739m4vv5OhR6nNdIpWzhybzW2RAM7qWF8vGwpVVH9k4Ce1IxREshEsqlM9Bo834scT+vGGu+9IwtK76IiEd8PxoTXWhiL/OhIUZi8vPy2vUrtPSKLPGKIO9N9Nb6slDiDsM+BH9GniI5nKIVkLOMYqPs/AIkTnTdfeIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fh7c2o0a; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4719edfcd13so3261181cf.1;
        Wed, 12 Feb 2025 09:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380163; x=1739984963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpLNszSPIwwrh77tKsORDywoOtjOjCMx1grEp42UkB4=;
        b=Fh7c2o0ak7V/2SOW0tusVfMMXO99zlE4FOggKn0rLYnl5Zpu5olQFJ+zfitc8zIvRb
         d2bP89mV+k7+dR67IfP3NzhkxkUhF19yexGnb8lhdbu/6rpqVE43zM4+bVZlmauOEK1T
         JqN/uuuyqejfp/UMGgmIadXvuMJnELea8ktaXByZFh4Nh2uZTmyvutcdJPWpIa5F74Uo
         Q6H6hW+xYjnMvojhRk+pvKAYAl+kTmtMA8VeXP+MLcFByenmI0Rbfv/lcQtprY1oMkDJ
         o0yKrb+2TSmGFfJzPEykw6IPHXuGq3R4gQHVCvlnede55Dw08vWSSdKQMaEI1oI6GhFN
         j4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380163; x=1739984963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpLNszSPIwwrh77tKsORDywoOtjOjCMx1grEp42UkB4=;
        b=T0DGHYxzSMROpqIoc6H/NGTNN1GxxmyI58/eqMe/9NiGmdo+tSGC3H3Cg7Nolzfjif
         VuPa+BPloScF9EMXpjZmspLXULr4TicFSnx9djsCFBT9KZ0LGp1x491NXxsfoL/DAO5A
         XuLhCTa3PFVseftbvAIK9AHHOoTKyAE3zh5u2SUrB/t//SuC5NWgV9EqDLuR8MQGZNId
         IU7VRQ8zvT0eFnT6KTeXWDsnIx4Vtc2FbMaEx8eQqiVe+9zs7E9QEXxJ+GWpWMrAOwBd
         KjtCG7BxHXFY2ebWX8na+fSwY8o7k4UZrkY7nQqgCZ4UeLedzVSQqUOLvJeMG1t/Vgdp
         UufQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6slBQHhkEGrVhajOVimlaNG9eAqwPYUdy4AQ0NaiV3DVSmeIT5Jcl2sT2QGQjy/bxv3lQdMx+uCb8RL8=@vger.kernel.org, AJvYcCUgvWYX9v3Mc2DLFTAcqNk3iBnVHdIoYirTo8KZ+/4JUACww2qzT97YAi/bVByh1o5v+rCQg+VnRymlwxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMM17JFDtCgTqibeSTn7pxfYVKXP0IXD1htSV1Ru0x9JPKPqrp
	iJOrHcD3AYxvE1vlq55cdv9C8arjchmOqcy3hytsEN80La65QSNx
X-Gm-Gg: ASbGncu+l8ZSmYEr8vDoI7ftWdKSVl5iAV1pHqcRxIDcvKk8RMUKCHBtXgVk5YFSLDf
	zDSftuMs2tFTcqA+9vdtHkE+64axNwo2jg3BwuPCxbiUeX3pkpGceH4xqrMf7A8ERTARGIbW+D9
	gnbFPPI7z0nuFaSaeBxTGO7uAYurqeS0KPa1nu38cFnFH8DRlwgNlC3YrkVF2kk1ThlwsRJaW0h
	f6nKmMYfNunXvV+WqTVnUys7EHLA/c5SO0BPI6v9JlBEYo/PERWKtFjy3N6/o9RnXM1zlGhzVrf
	/JLZ3B3yfEsd455disMEW6P4/AF/uQBcbUdAY1Ut47DggQt3R+vcY+kR
X-Google-Smtp-Source: AGHT+IHKWzLwDfNePO702O88CwKx9UYCSyolieihropdI5zFR3komWMYTqdpjqYxT0udFvZHn0eykA==
X-Received: by 2002:a05:6214:20e9:b0:6e4:449c:ab1d with SMTP id 6a1803df08f44-6e46ed77434mr26170986d6.2.1739380163677;
        Wed, 12 Feb 2025 09:09:23 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:94a2:c438:570:6155:5ffc])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e52798f66asm12079546d6.37.2025.02.12.09.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:09:23 -0800 (PST)
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
Subject: [PATCH 1/2] media: dt-bindings: Add dt bindings for m2m-deinterlace device
Date: Wed, 12 Feb 2025 12:09:00 -0500
Message-Id: <20250212170901.3881838-2-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250212170901.3881838-1-mattwmajewski@gmail.com>
References: <20250212170901.3881838-1-mattwmajewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a new yaml schema file to describe the device tree bindings for
the generic m2m-deinterlace driver.

Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
---
 .../bindings/media/m2m-deinterlace.yaml       | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/m2m-deinterlace.yaml

diff --git a/Documentation/devicetree/bindings/media/m2m-deinterlace.yaml b/Documentation/devicetree/bindings/media/m2m-deinterlace.yaml
new file mode 100644
index 000000000000..3ac9c1e7be88
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/m2m-deinterlace.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/m2m-deinterlace.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: M2M Deinterlacer
+
+maintainers:
+ - Mauro Carvalho Chehab <mchehab@kernel.org>
+
+description: |
+  A generic memory2memory device for deinterlacing video
+  using dmaengine.
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
+      - description: mem-to-mem capable DMA channel
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


