Return-Path: <linux-media+bounces-1724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F6806AF1
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 10:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F05A61C20850
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 09:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500701BDDA;
	Wed,  6 Dec 2023 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="qYh9pD04"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29589AB
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 01:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701855846; x=1733391846;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tETj21Fu9I358pJ0uzujFXz5/dtU7Q6TGXtf4wvjMb4=;
  b=qYh9pD04ISPyLQS7S5x6NomcSJxlw1f+SsAa41BnsFBvKEfz2vhkZuIB
   bw8BZpUXsVzkaS8RMGnusAjiWbtgzTG3kieo35EqMkwfy78MVnWmSaSXS
   ApJ4hnE43cYqpUSwCP5BcS+Kk5PO1Woh0dCghV3GMNZOdgvot3BEhyOUs
   mI2rmQzvSPz68Xs8Q0Ei4RP+pa1ScR7mJLFX09IkTVaD5eFRpZUCcUkqk
   ean4bPhtDNCy5qP1uCo46s/ynWQAotd6s5ddTEaDgzkzNM3oIdtL/J7KT
   yLZqkAZpdJ39WG3QV0s+98pysCWhZfjkKlwYtQ+NKOBGeUMG2Rs0Z90lW
   g==;
X-IronPort-AV: E=Sophos;i="6.04,254,1695679200"; 
   d="scan'208";a="34354274"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Dec 2023 10:44:03 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A4A36280075;
	Wed,  6 Dec 2023 10:44:03 +0100 (CET)
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
Subject: [PATCH 1/1] media: nxp: imx8-isi-debug: Add missing registers to debugfs output
Date: Wed,  6 Dec 2023 10:44:01 +0100
Message-Id: <20231206094401.491100-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The extended address registers are missing in the debug output register
list. Add them.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
index 6709ab7ea1f3..3ac5685d6cc1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
@@ -66,6 +66,13 @@ static int mxc_isi_debug_dump_regs_show(struct seq_file *m, void *p)
 		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF2_ADDR_V),
 		MXC_ISI_DEBUG_REG(CHNL_SCL_IMG_CFG),
 		MXC_ISI_DEBUG_REG(CHNL_FLOW_CTRL),
+		MXC_ISI_DEBUG_REG(CHNL_Y_BUF1_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_U_BUF1_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_V_BUF1_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_Y_BUF2_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_U_BUF2_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_V_BUF2_XTND_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_IN_BUF_XTND_ADDR),
 	};
 
 	struct mxc_isi_pipe *pipe = m->private;
-- 
2.34.1


