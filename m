Return-Path: <linux-media+bounces-252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A437E9E2B
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 15:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 318E0B20A15
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B0C210EA;
	Mon, 13 Nov 2023 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vw8320/h"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBB220B3D
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 14:08:10 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704B1D59;
	Mon, 13 Nov 2023 06:08:09 -0800 (PST)
Received: from umang.jain (unknown [103.86.18.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 615B429A;
	Mon, 13 Nov 2023 15:07:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699884462;
	bh=0lpguXFbz+BKP5/xOg3wKVbLHMvejhbyqPq3tWfOpfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vw8320/h6jsPmLMJaAydytdZvVXuYaR/TGM5BFP5aAcaHF2GVxAPsBNFBwSk65OoD
	 H2c6K3n7ZzcJ9HgTa30mR4JrkQB9cCHtl+HGCLtVMSdLosVIBXglhXXHlXM6ZkQz7c
	 E8um6fIzYKEZNvgfksMTt8Wxl6LNxiVkBZalm7/g=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org,
	kernel-list@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Dan Carpenter <error27@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] fixup! staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component
Date: Mon, 13 Nov 2023 09:07:55 -0500
Message-ID: <20231113140755.425365-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109210309.638594-11-umang.jain@ideasonboard.com>
References: <20231109210309.638594-11-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setup DMA Mask
---
I realised while (re)creating the test branches (sent in reply to the cover
letter), I missed to squash this hunk in
"staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component"
before sending out the series.

Sending it as a fixup! for now. 
---
 .../staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
index 316d35d5f19d..4a23f9feb6e4 100644
--- a/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
+++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
@@ -1774,6 +1774,12 @@ static int bcm2835_isp_probe(struct vchiq_device *device)
 	unsigned int i;
 	int ret;
 
+	ret = dma_set_mask_and_coherent(&device->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&device->dev, "dma_set_mask_and_coherent failed: %d\n", ret);
+		return ret;
+	}
+
 	bcm2835_isp_instances = devm_kzalloc(&device->dev,
 					     sizeof(bcm2835_isp_instances) *
 						      BCM2835_ISP_NUM_INSTANCES,
-- 
2.41.0


