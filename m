Return-Path: <linux-media+bounces-44461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F7BDAD06
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21D2A4EB16F
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0922877E5;
	Tue, 14 Oct 2025 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rt/u3LVD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363283009E2
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463663; cv=none; b=FETQSLJ/Mm4cUdcGOZx2quF/YS9FUv2fmy8fZpAN/MgZcme3LXAmLHCn7ZVmQaraYs5sdAWGYmEij7+GigUHsax+wTEU9gXQTZC2CTizlviKQBkiHG/YNrhRJx1wgbRrHppYV5gMJGHxj9cNw2wFYMCJuDCvhhYS7BYIgT70+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463663; c=relaxed/simple;
	bh=wPVXSafUyHXsDNn1Sc8VTX/P1qN7ajWOokdW67+JNWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLWg1D1YfgeB8vFpVxBhq+RgYAid1Ro0+Jn4txb36GUUkTX03bZN0ttRSoilvUs9Gsff0toMZAM3NlKtmwuA8I8BArO+AmHofTgrD3xqL+pkqeL8eiS0Z5Sl9iq5NdVmngR31fZUlZk9dKq39pTpQvjj+f2XYysK6dyxIk7jde8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rt/u3LVD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F40EC4CEE7;
	Tue, 14 Oct 2025 17:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463662;
	bh=wPVXSafUyHXsDNn1Sc8VTX/P1qN7ajWOokdW67+JNWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rt/u3LVDMBt/CUXO1Kyg58KS+yXCYqAFV1K3CRXGERSmYuaZFwGdjGZY339DgzLqz
	 +3RNT5t3Wcytw91nq4NgbKfanVOfM744A/loFG2mYDWh5Qs/VaQfgo4P+/4dkTO2Tj
	 hOsjCY4DW3d3yJvd/h/GGYIFPB0z2UyOej6dx2Nidq1cupe7JgFats0gnu8IOtJaOt
	 xMBK1Mw5t++qrTslLqP2R1LGz/1IH9Vl7DLsmPmdabm8u0n/OVTim0XBW+HWf4P2yv
	 iRGwrr6Jm2YARv1QD01tXyLK13kBt5awB8XDSHF3XnlaJPFI/lX4lBWQGbJiqYKLkE
	 yoLNRgP4sDRYA==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 14/25] media: i2c: ov01a10: Move setting of ctrl->flags to after checking ctrl_hdlr->error
Date: Tue, 14 Oct 2025 19:40:22 +0200
Message-ID: <20251014174033.20534-15-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of checking successful creation of the link_freq and vblank
controls, set their flags after checking ctrl_hdlr->error where it
is guaranteed that the controls will exist.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 21fca0d13c87..d0153e606c9a 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -461,8 +461,6 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 						    V4L2_CID_LINK_FREQ,
 						    ov01a10->link_freq_index, 0,
 						    link_freq_menu_items);
-	if (ov01a10->link_freq)
-		ov01a10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	ov01a10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
 						V4L2_CID_PIXEL_RATE, 0,
@@ -479,8 +477,6 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	ov01a10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
 					    V4L2_CID_HBLANK, h_blank, h_blank,
 					    1, h_blank);
-	if (ov01a10->hblank)
-		ov01a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  OV01A10_ANAL_GAIN_MIN, OV01A10_ANAL_GAIN_MAX,
@@ -517,6 +513,9 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 		goto fail;
 	}
 
+	ov01a10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ov01a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	ov01a10->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
-- 
2.51.0


