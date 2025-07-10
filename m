Return-Path: <linux-media+bounces-37340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8696B009EC
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F25E0562512
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AB52F1997;
	Thu, 10 Jul 2025 17:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XmgCMkaL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9342F0E3C
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752168572; cv=none; b=Vw/S2RmAjYBIgRx63cTe0DWmuky5aZHTh5dibC9B6BWwFYWds55xYOFSdgo8xNHZNrQ93QU33yHWJ4K/TgIGtrbBwAuHbEHE0HVWHQ9IAIIx6QekBccxtWnDR+ZFrkM1J0WWYJ0FOw77u2FMvLoogt/1X34oeYrmIH72RRWVpG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752168572; c=relaxed/simple;
	bh=XlP4JTqNj7IvkmiHr9tqG1K/XSMbOVFkEEzDSArtTGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UYyv2vLrI09skbOOa9vnFoUL9/E57wwvx+vx5Of1frgzizqKkIZ7uDhjJ+OZx1q1Hr2QIJpuJYvgUpKYdvAV3MdH/K+ULAKUFksSmIKOtirveJgRuIBWys1dCIwudEMlL49sRCOY4YptcW4WXmaTHZH+zy/4Vc+6E1kOdaMSiGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XmgCMkaL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752168569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJ8oLNxWrU/sJ7CRad317hP+3603UtC2qk2fILpYrUQ=;
	b=XmgCMkaLOPYwMSz/itrY5jcDwRaWXVILVZz7QTcXVRhwUW78FUN7nqfMoAQzqkrb9GK/LY
	is9VoXAmLOR+YzOm7mps1NKQYSwnreOg2A07ORzSpednYziOqM0uMiAaRWvfC9F0YZR2MQ
	9JhDD/ZN/DXZUa2ZFNVNxnNa98u0I4g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-RPcFMCOdMC25i-w0eWgaQw-1; Thu, 10 Jul 2025 13:29:28 -0400
X-MC-Unique: RPcFMCOdMC25i-w0eWgaQw-1
X-Mimecast-MFC-AGG-ID: RPcFMCOdMC25i-w0eWgaQw_1752168568
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d5077ef51bso182766985a.3
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 10:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752168568; x=1752773368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJ8oLNxWrU/sJ7CRad317hP+3603UtC2qk2fILpYrUQ=;
        b=LsmCOcbIfFOdhvuFbyV+z3MsgzBc555l0F/1w3cJ89DW0vER0sL/mKTNMiftd47aMs
         LBRTgTEt6m8Xn4ALPKlwxpAPTUoJBQQJINLfnWHTNsrgIWqZLqu3FeNlIwVj8BC+xrjv
         27CDCH8i6eqjqwOf+/J8lC5I3E7OdCl0N4E/rQeVhAeAyLXXVjzzCqm0gX6eYnLtBy9F
         R9QOPA2K+N18wLwUvbTluBm7l0WReBTlRUy3d3EKuYOh2zXpYZPlCK/9KEGeKvIHPn7Q
         24N2SOddJzdqFC9E021RRPG1ka4pSw9nImTpb529awjHi8b+atUapgt22CAqz59ZhU5R
         0N+A==
X-Forwarded-Encrypted: i=1; AJvYcCW0mCmQbnb6qAMsggxtZe1/diIwVehdHHN7SlS5M2j4ZaKy0Ibb39CH7YsnGCEgbQbcleXnUBa6XKD3eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkJpqb5Kd6dkDsp2VDd7oUNJs22M3q5N/qse5o1leIHFWio3aD
	m6u2Oj28HSzPEUttLYTl/SptL0YWwOPN0QO0IcPKaG4cV5AjZuJ6aEnqcVbLcfp/Bpi19zzGpM7
	vqP6657YsEMB2y6TZq9Qq4uYihxxthZ2T92O6M7r0zhnRlAfAmolXWNKzH5/bu2Az
X-Gm-Gg: ASbGncvue1JZumxPNvYgtKK7TFE3GSLIEl7aEq0/1D6qq/TE+7Wr4+EjViEHK0B9RdO
	WXO0FnyCafS8SByYcDy6lSfFF+aFAYTU+MmkZTZM06CdsOVQ7xK0W3813kTS4QediEW2/qYoznT
	BP8wMdrBT2628Bu/M5EurQGy0kUrh/NxJ5qG4ZrMmMstbBOuNztwCWaFiC8JF+wmbyUOqiiQ4Sd
	pt9qNwl1HlY+XInPqX/sulOiC43OxxyS4566K4weT89Ors1bASq/RfaHemeUcU1krhoWbuXrwcI
	l3grjftfw0U8jXsH/l2r6jy0tzRbexLjY6SggKw0vgVcj08XfemhusnefK14
X-Received: by 2002:a05:620a:424f:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7ddec176d88mr56986785a.30.1752168568021;
        Thu, 10 Jul 2025 10:29:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEASrri2Ld/AclC/23zcGLdVmOlP5lvu7yYNmYy6RQLVdGij7562wfMkwtg24N0RU6BEOMwFw==
X-Received: by 2002:a05:620a:424f:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7ddec176d88mr56981985a.30.1752168567532;
        Thu, 10 Jul 2025 10:29:27 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde806297sm117728785a.82.2025.07.10.10.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:29:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:29:07 -0400
Subject: [PATCH 2/4] media: i2c: max96717: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-media-clk-round-rate-v1-2-a9617b061741@redhat.com>
References: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
In-Reply-To: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752168561; l=2000;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=XlP4JTqNj7IvkmiHr9tqG1K/XSMbOVFkEEzDSArtTGE=;
 b=IZPrkyx5Mx/8rBmNEE2ncfwsaqrkNnJFwwc7DbA4LaSSjI43xyS4g6weDKPwkio7sUyOo7nCy
 eIITtwSJALwADRT1UZ4AYdPz7Y6HuPxE/mWTpvF7wnFYYBBRCfgrPZA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/i2c/max96717.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 015e42fbe24629cc0268825ec640532a145e563b..17625fa72367bcce59b2178b8ca4fba795187d11 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -782,21 +782,23 @@ static unsigned int max96717_clk_find_best_index(struct max96717_priv *priv,
 	return idx;
 }
 
-static long max96717_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int max96717_clk_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct max96717_priv *priv = clk_hw_to_max96717(hw);
 	struct device *dev = &priv->client->dev;
 	unsigned int idx;
 
-	idx = max96717_clk_find_best_index(priv, rate);
+	idx = max96717_clk_find_best_index(priv, req->rate);
 
-	if (rate != max96717_predef_freqs[idx].freq) {
+	if (req->rate != max96717_predef_freqs[idx].freq) {
 		dev_warn(dev, "Request CLK freq:%lu, found CLK freq:%lu\n",
-			 rate, max96717_predef_freqs[idx].freq);
+			 req->rate, max96717_predef_freqs[idx].freq);
 	}
 
-	return max96717_predef_freqs[idx].freq;
+	req->rate = max96717_predef_freqs[idx].freq;
+
+	return 0;
 }
 
 static int max96717_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -847,7 +849,7 @@ static const struct clk_ops max96717_clk_ops = {
 	.unprepare   = max96717_clk_unprepare,
 	.set_rate    = max96717_clk_set_rate,
 	.recalc_rate = max96717_clk_recalc_rate,
-	.round_rate  = max96717_clk_round_rate,
+	.determine_rate = max96717_clk_determine_rate,
 };
 
 static int max96717_register_clkout(struct max96717_priv *priv)

-- 
2.50.0


