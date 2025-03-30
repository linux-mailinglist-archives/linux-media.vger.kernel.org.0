Return-Path: <linux-media+bounces-29002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D825BA75C77
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A84101886011
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503FE1E5200;
	Sun, 30 Mar 2025 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQLV5eiP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032501E3DCF;
	Sun, 30 Mar 2025 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368893; cv=none; b=VmpPfQ0kYnUv+XNqLY+MgHWhiicw+ImBssS2B/gM40yaHaUD74M+ljIxc+VhcEDAimcjfiCw9pPQYrci8ZRbXZGaEQLqMxXLTMEiuKTg/oa+xnU6ZqJcWG94wds9AM2FGH7GbuKO+i8eawFNXkyZ5zpgrWDUv3U7Np9c83aFLDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368893; c=relaxed/simple;
	bh=pUB80jcdw+SEt5UJdAEGsRQbvnGhM71RY61ujzFAxt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVerFk7+mkC2oB7Pemep1DrrY9Z9mpOu1S+ym8ZH6bgchDBPi2uhYty9lc3CB3YX/qtRir+7t8k0H0IZDvLbSxcX7LCJJQtfSA8XcvsMu5eFkeb38r8JISxvnoaJHA062ijVouGu8+TSgbSc/R6iZL1z6iK7si5ByykN8B+8BQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQLV5eiP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43948021a45so38627525e9.1;
        Sun, 30 Mar 2025 14:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368890; x=1743973690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dLdv4ZldCWKu7a6syiIE6FXAFQiZOOGUWYnODshxvg=;
        b=eQLV5eiPL4Ig67At4dNaoTLLfHIgJc+qujUczOUtHUrAilgDvOsc19ZA5zw5rjTeAS
         +5tCwe+rDOQw1c0h0mpMm2vFuR4RtULmB37dF7Lq5MhIpB77khIlHHLM2r9k5a8VyJVv
         iRKK3HpPPusgPA80maUedLPT3yWibQ2YFt2QXX8PzOJ2vhkYQAzZqid9iZHA4VjNSevH
         my6th7jKbNuvT2k9/AbgwfAXDY4JcxIBUXogSnBmpRRusHnLJlAjwVSR7+IybXj40wk0
         22Oe9y5RCfeU7Vp0GrMBDIgElEfl8fhGDZhh+aelOlnZRDRj+NIzhOwYur+NNkpeUNTh
         bgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368890; x=1743973690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dLdv4ZldCWKu7a6syiIE6FXAFQiZOOGUWYnODshxvg=;
        b=MsbbkZm0/CP3DOpUwWFFrntU0ncK8qJ4llfQbt/jMc0beYmvrFsD8Af2yoRr6MwRhH
         rIu+IUMf4/7v5X5qcSN0XG0Vkn7GyJ1+1u+FNgC5v0qTyDh/ZO077kzTmiO8dZBxAXt9
         u1Fy+CUAt0euT0yYv93ePEn1hxQSl4zZFzP17YVsPE5aTZYjJJ/3rIuKuKV9/fP4OgBE
         +k1QMw+hcCmrzmQrOiY6Ab2XEX5syTsG5yh3ylxkbUwxTc7CBOirirxt/snsFvVb1eWN
         BEjAnbr4bidzYIj7DZIE1hSFMrmiMq+TKvdd54r99vUP4+kx6WV+zWwQATlyLUL3Azsr
         StBw==
X-Forwarded-Encrypted: i=1; AJvYcCVjJSSyyfBrsbjFOltASzZO09xRMxaSzX8l1J8emlXlUioQ7IOnNWTAG73otKh2UsNOyyAzcAeTr8AKTQOtMwe+g+c=@vger.kernel.org, AJvYcCVuYYnsSzg5jMUYz12bGRtR3ipmGMdP5ZH6T2SxIiU5AZHqPUyfkNdEeUF+s+f5QmnqdBgI2jtECrAfEdAo@vger.kernel.org, AJvYcCWuoXFbvMIElhDFJKRP3+HBe1jtxng7vvJ4kdodWFYbvRIJG26rIzj2HkwOh3/3nONNHaBfMtkFlP8=@vger.kernel.org, AJvYcCXH53MVPncHIWJFWvqSAt2/xjeOmP6ifN8/dtytISXFcW1PIJ5TjS2aY0eZo67jZ7IQTIeWrZCXoR1a308=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXxpiZ0c7/5L7wtc7nyPFJ2nCWlR+P0B8UwSlMSmOb9Usocu4I
	YJyQUsjSScSCTfRua3Xf34T6150u+JFkyNQDJdh2Xp4r9Ir8s86m
X-Gm-Gg: ASbGnct5BR/uR4/771Seag2981Y3bwy6LaFr7VUwmJHh3QfrNCBKCtQqSqEgoTykvzE
	bHl/Wwbw85QX+I0ThGDrv9Mmm7nnQBAgKBjFJvKOpPni0Lsy71FmyDafPUloa65xSD1z8hIJIfl
	giGdiU/XPctw9o9cw/oY879zrPGCy4C4gxYIi2EQp8G9cbt8vvqW6o5Q+pXV+nFSSejoG5j0hu7
	GoA5S/eSMR1wdDQMlE6scxtxdz7akJ06HJeHc8VS5k29CwrHdl1MkpMj+BFVKCZjpqHLFNxwK5r
	xRpvD0oidqAQbGpLyK1cLr6Buz/1aZ45ShT7FaGiF/rlSbRZdHZUbmzc0x1IhtA+SjQ5/A==
X-Google-Smtp-Source: AGHT+IFAPFwaUcZMgmo+j4Ii43YGNOsRxtJkgn4pcZP0N3XOIaRU8lEcRfQCd0g8rcOSNCN05e/YLQ==
X-Received: by 2002:a05:600c:5489:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-43dbc419540mr59851395e9.31.1743368889889;
        Sun, 30 Mar 2025 14:08:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:09 -0700 (PDT)
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
Subject: [PATCH 08/17] drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
Date: Sun, 30 Mar 2025 22:07:04 +0100
Message-ID: <20250330210717.46080-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index fa7a1ae22aa3..c6f60b7f203b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -585,6 +585,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 148500)
 		return MODE_CLOCK_HIGH;
 
+	if (mode->clock < 5803)
+		return MODE_CLOCK_LOW;
+
 	return MODE_OK;
 }
 
-- 
2.49.0


