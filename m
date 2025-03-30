Return-Path: <linux-media+bounces-28994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6026AA75C4F
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77E9E18852DF
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9961DE89C;
	Sun, 30 Mar 2025 21:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eisu89pk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8B01DA21;
	Sun, 30 Mar 2025 21:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368882; cv=none; b=iIDWFTQcER8atSQdNJ2OEYvIUgqZNmunFV6wLwo9NvWw6hwFv16YlvYFzLRWnY03Mv0KhD8TIc5pSZzjDUSLBHOrdMnGWhvzoRj+QCjiwDNbw3H82MtzGVy/Bx9a9XUC7m9K6F5h4p3Ai3OhXWO69sTQpzWa611yZDOXcVSrQz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368882; c=relaxed/simple;
	bh=BZpOrmXP8ROf5fnXLNhJvYNK4w9KkeVjITiKpK3Egbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QaflNQPCXZlucW/LQlliBH7nXluYLQoP1Mhq424/0JpgtumlqF6Y8d3F7mr72ETTp9enwP9rUWQwTchgW2UJ39poIVSV+knL4Mokzo/GYXPsV/rfXH1qMgWqMeojKcsG/3wn+ZPxGbS7dmzaVyg5Ry0gOQPbU2uCRZhSNIBzs2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eisu89pk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso26003545e9.0;
        Sun, 30 Mar 2025 14:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368879; x=1743973679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMcYDVzm/4n6/8MfrrCdfu9WYkB5GcIV7goVTlhWzQs=;
        b=eisu89pkGqo4lDcOj5hwB+P7q5cgnRVCEaSEz4yQUm/Q03CFjf0pPWvlIeaTgYo/b7
         mCSJmOjBq32kysuaJ7YAmhv+QhmX8QW9ae6v4m7A8377jwCtyw6BUkZtDu00742RZuEc
         LRn6Y/GVhHjyg6TRvglRdJ3YrrqE9eWHvtxIqbRi8lXZXbqcz+6pFxoQsF65mb0QPrTG
         bPUx76Gqa6qknkSSslAsvGLYrqMF35OQkX8no00kTPirtKxydTwqRWWmmXEzudVGG3cO
         86xq64msfeFMXpaecphf/DP0yMu1luo0xPNx4eOcQO2SsEh+sOvodnJlx2Iu/vUxttWS
         LUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368879; x=1743973679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMcYDVzm/4n6/8MfrrCdfu9WYkB5GcIV7goVTlhWzQs=;
        b=LDcSnlGbg6f0d20nMpVbuTqbOmJSHtw/Usy2I5jhqzis2/gEUkb9sG7eVkC2B7w+eE
         RgV+gezMCaQ8bZOW0jPGcJq9RouKyWQ1FGjTRIX2nBsKO3hR5+L/8Bl4ZGh+lZYiwarX
         eA/Dpzs25F/OtwE+KxrBJs4vjf/LxCHxa5d1SgST72rDhFdwODxCU+OCazQvo2DVPbLK
         4B3SneOS7Ww5yezYToV7j99Sla2F0EeccB3NjJiQWe/ZpexH4l+JZZutWCs3BljNpscj
         Phrc+WpnAy9ZYlFq4vdYG0wLv4+ckB549CN0ivOQMZXK4ytMwcdH+mRU8oi0U94/VkqG
         0jEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv5trMUvCKhedvPmWpYnXgghMO6WdbexsOSOfML1wpNbkWC03ui0+1Cyn2oMo2VRCv1nc55Kacu6I=@vger.kernel.org, AJvYcCVmBDwgOR2a7zXJkoyoPDBn8+bXt0NuFXk9dpB+Eg7ysQpetNTwbsl3tOv0gIX6aTbyFN9uC/9mnkq1Sy4um39xw1s=@vger.kernel.org, AJvYcCVz6xiNWb1VOp6x99lyTGAg5Gug2NKgZbg8jLsPPRdx+ny9O1SeyMY7QvqTL+rJ9NT0OKSpGI7B3mEe4cI=@vger.kernel.org, AJvYcCXwP1fB4JZB3SMcCqhcNPSribD+D2odFrhMQ6co5NleSmZSo68dwSirtpZxUM9BfZZfmftlghr1s0pD/adS@vger.kernel.org
