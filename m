Return-Path: <linux-media+bounces-50164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D0ECFEA7F
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 16:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F22923046FAB
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 15:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744C33612CB;
	Wed,  7 Jan 2026 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdYpryTR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F13C35FF6C
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798579; cv=none; b=aXRjZCw2NydyF3iUh4GS03pzppTOZ2mPlp2cgPbJbjzQsK/GQaKxyGpfNpJyd+3/WRcYfVaK77qPgDeTdhyV6tY38EiwutUgBOc6uacAr3YSXOU/1qF6DeJNlElZ7m1ny6I3awfaWJScc2f70VI0ePQ69WFcfN7oFJnrJOTBG+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798579; c=relaxed/simple;
	bh=mnmqm+sV4J6xoZuyVc6SiEB8yZ+1Lv05//8FJGOKXHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csCOr5s/TiW9uxmQ71JrJm66ONXnOXLNQ6GMIb4lNoHT7GSv5P78/lwolVjd3loORYgGoPwd2Zo2Y2NmchOEnkr0nks0QBzyG/kAFAa8V378VXXJf30m9lWfuwdA8wQlAOCb6rI2K7s4fZrObS2TRD/L6uUVUdx8Gv9pv3YSIt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdYpryTR; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so1368163b3a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 07:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767798578; x=1768403378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeBDx+YUjGbbLJYP7ioCQ7iYFylmc1DSRE5Jg3YEh+4=;
        b=NdYpryTRT8DeqDFTuENaXQt+tw4jVqWla45qCIb0JafqUARiubDnXtQbrZTTlZCVXt
         EEeeLqKmA+TilH34yoA329POF7y8O3+juOCdXuhpvF9/3v4dUzQW4+egEj0DimDOSAC+
         XKhPkhpZk31s2znobARvlqFSpkWDp4WPcWrbel/z54HrOc16U4qBh2Af896IlBD1yNhU
         73FcbA1r43x1oUsrC4/BLv6Gf3MWCijLmTqFrb1KTk3j4NFLx5bCuK5csJ7uBTSuPkPJ
         9u0wsKoacmDt03WuVJ02zF/DZZgDUllFVYYYospAjdpEVwHUN9MvZ1K4V/65SVVW67nF
         4BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767798578; x=1768403378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KeBDx+YUjGbbLJYP7ioCQ7iYFylmc1DSRE5Jg3YEh+4=;
        b=I30Lc7NR2xbXi4mPcdlrbypWacg13b7ykxbfk7USLKQlfMbdijY9P4f/YPJGe3bat0
         oPqfRTsvxQt1E05vm93lqYIFnrPtpgSP3vQ/BZLjtdqTHSEKCyWmHl/MMqP7R2w6BHQW
         jpMJLg+GHUC0zSKuEz490f2aF4nx0VNgCO5/acy14moo8fwYA/csbQ+G/X1CIDcLiDgA
         3aKi67OwwxZ18O54+r1OSsD9pM/qSRsTmEX9TYBA5jovVDz9YBL4a+sw8K9g/mkNYCgh
         8NVCyUT8qGX6Bh5iKS/UgIYPS+EILCvfoYgfbDRTp2A3gMkK2FPuq6ZMcxWLydDAp9TS
         5eDw==
X-Forwarded-Encrypted: i=1; AJvYcCXBC1U+PlOrCVLDsb6bwaCdsiFNPoTSqDH2ILV+SWruC1BGtjPLksM/QZvkEbo2jcnBoBvG6o/57PS/8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPQFevZu9IGR9SN51qJHN+e6g3iT1BzSW0KwWyt7tZ0WawEuyo
	q2u3cEuZ6cVNAC7wyzy8sFkL+kzgAOotsyuJIYO31naeXtcHmS9hC7Jl
X-Gm-Gg: AY/fxX7G6H9K3dv/xuOlms5y+26CUVrRyd7FtDU0qOc20Pzg9yseTY4R+kdfwhs4iNN
	PbRlq0m7uMwlwlgTUfnp95NBFKDj36GH82sBLOE8yUwty7zNzQPdnfIq3JiJ6oFCPxqoFaJwcgj
	5BT364UnIvPP1YHVM0w5NAfZ8Hy/I385QcbNkxHujm/czjbyBZRjiZDqxwgMFNcPOup2QCHaj6l
	fqUkmCRE7ARhjuNToPtiKaH+kspQRnfc87zfeBx6yceftnltvon7OtAgcb059AO9dFmtVRw1Wmt
	33fA0pu+Z9y6zobC0eYrWEOyr/Q2w1enF4fbR1/JGO1EQF61qeGlplLZSe0cIMXNm4EnDAsOuRX
	oLEWq3+c3CeZDo6U/A4TljAmF/lroutoDugtzsWviQvE2DBMgEuEgZtwKcZmt1WoPwCWA5CF9bB
	5kEL6HdWa+bdQ=
X-Google-Smtp-Source: AGHT+IGMs2B36viuuAnfjeiIBdzTg9KYUmjvbamIyDu2pKeCZP0v+ieVtRSjbeiTwNmI0J2gSr8EKg==
X-Received: by 2002:a05:6a00:4103:b0:7f7:850:dbed with SMTP id d2e1a72fcca58-81b7f7e2ae4mr2318127b3a.44.1767798577923;
        Wed, 07 Jan 2026 07:09:37 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59df961sm5246114b3a.47.2026.01.07.07.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:09:37 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v4 3/3] media: atomisp: propagate errors from ISP xnr and IRQ enable
Date: Wed,  7 Jan 2026 20:38:58 +0530
Message-ID: <20260107150858.79818-4-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107150858.79818-1-karthikey3608@gmail.com>
References: <20260107150858.79818-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the return value of atomisp_css_capture_enable_xnr()

in atomisp_xnr().

Also print an error message if atomisp_css_irq_enable() fails.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 677c460fe..0f5b2e90d 100644
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


