Return-Path: <linux-media+bounces-3226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 220EB82506D
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 10:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 479BC1C20CCF
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDF922F13;
	Fri,  5 Jan 2024 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="vIrnjShx"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24719225AD
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704445247;
	bh=vYij0IphN1dkavCSb/lN9KMHeGQ/4DQoaD0MHdFEQ6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIrnjShx+UDMsvvaH/BwBxN7TJ5728zHAWuuOLoJJix/dazdKbbJnGtatgBAy3Yzz
	 d4d4yQnHcd3LjZ4a1EAQaki7GLkaIEli4hI3kR4stiXoEL51v3dWPYsJlE12m/XHmy
	 uy4qO3MDJEwSPsShzRK45HNpXCn5P8/zen95f7oVUq9pNHkfqNkwEYpJNua06xZt6x
	 MOxtC5dR8RgkmaC4mQ5N8QeYVBOCGTXDb6fnqlzhH/oP68+HJzUnSADJB0IvRTKyjI
	 wvnTI7tzZO0toG0O6Dzg1DPqTsOdCK+MoLWKOF3JBw5uQEkGwynINEgn8gewqCExuJ
	 84Sl0t7ewD2TQ==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AEB8F3782002;
	Fri,  5 Jan 2024 09:00:46 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: j-luthra@ti.com,
	mchehab@kernel.org,
	mripard@kernel.org,
	sakari.ailus@linux.intel.com
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v3 1/5] media: cadence: csi2rx: use match fwnode for media link
Date: Fri,  5 Jan 2024 10:00:21 +0100
Message-ID: <20240105090025.1245112-2-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105090025.1245112-1-julien.massot@collabora.com>
References: <20240105090025.1245112-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 1029939b3782 ("media: v4l: async: Simplify async sub-device fwnode matching"),
async connections are matched using the async sub-device fwnode, not that
of the endpoint. Fix this by using the fwnode of the connection match to
find the pad.

Fixes: 1029939b3782 ("media: v4l: async: Simplify async sub-device fwnode matching")
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


