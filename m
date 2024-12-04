Return-Path: <linux-media+bounces-22600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF1D9E3859
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29940161264
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34181D8E1E;
	Wed,  4 Dec 2024 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fIPv5Y+7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD28C1CD1E0;
	Wed,  4 Dec 2024 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310361; cv=none; b=Ux5mB14Kmhy3CyTnNmgRGNFph8Osq8ctNDPdczvO/J3s0McBFLFwQeHLJtSGH8QD1SpTHocn2rifQF9BXimL0OX9A7rtIxH7fX7XjIotUEL8zvVFD9WJDmyCp2Lf0JE/T1auikeW6Iq8TuhELdFGFW3UsMpYIkfLMSEKm5phYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310361; c=relaxed/simple;
	bh=jgGbPlVw9htVnBapbccOdLIZ3VXgt0d8E6hbJmD4w3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m1AEehdavT3c9FwAFRXseoWU3k6qm95zjo4gEWzAR4soiDvgTh9sfPVqPnqT7zvimOnts29wm+RP6MMhHKJjigIvaaoaMEoHFJH4BPQsNZbNwcqeXTkLzkZgT0xg17bUmRenLyNkvFAc/BpeMc4O2naQGhKX3pzSmm06EKdNUhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fIPv5Y+7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72971191D;
	Wed,  4 Dec 2024 12:05:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310321;
	bh=jgGbPlVw9htVnBapbccOdLIZ3VXgt0d8E6hbJmD4w3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fIPv5Y+784RXwWoioPl4HrH6MB2mIZnXTbn9LMK3UUt63yAaA+wDznE6y+bs+MNx/
	 Nhlybj5om6w1xI1Er33NHx2mwpwd6z1CCIEseJOa1HYJUM58KMZhQAl+62Z7qh6o4r
	 8iWyVeW+x1jnluTBZIQdNdV0P9rxTXORHY/G3D8U=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:23 +0200
Subject: [PATCH v3 09/15] media: i2c: ds90ub953: Clear CRC errors in
 ub953_log_status()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-9-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jgGbPlVw9htVnBapbccOdLIZ3VXgt0d8E6hbJmD4w3s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeEW6K9zkA3utlp52CqjbrxvksMonJEE1hFM
 cNfEIviZhyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3hAAKCRD6PaqMvJYe
 9Z9gD/93SrW1FOL75LWW8pJBHJofe7m7TEbJdyCS/G4x2G3eTN3FmbCF6kyjnjoW73pRguOMvLx
 qrTSVNjwdF7r2tI/ocLJumYChx6kDhSCdJg/SjNwOVhBbgWaitoJl4vLw3+LQdMFCU+uCZnmbc3
 i3xhEW9EI4cD8oQkOIiWdi/qU8KKrz+bXog3yobf3QGCZM7nMILp1gWkd/i5QPEbxE+EGWpwqut
 0r9BKwFQ/6YD1UVWyz8O1Yi3THAoLQeeudcP812bo0jl1TcYPqmAPeB+ysfBTmHrlRnHAoJEINi
 sQaZTWmml7yXKC6JN6En3uumjZWeyb98uYXVnTcLCOw6xa6uhHFewGGXrrAm8I9QXl7lfyLgTMd
 N1Ftn7a4HhaT14eAO4U20tyTX5EVnSi8hQmgr7ttYK5Kbqr2FemQ0eYnI8SVvcmX6V+FkJ+3YIP
 ZWYmdcB2caSURTQp6SpGzSOG3MH5U+HHqaKLtuSmLPmj2m17VDc7UxAsz/me5evMtprXDgXatK4
 gP9IyLULF1Fm9qnMXJzeFLmt5uPdG1y4VV+lcb4S9w5doWX6L4iUm8GlKS05lxmC3y2jae9rciH
 wZIDWBloZaBHGSy7j7n+xJLSTXPm931t4rYjWy9IKwWnfJc+FWoEw58ItBSquqUW6hIvVA0SsE2
 Rgd70anvXaWIFew==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Clear the CRC error counter after showing it in ub953_log_status() to
make its behavior match the other counter values.

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


