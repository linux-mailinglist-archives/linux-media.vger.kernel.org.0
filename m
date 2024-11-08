Return-Path: <linux-media+bounces-21134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C646C9C194B
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E2AD1F24588
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1661E8842;
	Fri,  8 Nov 2024 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OjqPLWfe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDD91E7C17;
	Fri,  8 Nov 2024 09:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058536; cv=none; b=a57KZlDlUoqjKCfYVfPfyL3Gv9lFI8X38WF3h9O93rT4g//uK6ibLZuiafu7EBwuljhOS684yVe5DDXhs4k2AoIhpBkID8MG7KotijDzsSGMmNlAHhLkdMInmivk6C2l+bHzvfrF47lqbDmYJeh06kUL+RPQF4lCDXC7WPrf9PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058536; c=relaxed/simple;
	bh=5VLNvEv71o419ZM2snWjQCE3gPk5HEiEVCAtwv2Uo+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S7zeLj/tBMc/kPaE0ywE/zIID7PrqsE4uMTrCIdLH4YHXcPngJKFJ1GbeC70KYG9VQCNRx/l//lzKfLPJHPKRYtckISxQy9okFKHWOsaoSebIJBA/ZuykEX9xoWDj6ePPIBk08EDD6VuZlWodr58QW4Oe3Lj60mg6zdCT5M9qS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OjqPLWfe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 713643D5;
	Fri,  8 Nov 2024 10:35:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058512;
	bh=5VLNvEv71o419ZM2snWjQCE3gPk5HEiEVCAtwv2Uo+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OjqPLWfeg+2n97q8MZsaLhO6QedFzNNGoKP+QTaJHSjsSv4xtFVqqENtnA5dKO4R1
	 MyHYxSxyIpWbPW24XyAHw3IiX1tdu/h+gGp3nqhc/2r8HbfP2Od4Sr/ea34Cq8ZT1u
	 wYjil/l78/mwXEwxBVPuZO9F1ZPU723pT1vDNjl8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:55 +0200
Subject: [PATCH v2 11/15] media: i2c: ds90ub960: Reduce sleep in
 ub960_rxport_wait_locks()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-11-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=5VLNvEv71o419ZM2snWjQCE3gPk5HEiEVCAtwv2Uo+I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtR1CKuB3jU2gmQdf7/cZ/y4JYsXrxP9UVcL
 HbXhcR28syJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bUQAKCRD6PaqMvJYe
 9QCmD/9Vm7ld5rEngi4kdIQoCCxIgGI6MmYrnFZP2oEomZP7DXK6u6ytMfHKhH/DQFN+KHjJF76
 kX1q57B7j6Pd4DlE+/ZNNLwy0z1KP+TI7TH3q6N69EE8QF73Vs8btcY+xIcA2UvZUE5V4nVoS+x
 /bj+liCjOV2HGMsMkoPvyDJzoAZrtCeG4HHtl8g6SlB1r4Rr1fQbd6SZeuzWbYV9ogJpTGrUVSv
 0ILqYPeC7dNOp+/PqoVkUsWwN2O5JyK0ofWhyGwE8rARanxfm+s9QEKxrxPlTspGo+d+GYfDdGv
 4lYv1ssYUV314g7Hu8EcwaJ/1dDwNPTZbvRT6pr3umYdRyVfRvCdsTvat3WmOsJ6/veYcpBfy0G
 Ms9wa8Bbzuc38AUVviV9gVlHfo56BvAi1dRe0xhtrO5MpGDcp0Hmz8efBFmn0muIBOgb+uLS+9k
 6y22JbMSRJ4XIXzLvyp5wvc73EsQtcucxQSYeUrN8RHzR6SYtnS6Zpaj8hm9C9Q3NYDdeVgU1k5
 OFLsO00DhFybMJJBxSAg3dgyMh6OEry9IdsSmG9zOUG/mIu/5EM5fD2YAaZA7HkHV1tephMhFWs
 +LdxeQZZHeSDhb4jsM50CJjWnmeud679xRuMK82yzsp1Rqy5xr6fgSG3JMZvxpjTQvJZ3+3xhQb
 psG7VpuWJioMD3A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

We currently sleep for 50 ms at the end of each iteration in
ub960_rxport_wait_locks(). This feels a bit excessive, especially as we
always do at least two loops, so there's always at least one sleep, even
if we already have a stable lock.

Change the sleep to 10 ms.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index a4a624816d8b..64b5297c5f22 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1576,7 +1576,12 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 		if (missing == 0)
 			break;
 
-		msleep(50);
+		/*
+		 * The sleep time of 10 ms was found by testing to give a lock
+		 * with a few iterations. It can be decreased if on some setups
+		 * the lock can be achieved much faster.
+		 */
+		fsleep(10 * USEC_PER_MSEC);
 	}
 
 	if (lock_mask)

-- 
2.43.0


