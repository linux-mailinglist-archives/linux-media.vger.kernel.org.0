Return-Path: <linux-media+bounces-25218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00709A1A856
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 18:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FD61188C322
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 17:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF48714F9ED;
	Thu, 23 Jan 2025 17:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KqafMyie"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09A6149C4F;
	Thu, 23 Jan 2025 17:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651885; cv=none; b=pe9LVsbkkapY5xGjkXIOmkhSHXbTpgi11l15vS6oKmYla+8d3cehqk8rgfIsNVXWGSfl/ByObH4RoANNzm9ierTwlPPEOLT8HUeyBiBH2CdK0vVOcuc+9iOVFEcu60hqQKJ28qAK0YLFexI1gHlRUKQ7EULcJBmSJb67eQJJ3Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651885; c=relaxed/simple;
	bh=jZKh6B50TkxYhqw5Z/u4Kx/iYsZDEdgdZdK+m9No1oQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSLt7h3exZjohWPammTCp5xa8VkqnN1AJ9FmdyXUXBnkllR9lBjE1XnPAiyyn9oWdt+1393tSUx8IY8WTg22Gw3Emk2MxgWXhrtqXzf3ieCqqkzT87wR3P49IX1LVVocYOggWngZXZVS+g2rlBSGREJ6BOJ9mpA3xu8MyJYY0yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KqafMyie; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47987F91;
	Thu, 23 Jan 2025 18:03:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737651815;
	bh=jZKh6B50TkxYhqw5Z/u4Kx/iYsZDEdgdZdK+m9No1oQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KqafMyierUSxBYuquZlhJp3/oCv/uceCiANubf16HjRUgQzPXtwJLACnxGMQ9xBsa
	 oF0vNDczxfDDue9n0rq9iOfe45Ptgjy455ZyZ0B2PGLWdqWDDC3Nmyx7jg8xW8n7CM
	 NHeD5kXlt+xxe5s27AYVwY3mjyoha4wI6YvGO0T8=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Thu, 23 Jan 2025 18:04:03 +0100
Subject: [PATCH 2/6] media: vsp1: Enable FREE interrupt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-v4h-iif-v1-2-7b4e5299939f@ideasonboard.com>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
In-Reply-To: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=jZKh6B50TkxYhqw5Z/u4Kx/iYsZDEdgdZdK+m9No1oQ=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnknak30BWwhfg/hI20CXlvjFY4Mrb5w8g0tsze
 H5V1o3Z61iJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ5J2pAAKCRByNAaPFqFW
 PBzED/oCL+N/G0usGoJehLc1EUWjQ45EcJ9G2ZS4RCDaWP7u+1iGIUN0lm21FWR59vCcm+dL7p2
 aRSzIS81dOIQS58b3zO1s1y/zjmZ9cVuYA9Y3+6Pg4EuF/6qhnVmyXyA8qrjWddf571KYi1zAsy
 0BfzyYn1FW4qwYYOWucq4NrF9rQyO0janmvECooJZBFsOlmCYLSgM23BlZXOaZYAIVJ1h+mOW7G
 EkOKSTIxNLlHkYGku7cC7C+jAAQVygfds2EBrlFgfxaTogqGckGbPQDn12E4A686zbrptx7J42F
 IAYJiWdUYfQQXLaZma91jS+SZMS7yCi+CKRjRWIFJEdfFuzK7jkP6TKULcIBJoVmkWzxLh6N00H
 WlF8oggPUQXsCiMxboaLd7dHpd7g6Hvz4UvrtD4MUIpLuNJJRUIAkFMeua9oU7FVE3JPLF26YdT
 xetrNNBL28yML4C2i2P6ccWiEkFX8ta96tIbNq4Hibyn21J3TBNvcilU/ToGZz46Lqb0OUBHVKH
 roarLKoTyoMzXUQtjtdLZEw6dpF0qXd0uWEtZvQElj6jl1EvleLPM3K/HGlYoxvC2rWNVkxcpi1
 23RDzCpHbt9klyukhsLsAdKcbAUtp0T/euytSkHlZf16i4NO+gQCYu1VocGh+O5dmk0iJ4M2Pxp
 /brcNU+u3jm/q1Q==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Enable the "FrameEnd" interrupt to support the VSPX operations.

The frame completion interrupt signals that the transfer of
the config buffer and image buffer to the ISP has completed.

Enable the interrupt source if the pipe has an IIF entity, such as
in the VSPX case.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 3 ++-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index cbaad0ea0b73f90f3994bbdfb4304d2f71eabccd..5aa0751a896f8a58bd11128ccaa092c9596cdb5d 100644
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
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index f176750ccd9847fdb8d51f7f51a6bd5092b70197..93a663f58a5930a3c7c40a96a30888d0b8ccb2ed 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -239,6 +239,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	const struct v4l2_mbus_framefmt *source_format;
 	const struct v4l2_mbus_framefmt *sink_format;
 	unsigned int index = wpf->entity.index;
+	u32 irqmask = 0;
 	unsigned int i;
 	u32 outfmt = 0;
 	u32 srcrpf = 0;
@@ -312,9 +313,9 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	vsp1_wpf_write(wpf, dlb, VI6_WPF_SRCRPF, srcrpf);
 
 	/* Enable interrupts. */
+	irqmask = VI6_WPF_IRQ_ENB_DFEE | (pipe->iif ? VI6_WPF_IRQ_ENB_FREE : 0);
 	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_STA(index), 0);
-	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index),
-			   VI6_WPF_IRQ_ENB_DFEE);
+	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index), irqmask);
 
 	/*
 	 * Configure writeback for display pipelines (the wpf writeback flag is

-- 
2.47.1


