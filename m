Return-Path: <linux-media+bounces-29003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC6CA75C7C
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1AEC188B02C
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFB31E573F;
	Sun, 30 Mar 2025 21:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOf1X/ur"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753821E47CC;
	Sun, 30 Mar 2025 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368895; cv=none; b=cfqqwakXu4wV1JPpp8QQfX164LNlCxerXC1fte8q9StPw5F0S6/DHVEMqeJngJ7A/qknQJwr6DOsjlQCbnhaOCgqRcilNZn8db2FibnhayucwxUzCFUwpkeTsemfm3CXTewzAlnmgFcPYQl35FeW6RvGgiXTdoSOiUa+UQ9+gHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368895; c=relaxed/simple;
	bh=YKgC+zpcSZVti9qYdSidphksILumJm0KABmDUV6Mvrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfT6aBop8Fc99BzLthEjbnqyXTAj99A/EEFt09rKziT1+XRyJV65oxnzCg8MglLXxCdtdTRxQMs7cI8VsoDhS9UOArk2kc3vhuk0MxPPXieDA5ESt7cfur4HhS9eQ3h73rBWr63dCAuPtDGUNujUgCtNcg/Ffdw7ZTDG/UoFgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOf1X/ur; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso24306805e9.0;
        Sun, 30 Mar 2025 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368892; x=1743973692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNJLghqN1mIY8gBZTth5tmRykFOjM9B4vy7KpwCmFEw=;
        b=VOf1X/urW0xCy6NQcyvoGMyWpibXEadZeBstxbj0Dql6pW6VbKQ6yi32mp6ZWS8tvg
         No7FyQh47z5W8SjK47tCzmbjXWwWIbCzQvTJpP+05Vg5VKWafc0PHxT6R3+Z6qqHU1k0
         2pY/RFQEVyCsisGCvzarC0i9NmH84N/GmtqpWm5YophuOGN81d6ESPf+3iTIPg5ey/wS
         Buad14GOPUXY9oJPseJw+JpUtyrF9qNKjs3FpJOLnqNy8kCrLU6yHUjYQ4ylKua8zMRr
         6KR2VsL2kNuVH8pnnaHCtvJ/higNovsIo3pe+UbQqjERozVtSWOqxFYQTy7bRfQKjTAV
         IxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368892; x=1743973692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNJLghqN1mIY8gBZTth5tmRykFOjM9B4vy7KpwCmFEw=;
        b=BK0snACDQf3szKNd/7p/yQcgL18vubZERqHT2fVx8V8XOG5B8/u3A7qmaKAPnuS0s2
         UO+Z+IN+td7+8AoseYKGkj401VDFJjWFR1Y7MRu8H7xKUqFkKxRHWhf8a5JIMolTcczS
         nRBHHxZ5C3hq51eXhW8pkdmBk9eGG7IvbCVCgQ9/TVUPrz+jzspYV7vZhNx+OIJKyFaL
         tTr1DJ50pGCCwa/EIiS2L3GAH1ujyw+kJ8McMuH+mBy/T8zDhIF3vpAoVPtgASEfJ+kI
         lbuJPc2xDFtwE9+ZUrXey8W3bkNEO7SPaNgJ1yH9Ci9Jt/HHNZLpUxVCVBAC1WPZkGYY
         4CWg==
X-Forwarded-Encrypted: i=1; AJvYcCWBgYG63u2xQZ7/IJuQxW51vjJRpC02PZKfYcF0LRG/PjuHqLQ0YQKwOr9CHckA8GhnD4z6xk+zbN79dQbA@vger.kernel.org, AJvYcCWEhFivPpMmpp7oaXNVDFocWDh39Q+0D1qNWLJ2iu9zm/z6NSIxuOLFyWUVFhcaH74yayxk9+PoCAd6hao=@vger.kernel.org, AJvYcCWs02DVR8v6CtQbnm+MorJS+37yN/V72a1b3YaVBcQLBi+t66uCSNvrOOPIudsUeS/vwaAA2kVkyJw=@vger.kernel.org, AJvYcCXMfBjrsi2stmxmxiRfjY3iyhMXu5nZAsWvvCQWI182/RyAbaS9f+C82m5uvaWquWO9QnE3uQLurqhaUl2BoDmZU74=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGH/jUChOJvUXMIPccuyfeGIatn4zGrreaLSparVIeCRVmWXQZ
	rxMlvnBYPX36AMeU2U8LzdYv02FGJN3wx1A+DgYh4B6jSPYNufR0
X-Gm-Gg: ASbGnctEo4sZ05/AhgaTBhH9yM9Oakpn+4K5DDZF8fXxKZxrElYi4e4q9De7gGx74QZ
	JVmmAAUsLAPihVM4fDzigCTvbMdN1ICeYwtk3SYyWZvc18BzJ2XHsn988sk9uh84vBkXEtDOAwl
	5tiKAmVh6pLK8RWMoM+rqDB6diHPqJVWWBAivDywXaRSewAkJXHx2FSy/kT7NX5hO0ge3Zx7WGM
	/MyEsGeq7QmkCpz5vaYDac2CpYk6lCeUOnOjx1+FEbW9SLsB5agKnJuyB18CQ8Z4a3OVuBE9jCo
	9x2vcg2+BvlxUfVVOHCuXBeHxZ6l4QSEqhpAkCfNVm9ChpiNeUs9l9szPrs0uO/uLKVc0g==
X-Google-Smtp-Source: AGHT+IHRCWNdlr1N97JeMQhY/V9AuUUxbx6AHheyyzxTEXHJff9QfGN9BuyicTXtDKQfE+20Uuxn3w==
X-Received: by 2002:a05:600c:6053:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43d9105bb78mr89122125e9.7.1743368891719;
        Sun, 30 Mar 2025 14:08:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:10 -0700 (PDT)
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
Subject: [PATCH 09/17] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
Date: Sun, 30 Mar 2025 22:07:05 +0100
Message-ID: <20250330210717.46080-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the high-speed clock frequency (HSFREQ) calculation by removing
the redundant multiplication and division by 8. The updated equation:

    hsfreq = (mode->clock * bpp) / (dsi->lanes);

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index c6f60b7f203b..746f82442c01 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 *       hsclk: DSI HS Byte clock frequency (Hz)
 	 *       lanes: number of data lanes
 	 *
-	 * hsclk(bit) = hsclk(byte) * 8
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
+	hsfreq = (mode->clock * bpp) / dsi->lanes;
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0)
-- 
2.49.0


