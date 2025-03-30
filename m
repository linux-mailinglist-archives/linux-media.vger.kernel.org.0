Return-Path: <linux-media+bounces-28998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7440A75C63
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF5CC16423F
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C101E1A20;
	Sun, 30 Mar 2025 21:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTIRy+dQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E07D1DED56;
	Sun, 30 Mar 2025 21:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368887; cv=none; b=KzDImWob9qA8MIf4kmOKrl/e++sGaQFyo9Am600wnJpIgM6vga6Jnfl49l3DN8KTLjpB7OolyO1+F6HdMJ4DdPTuPSNZsXaXP0khJqXiXzdUNbjj4MReyo1i3OHLPc+bA2cbTfI6O6+FQcgs2ZhqK6D6Q+oIz2eEwfhxniYzQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368887; c=relaxed/simple;
	bh=ZWeCW3c0R5nYyCrr9NH3Jf5bObSBEEimmymg1Tp1Xx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtkROlNjlL6pGAr/neELgJJqDxEct2cvticpwE+ujB2KSWceFz05YYcuHY203lHSHbIZTGjgXTdCBXkhTxqs5oA/5KgppWiEc2xvSsL2kw1GpAj/X+U8VbZFEtGsKCu1PCgq5e69V8JQ4G1OZZm33vZE124uA+Ve3oTiIkUqRzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTIRy+dQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3306256f8f.2;
        Sun, 30 Mar 2025 14:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368884; x=1743973684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJGfkSX6YLjiBowXHobmTnY2qb6MyRd/XZpUO5ocTEU=;
        b=kTIRy+dQYf2cQn/aPEUymCGxzFMcev+l0+qZxRK3EGNaQ4/gHIgCufoTTNp2OtTv6C
         3PKFrKlXHyskP2C4rBo43baf4YYIxWY7EzhdcUu53FnBT5V00j1m/e0oSZ6/UaPwU/nR
         +Cbu5WfUjYpGF8Bs2bYAy1vw81D8wdNJ04QDoSP1S0/6GhDI9C3NFBbqEqWmHzgHoAp2
         YAWLixtrWSBGce/gHa6nWslyfr5Wpnka5tSZxdH6SAvkPhcQ6HiVjUB2QDh1Wt8aQM6N
         Qie18BYJrbKszqtIZKl/zM1+6grDpLnLKOLoSIhdiwkY3dHt0aVPwmFSh2qDVK/DefNO
         0cIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368884; x=1743973684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJGfkSX6YLjiBowXHobmTnY2qb6MyRd/XZpUO5ocTEU=;
        b=LbPbjxZ32CRi3W1z4mrVCiZzs8IvXty2ejDgwok586aixFqwCfksyFlwmopLK+SAXM
         I7CLy0pmZDA3M+9l1GDYaIJs0ONis8kCvAB7WA4LpR4gX2jLun5et32D/bBIA+MsAW0G
         +sCxrTGHEyShXv6vsy6r/EwbFAjU4Enq0/oYG9uBtOO/KvpdruMJif726+vdi90wV5Dd
         tHqfcBcu0QRHkULAJhFYpw/bGk+h9smchRM9xiIwAFWeBLMlfIa1ZRXC7GfTzH2Nnzs9
         Af34IlGNL0mSzifZ4unfxI2nzues+kStN3zhvoKkweNxXOAn9YDiqBndmel5eXM4fgmv
         ieIg==
X-Forwarded-Encrypted: i=1; AJvYcCUxCP/RIJlRvgIt/zq5jQ/vnrpBH1h5SvxSDk02LHy+jHSmdD6q+kbGD04OxnnPj6EtVduipc/Mma1HjhC/@vger.kernel.org, AJvYcCUxWGtCwjqfsaS/k5y4lvIkPxX0W6ql6QCkYjHVf9FeKpldibHiwy8TJC9bJqABdpRIRm0IOUmAEBY=@vger.kernel.org, AJvYcCUzbAMDzUREqABhexRrVN4OBjponASRTOoI+UVUVqtLzoulLE9oGnP5ojaEmgizR6LAl3ZJKV5/nWJa4cU=@vger.kernel.org, AJvYcCXo4yOJlLHZ/nOst0TZyfNdzTLmiQMSNN25gxgmWnso/S3E814jKvoBY+O3W8jfObkmixcRpJDli3QSPdynGsCX38k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOqzd5Y84vLGyNXYAk+nakuZl0IdKUhJVttpB/elV4YWt1NR8p
	mlRc9o86iwKfgMPBoq06ZgjgBwqQE08YrQR23HbHJCxgnF5N9n/3
X-Gm-Gg: ASbGncvA5i1l0g+51K+ZFXZ48ZxS9HmYuKnopbiSD8NFXLeydxikjT2JdDpsS1RBUJJ
	NeB5p0XFSeCktmRY/cHtGOvXZ9oPjm/5PEtXXyssijaLzUjhXUsgd10G5G1Uw9E7Lh/OvCTwPW3
	y1pm6Nkbs/S44//1rOJHdqtn8OWXSXYXR1iiAjre+NUzTebRYoTY0byOa8ZTPxNvnJNo/wG4nj3
	NSXXKqLU1xJ76AW+LqQjY9ACryK2Csm0RBkAewt2gmcSzIFAnTrJ48Aq28ibEXnKw2Hize3NWwJ
	RC+J5gT2lj1Qwb+hH3E8FdyrW1fMqSsv68MeD8/iLlyZ45OYfMq/JYPNnlgeZzUwWdTnBQpn5wP
	HL41A
X-Google-Smtp-Source: AGHT+IGpU1jaxarhQ7wRvM5FDs9koBUD9x9BN40Xq4EbGrv2oLNR6yGTBGtRq/Ag31z2lkoyiLpoDA==
X-Received: by 2002:a5d:64c5:0:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-39c1211b51cmr5252181f8f.47.1743368884422;
        Sun, 30 Mar 2025 14:08:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 04/17] media: dt-bindings: media: renesas,fcp: Document RZ/V2H(P) SoC
Date: Sun, 30 Mar 2025 22:07:00 +0100
Message-ID: <20250330210717.46080-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The FCPVD block on the RZ/V2H(P) SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,fcpv` will be used as a
fallback compatible string on the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index f94dacd96278..5ed9427fb757 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
 
   reg:
@@ -66,6 +67,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a09g057-fcpvd
     then:
       properties:
         clocks:
-- 
2.49.0


