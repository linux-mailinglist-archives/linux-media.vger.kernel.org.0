Return-Path: <linux-media+bounces-40117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23FB29E0F
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD18218A85BC
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BD030E0C5;
	Mon, 18 Aug 2025 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYRjG/UI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0525030DED0
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509530; cv=none; b=i0Nu30/BH23UhepGo05fYqX3FbKTLnxzIFVlazZexHiFPyzZshnhrVlgVprccIL2mbgwtHutH4t/migo1NrVPDLaIQjq8Cg5ibcIuWc7g15YNq2SUXGYtef4xl5SLDwcFrmGszvfvDdyvTQb8c+drbLbp0GHz44GBuTsdy+pMsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509530; c=relaxed/simple;
	bh=yHL+XSbBNGsMKJsHH4Uy4eDS/KVeEkZxpkCETJV5GnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FxmFmR/CpuDGTZnu7eWjECYT5y2szgD1/cJzv45ScJVjPT8fursCfeAxc2s2zN79ZSaNfBDUq2gVNTXjkxUcQbZEBbDJd3MhxHstD94kGmQ2yaGZw/UQwiftvz8ZK+5+ZBteHkht+pj7dEg/3wLIjJzKtxI0HnFeg6asACZzxDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYRjG/UI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2445827be70so42541575ad.3
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755509528; x=1756114328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHfYVwbmP+gPFXz8CWcley05MtbRCnNcrivNbsDjwVo=;
        b=LYRjG/UIPghbsufEkG0/n4cMP/MeZ7VGSVNfRF8JeyFx3cLTDuND9YTJHfHeb7SxO1
         KaHDlP4canfOS6Me2L2KYbGakQL5TWgmd/mzlfCXLJrpS2HcA0WPKazutlbNTBTNB7q8
         yZAugpXpZjtuQGVD5ZYWm8f3BwC1/y0StEYLZipi7LDnUFZ+8hiv8IenT9xQBxiJWXLa
         4hGOL8qn0+m9f9mW6LmMm204TK3HCGTEXmr2jXcv762oMk1zEPtHDMR2urtL2t8IEnCb
         PxWg9FFXqiABMJoUUmDGfbACjDQKZvkaSFns04jYFfJFxnb9RCN2nQ997mjvYLHvzUij
         sGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755509528; x=1756114328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHfYVwbmP+gPFXz8CWcley05MtbRCnNcrivNbsDjwVo=;
        b=YzxZUd/7PWTSrTi+C1jkZTxjeQ+Drdu9+d81lrRNP0USqDz8I8U8ZI62MtVXOfC70A
         onnrXiu1+fguC7h/xHdnZXpqzAF57x+ZAZmn1eFKw4NBPafk1g2+8XK2J5hI1apMQs+s
         nsxZEYseFgj/NyveCLA2YsQsZH2pgUPmZveeJlkKf5QAuTELP87JYWobqOrRGHsCzbMl
         AYNd6d/Rr3PaRNvNxZRTm4vMWWzXRCBfBpQjoYW7KxwNt6xnZq2Tn9nje84asAVQhe4K
         +gl8G0qI2CPACsyuPkoPddgTFuL4O0VqAQBbfz84MqooYKoS1xVdtEQ876XDmkCrcDNv
         /ZRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrWx2pJul2lLDgumSBmVhHvK9Nav2ZQOedPBBrq8h0qXsjmsiMxy9rF/JYqP2vz6tkfRgk1vGZomc+cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu6z6KSUn0lxZRYK9fPEON+l43Y0x6oLkgy+J8uQsSsk6Q85rT
	Pdc7z38y/I5fG4DAcGKvWyDsZzwySse8zb4SfpSe/B8wjwR//8drnM/r
X-Gm-Gg: ASbGncuWG02uDjJYoto2EbcU91iaLnWbgMkLh8bf8Mhi8Suz3eWgeKDl5ZNT7D40pRo
	1sBPIas/9k4ZBdGi0Vd2d3LgS6s1Lu36y6WtM0ltRYWuGSAFRAAVi4NKywTzKOk6KySsrrpZ2dK
	W6AlnZexlqnBQWpSp7dgJnp6e2U1mKzuFYrm13InfFMXsfs9QaYAfcSCuXaAjPmgufbstmgjykn
	Q8DOzfDilF0mZJyBKkenA94/QJHloXQF0b3///nq1cQ+wKOYEvWoR7iKk1B6bWTng80h2Sqrpg4
	9yc3KJLbCm/6A9vsmLNXQfxmSFcxCz5a3SVl2wFTt4PHAD16HgMAn9PfiHlB0zmP7qRCpQgiGCh
	Ug7csGT6jr3Z/sO2+5K4VFeJlHkMcKxhL7mRU9BEZQAJRhxjwcQ/z
X-Google-Smtp-Source: AGHT+IFCRtT2UOKN4GdguapaDt33D0B736i93LRmByQ1B2I3PXdFqVr/n+fJRYAuoJpHAa/pY3mMdw==
X-Received: by 2002:a17:902:e88c:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2446d8b67f5mr216185465ad.38.1755509528108;
        Mon, 18 Aug 2025 02:32:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1cb8:46d9:adba:d08d:ac6:8cbb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb0f007sm75092045ad.69.2025.08.18.02.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 02:32:07 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: alain.volmat@foss.st.com,
	mchehab@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] media: v4l: Fix dereference before NULL check
Date: Mon, 18 Aug 2025 15:01:57 +0530
Message-ID: <20250818093159.612208-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'stm32_csi_start', 'csidev->s_subdev' is dereferenced directly while
assigning a value to the 'src_pad'. However the same value is being
checked against NULL at a later point of time indicating that there
are chances that the value can be NULL.

Move the dereference after the NULL check.

Fixes: e7bad98c205d1 ("media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index b69048144cc1..fd2b6dfbd44c 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -443,8 +443,7 @@ static void stm32_csi_phy_reg_write(struct stm32_csi_dev *csidev,
 static int stm32_csi_start(struct stm32_csi_dev *csidev,
 			   struct v4l2_subdev_state *state)
 {
-	struct media_pad *src_pad =
-		&csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
+	struct media_pad *src_pad;
 	const struct stm32_csi_mbps_phy_reg *phy_regs = NULL;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	const struct stm32_csi_fmts *fmt;
@@ -466,6 +465,7 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 	if (!csidev->s_subdev)
 		return -EIO;
 
+	src_pad = &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
 	link_freq = v4l2_get_link_freq(src_pad,
 				       fmt->bpp, 2 * csidev->num_lanes);
 	if (link_freq < 0)
-- 
2.43.0


