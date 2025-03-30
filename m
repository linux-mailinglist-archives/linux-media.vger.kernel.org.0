Return-Path: <linux-media+bounces-29008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35168A75C95
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC3C7188ACC4
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC491DF270;
	Sun, 30 Mar 2025 21:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv/buWtc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B391E98E0;
	Sun, 30 Mar 2025 21:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368904; cv=none; b=CYkm5MlRodQAFNnVaAuJ+po0OeiEElpqSF1A560DBcZ4/NZ7B0q+ian/Y70oOc6ZcavM2TTqyJQtiwK+VcApMrA2UtL6xJQev/8x68rCFPnySQA7cCq+LgobdBA2UHsU6fJWaUxcvmRcmjocc4yRvJfuBbtlBHwYHVbhotAzWyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368904; c=relaxed/simple;
	bh=oA29O4BuT4qmU4suGtxMk9Lj6+9M8aYIsfR/i+CfkLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOlPVVT8qXxDrycrcZvaSXLoJTZWMnQ90pXQmpWS94vConzUa7oY70Sv2AEK3ZUhCo3YErRKzRPnFnJgz6SkXoYdeoCbNqOSAr1RDB+t13I24CerWJL4Hb2uZG3Mnxru/VGUBPt8jyMHaiPryTqIVEEAYKGRdlbgSqdzkGwpw9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zv/buWtc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe574976so26058135e9.1;
        Sun, 30 Mar 2025 14:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368900; x=1743973700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UluuZxUFbm5njLPBjb6IhbQdxhQua14hLJGR9/ZdZ2U=;
        b=Zv/buWtcphsm4/3JhEO6jS7KmFctm8N/ettaa7ucnLfPpVshshF0VqvJhuOlhLI3va
         h/X2nXkkd5m0kCLcIL69WztAZt35bZx3ZAAGPzJM3NbI7XRFtgS8GpdrB5NJVpmLLQQo
         04guxyyAyZkOAiQ4WqZdB7BtXmNceLeEZS6hTKa01tgtw2H/OKpELMBgEjbmO+FrnFA4
         SgtPKRB8TUeX2tD4UStcEcnYvcOeDIJN45fKuIsJrDarKvTEFiiEn30NzRgjSdinDdFS
         djn7RCvt9LHkKyZxc+Ez242U0w7MObvEoW856Ypne2dEhLONgerLUo/FRN4ff+UgVy+w
         O5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368900; x=1743973700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UluuZxUFbm5njLPBjb6IhbQdxhQua14hLJGR9/ZdZ2U=;
        b=quUmvzA0w3OSXazyFf1ePJGi+JJL8ST7vPUgY5SAdp9MiOUTk5Q5NvJZ4ToDgWRAld
         t0MvUXzpGqgD/qYLmiI+livUwsMhT2wi56Qt0VENRu8V/+ZcrkeYxvZfnzo7pojUslI4
         jEsH1ybaINKIR8befQHtic5An1cCCipbEyKCb5oNGQ4STMmUpG7SF0rqHZ31OjeDwNU7
         3fUgnPJpvfKJEczM2Ae5+3hLO9jtnogIx+rP/nPkb4UAWLiRd5h7OkdomYDVJ4wmnh0Y
         ASrwCaMrMPi+RdDdz3NUGBX7PSWknQkYFPqIIAEOpa/2TxGIOhUu1oda0RIsQSZAIUkQ
         X9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVfbEaf/j7Xwgki7tPpGQcErxKIqDMivRbeLdovn21elnEaYdwWtODKpEKekmcix9qogZCHEQnugcNynnQ=@vger.kernel.org, AJvYcCVkJOEi2bfa02oQsWGJx0NneWFeLIjdezOefHdW/y/89xzAljZcKTBbyY/byh9NT/0vriCbjoijdafxp+wTPS9XnZA=@vger.kernel.org, AJvYcCVz7/ORcSk4wLCukMa1B9v2j0o+Vdn3owA86e1IxnmU2Sj586vYJ8zx0HVQCrytDrxnOTIeA+/3CaM=@vger.kernel.org, AJvYcCXimy/OWhLC7j5ugHv+UBsWf3iA/5J6ekUtJkN38rKy30IANAFtBfOBS2AFz3F4hnz1uGeo79XyoLVFhE/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzolU7/3ig0APZvwnGbjx9HLdOl7/KFkCpbDgJnyPqZq1LtJGtg
	ljmJChuhL4bqSakYPwU+Y2oWlHehmH7NLP/TBNKXZyyTMhlxdrEgMEP/IinW
X-Gm-Gg: ASbGncvYW3s/f0DZKr+3eHNkTzK62znZWM/BIyc8+uxXcf2i2JFSpLdxmB8vgbuX7NI
	YSs/Ld1h6TbcreO3mMaer3IPlYWHkgQ9JZdp79D/Jgy5gpOIqIzgu4SDxzMBVdCrzr1Z+IAejFj
	oHDU7x/5dJghEALrltQPcwkigRDY928FXtaZwFqzVeoXI2t3fsHxg3NjyW3f7/SaiW1znriWDRO
	vZZC0TegXSDyKqanbVy9WsQM84SkWyTiTu194xHlVoiS8EmY+4A+YnJNjZzIlWONiUO6ne3q8nA
	mCG+vvmZIkbWGUnTj7NWqSeVObWLGjJocQAYscOoxDP2KArxIlyXXzl85n+fY0x3BR/kFA==
X-Google-Smtp-Source: AGHT+IGWSaixFwgM6lCiT9uhTH+eCMBpKmjujn+c51dMR09paDiw0I6E/1w2TqqN84Dp/PsM7X066w==
X-Received: by 2002:a05:600c:470f:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-43db6289ce1mr59684945e9.24.1743368900500;
        Sun, 30 Mar 2025 14:08:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:19 -0700 (PDT)
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
Subject: [PATCH 14/17] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for RZ/V2H(P)
Date: Sun, 30 Mar 2025 22:07:10 +0100
Message-ID: <20250330210717.46080-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to
allow additional D-PHY register configurations after enabling data and
clock lanes. This is required for the RZ/V2H(P) SoC but not for the
RZ/G2L SoC.

Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined,
ensuring SoC-specific initialization is performed only when necessary.

This change prepares for RZ/V2H(P) SoC support while maintaining
compatibility with existing platforms.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 0ffef641e2bc..143bb01e6f50 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -34,6 +34,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);
+	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -318,6 +319,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	if (dsi->info->dphy_late_init)
+		dsi->info->dphy_late_init(dsi);
+
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0


