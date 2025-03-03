Return-Path: <linux-media+bounces-27369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CADCA4C621
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423CD1896FB4
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C650216395;
	Mon,  3 Mar 2025 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rQ7lPdbW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E122214A93;
	Mon,  3 Mar 2025 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017793; cv=none; b=EwirnsqPhani1QvRMGvSBqJjCCWPPz8tJAv6mKkOqcDqytw60CYM7+z2LQzhUoflLMAiUVFpsmrblvEvr+0dNFNOm+IwU/hIvBG5y2j9Dg/9pekZKNuxaL+H9f2StKXwnXm43l2cc4wN/6b8h67Sp0Jd6+D3LDBUeOwPK+A3pLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017793; c=relaxed/simple;
	bh=4szr5SBoU2zPQsCP9iY/UxI4TMRHYDSPN9LWy9FaJnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJd9k/vZ13G/Ef3W2h4pAi51W3f70cmd/02Rwc8VNIW64XyeLareaj7BGQALbKA9bUw3SJ3eeCA4K18JXXyfdisAPftMSKq+suA+sBIIIO4HbVOF+aRJ3P90jEkVtlSDocBskH+2AmJnnhcNB6dA4EFXS7ilGeWgjHNGkKkYV64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rQ7lPdbW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3157A1189;
	Mon,  3 Mar 2025 17:01:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017699;
	bh=4szr5SBoU2zPQsCP9iY/UxI4TMRHYDSPN9LWy9FaJnc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rQ7lPdbWlFstPty+ZdnHrmoILlddOyw/g45DfZw7pYHsJKkLOeSJWCgWlCv45P2Yp
	 J66UIqNAchhV1tvJqKYrAdag9Gi/ARiVXC9om+Hmgfq5dnvxicI9g2xPTNoVZeChq0
	 IUxvZp/nBxd+PJcXqJzprqTReltwsAAuJRVuiFc0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:13 +0530
Subject: [PATCH v3 10/19] media: i2c: ds90ub960: Add UB9702 specific
 registers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-10-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2371;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=vQYAgT/AsbvwYH4FTDIelPwggGYmFjpLZheid3bs4JM=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdJ/j2zBfM5RCcX07ORu1Osl6blUy8BI+XR8v
 U/h1N5CMVOJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSfwAKCRBD3pH5JJpx
 ReAUD/47X0XcC5C7dfIOGFRddLKEyVHRZE3PAuc0nxlttb+HME1oEUjxzgb7UTTHku1vWouToLu
 I2oS6/Zr87jeh1/XDo8YUbMS1DPhH00r3l/z3fk6Md2+BYz0zdeXiD4Lgk5ewuOdkXwJps9mHua
 IiNLFtmoLAslbJvRcN9tvhprIGogpLpuzpOJPoZ1Qv1TvmIRQzRMN6sPTUIQA6H3QfoncsrgzQ1
 nLzD0tcUbR9FhGXwMSlBK/Fyp8TYqv1XjG5N4BLSALyMu7nYcRMbJlEi/mun5H8p8q9xT81rMi6
 wCon8kn/opGU0i8PGa5VmclkvRwWH8OqwlKrbs7Lb/gmRcu2hDSRoVHcFxrBnfzG7Cl27OiioXL
 kTprlNRfxA3eVRhTgsthpkuD7iMinnU4aRbGn/u2czv7j+JtHo0/v4iVQL39wShuKWUsHdzdKIx
 azd3R7e7k1ZMD77+ceu5vCxXa2B5h1kNfpN8mLUH+zWZeJgmyf3p+XRk/TF6CJAO5AomiD3VSKR
 j1P7wybv08p/nEvAJgsIhlvqbco6zPwauUq9zswX9FAZUZqFz5El+5i8RN8Mjpn33c6rpXyNZrC
 TKs2BVfoS+kMTU4lo7Z+MZsejlOT7WLT8Eopzwt8RHePSN92PS5hxk7SzfXEZ+6Bn37bs5m1OqI
 ptQMxp73zPDfG4Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Add UB9702 specific registers which will be used in the following
patches.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index f9af6d643ac86de22286b2107d747341c7d6f9b0..c56398aa895f05029879fb336bc52c932fee494d 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -391,12 +391,47 @@
 
 /* UB9702 Registers */
 
+#define UB9702_SR_CSI_EXCLUSIVE_FWD2		0x3c
 #define UB9702_SR_REFCLK_FREQ			0x3d
+#define UB9702_RR_RX_CTL_1			0x80
+#define UB9702_RR_RX_CTL_2			0x87
 #define UB9702_RR_VC_ID_MAP(x)			(0xa0 + (x))
 #define UB9702_SR_FPD_RATE_CFG			0xc2
 #define UB9702_SR_CSI_PLL_DIV			0xc9
+#define UB9702_RR_RX_SM_SEL_2			0xd4
 #define UB9702_RR_CHANNEL_MODE			0xe4
 
+#define UB9702_IND_TARGET_SAR_ADC		0x0a
+
+#define UB9702_IR_RX_ANA_FPD_BC_CTL0		0x04
+#define UB9702_IR_RX_ANA_FPD_BC_CTL1		0x0d
+#define UB9702_IR_RX_ANA_FPD_BC_CTL2		0x1b
+#define UB9702_IR_RX_ANA_SYSTEM_INIT_REG0	0x21
+#define UB9702_IR_RX_ANA_AEQ_ALP_SEL6		0x27
+#define UB9702_IR_RX_ANA_AEQ_ALP_SEL7		0x28
+#define UB9702_IR_RX_ANA_AEQ_ALP_SEL10		0x2b
+#define UB9702_IR_RX_ANA_AEQ_ALP_SEL11		0x2c
+#define UB9702_IR_RX_ANA_EQ_ADAPT_CTRL		0x2e
+#define UB9702_IR_RX_ANA_AEQ_CFG_1		0x34
+#define UB9702_IR_RX_ANA_AEQ_CFG_2		0x4d
+#define UB9702_IR_RX_ANA_GAIN_CTRL_0		0x71
+#define UB9702_IR_RX_ANA_GAIN_CTRL_0		0x71
+#define UB9702_IR_RX_ANA_VGA_CTRL_SEL_1		0x72
+#define UB9702_IR_RX_ANA_VGA_CTRL_SEL_2		0x73
+#define UB9702_IR_RX_ANA_VGA_CTRL_SEL_3		0x74
+#define UB9702_IR_RX_ANA_VGA_CTRL_SEL_6		0x77
+#define UB9702_IR_RX_ANA_AEQ_CFG_3		0x79
+#define UB9702_IR_RX_ANA_AEQ_CFG_4		0x85
+#define UB9702_IR_RX_ANA_EQ_CTRL_SEL_15		0x87
+#define UB9702_IR_RX_ANA_EQ_CTRL_SEL_24		0x90
+#define UB9702_IR_RX_ANA_EQ_CTRL_SEL_38		0x9e
+#define UB9702_IR_RX_ANA_FPD3_CDR_CTRL_SEL_5	0xa5
+#define UB9702_IR_RX_ANA_FPD3_AEQ_CTRL_SEL_1	0xa8
+#define UB9702_IR_RX_ANA_EQ_OVERRIDE_CTRL	0xf0
+#define UB9702_IR_RX_ANA_VGA_CTRL_SEL_8		0xf1
+
+#define UB9702_IR_CSI_ANA_CSIPLL_REG_1		0x92
+
 /* EQ related */
 
 #define UB960_MIN_AEQ_STROBE_POS -7

-- 
2.48.1


