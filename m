Return-Path: <linux-media+bounces-1814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B64F3808661
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CA7E28264F
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 11:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646FC37D0E;
	Thu,  7 Dec 2023 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Jln88Cw8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83768E9
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 03:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701947363; x=1733483363;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a0+x51kZnb8HjPt9/EmhVnNBvfgw6ppyre9ujfxe3DA=;
  b=Jln88Cw8e5hjtG61M120sh5/OPSczDXGY72NpnDxp0/epKGMGgDC+2kI
   hORXCRhBSkQkJJUGloBkk58vigXjwPzf/TTjowB9qSCEPzpK1CBU9fhEu
   /P0BD0qw0E5HyJT/HX0H5W2jpq+sv9k8QSPwpOF9Xe/AzfXsl05CbsUJI
   vzfIHlZ7khHieq9mjiBcH2WZBpQHCH1rrbzPibT/+7g1LaGNNYWnJfeaU
   iB/W263RUzsp6JjchazSlioFLEpdYBdORsmga8E96PFCJNOLlm3PZgtXd
   11iXWmt/iOwsmcQA0iTILQquFxgUYpoP/qaGTcTkLVxELAjy+ntsasHGq
   w==;
X-IronPort-AV: E=Sophos;i="6.04,256,1695679200"; 
   d="scan'208";a="34381294"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Dec 2023 12:09:21 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 89C90280075;
	Thu,  7 Dec 2023 12:09:21 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/1] media: nxp: imx8-isi-debug: Add missing 36-Bit DMA registers to debugfs output
Date: Thu,  7 Dec 2023 12:09:18 +0100
Message-Id: <20231207110918.1338524-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The extended address registers are missing in the debug output register
list. These are only available on 36-Bit DMA platforms. Due to the
prolonged name, the output width has to be adjusted as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Split register set into regular and 36-Bit DMA only
* Adjust output width to address longer register names

Currently only tested on TQMa8MPxL (imx8mp-tqma8mpql-mba8mpxl.dts)

 .../platform/nxp/imx8-isi/imx8-isi-debug.c    | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
index 6709ab7ea1f3..398864b5e506 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
@@ -22,10 +22,11 @@ static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)
 static int mxc_isi_debug_dump_regs_show(struct seq_file *m, void *p)
 {
 #define MXC_ISI_DEBUG_REG(name)		{ name, #name }
-	static const struct {
+	struct debug_regs {
 		u32 offset;
 		const char * const name;
-	} registers[] = {
+	};
+	static const struct debug_regs registers[] = {
 		MXC_ISI_DEBUG_REG(CHNL_CTRL),
 		MXC_ISI_DEBUG_REG(CHNL_IMG_CTRL),
 		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF_CTRL),
@@ -67,6 +68,16 @@ static int mxc_isi_debug_dump_regs_show(struct seq_file *m, void *p)
 		MXC_ISI_DEBUG_REG(CHNL_SCL_IMG_CFG),
 		MXC_ISI_DEBUG_REG(CHNL_FLOW_CTRL),
 	};
+	/* There registers contain the upper 4Bits of 36-Bit DMA addresses */
+	static const struct debug_regs registers_36bit_dma[] = {
+		MXC_ISI_DEBUG_REG(CHNL_Y_BUF1_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_U_BUF1_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_V_BUF1_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_Y_BUF2_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_U_BUF2_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_V_BUF2_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_IN_BUF_XTND_ADDR),
+	};
 
 	struct mxc_isi_pipe *pipe = m->private;
 	unsigned int i;
@@ -77,10 +88,21 @@ static int mxc_isi_debug_dump_regs_show(struct seq_file *m, void *p)
 	seq_printf(m, "--- ISI pipe %u registers ---\n", pipe->id);
 
 	for (i = 0; i < ARRAY_SIZE(registers); ++i)
-		seq_printf(m, "%20s[0x%02x]: 0x%08x\n",
+		seq_printf(m, "%21s[0x%02x]: 0x%08x\n",
 			   registers[i].name, registers[i].offset,
 			   mxc_isi_read(pipe, registers[i].offset));
 
+	if (pipe->isi->pdata->has_36bit_dma) {
+		for (i = 0; i < ARRAY_SIZE(registers_36bit_dma); ++i) {
+			const struct debug_regs *reg = &registers_36bit_dma[i];
+
+			seq_printf(m, "%21s[0x%02x]: 0x%08x\n",
+				reg->name,
+				reg->offset,
+				mxc_isi_read(pipe, reg->offset));
+		}
+	}
+
 	pm_runtime_put(pipe->isi->dev);
 
 	return 0;
-- 
2.34.1


