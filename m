Return-Path: <linux-media+bounces-17676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB4B96D706
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DFEF284DE4
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A591219995E;
	Thu,  5 Sep 2024 11:25:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF049199947;
	Thu,  5 Sep 2024 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725535518; cv=none; b=X7Ax0zws4UAMC7aIagbav4JDOaxKPU54CVmrm7pLBL3J2LYETPdpLb69wnUxj4exVdfJ8uR3K7XluzZaAQR6Nj2KaRJGf0C9Sum5U2s9ii2PuV6DHFe8iGIgjBZXpZ6hR14QWoeULgLYbpz0B5D2A2O102bNRnHshLc8vYA4T+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725535518; c=relaxed/simple;
	bh=EWTfBs+uWTA9OtruiYJeZwqDqNVcY059DYEzHwpGh0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RNxAKN7I0AlajEp8iQGuJLsCISox61sdhuZjmc+9NZWGhQUcDeNch+rpGtc8rv4BztRzSJYqz8Sl7tl6sddOYdLYZz+EOniNLYQIcI9msj8wrnm4+zQXXJgdqGYpd4BLvyCfqTmG5d3AmZLxIwUkQB/iOFpKJZf//8Sm+m3xdsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,204,1719846000"; 
   d="scan'208";a="217640246"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Sep 2024 20:25:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.27])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 228CC420ED40;
	Thu,  5 Sep 2024 20:25:10 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Pavel Machek <pavel@denx.de>
Subject: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Fix the comment in rzg2l_cru_start_streaming_vq()
Date: Thu,  5 Sep 2024 12:25:05 +0100
Message-ID: <20240905112508.160560-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "buffer." -> "buffer", for consistency with rest of the
comment blocks in rzg2l_cru_start_streaming_vq().

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/all/ZtWNFuw70nkB37EK@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch have merge dependency on [1]
[1] https://lore.kernel.org/all/20240826110740.271212-1-biju.das.jz@bp.renesas.com/
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index bbf4674f888d..d17e3eac4177 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -648,7 +648,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto assert_aresetn;
 	}
 
-	/* Allocate scratch buffer. */
+	/* Allocate scratch buffer */
 	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
 					  &cru->scratch_phys, GFP_KERNEL);
 	if (!cru->scratch) {
-- 
2.43.0


