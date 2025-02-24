Return-Path: <linux-media+bounces-26871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EBBA42D91
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 21:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8CEA170480
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 20:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC230206F16;
	Mon, 24 Feb 2025 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AyUv4in6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04B8244E8C;
	Mon, 24 Feb 2025 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428405; cv=none; b=CojusZNi6FB2oMIsOyay2W64m+FTp5XpWcD63uwaCGwbizStnthXDdGEN11Xx8Nbvl4ixE+7oEASiQQFU7YBzgjNOCR35sfOsZ1z4f7G5T/WdX4qBpcPn79j/RBDZ6X/pkin20e9GP5Nv5bd9aaq5jsolDu6ZQ5aOi4MSWlAVRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428405; c=relaxed/simple;
	bh=eFBbTPMz4pjW3upJItf+CF0P7+hXPrFgG06nWdnmCeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NxVVWGqLv15RTa7xfDch9l78U2+Hcos+J5jjJZlt/dOOJqfQZ59qbfBIZUKJlX31aXePi9rUHKtplVzvzFpTy8sojhyKdmaST7XS7QvyxopnuoaIOvXJDa+lICBZGUdYKJcJ11FbC6F5JgU/ozfrZYDywPus4bb4HHew9ifn/Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AyUv4in6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2ADBA57;
	Mon, 24 Feb 2025 21:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740428312;
	bh=eFBbTPMz4pjW3upJItf+CF0P7+hXPrFgG06nWdnmCeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AyUv4in6CuvuGzLpT/0SRCmHpdMbAxSsxd7TBOtYB3mwzaLRAioBj7u4Q6BIuJLdY
	 2r9igSHBGSl48Yl6Qj2p2TBFiEUoSqDMV1Hmo8Q9ii1YUVFKuDNBW2ldefZn9TkK3M
	 1N4Em3QzKdcYqq4WPjW1bv8QVGSWgZbRkKZJtLY8=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 24 Feb 2025 21:19:42 +0100
Subject: [PATCH v2 2/6] media: vsp1: Clean FRE interrupt status
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-v4h-iif-v2-2-0305e3c1fe2d@ideasonboard.com>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
In-Reply-To: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=eFBbTPMz4pjW3upJItf+CF0P7+hXPrFgG06nWdnmCeI=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnvNRreBzdqHE3ZhS59B4jINNiXscmvN0ICswOo
 yfT+XOF6jaJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ7zUawAKCRByNAaPFqFW
 PDlJD/96ziesFu2RNAVtkVuwEZRzOKxp323WlWwgxrZhmWNkYyDVjEkkY/7F1TQLtKl2yybUPtg
 aB4tfVoTxnJro035mjP8+ZbYlh5hdB38Vp+cGgZWvrosVlrhnaD5sKHe5xbeh2ixY8VTsZx39sj
 +FjjZgAJREHk8flZ1lwKslsHOIr5Fg07hju17JOUj5PIjWHcftA91uJ2RVsIMiHKJmYbSSAgXyP
 6hYtiGZHhSnWhRW5T9xjy4zdHw3NFfle2/BF4GEV602KsuPC8EvpDasJv5pEffXUFogpuJXpeqO
 8YyIOm+euKFnrVy2n1zHqRznkPJVAQgl+FvwbeqLELB60/H1citF0kEdKlyBMyK9wEFd6fjsHdR
 gx6Ap6YpapUjj2Zo+PKvEZ7qQiJ5qzVSEhXUz9UtIxeACuoUQI2IY+gHF95t9EZRKR4yD5mDTW7
 kLzdLapxMpYW/w87qKN5olZN9YLbb2XF2rEkHT+wQBlHj4DmzoWRUMgU/pDI3xdkcdf1AjAHQ11
 zPOGGXS9J3C423gDShSFJsLr+MRvEmdMQ56nKPJK/dqe4jZN7sg/1mTCU3ZUYaim/jqoNAgqghy
 hQm1hMV5cHZIDgm1EYmtfWkPMPNFKFaAqkwRnFE/y0TyYxFybroyKqbRgemiDuGVlWfBRqMlaBq
 chWR4PvAflGvZpQ==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The VSPX generates "FRame End" (FRE) interrutps, one for each
buffer transferred to the ISP.

Even if the FRE interrupt is not enabled, it is reported as active
in the interrupt status register.

Make sure to clean it when handling the interrupt.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index d13e9b31aa7cff8610ea196ae4de88ab22e44e0f..17ace4c6844d19aaafc27e79f016cc05091372bf 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -69,7 +69,8 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
 				i, wpf->entity.pipe->underrun_count);
 		}
 
-		if (status & VI6_WPF_IRQ_STA_DFE) {
+		if (status & VI6_WPF_IRQ_STA_DFE ||
+		    status & VI6_WPF_IRQ_STA_FRE) {
 			vsp1_pipeline_frame_end(wpf->entity.pipe);
 			ret = IRQ_HANDLED;
 		}

-- 
2.48.1


