Return-Path: <linux-media+bounces-38406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 691CDB10D35
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A653E16BA17
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2F72EBB9D;
	Thu, 24 Jul 2025 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UlL2edDM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517F2EB5BF;
	Thu, 24 Jul 2025 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366270; cv=none; b=VuQinvCS+PpIg0UlR3Oqlb9tVDZBwG1XS6y7y1rumGh7R8rJRMt/YfXGBBvms0KGAQ8L0auCG8i9A7ePudjqjHPMPHFwcumbTeLJbxDmSPHpY1ZMMxu/tx4NMElwFsFCi10QRYTD54dnuDrxeH3dSAvsc+alRLtjjtHQeKGY9Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366270; c=relaxed/simple;
	bh=NRkJxIVd0ZlILnv8udnGakJfoaHUIwP9DNE9boCy8vE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHeutNOegI9GFX2MQYenjh+6jlLDe6Nup2RaxJrqhQv+MygjMIOTz/O/AaYDHDQG0n83pYHhiFP5hkkalEx/e3DolZE/ihBAw04DioUdHIOIb8tQ5UR57BZGMvv/4QcGQVJPR7S6ICzeMvpAVS4lu5w0RPn3VFvrnRZIWrrXfWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UlL2edDM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DB6E1AE0;
	Thu, 24 Jul 2025 16:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366215;
	bh=NRkJxIVd0ZlILnv8udnGakJfoaHUIwP9DNE9boCy8vE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UlL2edDMMY3vE+u6qV+WJ5BxDywdBIyB7RAh+Z1A2BSwPLSD/Tjbt5wH7jSgmXo2S
	 pGBRsikEUIjG95tu0BC/fX+ieONc23GevfVFtkRlG6l/cs2+R/12EmFf/5GGga2ti2
	 Yh0gHaKR3Na2WZ19pYJNQxwVJ5K8BZ+kgX9479Zs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:29 +0200
Subject: [PATCH DNI v2 22/27] media: pisp_be: Start and stop the media
 pipeline
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-22-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7QEP+68dq8KkWsJ+v1ViUzSitaYErWzTwC/
 sRx00/o4rWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PGUtD/sGh0joplnq6k8QTbkDJBZ7jg6en6tZ4O2bziq8gjtTEVqGjo6UzEq3/UweR5JgoZBb1/k
 Tx1QTAG0XQoByC1DXrmtvmywS+XInxq5IYbgYMAUXOU5uVhYsuewLsp4Agy4zYV3j4Xe/jHC0XZ
 YgLcevIjOuTFEFWEt0/aD/zvlF3gKqC24dX0fnHwxvU0MQbB8rdZCvgQFUdjrTtdeqD57bU8Uso
 H5XbNZpI5rxaNYKtt2OxPTTEfPENl7CxH0djPgtmT+hAutEd7i5KuTQbaaN0FjTV2RpIx3/Qfah
 VZOcfW2Qpeg6LVCBY5p1HjwzVDsxGeTwsKI7ZtIZvmlp2uffKF7QpQ1h4lJ/yRn8icuiVgoQaBi
 SkxqeU2qvUzeXb/kYEjpS01FX5pq4tMTeSJB2Tgd4yREA1S/+RQcQG9nFvWVdlMw+0nQuSttOMC
 qJNKCcMa87drjlDepLc9wMtSC5PzlGwJ8p1kBibetqLF2ZlxMQGBsZ+4KYBBUTKkwGhAz0LbXPf
 m3xRQ80J+9pkklAc0OfOHXwXjDPZ+ju9eFD24deqbVNLQJ3xj+OXMdWWCh7p7q1eY1waEBdNvmw
 zxSmDb3WIy2ThJL9y/r+52Usz+LasLT4o+qHPz+6yrtPHjZZLmm7fZ7sp8NCupM3s1wxJnt/zTK
 4NxoG8FwDE/wjcA==
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


