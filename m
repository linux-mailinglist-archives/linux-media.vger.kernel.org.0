Return-Path: <linux-media+bounces-42257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFC1B52B50
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 425827BA3B2
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379442DF146;
	Thu, 11 Sep 2025 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tHyOc/Ht"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F512DE711;
	Thu, 11 Sep 2025 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578504; cv=none; b=vAq7fQHhpxNPJu7rG8Sb9bSVfQ+/c83H94vRKD8Q0gNWJDzXxZ0Weh+m6aRBtl2/lp4X7+nZyZpazy0tAeOq+9048A0XHT6TkeqIxQnXQ+qwoF5ENybMLSxKYfB8OTwFg2AcQDe2aqD00L5jFkPdbLAMFU9uy2uJNqqUq/AltDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578504; c=relaxed/simple;
	bh=f554b4UEqiVHHa37Elp5PwAy1JMUtZkiY0I7rFW4grc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=exCymbKfIj0tnXm98htzNE7JCDnNP6yLMWIF930axB49Q/+re3caI3N0qZOXsNKfIfuJxfr5d3S21IBfLhLjDsxO7Z9huS3qCa9dL1J4LLbg3Ad5uRM3WYnsS4kSOlrR4XFKQRr9oImP2MkzAmRXsjqnUVj4xa4hywvY0DYn0cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tHyOc/Ht; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBA5D666;
	Thu, 11 Sep 2025 10:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757578425;
	bh=f554b4UEqiVHHa37Elp5PwAy1JMUtZkiY0I7rFW4grc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tHyOc/Htzc0wh7Kv+mJYfNDql8X38bwroyxVVWUBIidTYQhjtIsNX7cCqSspXPeex
	 J74kgx51i58tQ4GgFHHeRlBFHM86YjqHhCqY56YXUJMz1FQbdC4ZZQsS9N58Ot8CCU
	 GbAaHLL1DB5EJpdRXdYuCr6fXLIT3l2EZKaphqN4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 11 Sep 2025 13:44:17 +0530
Subject: [PATCH v2 1/8] media: imx335: Rectify name of mode struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-imx335_binning-v2-1-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
In-Reply-To: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=m9o+E8P8Et1zh2okIxdKsiF7R7Zf9sUf+PhNJ2zoZjw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBowoTsEC5vhjmt+RG7EUnmsJfEX0MMD5Wa4biyR
 eguVThAZ2CJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMKE7AAKCRBD3pH5JJpx
 RfteEACuwd2eKwl4Rr9wEPP9QPXabn9zh42r80ADXFZyKn4baEcbuGkfDNwaARizndy6BxnaeHs
 UI0XnpfJCpavhoqsfsZTE/9yRcBQJYAYdo7v0bIrKUMeSw+69P0ChZFJfuBybDJXD4vaoXashx4
 wdqNHSQb5sR8FPl+HoHbZwcHkScbB3HQ7MdafIDKaVYGPhzOpsnBywA7OFeiipGvuvdNMEVm9mS
 XloF2rynsnO24RabUn790/yc6HXmrXE9xT+dha4rt1jwBQi5/dppWKwmw8OnqPYfeD16J7TcIoX
 YLoaOZWOGGN3+hRG/e+YfADBYfO745r1CbgdcAQoB7ymk/v/ia2y4LhApUrHFAGlfxRYDWqGy+b
 I103DCxy32tY8KxuG3To1HCewvNvObXPP1vb1zVZDD1Cl37QyFwlFXFq/EnJtMmNHcJaRF6zL1U
 EKXdw0WATZauhKHwXsjEE+43qG66tl9h+FWgZ2N1urN6YG256rSxBmuZj7zotfmWxisJtJhJPvp
 PdrXZV8dJ+gUmBjvpaexbEKK6TaHgIWZGdzc9TmvoQ6tgbO0O/W65ZY3uzbhbFi9zadXEoiYixe
 M7D0nHo3f6KLycRW0RfXj+O1pxpMXhbGRD9g/W8LMwcJ9/Y4N/e8k6rApKpP4rD3dnagcVqlPRj
 zsBL2Z0xtAmP4vw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Umang Jain <umang.jain@ideasonboard.com>

In commit 81495a59baeb ("media: imx335: Fix active area height
discrepency") the height for the mode struct was rectified to '1944'.
However, the name of mode struct is still reflecting to '1940'. Update
it.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index c043df2f15fb25b3a56422092f99a1fd9a508fa9..213cfb7276611f522db0643186f25a8fef3c39db 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -252,7 +252,7 @@ static const int imx335_tpg_val[] = {
 };
 
 /* Sensor mode registers */
-static const struct cci_reg_sequence mode_2592x1940_regs[] = {
+static const struct cci_reg_sequence mode_2592x1944_regs[] = {
 	{ IMX335_REG_MODE_SELECT, IMX335_MODE_STANDBY },
 	{ IMX335_REG_MASTER_MODE, 0x00 },
 	{ IMX335_REG_WINMODE, 0x04 },
@@ -416,8 +416,8 @@ static const struct imx335_mode supported_mode = {
 	.vblank_max = 133060,
 	.pclk = 396000000,
 	.reg_list = {
-		.num_of_regs = ARRAY_SIZE(mode_2592x1940_regs),
-		.regs = mode_2592x1940_regs,
+		.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
+		.regs = mode_2592x1944_regs,
 	},
 };
 

-- 
2.51.0


