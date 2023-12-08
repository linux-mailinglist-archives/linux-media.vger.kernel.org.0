Return-Path: <linux-media+bounces-1981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5659E80A744
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FA46281C43
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D621730342;
	Fri,  8 Dec 2023 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XoGlIMyz"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9372FB
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 07:23:38 -0800 (PST)
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FD7E66073BF;
	Fri,  8 Dec 2023 15:23:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702049017;
	bh=8K5r82lr6/FS1WCeVe8W58vchtyHKQokA1fblw9doF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XoGlIMyzuxw4F15k6ixOKJg9gTQEGpPy7SgmvREpwO+1KMrZSuAkHhvyj1JftlQY2
	 k96g77F8/z7dz9YMfG0A9sWKd6VEpKmSUPQbSN2tdNlgxGsU8RtUQTd0VLSRIAPuYa
	 EaCxdc0EDbxLcAXYahPVY3XQgW0s8GoIL0hDiz9f4eIfvEdrckpH1FxmvPcBK3lmA2
	 BVViJ7Fx9eCPXqg2zwqmLipe77ILsungdV3AM2ePWcauLaEDugJlJLfWIOidNzPeTc
	 byghDW6XmhuEkQh6q7PO9AF2kYMPVA7Ev0RLSVqZplcX//Ftx6TvbIH784peFNXg7q
	 XP1AGjEek6/1w==
From: Julien Massot <julien.massot@collabora.com>
To: linux-media@vger.kernel.org,
	j-luthra@ti.com
Cc: kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 1/3] media: cadence: csi2rx: use match fwnode for media link
Date: Fri,  8 Dec 2023 16:22:53 +0100
Message-ID: <20231208152255.472467-2-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208152255.472467-1-julien.massot@collabora.com>
References: <20231208152255.472467-1-julien.massot@collabora.com>
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

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index b751227fc8a0..b9356cc7a192 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -464,7 +464,7 @@ static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
 
 	csi2rx->source_pad = media_entity_get_fwnode_pad(&s_subdev->entity,
-							 s_subdev->fwnode,
+							 asd->match.fwnode,
 							 MEDIA_PAD_FL_SOURCE);
 	if (csi2rx->source_pad < 0) {
 		dev_err(csi2rx->dev, "Couldn't find output pad for subdev %s\n",
-- 
2.43.0


