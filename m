Return-Path: <linux-media+bounces-29001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D08DA75C74
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF5BA1886209
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D241E47AD;
	Sun, 30 Mar 2025 21:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdNWydus"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7641E261F;
	Sun, 30 Mar 2025 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368892; cv=none; b=s0ZftbA8ZvvP/oy32DyXw+9zYt9Hrr9uRbqCOwRMr6YXSuyAuhi2yczC9KrzODsoVv2Uq2EH5dqdhuW5izBDd83FsgpqidRwU+jf0yb6ZNISxNXKCBZHrzSLUUapKiZdpQj4IzTb1hg7Iy+dwmHX8+p/r0rIgZdGQdGfLTyvqAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368892; c=relaxed/simple;
	bh=RULVOVjR7RbbdsyLcOIkpSNvyaI8NAYtawM8UYjTFuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNxrpOsTomkmItsz05iGulhPI4kS/90LmqHN1e46rGxF8Fg/obDY5o9yOLxFTbNDWW4FgDdXLuj7GVgpLM2N4ktmkMbPabxp6CtGwspqiv6tYslo8bzAhz9n7bHqUDSZO28tgkaUlMiTJf1L/ZnH50qY1EBlV129LIeuMujAsCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdNWydus; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948021a45so38627415e9.1;
        Sun, 30 Mar 2025 14:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368889; x=1743973689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWGwt05eoKsBOuAIkdn87vjxTMsvoFkURE5F8gc9+EE=;
        b=SdNWydusgHwbRKQzZSlAd05rDDij/d7SmFha+5l2oM9QbZNObUogdW4vGHNB7pHtPw
         Y8zcSV/k2VB/ZUeDay/ctAcc38w0LV3QnSY0ya9BQfquyD0wD0Dpf6CYWMsPt/oflJ8l
         dJ6E61tUlTGoO5ITUmO36C02qF1cxi2cJDk6yzUdHnVFhxDLfBuUAzRVaSbQmHdJpKWA
         EnoQjZPtSGcwYNGEx+u6Du4MzJJm/FNtCvgUj0sYiZAL82g5GE36/IGmY9WUjAwBLy48
         zlkznlcA9HpDiSuC5h5/0/OaQ6UEJdZBvjQyiOMJu7XWoNgh4deh+6O7r+kDYNcXnoVF
         Vp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368889; x=1743973689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWGwt05eoKsBOuAIkdn87vjxTMsvoFkURE5F8gc9+EE=;
        b=mrPERLdAVufh/dPYxSmXuekA+AF5KI4O4QtRV+yhQYnBptm52vLOoVYRJtE6ytG+K0
         /VEEcpktLszm+h1t6CNlI5nRE6AZ3Lyk40cpdYK/i7X2tD2eSK5it1yanqI2hmP+Tqw+
         1IKnWYMroZvIyGW1mmbNx7SYYnr6+M5HGmuTqX83RFaTZbUGOPBo8PrjR4xDGvSFqID4
         9WJC5T6FtVgOPUp5QwgjbcwAmgzx28+R0AGid2ezYlmgp2Q2opFuq45DInFpY1kzzmT/
         kxWPq9SvEnqcDhILXn1YWemYmr/svT+cF7buKlwZwTcHsv6WE8iAsXlRVxLXmITfSRdH
         ypPg==
X-Forwarded-Encrypted: i=1; AJvYcCU7lIRhnFqqM4N11DY8HrVPyf812C+acJLCEBOJKSsDKb3n+dcYITRCcDUZlLawzfmOuLqZJrOt8b9M38fl@vger.kernel.org, AJvYcCV1DSlLs4yZ8O+t8i3d6YKbSgqWR3RbvJCuF6SyZCU/K21RGew+6pKdn7g/fcC4ZZSfTIjPeHa5VLbdnYd4k+sjRcY=@vger.kernel.org, AJvYcCXM77Qju+kZXD6QIiC/YkpjPEyo0Lk+NwHOcrJqpbqmmkRhQJnO54UPJixlIIEsubPvQbjDiJ2qFbTy/uc=@vger.kernel.org, AJvYcCXTzbirBEqzjcbC4zZQutVSEwc/fVncjA5mO6Ketr56ho85Ultf/MULdDkxCuzR5+ZkxXNLbTO5POE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4kYaplnCr69+4lkU3ENcyg9Dkp118i/2X6oYMjA2aEsoiWTS1
	AS1e4ZA9OMXQTxVK/IoEj+67UooMJos16x3yJVun3ffVY+M1AcLm
X-Gm-Gg: ASbGnctAz7PJMdfg5Fpies5HyL0oA0qUJC8L16q0liSsRdA5PrNcILrwxaAFsCc7AEX
	whqvq5ZhsyxwjAZkrpMIqozYigijfKMeyHgO1eH5JD3sPXUh4SU/l3wh3sMm2SUGw3Q0Xv8GAWS
	H4nCaNIj+0Dm9fzJf5YL8gIEifOGjZVGPDp9z0OBGtKJ+F5KWosFHRId8SiiOiLEFuMjGuoKrDQ
	5qJycvbEEnvUy8DAb/7bM6S6e/G1Bo5rgohIVs+6DQz58FjrA4QfvrawzjeEkpi4K7qL8v33zhq
	O0R4+OZRSrrHJWaBQNjbFEOyrjbAC9is7AZppXBKMiMp4fdHenhzk7RxHjMwYYEwW6CcAw==
X-Google-Smtp-Source: AGHT+IEtGYaKa03nkcnkCso7yQ9l2iGopbNXYO0E/o7N8DtFwH+edLdC+6NX2B3qDLnOS/6zKUWNJA==
X-Received: by 2002:a05:600c:a08b:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-43db62bf93bmr61843325e9.29.1743368888691;
        Sun, 30 Mar 2025 14:08:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:08 -0700 (PDT)
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
Subject: [PATCH 07/17] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
Date: Sun, 30 Mar 2025 22:07:03 +0100
Message-ID: <20250330210717.46080-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
Compression Processor (FCPVD), Video Signal Processor (VSPD), and
Display Unit (DU).

There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
to the DSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 5e40f0c1e7b0..e1aa6a719529 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -50,9 +50,20 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
 
-- 
2.49.0


