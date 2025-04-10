Return-Path: <linux-media+bounces-29866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F32A839EA
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1408C5289
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793E320ADF0;
	Thu, 10 Apr 2025 06:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l93D8+VQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BCB20468C;
	Thu, 10 Apr 2025 06:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267800; cv=none; b=Ov5GND9CWNl5xGg2J2IgquzQhO4ZqO/KaZcaPqPWtUE7oTDv7ulnRh2OnbgSJG6DpEyl76RngizEKfFFKQGdGbabqW1OOY6WnXPe56GmBw30leOKXLo3GoJetxijoDhDY+BFhIoqCiKy7b5cm9rMjigcKgWwzSCVFT6/210SbH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267800; c=relaxed/simple;
	bh=0IDoVRF4Jk2o4J2x8325zn/PNl0hGSYENwFo90C+Dn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KzKiIaf/dtjZfbayfcPeK0/uyk4p6aAIuSOwHJhLNd+av5r/mXP6AK1WsOdDF6KlHdATd0eAMDpOXHLtIvB317wN+vo5YY4kFJANKBsAX1soy9TTtXsOvrEd3P4Hu6EOcRkCBZvf7mwGJPefW+IB1oxsj5gqLLZFtlm4l1Byvic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l93D8+VQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:389d:1fcb:c0f8:ff7c:208d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3B4D11D9;
	Thu, 10 Apr 2025 08:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744267679;
	bh=0IDoVRF4Jk2o4J2x8325zn/PNl0hGSYENwFo90C+Dn8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l93D8+VQ5jB178X+5zZBbJIi0/no26MI1jXBfUquB/QTm0Sfv8QA3cME39w2jxpUn
	 A2KK6NGUGw/vodPfvVtCILea5VPj6db0A/DjtynTATOKv3UFRSc6PSJtSxEPTfTSAr
	 xkmbK5tRhcVHCGoaOZ3IQRq6ZNBA2aJQTHDN8WyM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 10 Apr 2025 12:19:02 +0530
Subject: [PATCH v2 4/6] media: cadence: csi2rx: Implement get_fwnode_pad op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-probe_fixes-v2-4-801bc6eebdea@ideasonboard.com>
References: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
In-Reply-To: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=0IDoVRF4Jk2o4J2x8325zn/PNl0hGSYENwFo90C+Dn8=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn92n3ugwULKDesfOvviG65xqGwPE1kALyvZ03t
 0b9UWnMp1qJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ/dp9wAKCRBD3pH5JJpx
 RUCmEADMo4gTUm9RMK6HVBhPGTImqyOQCNQpTtZKMKQnEkjDUAKA0YZOe5i2nX0Ht+2EnvkBUQ8
 EgZz2J8VaOSKLmj42sH+Tz0o/MGPjq1Eri6wdoqTXvIY4nKqDtm1XAVu2yS0F3kvR4sZ/hFN5Ms
 /iLBI5qn6Zl0fC/1YcOIg6ydFxKqIIkyc3tfQkAGd/I1aT0yoJR1InIwYknDgrfZv5kUuwYPPrC
 lT1Tdl++e593pN4XMWIf3SBn5ccBgfk9B5ctH8Ab87OeeRUGp72w6INlC7rALTaFLhKsfgM6cmz
 HUbHFy33QNr2HvjGV3GaH3+9UokDv+yq77qtp+tVXcEYSsjUxNatrHzXXvZEp/JnW7St+wK5OS+
 Zu95gGwlUh/y47YLCP5okDSpvwcqY+L+xfCQlagF9kaoYFtaGFU1oCi//rdQSveHJDaHALcPJAI
 IhMmsCk34xwuxhdqKX9WFWPh7tX6HUSkHBlhPIVa+hTJ0YxXnD2qMcSfi9yXJ3oSpsNg8eGGXxb
 0gMyLJvw4MHuhmFqQ8yhrRfOcCXyLi9tYXFuRKEuhbOd/iviYd0geXw/OkQXqNQXHA0rUI+SMkz
 2XRGtpqsVJZax4dlwrTMLGcVyZPMhwje2lmv+2Bc0MEI9nbIuMPt4evaomLu68O0pFP94XnsMoQ
 cil/W2GZ82a7mjQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Use v4l2_subdev_get_fwnode_pad_1_to_1() as the get_fwnode_pad operation.
Cadence CSI2RX maps port numbers and pad indices 1:1.

Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index cebcae196eeccc65548d2c8e14bcba4799415beb..608298c72462031515d9ad01c6b267bf7375a5bf 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -479,6 +479,7 @@ static const struct v4l2_subdev_internal_ops csi2rx_internal_ops = {
 
 static const struct media_entity_operations csi2rx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 };
 
 static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,

-- 
2.49.0


