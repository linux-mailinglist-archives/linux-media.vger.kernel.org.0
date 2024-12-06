Return-Path: <linux-media+bounces-22783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18759E68D4
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFD6A166A01
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89FD1FC0ED;
	Fri,  6 Dec 2024 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m37XbWz6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85C51FA279;
	Fri,  6 Dec 2024 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473652; cv=none; b=l3IfhKgNwuKZxxPD0yuFflgKihSyXQEWBeDmjD/ghmxAA4Ogth/2id0qK7GF8nTDjtI50ZDFF9TucvIHj8Rn3ri27h2Muq5L3drXlDU34HVv1RnhuVp32fowZtFpk452MXd3Rrif5auCpXugdJQKbgPF1ehO38X/Plh7s6lZL5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473652; c=relaxed/simple;
	bh=2l5KAyuf7uxOCItYJ/e0vlOdjvj5bF5botLs7Wr6H1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mreGFS4koyh93W7QmXw8xucH2r11PyLsrNMzZQARR4xio1Jey1ViVhXT+NV6wWCnxEuHUAVNsy36Ged1zFr2PER2D36+jdR4/IUXpeHiZnycOioctLXtWQvwD4G14/56q+m/E9KcHHCD7e9WwvPSLugyPZtAynAHgTwGnRNCwzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m37XbWz6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC9AA1B83;
	Fri,  6 Dec 2024 09:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473610;
	bh=2l5KAyuf7uxOCItYJ/e0vlOdjvj5bF5botLs7Wr6H1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m37XbWz67tXnIoCFcRkwC5hSP3z9Fjrjn5FqkpjC9vvexS7iOY0hpe8/SnBoJ02ID
	 CSoR6n7RbL/jZk5q37u62zsXKb3fQrFVWtfvxDyCOUsAdwHrQFthClDeJDDDlsVIKw
	 MDnpHoHJlOKs8HafwWaZ4CLM23C0yCw5iXxmfiZc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:45 +0200
Subject: [PATCH v4 09/15] media: i2c: ds90ub953: Clear CRC errors in
 ub953_log_status()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-9-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=2l5KAyuf7uxOCItYJ/e0vlOdjvj5bF5botLs7Wr6H1I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVeE9OpJ980Eoi+hdYVyaIC8KJFGcsxthifb
 XjFkvixipeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1XgAKCRD6PaqMvJYe
 9cxRD/wIYWQylHzbQK/LC7CGqryRLnHARZpEop8h3X4UuAzcdVKLF2Ldz1/wXWMNjo5Wk+8sgeQ
 sTVg7+44K8ObqqMIErrvOytN2ENAEwd56h7fHkZ6Ar2w4/ypprYSp0Ul3fZKMORcdNDE+XpLZgp
 BiYc21/EB3xzdKh+o+jOdakrVHWJY9sL+Zw5qKC9WvPwMLsDmhsmoJdRc2oEjdCURnAk5JxeT29
 CSypD2Njmzb+yc7YQhziw9rTqwgcFNjihwpT3FcBCQ1/TQ42i4vTd0WRGsQgGQOottC72YVcSyj
 WlwzP/Jbf9CLa6zWfFkInN5ki74/A+pwGYr/lofxzOnIYIz3rem4s8HlzmF9balyHS7Pm9Y6rWV
 pLeEt5rJgt1+7GPeNQvOVuxjSRyo569P+ORqNAMmKlJgEo45d8V9K40+h4mD4kTaJGavrsLWqDf
 cvqhqFJDSJNtoXGCg0X9h8xCvdVOnA2pev9vZd3/C5AyWXExV7MVDm20gSVbX9fE0emHbfJ2Qps
 gbX7M+dSsh0KVgXtHEdrlFKFxl0UsTTp1B7pt8wmWDKMHFM2VsySvRg4dPPYW5fAcCtJM6In6a6
 1WL1ICePT96DME5krZ2yfwcsjaORa6UXIcbHM7WE9tpNQpBdPnuZrO1bw3lWn250XXjijUuDj4T
 0k3qS2inV2vT/xw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Clear the CRC error counter after showing it in ub953_log_status() to
make its behavior match the other counter values.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 10daecf6f457..b6451811f906 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -66,6 +66,9 @@
 #define UB953_REG_GPIO_INPUT_CTRL_OUT_EN(n)	BIT(4 + (n))
 #define UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(n)	BIT(0 + (n))
 
+#define UB953_REG_BC_CTRL			0x49
+#define UB953_REG_BC_CTRL_CRC_ERR_CLR		BIT(3)
+
 #define UB953_REG_REV_MASK_ID			0x50
 #define UB953_REG_GENERAL_STATUS		0x52
 
@@ -619,6 +622,12 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2);
 	dev_info(dev, "CRC error count %u\n", v1 | (v2 << 8));
 
+	/* Clear CRC error counter */
+	if (v1 || v2)
+		regmap_update_bits(priv->regmap, UB953_REG_BC_CTRL,
+				   UB953_REG_BC_CTRL_CRC_ERR_CLR,
+				   UB953_REG_BC_CTRL_CRC_ERR_CLR);
+
 	ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v);
 	dev_info(dev, "CSI error count %u\n", v);
 

-- 
2.43.0