X-Gm-Message-State: AOJu0YyTenwr4TPXl7IZ5LaU/pie5B7SmqyOUVICygIdS396YXCmVm2q
	Mr3VHcweqXo61G36YPKEaeimUBLqxIq3ksNBLu+pTcvY3KRmEQ3l
X-Gm-Gg: ASbGnctxbv5A1SRlXjW9juyHVZSrBRoCf9fZctA3UE3P7R1Qayg5CtFM9Xd0DxtcWtO
	wiL/obOWhshkV8Y9Sz8CVY/FCtje17GO4yOe/fi958I6Z1YJFF200EpMRFDTlP/6CybzR5YxOUF
	BqLCD1QjIs8sRnXOk70mLGoK9B+grxmImhYaNwdgFgpzWnJucEUKpMlkpjJHGxCg7lwmuzuHUG9
	DbCLLdAzf+sKO3zsJdXqMXKAlqO+fiLYkBxDoGgAOym3y/Hw+/PYbYcj59OTgzk5gPE9pKl3BgU
	ceexeilYlHpm95X/M59Ucb1bauxKd7sXJSd8fXdw/2dvgWw9a5lw4axF/npE2PMh7D6NAA==
X-Google-Smtp-Source: AGHT+IG8cSQoD9pfXbbc/zCPXzhG3Gu3LMCabeNYny3HnbmWt6JnKUWTKvG219e3Wk595rs/5BlePQ==
X-Received: by 2002:a05:600c:35d4:b0:43b:cf12:2ca5 with SMTP id 5b1f17b1804b1-43db6223043mr52349155e9.8.1743368878597;
        Sun, 30 Mar 2025 14:07:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:07:57 -0700 (PDT)
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
Subject: [PATCH 00/17] Add support for DU and DSI on the Renesas RZ/V2H(P) SoC
Date: Sun, 30 Mar 2025 22:06:56 +0100
Message-ID: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the Display Unit (DU) and MIPI DSI
interface on the Renesas RZ/V2H(P) SoC. The inital patches add PLLDSI
clocks and reset entries for the DSI and LCDC and the later patches add
support for the DU and DSI drivers. The DU block is similar to the
RZ/G2L SoC, but the DSI interface is slightly different. The patches
include updates to the device tree bindings, clock and reset
controllers, and the DU driver to accommodate these changes.

Note, my initail intention was to split the clock patches and the DU/DSI
driver patches into two separate series. However, I found that sending
them together will make it easier for the reviewers to understand clock
related changes.

Note, the clock patches aplly on top of the following patch series:
- https://lore.kernel.org/all/20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- https://lore.kernel.org/all/20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (17):
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  media: dt-bindings: media: renesas,vsp1: Document RZ/V2H(P)
  media: dt-bindings: media: renesas,fcp: Document RZ/V2H(P) SoC
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P)
    SoC
  drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
  drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
  drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Add OF data support
  drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency
    calculations
  drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
  drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for
    RZ/V2H(P)
  drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring
    VCLK and mode validation
  drm: renesas: rz-du: mipi_dsi: Add support for LPCLK handling
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 117 +++-
 .../bindings/display/renesas,rzg2l-du.yaml    |  28 +-
 .../bindings/media/renesas,fcp.yaml           |   2 +
 .../bindings/media/renesas,vsp1.yaml          |   1 +
 drivers/clk/renesas/r9a09g057-cpg.c           |  63 ++
 drivers/clk/renesas/rzv2h-cpg.c               | 284 ++++++++
 drivers/clk/renesas/rzv2h-cpg.h               |  17 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 607 +++++++++++++++++-
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  42 +-
 include/linux/clk/renesas-rzv2h-dsi.h         | 207 ++++++
 11 files changed, 1309 insertions(+), 70 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h

-- 
2.49.0


