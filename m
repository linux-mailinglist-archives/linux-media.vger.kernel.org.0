Return-Path: <linux-media+bounces-38065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AB1B0A669
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 16:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69A30189CB6F
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 14:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFA42DCBF8;
	Fri, 18 Jul 2025 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3XCVo89"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D452DAFD4;
	Fri, 18 Jul 2025 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752849271; cv=none; b=TkZch/onPjDM/VOZXISE4yNedO4yG4fJYBgSjf+CeXRCNb+KJRw6eS0hrEROJEfAk09/ITLdMqROO7pi4hoABwF+vG8Koo30j1tdLwvYkcMtl1LsGHXSUJ5sRzmiM1YPZvOP7ia3p0LXwE1Cl9PhYT7UlQ/th9jr/xJHbah1lmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752849271; c=relaxed/simple;
	bh=13JiryTUqvHobefpOGHqTVk5FnzqxAodhM9uj0YvSPA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=XCruJGpSQv2v9dS9irFILpQ0/OluNWjcpRzpc1h5Xvk24+5OKkOrvgsRqcfi1A8L65tm5oCNrBjRZ5jHmdHO7EfxOmuRAspQfYiFuJ8OGRRILeCYuTOdk3KpBJz/bMCZjEwajzJ/4SfKDAraS4w8LmMzN8Kvp0Ie0H/wZBEN+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3XCVo89; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7490cb9a892so1504930b3a.0;
        Fri, 18 Jul 2025 07:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752849270; x=1753454070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dc4RmbubOACKDopQNCQandB/1PMGeDeSvCmTVZVuJ74=;
        b=a3XCVo89ANIFqG8owJXYGAakgOmTIJMZQx59FZ/SHwLfXez6V8iujZanPdWC+PMdty
         Pjsaj0D3uj14JecGOkYfY+54M/50qG+3UyFW7Hp2TunioVHggsJsCe+MsunibK2nXH/V
         dtuiLnql+uDBCjzP+wUV5dBdpYlEvI1Jmh0giO6D/5fmttXnRmv7LrZG0uqb3FRb6RTe
         aWvfHFZFDg+FAN2b1WfzubdwqPqs4lt9C+7DuSNHI5xul5IVHnZ1k5YEvbZxURy/nb8H
         iCwLaX04OI8d8lNNIkftnyOsSlfEvAPdJISPPDMCl2u1fdFQCf/GXgsIFL4tcsnKmH9f
         3JBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752849270; x=1753454070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dc4RmbubOACKDopQNCQandB/1PMGeDeSvCmTVZVuJ74=;
        b=TqutTx6brIcJpYRZLQGVmzn1yeL/GkdJqXC9dKj6BOhK9LYon+R/xMVNYH1Is5j99+
         Yk+/bIPD6yuHKxQtSS6zPAYTfClItGN9WCefFqjkd7n1k4hJ1+m8kFuVI8jomws5GovH
         J1o1pLO67yvjLype6Q4d4Ngk5ckgOCZhk9FuitkFcm/97lX31q+u2KYLdP3bBGPCyA2P
         9m0l5K2qhQm/Ro/tUVJN6EOJz8uNYZpE1mmW1TX/dylJ4A6iwsR3YUgect7yUZCUR1ra
         d5dNg+9nGVIaTyEHSxbFvJRHyFfpemJjWdRtUmZz3HrAScB1FaEO9elNlZT4YPCHfhnu
         y04g==
X-Forwarded-Encrypted: i=1; AJvYcCWHKLF2xamvIM1IEEY8o+csdohSgXJxDB0ObIEKmmRu1qzs6uc2p+TbjjmjutjasX+QEsDwAKU0LEqZy54=@vger.kernel.org, AJvYcCWkvK8DC7aEzJ39L9EZjrBiM2d0PmKNFbbvZVRJT52vqeiJ2UaZSL3lvb663aIrVgMrj8h1ym3ryh2xBFc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Yr2XB61i+8rTa1ywvB0mjCE2OL4+M2TegfdJAkOuuPydJT7u
	QnWF4OF2g0MTlkqKD4fb6Gp9RpltMUxvqYKzFy/D1chbl1R92qKMHbuW
X-Gm-Gg: ASbGncvPo5UdNqhlC+rms59nYXCV++J5dtNEMwPYut5zrmfrbTn56DvhK3LBt4Bo2A6
	qR3a3xRacI9tZSIRsn0Z6E/dL0V9WOTJcpEdsLmdNPtyIMx4lPV5ii9Bk+DuJsRnpG9iUqxPzy/
	dtPY0Gl/OOBF0c29x8CyJWH72YKdcPtplHxSF/W3DM8nlvf9ZsPbFC0jv3hsH+isKp9RFd1tvSM
	k8aXQ7VS+Yy7dAUV1j8v2MC8MfgIb4XrEnqKr7CBBtz2pUABIyl7p3zix/9w1Yq5S8BCEkXJzyu
	0/+A+M16EQC40sVkpi54g5bow+EQ/CpjGBlwJJ1ngtxCe0OMX34hBgp2euLV5b/xs7D2BbpxR5g
	qBTskvav9IenhgT8CeyX9IiwiyPk9GF5krZe60b29q6Zd7IhQ2OCUZ/tEmNmklmoRikdQYGvL1c
	U=
