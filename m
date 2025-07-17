Return-Path: <linux-media+bounces-37985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D79A1B08B23
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 368811C2493C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB62A2D839A;
	Thu, 17 Jul 2025 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L3xM2sIN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC7B2D7801;
	Thu, 17 Jul 2025 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749179; cv=none; b=eVk0ZNc6b8aQrKPtO3+b0jA9J9iAg4YE7Tz/99IcF1OZrOlWOqIQaGzSwkEEQEjup4LH6L9Oa8/t8mRI8oYlmECX5cLsQJulfRBspJ5sj03KntPECYVUMapjlq3wcmd4I1L54aWaT7yKYSzWjsRCYXeBTD6msbpG6gDujO/tauA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749179; c=relaxed/simple;
	bh=NRkJxIVd0ZlILnv8udnGakJfoaHUIwP9DNE9boCy8vE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEDF3/FJPgPTPL4owhfjG4bYO9rC2IRj+oVICRdAsaBW1/bYT9B6cQ9IZtt8VU5OpnswcUPbEi3s3EgQQImkDUM9IxmWQEMnzaq3XxgVFMdtV8QYZnOEdzrbjRmhGlHrCxz3g8EkNCyvgC1HfoFypmokfJPq4YKD5UoTn49+AR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L3xM2sIN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F4C420EE;
	Thu, 17 Jul 2025 12:45:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749141;
	bh=NRkJxIVd0ZlILnv8udnGakJfoaHUIwP9DNE9boCy8vE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L3xM2sINUfbupiC+4EYm9Z6p/Zv84402Yye5DQ6rY0irVFPw9GLujgTxofj00VRJM
	 WwhBg+9npeSIX0m1lJMP877j9Y/AmNMl3/frgxTchEGe6EkNK1QOJJdSoEWdpMHA88
	 OBUPUDXg+FYpinYgkQw7S6jAEBfUgRd8HcRcX/Rk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:47 +0200
Subject: [PATCH DNI 21/26] media: pisp_be: Start and stop the media
 pipeline
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-21-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=NRkJxIVd0ZlILnv8udnGakJfoaHUIwP9DNE9boCy8vE=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRRnPxjMuVJs1HDTPiwMpU50liJADhwZgbZ+
 3n0peOrAiaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUQAKCRByNAaPFqFW
 PKqND/9lgHHdpWtrKrn0s9fq2BS22V66oiOoXeL8C/PTv242eTMZeOE94cLl9MbKi4o+5xPUSgF
 BeOjGegTyWCk9qatrxSXUbEIlx98/xRYLXW6k27iRYnM9mSy2VGrG/R/Os+jhwDjC+FhXRoAcj1
 438gbXywzXL1ywduiOQI5XFleXFU0hnet4mRrNDVDk/oZhBC/e+79ucyLeNSYpfUaAuv6IDub68
 jMNrSN729Cr7IWSOIqtzcz0xL8+81s8VY0pBCoFEspXC5CAt+1UQerJJJWGTR0lwwGdfT131EY3
 pzv8dR+EEHF/5Y10fG4GkqmQMNY1K5WWbX8I4NSFSn37M7H1iQ22PTVkiWyXaI+NU5WMJN98EJV
 la/yOjYj0cCpdMlL2qWs3v9spHNpfBJ3KjGhh141hwkOj49CB5xoEakxlinG8nZX+q03FF41wKG
 QPDrk4+zDNA8ZJBwGCWtTJFatlK1s5JEaaldh6FmuP3gzsT2usT5fAbrzhg/mDT2DwskRjbUiCC
 d36/yQrpr7Z/G20fbDWHjFKJ9BIRmrR4wLyvmWLUDMSv1RksKgBXJjpGn/RzJdJGZFWJzNXmqoG
 4oF+g2oqfjhLklBeGkcvdSPI8xUAKGB3vtA96BOx4dI6HDcxbudyhriK2e9SE9MUg7vmyxzBI57
 ELeGa7Yq1gwaB4g==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Call video_device_pipeline_alloc_start() and
video_device_pipeline_stop() at streaming start/stop time for all
video nodes.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index b30891718d8df9c48ce1b83ad9fcafb201105625..423cb21298309c2ba51214b129fbf6e875370c98 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -878,6 +878,10 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret < 0)
 		goto err_return_buffers;
 
+	ret = video_device_pipeline_alloc_start(&node->vfd);
+	if (ret)
+		goto err_return_buffers;
+
 	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
 		node->pispbe->streaming_map |=  BIT(node->id);
 		node->pispbe->sequence = 0;
@@ -933,6 +937,8 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 
 	vb2_wait_for_all_buffers(&node->queue);
 
+	video_device_pipeline_stop(&node->vfd);
+
 	spin_lock_irq(&pispbe->hw_lock);
 	pispbe->streaming_map &= ~BIT(node->id);
 

-- 
2.49.0


