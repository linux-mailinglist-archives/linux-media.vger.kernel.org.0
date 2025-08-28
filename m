Return-Path: <linux-media+bounces-41253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4163B39F80
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 15:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6486C7C19C1
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 13:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9263101B1;
	Thu, 28 Aug 2025 13:58:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4D30F944;
	Thu, 28 Aug 2025 13:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389531; cv=none; b=PM30Kjd/TgmqLdRToThDuqov0eC7w8PcgEqYuTRoKEVKOBi+d73VGMQr/Ty2OBLwQ8KT4PNCrFt/iGXmmgJKJr2EQLEGnPGluxrPRgVFC18aoakMzCGSW7lV3jNpW1Oi78+t+kfZlbLODTQuiVJJ4uKtF+sDoeLCEnpxXFLhyv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389531; c=relaxed/simple;
	bh=h0pnYiLpVOm9ScPXci3LHPTFEOcR0Th23+I4oCnDGo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pB4wo9sfJ+lCSZdB0/t5eeKBy5QV9pMMsT5K6SVM4mb+tgW9h63oDka7bovWIFqH9JT/dikClog8nDQEdfwycvBWp6PEb1EfplEh4j3IYdvJ4wi7knOGOgIOde2XBVW5v7xVpOhLrGw1Mz0JdK1xEpR4/n2QryipdCy/zI7xI4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 0D76E1F0003D;
	Thu, 28 Aug 2025 13:58:48 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 683AAB02226; Thu, 28 Aug 2025 13:58:47 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 1B81BB02226;
	Thu, 28 Aug 2025 13:58:21 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] media: verisilicon: imx8m: Use the default Hantro G1 irq handler
Date: Thu, 28 Aug 2025 15:58:20 +0200
Message-ID: <20250828135820.1859316-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing imx8m_vpu_g1_irq implementation is an exact copy of the
default hantro_g1_irq one. Switch over to it instead of keeping a
duplicated implementation.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 20 +------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index 35799da534ed..f9f276385c11 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -234,24 +234,6 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 	},
 };
 
-static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
-{
-	struct hantro_dev *vpu = dev_id;
-	enum vb2_buffer_state state;
-	u32 status;
-
-	status = vdpu_read(vpu, G1_REG_INTERRUPT);
-	state = (status & G1_REG_INTERRUPT_DEC_RDY_INT) ?
-		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-
-	vdpu_write(vpu, 0, G1_REG_INTERRUPT);
-	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
-
-	hantro_irq_done(vpu, state);
-
-	return IRQ_HANDLED;
-}
-
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
 	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
@@ -328,7 +310,7 @@ static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
  */
 
 static const struct hantro_irq imx8mq_irqs[] = {
-	{ "g1", imx8m_vpu_g1_irq },
+	{ "g1", hantro_g1_irq },
 };
 
 static const struct hantro_irq imx8mq_g2_irqs[] = {
-- 
2.50.1