X-Google-Smtp-Source: AGHT+IHIjbZRs8M6aJo8lmvlsW5wDpBjayivkW7Y0yOv0ghLZuE4hUj3gKo2FHaxEbQIZzzQ4ZKD+w==
X-Received: by 2002:a05:6a21:329d:b0:234:28d7:b8fa with SMTP id adf61e73a8af0-2391ca91791mr5369708637.40.1752849269470;
        Fri, 18 Jul 2025 07:34:29 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([27.57.176.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb152227sm1351774b3a.79.2025.07.18.07.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 07:34:29 -0700 (PDT)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: b2c2: flexcop: Fix coding style issues
Date: Fri, 18 Jul 2025 14:34:20 +0000
Message-ID: <20250718143423.2798-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code in flexcop.c has several instances where spaces are missing
after commas in function call arguments. This violates the Linux
kernel coding style guidelines.

This patch cleans up these minor style issues by adding the required
spaces. This is a purely stylistic change with no functional impact
and improves overall code readability and consistency.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/media/common/b2c2/flexcop.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop.c b/drivers/media/common/b2c2/flexcop.c
index e7a88a2d248c..8506de48ba45 100644
--- a/drivers/media/common/b2c2/flexcop.c
+++ b/drivers/media/common/b2c2/flexcop.c
@@ -170,7 +170,7 @@ static void flexcop_reset(struct flexcop_device *fc)
 	flexcop_ibi_value v210, v204;
 
 	/* reset the flexcop itself */
-	fc->write_ibi_reg(fc,ctrl_208,ibi_zero);
+	fc->write_ibi_reg(fc, ctrl_208, ibi_zero);
 
 	v210.raw = 0;
 	v210.sw_reset_210.reset_block_000 = 1;
@@ -183,17 +183,17 @@ static void flexcop_reset(struct flexcop_device *fc)
 	v210.sw_reset_210.reset_block_700 = 1;
 	v210.sw_reset_210.Block_reset_enable = 0xb2;
 	v210.sw_reset_210.Special_controls = 0xc259;
-	fc->write_ibi_reg(fc,sw_reset_210,v210);
+	fc->write_ibi_reg(fc, sw_reset_210, v210);
 	msleep(1);
 
 	/* reset the periphical devices */
 
-	v204 = fc->read_ibi_reg(fc,misc_204);
+	v204 = fc->read_ibi_reg(fc, misc_204);
 	v204.misc_204.Per_reset_sig = 0;
-	fc->write_ibi_reg(fc,misc_204,v204);
+	fc->write_ibi_reg(fc, misc_204, v204);
 	msleep(1);
 	v204.misc_204.Per_reset_sig = 1;
-	fc->write_ibi_reg(fc,misc_204,v204);
+	fc->write_ibi_reg(fc, misc_204, v204);
 }
 
 void flexcop_reset_block_300(struct flexcop_device *fc)
@@ -202,13 +202,13 @@ void flexcop_reset_block_300(struct flexcop_device *fc)
 			  v210 = fc->read_ibi_reg(fc, sw_reset_210);
 
 	deb_rdump("208: %08x, 210: %08x\n", v208_save.raw, v210.raw);
-	fc->write_ibi_reg(fc,ctrl_208,ibi_zero);
+	fc->write_ibi_reg(fc, ctrl_208, ibi_zero);
 
 	v210.sw_reset_210.reset_block_300 = 1;
 	v210.sw_reset_210.Block_reset_enable = 0xb2;
 
-	fc->write_ibi_reg(fc,sw_reset_210,v210);
-	fc->write_ibi_reg(fc,ctrl_208,v208_save);
+	fc->write_ibi_reg(fc, sw_reset_210, v210);
+	fc->write_ibi_reg(fc, ctrl_208, v208_save);
 }
 
 struct flexcop_device *flexcop_device_kmalloc(size_t bus_specific_len)
@@ -266,8 +266,8 @@ int flexcop_device_initialize(struct flexcop_device *fc)
 	if (fc->get_mac_addr(fc, 0) == 0) {
 		u8 *b = fc->dvb_adapter.proposed_mac;
 		info("MAC address = %pM", b);
-		flexcop_set_mac_filter(fc,b);
-		flexcop_mac_filter_ctrl(fc,1);
+		flexcop_set_mac_filter(fc, b);
+		flexcop_mac_filter_ctrl(fc, 1);
 	} else
 		warn("reading of MAC address failed.\n");
 
@@ -275,7 +275,7 @@ int flexcop_device_initialize(struct flexcop_device *fc)
 	if (ret)
 		goto error;
 
-	flexcop_device_name(fc,"initialization of","complete");
+	flexcop_device_name(fc, "initialization of", "complete");
 	return 0;
 
 error:
-- 
2.43.0


