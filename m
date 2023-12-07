Return-Path: <linux-media+bounces-1791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBFC80823A
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 08:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1352830DA
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 07:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741111E4A9;
	Thu,  7 Dec 2023 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y7xwRc5/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D06B2;
	Wed,  6 Dec 2023 23:58:14 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44D0ABB2;
	Thu,  7 Dec 2023 08:57:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701935850;
	bh=IN5LU/eD22tmOTeDM2C7nJS4isiwUwSC5E9Fa8YFuO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y7xwRc5/7+KVUJYnbGStSVw2rc55W8ELOcsGf3/p3AYo/XtOHeRA9t8XSjJswnoYN
	 MVSMFR6xL9bL/J4oI+VVk/kSBRe1AXaybVncoSS1ZaOaIOzDH5agTzN/FGueVk0R2q
	 1teZ9sXK0NhqQfw3R+2sOtHiGjQ8zCVpjV+gppIU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 07 Dec 2023 09:57:47 +0200
Subject: [PATCH v3 3/4] media: rkisp1: Store IRQ lines
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-rkisp-irq-fix-v3-3-358a2c871a3c@ideasonboard.com>
References: <20231207-rkisp-irq-fix-v3-0-358a2c871a3c@ideasonboard.com>
In-Reply-To: <20231207-rkisp-irq-fix-v3-0-358a2c871a3c@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 kieran.bingham@ideasonboard.com, umang.jain@ideasonboard.com, 
 aford173@gmail.com, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3974;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=IN5LU/eD22tmOTeDM2C7nJS4isiwUwSC5E9Fa8YFuO4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlcXsOh+BH82EXHG0jjkStq5uPi/P/50dYPN2Au
 njDqaZfbJCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZXF7DgAKCRD6PaqMvJYe
 9ZoFD/9N23s+QIvh7ode//z60gdpcgTf9YQ7ollHP5eZ+RZNkTg1wFNir8l1ACakoiwD6U2Rujs
 fFhRIEmJFLxMDujyRNgqKdhsokjUKBk25qREscVn5SuclYYZomhbXenR2gSUvRdOW7mCcMfo+gh
 sqg8wpNJS8KiK0SVHNm492EVbyewwvKXE0yrQiMhvCYclXCo+RBGUyB70K1Cp0IybDpSyJVsLDz
 utfnhVTndkYKyy3yM2HmPs7iS6rVygOnVMchFLu6YX5Ap18S6F7sacVJZbjnc3BphEjYaYmV44p
 FLjEIZVt7CS6TsAAeuxb++csH1wfk4dRmmQkxpdquJHe3tnXG1hE7EBAJCUEwhLrWy9tv4FRgke
 KmCijgiQCj50t33zIdGAbEgsonejWPG+tBu9eA/kI8F5QTmhLJw9+qOTos3hY+O8C3Rjez1bWFx
 QTTnpg6arXrE0mrEDMIZn0WCOFgMfu9bq01HRTTmSpusmu8PW1ftxejFn2HmERcDVy4/is1OL2m
 j4A55L0ccZanY4vv8hqwLIZMIFnDtJKiqBll/0fA3ZK3qFYoZZiObiOwQq4QiZ8+IT70Ao9bxTB
 YNnHzXsbuHqSAmPgYW07hmwVdwHa+E0anDFOoRVCm7hLPOqKEcxgfxeel0aJOx60PpanSi+ugcn
 fRQeetI0vdBMbIg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Store the IRQ lines used by the driver for easy access. These are needed
in future patches which fix IRQ race issues.

Tested-by: Adam Ford <aford173@gmail.com>  #imx8mp-beacon
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 11 ++++++++++-
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c    | 17 +++++++++++++----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 1e7cea1bea5e..2d7f06281c39 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -61,6 +61,14 @@ struct dentry;
 						 RKISP1_CIF_ISP_EXP_END |	\
 						 RKISP1_CIF_ISP_HIST_MEASURE_RDY)
 
