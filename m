Return-Path: <linux-media+bounces-28085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA30A5DB4D
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 12:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B6287A2E6B
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 11:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7373B23F289;
	Wed, 12 Mar 2025 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KLE/CqEM"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027A12C190;
	Wed, 12 Mar 2025 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778534; cv=none; b=Tw7nf/TYu2ZVCKptWodd9yst552blszw3z0SfltPXqZQ0mRYYvg+GH6rOrGKF3HWzKndRiPYfa7vkX5ooSgMXYJf+hvgJb4os9O2cTe0ukUeLhB0Ssxf/TWkjOTfwyvaHi9uWUihIsEEkaV/KeMWqdPvzHTZ0ng6Ur2FCWXzqMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778534; c=relaxed/simple;
	bh=r4UtDqttS3td9wq7cG5SlG2fWfSXqZ4cwwc1WIm4/pk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KpYA7xJllKgi+FaEi4oas6XAo2Cb6l6Q7OgDtb/iheY3SK0gozehxCgq4cUn4K9qlKFmVwdXYq3+ZTRxVymGgfB67x98MfO9Nvphubfjw7+R+PQ41XO4Z1H+0EiCRPzfkzyfPm4Jl0MU+/EdJtwdqKzIKI8ZNA5qW6o68hFF9uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KLE/CqEM; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CBLftx1044961
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 06:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741778501;
	bh=hJlnPKiZhJFQrE0s110HOAEmMxXkxOy2RoLFvgXBgbY=;
	h=From:To:CC:Subject:Date;
	b=KLE/CqEMoEwkvn9y4LARMrYq1/D6ncNq3HPMEAM1abAxMgMgGnxImDQrpOWjj5vY8
	 eN8b/6+crnWSqbLOKgJHjAT95kfvJaf+C4BrU8d6OwNY7U98XbbCZUY5Tnr1CthcQt
	 8/M4nLgBfFND+ezcmZibfl0gt2eVv8bunZxS82bo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CBLf5W105432
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 06:21:41 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 06:21:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 06:21:41 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CBLeSM024153;
	Wed, 12 Mar 2025 06:21:40 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <jai.luthra@linux.dev>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <s-jain1@ti.com>, <r-donadkar@ti.com>, <devarsht@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>,
        <tomi.valkeinen@ideasonboard.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH] media: ti: j721e-csi2rx: Allow passing cache hints from user-space
Date: Wed, 12 Mar 2025 16:51:40 +0530
Message-ID: <20250312112140.449765-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

User-space can provide cache hints to enable software managed cache
operations or skip certain cache operations using memory flags
and buffer flags. This is useful for SoCs such as AM62px
which do not support hardware cache coherency.

This is tested on AM62px with yavta capture by passing
V4L2_MEMORY_FLAG_NON_COHERENT while using VIDIOC_REQBUFS
and V4L2_BUF_FLAG_NO_CACHE_CLEAN while using VIDIOC_QBUF
and ~5x reduction in memcpy time is seen for
copying captured frame to DDR as shared here [1].

[1]:
Link: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1452545/am62p-the-ads6311-radar-camera-has-lost-frame-capture/5580472#5580472
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6412a00be8ea..284d33b2a0ec 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -895,6 +895,7 @@ static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
 	q->dev = dmaengine_get_dma_device(csi->dma.chan);
 	q->lock = &csi->mutex;
 	q->min_queued_buffers = 1;
+	q->allow_cache_hints = 1;
 
 	ret = vb2_queue_init(q);
 	if (ret)
-- 
2.39.1


