Return-Path: <linux-media+bounces-1475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A2800CCF
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 15:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C19DE1C20F0B
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 14:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA38A3D3A9;
	Fri,  1 Dec 2023 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bs4yQcW/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6D094;
	Fri,  1 Dec 2023 06:04:56 -0800 (PST)
Received: from pyrite.hamster-moth.ts.net (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22F67138C;
	Fri,  1 Dec 2023 15:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701439457;
	bh=6zAIEj5ay2gT7+AvgvT+WUyzdRwwv76PYE4uLNb3qOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bs4yQcW/vUdx9xaVmGD7CpLkHEu69wWuVl/djvZU0fy+fZTmDBUhNtZ6czqnNIUPs
	 aM1PGitQ4siHqyu2UvsLCVLdAXLNbiG2JcPzLNTDHDBj5CZhF0NJ5R8ZKW+DSb8sKo
	 gMcrmimq8GEvoBE0Pn+B+/SeLldJcmSmUX1T9/3Q=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: laurent.pinchart@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	Paul Elder <paul.elder@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/4] media: rkisp1: regs: Consolidate MI interrupt wrap fields
Date: Fri,  1 Dec 2023 23:04:30 +0900
Message-Id: <20231201140433.2126011-2-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201140433.2126011-1-paul.elder@ideasonboard.com>
References: <20231201140433.2126011-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate the wraparound fields in the memory interface interrupt
status registers, so that it can be more succinctly expressed by taking
the stream ID (main or self) as a parameter.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index 350f452e676f..bea69a0d766a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -172,12 +172,9 @@
 #define RKISP1_CIF_MI_FRAME(stream)			BIT((stream)->id)
 #define RKISP1_CIF_MI_MBLK_LINE				BIT(2)
 #define RKISP1_CIF_MI_FILL_MP_Y				BIT(3)
-#define RKISP1_CIF_MI_WRAP_MP_Y				BIT(4)
-#define RKISP1_CIF_MI_WRAP_MP_CB			BIT(5)
-#define RKISP1_CIF_MI_WRAP_MP_CR			BIT(6)
-#define RKISP1_CIF_MI_WRAP_SP_Y				BIT(7)
-#define RKISP1_CIF_MI_WRAP_SP_CB			BIT(8)
-#define RKISP1_CIF_MI_WRAP_SP_CR			BIT(9)
+#define RKISP1_CIF_MI_WRAP_Y(stream)			BIT(4 + (stream)->id * 3)
+#define RKISP1_CIF_MI_WRAP_CB(stream)			BIT(5 + (stream)->id * 3)
+#define RKISP1_CIF_MI_WRAP_CR(stream)			BIT(6 + (stream)->id * 3)
 #define RKISP1_CIF_MI_DMA_READY				BIT(11)
 
 /* MI_STATUS */
-- 
2.39.2


