Return-Path: <linux-media+bounces-50144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1238CFE1B4
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 14:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5A6A3092839
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 13:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6228433342A;
	Wed,  7 Jan 2026 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxJYz8bt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6AE332EA3
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 13:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793760; cv=none; b=gKuwcT3yz7yLb6X4Un5YnDzDSMSGKr4WFfl+TeuZXXXdUrxdUYG9Nj2SLKancfbBgI26ljO/G4cOVnV28cS5n+nOhuR+bcpFN6wI8Y7Ck/eefWCG5BKwMJdxhTy0zhvqRvxNQ0WgbEG8aUOncpEdthCE4Iy2J0cc3LjlhOUuL+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793760; c=relaxed/simple;
	bh=VcJC7sCWJodERaoTS9t7XlGBxL7hprZHiIDPn09Ne7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjWWfQwl+Nl56JPuzQlVQm09pfXzTT0XD4vfQn6CGrw0rYD0AnRwiL6+Qh7QU4pPrMlKvRYCNpJQoLccHTmKdWgLImN44eX0cKDCD5gekI6vG27zC5MOYHqO7v4cU0ocTRgjFT6jJSy86ayjoBbxU6aFvGZ8nWw+ussOcMmwJHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxJYz8bt; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso2403076b3a.1
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 05:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767793758; x=1768398558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw6fgNtZmBe2W56ugS12P5lnC0TRTn4SZrhJOxug+wQ=;
        b=gxJYz8bt/oZWkgpgaOd6u2u1vp5NupVrTV28o7GAMqG/gNb/5MIwE/mQ+eLk16y44C
         /SwwjQa/mMB9W9jIEPqQgxLYMi6DKCjrI0bEh8TjBDduUp3OHS18IQkfsE+xoEO8uw97
         zi0ZsPBBF9cVtWgNKEc2Hu32F9kQRoFkTagClrG7GI4cT5NIFpn+8Y8aFvyVPZrLjmJy
         Twa8y3hACCRLTm7ePSOm9oWLQwogNhZdCyuu/D7V0LeYq/sKTRI4hqpvkYoaJ5bXsFLp
         INm2Gw5FEti9G0w2BTUI3+yz8KoNTTNHvHtkZFGyrIXSVhRI7yihqEtF2GEDgOvJ+h7t
         DBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793758; x=1768398558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bw6fgNtZmBe2W56ugS12P5lnC0TRTn4SZrhJOxug+wQ=;
        b=GSOudl15+5maVsLsxo9tjDkHgivfRxyG25YlhujAN8lByT5E7A1jM7zjWWaqNN9q+h
         W3OnSEbOicvIclT2Tl5CSO/NcgVvqmcO5tR5Cwr7cGV2ZF6OFuovmuc6+gZcMb0qOrpH
         znlljEp6ey9awBsEfxSdjGd0Ycyf5y1TsfPvg0/w4aACdKMUqrgNXq1t+4rltTW/6/2m
         0YL0pD5+2iVU0ZU5uAVbTIa+WUHnzI3IAI2AdlhFmRQUzWBRLFz3OUBw5O1FwOsNFKDY
         fSdcZrjDX5fRmqmLEgNTBb+JKGE+5HN1M1T66nz9MleQ0GpIyFGO48ZZXrC9xF02bi9o
         YZCg==
X-Forwarded-Encrypted: i=1; AJvYcCWI1kLpKBXs6e5Y5Sc7gr2Y8gEbulhk5Smr1UjyOxvWVO2AX0pM+HZYya4/ihfUYKjae72jgVIcpgl2Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjqomBhfj4AGxt9O2McHhjKPvID9ovZlOl64W0rGrvL68rARLM
	qc50YOi24trgldd+bjJs4wvqvCxuuWgEfveVUvVtQ6KSqn0SKAEBw7u2
X-Gm-Gg: AY/fxX7QZNl4PxH3M4DwKLQZigwTfqU7uVtYGXkOPqH5BGIkMcOOxE9lxxuYaR7uO2W
	0p9FrefG7bYFufl2QLaXlgKtotnnVZp+hAshnuVqYmXgVu3yeH3/ElMr1x3v1YiU1QraGY7p94W
	qKbNhuhyC+kAFTlP8vDEIrxZ5oF5Zz+PerAQbdzlnje0DBR2fETW62hYrtg04LHy6PWI+vJA64W
	A5QKQeMwXhiGArgHH0wPupvXPcTkwCq1RY3uBrdMbd3v1U52Yb3P4AMGAOqyhubi0nurPKKzliT
	vM0L86+FKHzmVKsvIxaxvH4tCE9CWy6QVIgflKXuOZsO1CTCxIkg0Wrl3JPshXMTI6yqkODW3yM
	mQwsumkf0970XbzfNSYFqpHWfQrbOFRoXve7bQyyLu/13byawc2R67Do/MQlBx2kI3xaTovJPYH
	J6GUDXLEXyUj4=
X-Google-Smtp-Source: AGHT+IFj4SFEIp18Y5M2C38LwZUCcGWQNMHaApWC/2wyk9IyQIwapqJnVP0bVg04ZV9jnPoyGDdrDA==
X-Received: by 2002:a05:6a20:6a26:b0:35d:cad7:cd63 with SMTP id adf61e73a8af0-3898f91d20fmr2344473637.30.1767793758490;
        Wed, 07 Jan 2026 05:49:18 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5302c61sm5109577b3a.42.2026.01.07.05.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:49:18 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 RESEND v2 3/3] media: atomisp: propagate errors from ISP xnr and IRQ enable
Date: Wed,  7 Jan 2026 19:18:44 +0530
Message-ID: <20260107134844.68074-4-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107134844.68074-1-karthikey3608@gmail.com>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the return value of atomisp_css_capture_enable_xnr() in

atomisp_xnr().

Also check the return value of atomisp_css_irq_enable() and log an

error once using dev_err_once() to avoid flooding dmesg.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 4ed6b8aea..da2481af2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -874,7 +874,8 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	if (!isp->asd.streaming)
 		goto out_unlock;
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	spin_lock_irqsave(&isp->lock, flags);
 	isp->asd.streaming = false;
@@ -925,8 +926,9 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	atomisp_csi2_configure(&isp->asd);
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
-			       atomisp_css_valid_sof(isp));
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
+				   atomisp_css_valid_sof(isp)))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
 		dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
@@ -1196,9 +1198,7 @@ int atomisp_xnr(struct atomisp_sub_device *asd, int flag,
 		return 0;
 	}
 
-	atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
-
-	return 0;
+	return atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
 }
 
 /*
-- 
2.43.0


