Return-Path: <linux-media+bounces-50334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30223D0CFFB
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 06:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36E4D301E6E8
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 05:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8DB30FC1E;
	Sat, 10 Jan 2026 05:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ha4uEMpe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FE533ADBA
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 05:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768023459; cv=none; b=isHm0D4YEP+9QXziucfyXDkdaHGW8zgximYl3P7lsA4qdtb9fB4o/MQwXqfufz/Ex3hO8kqVaadGPyzs8a4pEz511/WwT5cVbzXjKj4TbAUP21fo7OKtBBG5gwuGlm4steqN2CD3MEmm+ijiqIZlEAUgKI2yD4/HQvzM21yh0jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768023459; c=relaxed/simple;
	bh=SXaAuy+sO3dzXQ2PoQ2eNwc+lb4WuVOPoS1sybm+gP0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5eFX2PGO4yq8nP3FDp9QH90eCdIYuWMpuMFnl+1tD0ZDvh4rkToL1jbPgCkK6VXhkfU3h/lcCm1ue8MfdZrgpkRnP6qh6uBAKAGuz6RI3pKo6p90oZFRKPoQ2Ug72k6TCY/aen7QNsKSib0ItvG5uE834Bf2/wKnW3Ya4c7hJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ha4uEMpe; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43284ed32a0so2464870f8f.3
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 21:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768023456; x=1768628256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRmj6n80JYrNuWPK4JdBaS4YTu/hZ0Oho3r4jDBrKMA=;
        b=Ha4uEMpern4BJ5rNwza0fIJ7r7C5pMihEl2yXW+zcx+j/D7fGVxbrImaOVSvx/cIFe
         5aPQbLmfXjxjO0zXPuLKnDvzISnMHBtMWn0pkCh1WZaiknX9EQjrLC10qX36cOdFUIZE
         lIlSGkva5LNzX3mbhrWxdQEuFEPSfXjGnLymKd645mchF6I7dd2LdB8vJe7AylvPUYxX
         4kTEoS+3rp5/XqlQeoDdtFYw+4cwbFiqR6Fm3RmoOACxYXFEy7YCLoGe6MpUgQMVC2ND
         EC9dLcjwQp6y/g+IYs8xrd0eW45Fo2HgW0kw9SllUHReR66bqW+mv+e9Vny/FLF71c/b
         AaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768023456; x=1768628256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bRmj6n80JYrNuWPK4JdBaS4YTu/hZ0Oho3r4jDBrKMA=;
        b=gg6L24cD377aaefPR15GHF7t9QJW15x8MrnEzbM3dUjqsGnJLvzMwa2y5d/zxeI9qf
         R92K0AZNO4FUSF7RnJ52qr0+maGkaAHvn1zh/wmOyMgci0dwpvVlDkQA7UNHL33xg9YH
         /wloZkKS7ZZgAxc99LqxkepT+kI4bqEwRCtPqvDRxIXNw9omoNpsy7D7mBPT+tXTlyLT
         92fbbRBXxfJL26GLi+edZnsZ8n4myy9khIpYs65QU+7resPRybR4l+poxh0qRkvs48jm
         LsazsndPvNAKqd0iqhittEcVh3M7c6Bs74IemjqJWfBAK5k7ib/EUW9nAhcDgmpSCHZX
         SVDg==
X-Forwarded-Encrypted: i=1; AJvYcCUpyDyRGpROPz5KnAoyTmNvmu8FrUDocNDJHmvOTyMD6KcS2B7CkXGWQIa/eyJBoPgOBQYzX9vYD+//Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx29AkyJvaPY1ZwidGZx5NmrU6/acIGooaou8OtDQHuWbe5mwBi
	ycxpXHDqm4CR3L/uG/j1OsW0kJvWLuZAyyDXSf5LbIC5bbqeigaQzwuJ
X-Gm-Gg: AY/fxX7uFv8bACNJA+osRQl48BbMzFIlp4NCC/kM2jSaSx1/fMfppckhQCTEPvr9MUz
	h8WO0WLdOUmrBRDbjvhWoBKFGQV8CcWQWsSjOfNcadolLDgzNrVnCgos1x5gzhGLnjn/tA2caqV
	4FL6qbbFIkMz3B91nZf2MPfzcYRRB57q8nlsKnGGRUJRaDBqduwWqw2bGm2Ap0x8bJ1HUd3qxnn
	j5DRcoSgLKYJOw+ltTGuGRu8rnB+KH+LBw2dCLsyD9/MoecsPnlzZhO6r7SKmiIqLNsjLJcXF5l
	SZX/A81G7eKEul8+ZjEa/x5noKBJFFeHndjH1XJLRT6gxTOlejLBQ601WKOExoTnVLSQzmMRuI0
	n9h+mzkRb4fCDcmevo0U6Tnl5PThLxFk4xKiU9zFgl8Sjer20E8lGOkHDCy5qxUR/4YsvQcE/Nm
	nGRQzR5SYVJMuPwoPopDbz3PrX+w==
X-Google-Smtp-Source: AGHT+IHFjnlCF8pTEQfGb9W1ffV5gzSschOlhEKfZUTAdGXo3QGSdTLZRenFmR/o3QVDEWnVyv6rKw==
X-Received: by 2002:a5d:5f54:0:b0:42f:bb9b:9a82 with SMTP id ffacd0b85a97d-432c37746d9mr14189554f8f.60.1768023456178;
        Fri, 09 Jan 2026 21:37:36 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dadcfsm25973825f8f.3.2026.01.09.21.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:37:35 -0800 (PST)
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
Subject: [PATCH v3 1/3] media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
Date: Sat, 10 Jan 2026 05:37:25 +0000
Message-ID: <20260110053727.2295260-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110053727.2295260-1-christianshewitt@gmail.com>
References: <20260110053727.2295260-1-christianshewitt@gmail.com>
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
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
2.43.0


