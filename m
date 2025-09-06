Return-Path: <linux-media+bounces-41889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3058AB46F66
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9C833A8851
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6872F7475;
	Sat,  6 Sep 2025 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0oqzpNs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030352F4A10;
	Sat,  6 Sep 2025 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166850; cv=none; b=tXe1WUqSLdnges8qUTyh0LO7ZCjdykS74OtxRRC/sS6fwVnlwXO/1wA44M1uZw67gp9uZeIVDEaO4uxnmo7hXOeoFmm6qtyTajJNNsa9mZUCPV4GuOPsLdIfxN7+1njQBkl+EimWsFoSVorHKXGQRjTx5E5KeMO6jbl0PGH+uII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166850; c=relaxed/simple;
	bh=cxJDHY7ksKyotUEe1ULZ+faokKja/+0d3tNVVflADFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIGs+HnT7wLvKRkJPshotqJ4SyfDBjf/gHof8+zR7cQjxRwkJDMC+FrZ7SKHTEmrYpUhPugmgvg0aiyGGBHOav05lwRn4kiw91e1woOguQ1gIPzodySVBv37cXUKGSKR5GG4B4Si51AB+yie++LoaoMr2RPuT2yvLFkZLiRhIAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0oqzpNs; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f76277413so3648612e87.3;
        Sat, 06 Sep 2025 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166847; x=1757771647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i6OcQVl223L1rRsm8JFsKq6/v1CeE5Ws5ZJzPzHaTg=;
        b=j0oqzpNskkEizM6JjfjJuuzAL0AtKTBPomUupF7SUUhzUgBwsB4NxlyjMsiBquH0/g
         3xo713XO4dIQBiScP4+olYo3F3qkYmPPk6AV8Dvvva1oHDJzIVDi+z+ZqKls/8Q8FIg3
         2YL3OWdgL6j6a0Aq/osdI+mGqtK31RqVqPvTO0iuKgbiaQ4+C3PI+yHu+TDH+EeypOa/
         lYjxlvIAqclidDZYE+30KEsK4kCLNdmboh3Dlv1XSb452WhU9OvA1CIZ30ZZBjsTdNK8
         YdPpPIOMLEjiT6dpF6Knf86G9pRB8BLrsDQnEdU3g/4e118HShLlBn0lHhVD12VwCFyS
         RAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166847; x=1757771647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i6OcQVl223L1rRsm8JFsKq6/v1CeE5Ws5ZJzPzHaTg=;
        b=LWCv3aD9JsiTfY3d2SWyIgci699CN6RnmPUyvDL7bMbke1WYhq43JalAesLCd/khkk
         l/NVUnnFb7lEUVxOMNXnSpkg2gx+cBVzlqI3BRuNCiTqZ5xmdPhaPKrpdvsa0k5YRYn3
         917TRptIoNqLgoO969SOigz8aFZ7rxeMjRlEtF3Gg8ci/5xwmfBo428HmzxVGAJjpYyz
         UjDFQ05SWhtNXpNqeuH7zwRvTHSU1gVj6rcDg16Y5uwWct0hS+j2Ce43vTjFgqTgZRAE
         Vi0IowFpenHnLJYdND1xGC+BXV/IJ8wNhWyGrVw3p1yd7R8e+DCGpm0rDn4TpRLnrbS3
         cOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYqMoocjyth42BU8pMKjSYSalh6SVMsJhZgBVh9FW7nLyvdKYZMeiKO2cS6WQ1oc7zQEdkU/8Qk25w@vger.kernel.org, AJvYcCV+PTzbC+6d5Zp3Vs4kJz+SWfMNJqkDagBLXcn3QqT5ObfgA14OmCQLaH2knbCxIyHOiwElLJHPv4UjBss=@vger.kernel.org, AJvYcCWY1dISzmN8QZQUB5oQIPy1QquqQj+7x+/cIS1UrinpVL9hw8BwykHaXid1fdnJWNa49zlg1W3kRwO9@vger.kernel.org, AJvYcCWcI4ubRMldbUUfxESb1LlhbRnyoH8z80KjfTK3uf87y7s0j4zTxXoJgxG6XOku9Cd8yqW3dDxq2kz357Ch@vger.kernel.org, AJvYcCWs9bTjJ4P/qKAAwI/u8QjmtGJ5NTbN6EIP5dIGoncyZIN7icJsQV3DucB7vZ8ZBrRI9ZeJS/4ArFzIaEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYjFpA7Hq8fgGHEM9v79mGBpVtknSNZ7YYAPebLBjP7Hk48+dY
	MRFMnGRS5rhYDkn++OsPoQAGdH0BCyfBVVvmrdrCg+1WWvD6+JAKEkxZ
X-Gm-Gg: ASbGncvXWLe4yrrDUSrFwtH7vbYbS7k9cjpekgMuWyR6TuX76hx9JBjXt+4TqEXDCTF
	fQOfudOBlONmgIhRQIkIgcevFMAcJ30qayDAeZJEJTHg4jy62WK6oW56vOdUlCMmf0J1ZgYtQ5h
	sDeNUg0V5RzL4knKcpvI8E1+n3Yo4eycLXhYok0lfMv9B2dc7DvC/kY8S1SDi7ixgsCFFrgE07O
	ODV/9XyEMT46MrFiRV65s9oSmbSKzlfvARce7eDoVrVL135Z70AMYQgmxKu7ihrWnF0sFWoT5cg
	XQym53X/gDx7QnbVrIFkb50JoTdcDabwdFuDiaaYCc+jsx7osOCBmuLmK4Pf4e6/V0JYgDF6ZsQ
	3w2BFZTxaliURYA==
X-Google-Smtp-Source: AGHT+IHOTXlLeFAX4PeEb0CFRrWklYJRkXCSL3HIOnLPeENoT5B3vXrzBWCpqmbQzCgd2aQkyH/8qw==
X-Received: by 2002:a05:6512:1188:b0:55f:572e:2417 with SMTP id 2adb3069b0e04-56263007fd8mr640516e87.56.1757166846889;
        Sat, 06 Sep 2025 06:54:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:06 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 03/23] clk: tegra30: add CSI pad clock gates
Date: Sat,  6 Sep 2025 16:53:24 +0300
Message-ID: <20250906135345.241229-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra30 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively. Add plld2 spinlock, like one plld
has to be used for clock gate registration.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ca738bc64615..61fe527ee6c1 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -154,6 +154,7 @@ static unsigned long input_freq;
 
 static DEFINE_SPINLOCK(cml_lock);
 static DEFINE_SPINLOCK(pll_d_lock);
+static DEFINE_SPINLOCK(pll_d2_lock);
 
 #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
@@ -859,7 +860,7 @@ static void __init tegra30_pll_init(void)
 
 	/* PLLD2 */
 	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc_base, 0,
-			    &pll_d2_params, NULL);
+			    &pll_d2_params, &pll_d2_lock);
 	clks[TEGRA30_CLK_PLL_D2] = clk;
 
 	/* PLLD2_OUT0 */
@@ -1008,6 +1009,16 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA30_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA30_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA30_CLK_CSUS,
-- 
2.48.1