+/* IRQ lines */
+enum rkisp1_irq_line {
+	RKISP1_IRQ_ISP = 0,
+	RKISP1_IRQ_MI,
+	RKISP1_IRQ_MIPI,
+	RKISP1_NUM_IRQS,
+};
+
 /* enum for the resizer pads */
 enum rkisp1_rsz_pad {
 	RKISP1_RSZ_PAD_SINK,
@@ -423,7 +431,6 @@ struct rkisp1_debug {
  * struct rkisp1_device - ISP platform device
  *
  * @base_addr:	   base register address
- * @irq:	   the irq number
  * @dev:	   a pointer to the struct device
  * @clk_size:	   number of clocks
  * @clks:	   array of clocks
@@ -441,6 +448,7 @@ struct rkisp1_debug {
  * @stream_lock:   serializes {start/stop}_streaming callbacks between the capture devices.
  * @debug:	   debug params to be exposed on debugfs
  * @info:	   version-specific ISP information
+ * @irqs:          IRQ line numbers
  */
 struct rkisp1_device {
 	void __iomem *base_addr;
@@ -461,6 +469,7 @@ struct rkisp1_device {
 	struct mutex stream_lock; /* serialize {start/stop}_streaming cb between capture devices */
 	struct rkisp1_debug debug;
 	const struct rkisp1_info *info;
+	int irqs[RKISP1_NUM_IRQS];
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 22b2ae0e89c4..c3fa40976140 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -114,6 +114,7 @@
 struct rkisp1_isr_data {
 	const char *name;
 	irqreturn_t (*isr)(int irq, void *ctx);
+	u32 line_mask;
 };
 
 /* ----------------------------------------------------------------------------
@@ -471,9 +472,9 @@ static const char * const px30_isp_clks[] = {
 };
 
 static const struct rkisp1_isr_data px30_isp_isrs[] = {
-	{ "isp", rkisp1_isp_isr },
-	{ "mi", rkisp1_capture_isr },
-	{ "mipi", rkisp1_csi_isr },
+	{ "isp", rkisp1_isp_isr, BIT(RKISP1_IRQ_ISP) },
+	{ "mi", rkisp1_capture_isr, BIT(RKISP1_IRQ_MI) },
+	{ "mipi", rkisp1_csi_isr, BIT(RKISP1_IRQ_MIPI) },
 };
 
 static const struct rkisp1_info px30_isp_info = {
@@ -492,7 +493,7 @@ static const char * const rk3399_isp_clks[] = {
 };
 
 static const struct rkisp1_isr_data rk3399_isp_isrs[] = {
-	{ NULL, rkisp1_isr },
+	{ NULL, rkisp1_isr, BIT(RKISP1_IRQ_ISP) | BIT(RKISP1_IRQ_MI) | BIT(RKISP1_IRQ_MIPI) },
 };
 
 static const struct rkisp1_info rk3399_isp_info = {
@@ -543,6 +544,9 @@ static int rkisp1_probe(struct platform_device *pdev)
 	if (IS_ERR(rkisp1->base_addr))
 		return PTR_ERR(rkisp1->base_addr);
 
+	for (unsigned int il = 0; il < ARRAY_SIZE(rkisp1->irqs); ++il)
+		rkisp1->irqs[il] = -1;
+
 	for (i = 0; i < info->isr_size; i++) {
 		irq = info->isrs[i].name
 		    ? platform_get_irq_byname(pdev, info->isrs[i].name)
@@ -550,6 +554,11 @@ static int rkisp1_probe(struct platform_device *pdev)
 		if (irq < 0)
 			return irq;
 
+		for (unsigned int il = 0; il < ARRAY_SIZE(rkisp1->irqs); ++il) {
+			if (info->isrs[i].line_mask & BIT(il))
+				rkisp1->irqs[il] = irq;
+		}
+
 		ret = devm_request_irq(dev, irq, info->isrs[i].isr, 0,
 				       dev_driver_string(dev), dev);
 		if (ret) {

-- 
2.34.1


