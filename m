Return-Path: <linux-media+bounces-2541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F2F816A4A
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 10:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 897CB1F2304F
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 09:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC35D12B72;
	Mon, 18 Dec 2023 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aVIleK3A"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7061F125A3
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702893399;
	bh=aZxFvBCzVGWidU55REJGWf/K6aRmbdrMYFMczhY/jzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVIleK3ASDA5MRXCizrOeRBJTmmNfgDUB1qTO26mIJjrTMEGbouW3nbc9Y1L6ZJv9
	 KUoNdVZAl88+KQTpGRIXnai9VSIfEGZS3e4bOzwgYQztQg1UBh0wDdQ/LPXg1j1/9y
	 BoogXa8cYbdUDQ/g9FugsONUaZ0FdBDEPcbi15A38BqoNgPyXnspWRxRayfkOCxfFe
	 lK82ialIYrnwMbT+ybRGWLkqcvrbgzCTe9VQj4esgfFC/uOIRvYRH5PBIByIuHReCZ
	 dDdBZDA0Y6obhI9eZesE7ACOMOB9lGzt3H+8ugLg0LpuNcHoFQ41n7J2eg662Flw1n
	 jAuEpVsFeokXQ==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 13F74378143B;
	Mon, 18 Dec 2023 09:56:39 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: j-luthra@ti.com,
	mchehab@kernel.org,
	mripard@kernel.org,
	sakari.ailus@linux.intel.com
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 1/5] media: cadence: csi2rx: use match fwnode for media link
Date: Mon, 18 Dec 2023 10:56:00 +0100
Message-ID: <20231218095604.1950737-2-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218095604.1950737-1-julien.massot@collabora.com>
References: <20231218095604.1950737-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some subdev the fwnode is the device node and not the endpoint node.
Using the subdev fwnode doesn't allow to fetch the subdev
pad we are connected to when the remote subdev has multiple
output pads.

Fixes: 1fc3b37f34f69 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 91ef22e9109a..e83b877c48da 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -467,7 +467,7 @@ static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
 
 	csi2rx->source_pad = media_entity_get_fwnode_pad(&s_subdev->entity,
-							 s_subdev->fwnode,
+							 asd->match.fwnode,
 							 MEDIA_PAD_FL_SOURCE);
 	if (csi2rx->source_pad < 0) {
 		dev_err(csi2rx->dev, "Couldn't find output pad for subdev %s\n",
-- 
2.43.0


