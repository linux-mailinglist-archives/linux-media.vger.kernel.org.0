Return-Path: <linux-media+bounces-48350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54BCAA2E1
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 09:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F60830F61EA
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 08:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00202DECA8;
	Sat,  6 Dec 2025 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvWrfxbf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AB62DEA9E
	for <linux-media@vger.kernel.org>; Sat,  6 Dec 2025 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765009704; cv=none; b=Pti1i7CgL5oQUL6kbRneXsks+rs/lwgyU+Yo/8fhmH28IkcXLMHX3lma/M02CIu/yUKPYyd+jay3UxBKDpaIGLcoGFBeA9TtmusHmOnyMQk5MKQ45kV1O8VMpCHzpxgNGNcv8lVzwilZYI3OXZzvDct/SDYMDISjjKZ7fVsZVgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765009704; c=relaxed/simple;
	bh=udlem5Z/fXEsPyiXOwoCFhXzyh44uYOwdlmHnhLhlRM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=baLzgSHaweu+Vcb33k6ErZiGCrvm5ZgCMH22a8mV6o3sgIhkKuELOiaoAJ84eP6B0VZCuzv/O1j6a14DK3bHFjhXmoiYmMKv5WIWZOxtFWQAHXT+iTxs+k+H7d+liWdtzuJUNv5hQyW8M1qj02rcBEEiK4LsMAT78XNVxQCajvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvWrfxbf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso26941395e9.1
        for <linux-media@vger.kernel.org>; Sat, 06 Dec 2025 00:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765009701; x=1765614501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4FBci3+O4afQtw23umY0BKlPjTmvjUx0lyWZ4/itP0=;
        b=NvWrfxbfvkeumag4dl4Dgzgy2jX65+nmJ25eSFa5bMIZnTX3s9fCoDOZNJ7wnk+3jm
         gGMjqAOL0Rylaj9uBrjB+EPppycsa7J95B9Jg5InfUvI8TaPbayOXBv1uKAIQa3DqIUS
         S43w0ZtfMsHGafVtNlZ3qx3H8nBTypfdZkqJPsI6Ti1FpTpFp7UrTg3UqLAO/BGWM36F
         gwn5Xi5AHjEaFGxTUhPzLQA3YeHi97jwZPfSuAZ4P4e9sizBX6v6khmfBKRTRkqqMqfV
         yoLqqn5qUrjOLViCgDt7bgHBzkyELpDKMXpkEki8uHnWKKs7aka2X+Mw6W0UrjS6i/1D
         KOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765009701; x=1765614501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j4FBci3+O4afQtw23umY0BKlPjTmvjUx0lyWZ4/itP0=;
        b=YBULMMbtVjvXIQt7j1FRgMUGggwyEe34+hlpYX3WoXFrXf0WCHXf4oWOfxl45evevi
         6axILVMc4zJwKUGozj3Fo7w4KlR1pEwKWlIuwNMkD1qL9vTpSRg0vtazs7AZ7Ela1lxo
         sE/dI4g5n7EGLjHVxF1oKoRLKE2FPfPDeAsnTQhmKOFiSAGrydzDclG6Peauqgc8OJNl
         ll6LULhS/e0/vt+ZbdNrEmPC7Q5/VTqskjzAqtMLBBLQJrLpjdzfcX4Q5cG8zz3oCBDF
         u4LyF2xpNGirFEYgi0Vyz54X7JI+K+HYM3xD6YS2bg0psEDXa1mxzv2tFyJcSIE7hTz9
         dPrg==
X-Forwarded-Encrypted: i=1; AJvYcCXmNWrKdpPKjA8Ct5jBnf7LJk56Bz1UQVwlFa9Oc+qgEJoMyCYzXiXCuN2SW8k3ultGs7nLYgLpo6OAnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIsn9RtHFgZyQpdrfSwSRUL78NDjNlP9NqLGivtC0YidtDzOCf
	es8et0TVS/uJp6U2lV5j6tZc6rBB/Vj5wnTqR9mkntTbo7Fag6+p88TL
X-Gm-Gg: ASbGncuwc4pKv7r9A3x93/06tljGIu3w6jgPyj4aiLaogzZ57Y4aSxC4yBlobqI8eeg
	04EeCHsQRh8RT2jvwE+CAA7KYxnId2jHdH/lNHhO6qsg595ew5bR4M4Nznyako1jczWd/4y404H
	CfFzC1SF4ZgKZ0IgzNB07oxRuGqY9zVrxwvHzVSlwQNuSjxtFRf+3zvDPxSPEG1nZOMCgW0Bd+k
	Y+0Rz0YD/YEwVBxITspEl8dyPPVCW5ZK2HboY8AD6S/TzJJLpA7+t61ygshO+RrIMTc5BIsrRZk
	WS5b1tBJJchfRP8p9yI7kfHKPL7YVDl2HaK1w+eyzK76IzL6qpAQkMoNfwFQLGfPueVOjId7/oN
	v/0b7M81tjgenM1boVSRsZ4KErmgmsmooOSoNKqvfG83FeQGyxAKlIRc58U4rqFUiTM+l/SuxW0
	44nS8KNk7CnQKRDZc=
X-Google-Smtp-Source: AGHT+IGduH610rn5UO5W1I+quoffTQLyEbtEowPhpEB04wS1de/RlDICAj847j9oMdvdQqNq4Iisag==
X-Received: by 2002:a05:600c:a08:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-47939dfa053mr22028575e9.6.1765009700413;
        Sat, 06 Dec 2025 00:28:20 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6d9dsm123094705e9.2.2025.12.06.00.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 00:28:20 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	=?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
Date: Sat,  6 Dec 2025 08:28:07 +0000
Message-Id: <20251206082809.2040679-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206082809.2040679-1-christianshewitt@gmail.com>
References: <20251206082809.2040679-1-christianshewitt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The video decoder in RK356X (vdpu346) is described in the same way as
the one in RK3588 (vdpu381). A new compatible is added as the decoder
capabilities are a subset of the vdpu381 capabilities.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
nb: I've chosen to us rk3568-vdec not rk356x-vdec as other compatibles
for these chips are using rk3568.

 Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 809fda45b3bd..656ceb1f116e 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - const: rockchip,rk3288-vdec
       - const: rockchip,rk3399-vdec
+      - const: rockchip,rk3568-vdec
       - const: rockchip,rk3576-vdec
       - const: rockchip,rk3588-vdec
       - items:
@@ -107,6 +108,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3568-vdec
               - rockchip,rk3576-vdec
               - rockchip,rk3588-vdec
     then:
-- 
2.34.1


