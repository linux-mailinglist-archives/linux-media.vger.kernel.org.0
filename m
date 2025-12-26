Return-Path: <linux-media+bounces-49574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA2CDEA5E
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 12:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12FF9301619B
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 11:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825CA27FD75;
	Fri, 26 Dec 2025 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/fwVLeT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299DD31B137
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766748712; cv=none; b=R0PW5LT5A0JVbEHRIIQxFibPm3YSD15aN4lAQ5wtmzTuw9M0qGV9un0GxaUQp7frxR6yXqG9MohcfoRHbY2e+LeSt6ahA4fOWPzJUuAeUiZIbafiqMFmwAoIPmCliuKO6wdBXor7QP6+uMdLxeRmI4J/tz1Jg0jqviTzsWuHzB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766748712; c=relaxed/simple;
	bh=pUZReCh+vIpgfrGMTYBFp5j2uqehUu1pBP7haht/rr8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jmyt66iJsLhhBNM3Qnify+IdfugK2i6Si42KpfVBht6qG3zo7w0AKVc8UHxoweKZwSsccBRUU2qPDZUL0NFHthkoknYKN3Lrpc+njXGUjvOhmF3XJLYfl4hIQWW19YX2Fg9JXxBep8tVDxtBtsij0XGX2XXdPfG/mak6n4lo2js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/fwVLeT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbc3056afso3837052f8f.2
        for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 03:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766748709; x=1767353509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuMCPB2Cfnw96ImXExWXbYx4SWWW9bt6GASD3DMHGsA=;
        b=B/fwVLeTKJeh+Pv914E1Dt6oJ1zR3khzKFFE5F5mIwOo6VFYiuOC4JtFWVF4w0YSnp
         uzYA/tOdu/zHbbf7AMku1PN1L1NLzX7AUi5ryQOpy4pG5/LEpos3qKQH/HNjLqmuG0Hf
         EF6V8bOPvMiu73dnwjvYxj/0UdfmO2jk3aoxxP0veNXmR0OBfadShfL1K7paSCNrb+BO
         SYxNi4yFI07UChrNrS1SmRPaWSh0Nvua+9Od8TkXNFf5t2WRQ4BfjRtTVo7OI7rL45qI
         /w5Vhi2kg3yRYk6R+PIXYO8Mp+wk6qN7NHx1QZz/SUJyK92POmtVocVZ7Doo0jiOKTvh
         pOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766748709; x=1767353509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KuMCPB2Cfnw96ImXExWXbYx4SWWW9bt6GASD3DMHGsA=;
        b=Oc5qcpgEh3fYOFyJusIxoGPJYc9jXT3TZJfctf2Ew6PRivbJuigO7fLd5K55rOOBu/
         IbcveLtOu8vP2pdZslKYjIj9RuA4Tx1MCYAO2oBs2EgO5I+0HFQTzFmv2UfpgBMp4Ln/
         6fJeM4IQOF+8gY15gciVxzmi+Y00vlADsOKesUSq91oKacv8Iwbd5xZDCT+8lBH7eKEp
         NI4urBqPCvCGJZ1bJOnDMixBqobwtIOb1nvqo0cSqvfGpO/3mcMlceQ0SbUnCP+2HzsE
         cQI4+PSrkcWwWX/EzG0AjbFdVqhZj8gU8N52mpyAgsz15yT9MYjvYsXSpOkWlAS1PnTL
         ZLwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpAqoshhoknUDOu6GvDvbK9Hl5s7mkNPGuDcfeyZL3b4bQENdIkKL0hOCTsf5mnl70ne2H8/ZAZQIXtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSqyBmTuscFS7hbFavhUeazOP8yRt2KVgSohm5Dz4mX5kHLE2l
	b/WLQBeRKr1qUvXMTa5DY1scVGdA1i+d7gn80hMhAlCMRCdopAF/Cn5zMtvmGuzq
X-Gm-Gg: AY/fxX7IR2STiTiT1tA+Jz4BNEhKchOxDXXUccBmZ5PtPP4Go82cvXXl5i6sMgrcPAf
	Ny9KPH+FmmAhP6wCCp3UtDivwNEHnhmk6FilZSP7QAIFUuDClkcDGIV1RaDrylP7nrbBJr173xo
	0tzgC633xC+yrHMdXYvvetfI+PaoJPUfiK4UtLRbQSE/ihU2KU0J3DFqospCaGjDD9lXzMTKKEY
	UJxn4dVlLlWpTEj4RNUUMQMAox3vCjOU41gkZ8dE0AZkMYL3UUGuBC1U6N4L1kYKgjvOz9Mx+Pj
	zMCbzSskJEDhDW2hM8SatU/oc+bt1a2Vlzs6YorJBIiaIH9mcv/N3GftQjOudXFiIkJhL6/IWtv
	eBl+t1Dhykh5yXUCzAPoqpWIWin1oUDFzPF0aKGzU/W8yqbUCZmXdsm1Ft6samliimPVZGPp9Y1
	+wBCf4TKKBlb74wZ8=
X-Google-Smtp-Source: AGHT+IHgXf/up4jkfIeElgBTb357EsgC5MRWNtr9/aPdG43pJwbtZ7QqWeH/nFQ6nQwGUv1j8qob1Q==
X-Received: by 2002:a05:6000:2c02:b0:42b:3246:1681 with SMTP id ffacd0b85a97d-4324e4c97d7mr27121460f8f.18.1766748709464;
        Fri, 26 Dec 2025 03:31:49 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm44182107f8f.8.2025.12.26.03.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 03:31:48 -0800 (PST)
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
Subject: [PATCH v2 1/3] media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
Date: Fri, 26 Dec 2025 11:31:38 +0000
Message-Id: <20251226113140.573759-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251226113140.573759-1-christianshewitt@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
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
2.34.1


