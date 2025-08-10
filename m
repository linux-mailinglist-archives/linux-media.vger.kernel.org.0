Return-Path: <linux-media+bounces-39355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F197B1FC57
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 23:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE04E1894DFA
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 21:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A67286416;
	Sun, 10 Aug 2025 21:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="RKa85VhA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28F286893
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 21:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754861154; cv=none; b=bj1OOnpfnB7bkvr/2TWXc8HhLFSKIa42flP8Vf1lzOo8i9b8AGXGqGkEmuSPdmU5b58jj5zEQJdtMB5jP74/e1k+o0e00WoMscojv4ijeA6cT7E/j6PFkrZXQ5fjnFR7+qj8P4rzZ2zR4XllmwrqL5NyvdkXLoJOoThAjbWrbQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754861154; c=relaxed/simple;
	bh=9+HpTmz5tCPuKNJ18O03ZWzkzB0eG2Qc/0Iz0sWdEt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqoJTj5BrRYGlGUuIero3UuSzQgqG88tVdu4hco+uhGo7dW4Ud5MiViavsUBjksrFl1XcPhUWyQQ4j2y6vrcLNmoulnjH5VFp9s4XkDRqrmTdDPlLh7z0QNmLwd2KNC0uzQb66viJlUqoxcYPs2EgesKnrwnE3IdXrW4tltP4T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=RKa85VhA; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1754861152; bh=AffjwLL2Q730popPdM+cA5Jw1dmPFrUx6J2FHMVA81w=;
 b=RKa85VhAh91fMmjTZ/sC54e7jftZSkC8ieebFhAvth23q+WaS20l4KbKK9RqxKAYAj/bfSlh7
 3V5bn246UAT7NxoPhtKIpTiljpIej4pkAKeyv74VOwlme5NMAb/VqxKzkWEZDTFFO57Skn8DrZ0
 G35QkU6U9+k5jgjec9t1V8Wi0dbhFM88CqpgjuGLeawGpBgR3k09UlpoASCF9CKMnxuTlwSVrMy
 4brR2ab01QgjtDh8VDW4M+llpjGvDBo2a7U1+DcAh8mKK3qwhQeblyq29vbi5oaNjckRD7nZL3y
 pNSL802d3afdHoY0haSsha5Ufqi51pBidInegl4S7kgw==
X-Forward-Email-ID: 68990e5e797ab89627792409
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 2/7] media: rkvdec: Add variants support
Date: Sun, 10 Aug 2025 21:24:32 +0000
Message-ID: <20250810212454.3237486-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810212454.3237486-1-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Bee <knaerzche@gmail.com>

Different versions of the Rockchip VDEC IP exists and one way they can
differ is what decoding formats are supported.

Add a variant implementation in order to support flagging different
capabilities.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 21 ++++++++++++++++++-
 .../media/platform/rockchip/rkvdec/rkvdec.h   | 10 +++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index cfb326600a2d..e7b9dfc2d1ab 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -14,6 +14,7 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -327,6 +328,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.ops = &rkvdec_hevc_fmt_ops,
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
 		.decoded_fmts = rkvdec_hevc_decoded_fmts,
+		.capability = RKVDEC_CAPABILITY_HEVC,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
@@ -343,6 +345,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
 		.decoded_fmts = rkvdec_h264_decoded_fmts,
 		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
+		.capability = RKVDEC_CAPABILITY_H264,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
@@ -358,6 +361,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.ops = &rkvdec_vp9_fmt_ops,
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
 		.decoded_fmts = rkvdec_vp9_decoded_fmts,
+		.capability = RKVDEC_CAPABILITY_VP9,
 	}
 };
 
@@ -1187,8 +1191,17 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+static const struct rkvdec_variant rk3399_rkvdec_variant = {
+	.capabilities = RKVDEC_CAPABILITY_HEVC |
+			RKVDEC_CAPABILITY_H264 |
+			RKVDEC_CAPABILITY_VP9,
+};
+
 static const struct of_device_id of_rkvdec_match[] = {
-	{ .compatible = "rockchip,rk3399-vdec" },
+	{
+		.compatible = "rockchip,rk3399-vdec",
+		.data = &rk3399_rkvdec_variant,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_rkvdec_match);
@@ -1199,16 +1212,22 @@ static const char * const rkvdec_clk_names[] = {
 
 static int rkvdec_probe(struct platform_device *pdev)
 {
+	const struct rkvdec_variant *variant;
 	struct rkvdec_dev *rkvdec;
 	unsigned int i;
 	int ret, irq;
 
+	variant = of_device_get_match_data(&pdev->dev);
+	if (!variant)
+		return -EINVAL;
+
 	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
 	if (!rkvdec)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, rkvdec);
 	rkvdec->dev = &pdev->dev;
+	rkvdec->capabilities = variant->capabilities;
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index c062c5c5bbb2..8e1f8548eae4 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -22,6 +22,10 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
+#define RKVDEC_CAPABILITY_HEVC		BIT(0)
+#define RKVDEC_CAPABILITY_H264		BIT(1)
+#define RKVDEC_CAPABILITY_VP9		BIT(2)
+
 struct rkvdec_ctx;
 
 struct rkvdec_ctrl_desc {
@@ -63,6 +67,10 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 			    base.vb.vb2_buf);
 }
 
+struct rkvdec_variant {
+	unsigned int capabilities;
+};
+
 struct rkvdec_coded_fmt_ops {
 	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
 			  struct v4l2_format *f);
@@ -98,6 +106,7 @@ struct rkvdec_coded_fmt_desc {
 	unsigned int num_decoded_fmts;
 	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
 	u32 subsystem_flags;
+	unsigned int capability;
 };
 
 struct rkvdec_dev {
@@ -111,6 +120,7 @@ struct rkvdec_dev {
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
 	struct iommu_domain *empty_domain;
+	unsigned int capabilities;
 };
 
 struct rkvdec_ctx {
-- 
2.50.1


