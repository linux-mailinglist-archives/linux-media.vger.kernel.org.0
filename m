Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C8E37ADF7
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 20:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhEKSJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 14:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbhEKSJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 14:09:30 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627D9C06134E
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:22 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id 1so15301800qtb.0
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cX7VUxclVGfkyV9rVCDHyazRsd8VZZtRYarJP7RCO34=;
        b=BuqyYzAdQgWzCtjuH5wvPUIcZPLbBfnEd6wU/R3rGEtSEHDFAq0djDSfodH+yaUhN2
         UNPjDvyNgDzLYAukgjmx7DbFvjNzDJW4T3dhX2aU9yi7UjWLRL74K3eW0G0RsvZUEGAk
         nSHBe3e7KsL1+3wWxzf4q0AGF8a8xgwbBNOPgWBpL18UhzW4DcOLeZfpI+dEp7vnLQKd
         eqvMi1xHx9SyihlXm25Xyp5PSXKIp7VaglFikb5vm/cj2cXmiEKMzM72mKkp8kqX0OQF
         DpJkEhg+2NiXq7RG1byNz/zuOgU8VmddxwyvYIcd644z6o8n53UdCRfZSEldEuwAz9gk
         5g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cX7VUxclVGfkyV9rVCDHyazRsd8VZZtRYarJP7RCO34=;
        b=pjFHAFEjoXYfAxuWq3kPgeFJWWccaA8V+ynNb9ImSrmvRzEBkzhgawBvRLiy5wGN5M
         5QaZGvtQ+v7IXM/O10i2KHeB8Gt1ijHWSxjiQZOPM1ce9lxigKTCLQEAkOGAq4Y0Rx9y
         q4n+/hADzL9Q+S6lzDE3oNFk9V0ZuNEdLp1iprehiKSOZ16H/RAZ8XXcZOhHD6C89JL3
         vbSnmRpGo2PpnhqFOXlkKfQYh18NI6FTZ38816kTkmBo0BkBV8Kf5FmQpavH9yo4onHA
         PUxHpjVji0GAMbcwvhpEihM5F+9MvMZm68w7AgWoZTYAFjTqpgXPGdZZQOeuJ5Vwkgs2
         4QpQ==
X-Gm-Message-State: AOAM533CokFzvv80RqUOH8AdbD5Z5wgRJPhaEOkcdERmD9QE5h240t8J
        zbCgfGYOG6NYmDUqTY8dd9H2Mg==
X-Google-Smtp-Source: ABdhPJzrcQa4lolbmsjOGNCmrYUqVsujZXPtz83eDxf39yjfInkVOoMZWdsx4gwDOK+SRWJS79buUA==
X-Received: by 2002:ac8:44b1:: with SMTP id a17mr29422749qto.369.1620756501537;
        Tue, 11 May 2021 11:08:21 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:21 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 12/17] media: camss: vfe-170: clean up some dead code
Date:   Tue, 11 May 2021 14:07:19 -0400
Message-Id: <20210511180728.23781-13-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vfe_isr_read()/vfe_isr_halt_ack()/vfe_reg_clr() are never called.

vfe_isr_sof() does nothing, remove it.

The only vfe_reg_set() usage can be easily replaced with a writel.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../media/platform/qcom/camss/camss-vfe-170.c | 53 +------------------
 1 file changed, 2 insertions(+), 51 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 8594d275b41d..076ca082e107 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -188,20 +188,6 @@ static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
 	dev_err(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
 }
 
-static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
-{
-	u32 bits = readl_relaxed(vfe->base + reg);
-
-	writel_relaxed(bits & ~clr_bits, vfe->base + reg);
-}
-
-static inline void vfe_reg_set(struct vfe_device *vfe, u32 reg, u32 set_bits)
-{
-	u32 bits = readl_relaxed(vfe->base + reg);
-
-	writel_relaxed(bits | set_bits, vfe->base + reg);
-}
-
 static void vfe_global_reset(struct vfe_device *vfe)
 {
 	u32 reset_bits = GLOBAL_RESET_CMD_CORE		|
@@ -305,32 +291,14 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 
 static void vfe_enable_irq_common(struct vfe_device *vfe)
 {
-	vfe_reg_set(vfe, VFE_IRQ_MASK_0, ~0u);
-	vfe_reg_set(vfe, VFE_IRQ_MASK_1, ~0u);
+	writel_relaxed(~0u, vfe->base + VFE_IRQ_MASK_0);
+	writel_relaxed(~0u, vfe->base + VFE_IRQ_MASK_1);
 
 	writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(0));
 	writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(1));
 	writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(2));
 }
 
-static void vfe_isr_halt_ack(struct vfe_device *vfe)
-{
-	complete(&vfe->halt_complete);
-}
-
-static void vfe_isr_read(struct vfe_device *vfe, u32 *status0, u32 *status1)
-{
-	*status0 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_0);
-	*status1 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_1);
-
-	writel_relaxed(*status0, vfe->base + VFE_IRQ_CLEAR_0);
-	writel_relaxed(*status1, vfe->base + VFE_IRQ_CLEAR_1);
-
-	/* Enforce ordering between IRQ Clear and Global IRQ Clear */
-	wmb();
-	writel_relaxed(CMD_GLOBAL_CLEAR, vfe->base + VFE_IRQ_CMD);
-}
-
 static void vfe_violation_read(struct vfe_device *vfe)
 {
 	u32 violation = readl_relaxed(vfe->base + VFE_VIOLATION_STATUS);
@@ -375,10 +343,6 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 		if (status0 & STATUS_0_RDI_REG_UPDATE(i))
 			vfe->isr_ops.reg_update(vfe, i);
 
-	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
-		if (status0 & STATUS_1_RDI_SOF(i))
-			vfe->isr_ops.sof(vfe, i);
-
 	for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
 		if (vfe_bus_status[0] & STATUS0_COMP_BUF_DONE(i))
 			vfe->isr_ops.comp_done(vfe, i);
@@ -607,16 +571,6 @@ static int vfe_disable(struct vfe_line *line)
 	return 0;
 }
 
-/*
- * vfe_isr_sof - Process start of frame interrupt
- * @vfe: VFE Device
- * @line_id: VFE line
- */
-static void vfe_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id)
-{
-	/* nop */
-}
-
 /*
  * vfe_isr_reg_update - Process reg update interrupt
  * @vfe: VFE Device
@@ -749,9 +703,7 @@ static int vfe_queue_buffer(struct camss_video *vid,
 
 static const struct vfe_isr_ops vfe_isr_ops_170 = {
 	.reset_ack = vfe_isr_reset_ack,
-	.halt_ack = vfe_isr_halt_ack,
 	.reg_update = vfe_isr_reg_update,
-	.sof = vfe_isr_sof,
 	.comp_done = vfe_isr_comp_done,
 	.wm_done = vfe_isr_wm_done,
 };
@@ -772,7 +724,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 const struct vfe_hw_ops vfe_ops_170 = {
 	.global_reset = vfe_global_reset,
 	.hw_version_read = vfe_hw_version_read,
-	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
 	.pm_domain_on = vfe_pm_domain_on,
-- 
2.26.1

