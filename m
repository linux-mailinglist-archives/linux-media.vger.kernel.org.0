Return-Path: <linux-media+bounces-26576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95287A3F3F6
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 13:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8BA8189FC39
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DFF20B1F2;
	Fri, 21 Feb 2025 12:16:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A7F207E1A;
	Fri, 21 Feb 2025 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740140211; cv=none; b=UsixDAkLIPAhQcMp/h3hST0mWVf/rDE+sTwA6VFfFYr/EAdjDfqISYZ+fuo6rvKtqarJeLTvVma0jqEdG98+OQt/+6T8vJnX9mxo8K8hQHhp/ooH9OxdJfAVZT/cmQGbfpGllNwdMZKnTxRVqm4hYD8sxGjykRN0oJ8SibPeeJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740140211; c=relaxed/simple;
	bh=/85CvhojaOEITcE5GoUzlhsmmXD+4jgin8lTFeq++TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgl1E4dfbCpHswKFoahC8HjTk89MrTzrZ0+GxyHKQRloJtAbsDaaXsj40/tzJL3DWdDJAn6HP+F9fTU1Ek98jlW11wV1HdhUu7Wk4s9G35XmwttMHcWm5FgO07HXEYYGKP2jvM4WPF7dVpB2aoIR/T8OYrwT5a/e+BZoTSJmQ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id E3592316A2;
	Fri, 21 Feb 2025 13:07:49 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 1/2] media: mgb4: Fix CMT registers update logic
Date: Fri, 21 Feb 2025 13:07:42 +0100
Message-ID: <20250221120743.1703-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221120743.1703-1-tumic@gpxsee.org>
References: <20250221120743.1703-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

The CMT "magic values" registers must be updated while the CMT reset
registers are active.

Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 driver")
Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_cmt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_cmt.c b/drivers/media/pci/mgb4/mgb4_cmt.c
index a25b68403bc6..bee4bdf54d1c 100644
--- a/drivers/media/pci/mgb4/mgb4_cmt.c
+++ b/drivers/media/pci/mgb4/mgb4_cmt.c
@@ -206,10 +206,11 @@ u32 mgb4_cmt_set_vout_freq(struct mgb4_vout_dev *voutdev, unsigned int freq)
 
 	mgb4_write_reg(video, regs->config, 0x1 | (config & ~0x3));
 
+	mgb4_mask_reg(video, regs->config, 0x100, 0x100);
+
 	for (i = 0; i < ARRAY_SIZE(cmt_addrs_out[0]); i++)
 		mgb4_write_reg(&voutdev->mgbdev->cmt, addr[i], reg_set[i]);
 
-	mgb4_mask_reg(video, regs->config, 0x100, 0x100);
 	mgb4_mask_reg(video, regs->config, 0x100, 0x0);
 
 	mgb4_write_reg(video, regs->config, config & ~0x1);
@@ -236,10 +237,11 @@ void mgb4_cmt_set_vin_freq_range(struct mgb4_vin_dev *vindev,
 
 	mgb4_write_reg(video, regs->config, 0x1 | (config & ~0x3));
 
+	mgb4_mask_reg(video, regs->config, 0x1000, 0x1000);
+
 	for (i = 0; i < ARRAY_SIZE(cmt_addrs_in[0]); i++)
 		mgb4_write_reg(&vindev->mgbdev->cmt, addr[i], reg_set[i]);
 
-	mgb4_mask_reg(video, regs->config, 0x1000, 0x1000);
 	mgb4_mask_reg(video, regs->config, 0x1000, 0x0);
 
 	mgb4_write_reg(video, regs->config, config & ~0x1);
-- 
2.48.1


