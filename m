Return-Path: <linux-media+bounces-53868-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMpsOT6To2khHQUAu9opvQ
	(envelope-from <linux-media+bounces-53868-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:15:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DB51C9FF9
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F427300D924
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB18236437;
	Sun,  1 Mar 2026 01:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGcTfw0Q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247EBA937;
	Sun,  1 Mar 2026 01:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327721; cv=none; b=Tq5htEU/APCNtJirRvuNHO2eU30AfQeOP61TpnF8TEHDJr6voQLh+4qTU8STBOWNef73z7WMLHJUES1B10XOOG8+Nh7EgWJR504Awkk/seYZCfzdC95zvzT8N0zlohqTrgVVhCku42Qp26we4fFe5DoRDwrY/bFJ3XXd5x+SSFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327721; c=relaxed/simple;
	bh=NCT6pGNSoNEDvuAg1+YO09RDq4gjI00siAgnQvYfAZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pijJGVhVKWIX/QpK7gd/CFxdF67YCnIdFWIppV13SbtbAbhaMNb2JTZ8Mu3rNhnNX7BiwqalzbSPm86C4UmsUYyi5m1nuIcLtdXi1TcvZTJ625hNN565bUvdvUSPxI4rVxkBXt9mfoo9icmU1AF3FTpg+NbXmiWZgtZSyeoUAJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGcTfw0Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB47C19421;
	Sun,  1 Mar 2026 01:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327721;
	bh=NCT6pGNSoNEDvuAg1+YO09RDq4gjI00siAgnQvYfAZ0=;
	h=From:To:Cc:Subject:Date:From;
	b=aGcTfw0Q2aiVIg/KcMA+ReIYzLX6xCuubxNHXny/kaoIfVU/wFfCsWkXPy3Z/TwWi
	 iQ3YTScU9K95Cca0CjCkBjnPAwNjcmhZyEzSR3NN/1pS3BQqu1nQfPCYJSUuVdufTy
	 iudj4C1p/jQs+mh5A/mUTXbdqmzsEIIh20VDuAH1YUnXyX+pE4uZ+izHKRn8yGfhEZ
	 NNoikxhj4CvgDj+ks1njsmbkPbPNJTiM8DDIa67kbdgydNa1MKvZ0Jeu+usKQ2pktg
	 JGdJBN7HjR9KVexCmy9FbU97c+NeWHj157VjD8KWoiVgmL3OGut78j0rZe/YtTTW4m
	 O3rE3f+q4f/iQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	ming.qian@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC" failed to apply to 6.18-stable tree
Date: Sat, 28 Feb 2026 20:15:18 -0500
Message-ID: <20260301011518.1668455-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53868-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 84DB51C9FF9
X-Rspamd-Action: no action

The patch below does not apply to the 6.18-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From e0203ddf9af7c8e170e1e99ce83b4dc07f0cd765 Mon Sep 17 00:00:00 2001
From: Ming Qian <ming.qian@oss.nxp.com>
Date: Fri, 5 Dec 2025 09:54:26 +0800
Subject: [PATCH] media: verisilicon: Avoid G2 bus error while decoding H.264
 and HEVC

For the i.MX8MQ platform, there is a hardware limitation: the g1 VPU and
g2 VPU cannot decode simultaneously; otherwise, it will cause below bus
error and produce corrupted pictures, even potentially lead to system hang.

[  110.527986] hantro-vpu 38310000.video-codec: frame decode timed out.
[  110.583517] hantro-vpu 38310000.video-codec: bus error detected.

Therefore, it is necessary to ensure that g1 and g2 operate alternately.
This allows for successful multi-instance decoding of H.264 and HEVC.

To achieve this, g1 and g2 share the same v4l2_m2m_dev, and then the
v4l2_m2m_dev can handle the scheduling.

Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
Cc: stable@vger.kernel.org
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/verisilicon/hantro.h   |  2 +
 .../media/platform/verisilicon/hantro_drv.c   | 42 +++++++++++++++++--
 .../media/platform/verisilicon/imx8m_vpu_hw.c |  8 ++++
 3 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index e0fdc4535b2d7..0353de154a1ec 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -77,6 +77,7 @@ struct hantro_irq {
  * @double_buffer:		core needs double buffering
  * @legacy_regs:		core uses legacy register set
  * @late_postproc:		postproc must be set up at the end of the job
+ * @shared_devices:		an array of device ids that cannot run concurrently
  */
 struct hantro_variant {
 	unsigned int enc_offset;
@@ -101,6 +102,7 @@ struct hantro_variant {
 	unsigned int double_buffer : 1;
 	unsigned int legacy_regs : 1;
 	unsigned int late_postproc : 1;
+	const struct of_device_id *shared_devices;
 };
 
 /**
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 60b95b5d8565f..94f58f4e4a4e5 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -13,6 +13,7 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -1035,6 +1036,41 @@ static int hantro_disable_multicore(struct hantro_dev *vpu)
 	return 0;
 }
 
+static struct v4l2_m2m_dev *hantro_get_v4l2_m2m_dev(struct hantro_dev *vpu)
+{
+	struct device_node *node;
+	struct hantro_dev *shared_vpu;
+
+	if (!vpu->variant || !vpu->variant->shared_devices)
+		goto init_new_m2m_dev;
+
+	for_each_matching_node(node, vpu->variant->shared_devices) {
+		struct platform_device *pdev;
+		struct v4l2_m2m_dev *m2m_dev;
+
+		pdev = of_find_device_by_node(node);
+		if (!pdev)
+			continue;
+
+		shared_vpu = platform_get_drvdata(pdev);
+		if (IS_ERR_OR_NULL(shared_vpu) || shared_vpu == vpu) {
+			platform_device_put(pdev);
+			continue;
+		}
+
+		v4l2_m2m_get(shared_vpu->m2m_dev);
+		m2m_dev = shared_vpu->m2m_dev;
+		platform_device_put(pdev);
+
+		of_node_put(node);
+
+		return m2m_dev;
+	}
+
+init_new_m2m_dev:
+	return v4l2_m2m_init(&vpu_m2m_ops);
+}
+
 static int hantro_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
@@ -1186,7 +1222,7 @@ static int hantro_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, vpu);
 
-	vpu->m2m_dev = v4l2_m2m_init(&vpu_m2m_ops);
+	vpu->m2m_dev = hantro_get_v4l2_m2m_dev(vpu);
 	if (IS_ERR(vpu->m2m_dev)) {
 		v4l2_err(&vpu->v4l2_dev, "Failed to init mem2mem device\n");
 		ret = PTR_ERR(vpu->m2m_dev);
@@ -1225,7 +1261,7 @@ static int hantro_probe(struct platform_device *pdev)
 	hantro_remove_enc_func(vpu);
 err_m2m_rel:
 	media_device_cleanup(&vpu->mdev);
-	v4l2_m2m_release(vpu->m2m_dev);
+	v4l2_m2m_put(vpu->m2m_dev);
 err_v4l2_unreg:
 	v4l2_device_unregister(&vpu->v4l2_dev);
 err_clk_unprepare:
@@ -1248,7 +1284,7 @@ static void hantro_remove(struct platform_device *pdev)
 	hantro_remove_dec_func(vpu);
 	hantro_remove_enc_func(vpu);
 	media_device_cleanup(&vpu->mdev);
-	v4l2_m2m_release(vpu->m2m_dev);
+	v4l2_m2m_put(vpu->m2m_dev);
 	v4l2_device_unregister(&vpu->v4l2_dev);
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
 	reset_control_assert(vpu->resets);
diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index 5be0e2e76882f..6f8e43b7f1575 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -343,6 +343,12 @@ const struct hantro_variant imx8mq_vpu_variant = {
 	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
 };
 
+static const struct of_device_id imx8mq_vpu_shared_resources[] __initconst = {
+	{ .compatible = "nxp,imx8mq-vpu-g1", },
+	{ .compatible = "nxp,imx8mq-vpu-g2", },
+	{ /* sentinel */ }
+};
+
 const struct hantro_variant imx8mq_vpu_g1_variant = {
 	.dec_fmts = imx8m_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
@@ -356,6 +362,7 @@ const struct hantro_variant imx8mq_vpu_g1_variant = {
 	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
 	.clk_names = imx8mq_g1_clk_names,
 	.num_clocks = ARRAY_SIZE(imx8mq_g1_clk_names),
+	.shared_devices = imx8mq_vpu_shared_resources,
 };
 
 const struct hantro_variant imx8mq_vpu_g2_variant = {
@@ -371,6 +378,7 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
 	.num_irqs = ARRAY_SIZE(imx8mq_g2_irqs),
 	.clk_names = imx8mq_g2_clk_names,
 	.num_clocks = ARRAY_SIZE(imx8mq_g2_clk_names),
+	.shared_devices = imx8mq_vpu_shared_resources,
 };
 
 const struct hantro_variant imx8mm_vpu_g1_variant = {
-- 
2.51.0





