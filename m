Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114F26316F1
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbiKTWn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:43:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiKTWnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9308424F18
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TfZsZBtOZtUHoGjvKmzvyBYNWEKccUvtXmzcQlFHfSg=;
        b=ia49123jOdPKd6PyDwimAR9Yhr8pjEyKakHUCiWi7X3/6Enqm+/jgGVGvBVQDB6Y8ZfhWx
        JxQyh4JYNffgAvGM4ZV0eoM3p0dxdndQLaSOhzfNqm3B+48c1ghWsPD1nxbcRx3RSGLmNm
        B/50Ww3IlMYvCNJ67zHq5yrbBjcYcjo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-_Qt09UdmPeaiT8rH4aoF5Q-1; Sun, 20 Nov 2022 17:41:37 -0500
X-MC-Unique: _Qt09UdmPeaiT8rH4aoF5Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D19083C0DDA5;
        Sun, 20 Nov 2022 22:41:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 602B847505E;
        Sun, 20 Nov 2022 22:41:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 15/20] media: atomisp: Remove sw_contex.power_state checks
Date:   Sun, 20 Nov 2022 23:40:56 +0100
Message-Id: <20221120224101.746199-16-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,TVD_SUBJ_WIPE_DEBT
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the unnecessary sw_contex.power_state checks:

1. atomisp_freq_scaling() and atomisp_stop_streaming() only run when the
   ISP is powered up through runtime-pm, so the checkes are not necessary

2. atomisp_mrfld_pre_power_down() and atomisp_runtime_resume() are only
   called through the driver-core pm handling code which already
   guarantees they are not called when already powered down / up.

3. atomisp_isr() also checks isp->css_initialized which only gets set
   by atomisp_css_init() which runs *after* powering up the ISP and
   which gets cleared by atomisp_css_uninit() *before* before powering
   down the ISP.

So all the checks are unnecessary, remove them as well as the
sw_contex.power_state field itself.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 20 +----
 .../media/atomisp/pci/atomisp_internal.h      |  1 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 75 +++++++++----------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 19 ++---
 4 files changed, 43 insertions(+), 72 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index e80038e46e0e..475ba82b858b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -207,11 +207,6 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 	int i, ret;
 	unsigned short fps = 0;
 
-	if (isp->sw_contex.power_state != ATOM_ISP_POWER_UP) {
-		dev_err(isp->dev, "DFS cannot proceed due to no power.\n");
-		return -EINVAL;
-	}
-
 	if ((pdev->device & ATOMISP_PCI_DEVICE_SOC_MASK) ==
 	    ATOMISP_PCI_DEVICE_SOC_CHT && ATOMISP_USE_YUVPP(asd))
 		isp->dfs = &dfs_config_cht_soc;
@@ -511,8 +506,8 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 	int err;
 
 	spin_lock_irqsave(&isp->lock, flags);
-	if (isp->sw_contex.power_state != ATOM_ISP_POWER_UP ||
-	    !isp->css_initialized) {
+
+	if (!isp->css_initialized) {
 		spin_unlock_irqrestore(&isp->lock, flags);
 		return IRQ_HANDLED;
 	}
@@ -5503,7 +5498,6 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 int atomisp_ospm_dphy_down(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
-	unsigned long flags;
 	u32 reg;
 
 	dev_dbg(isp->dev, "%s\n", __func__);
@@ -5515,9 +5509,6 @@ int atomisp_ospm_dphy_down(struct atomisp_device *isp)
 	if (!atomisp_dev_users(isp))
 		goto done;
 
-	spin_lock_irqsave(&isp->lock, flags);
-	isp->sw_contex.power_state = ATOM_ISP_POWER_DOWN;
-	spin_unlock_irqrestore(&isp->lock, flags);
 done:
 	/*
 	 * MRFLD IUNIT DPHY is located in an always-power-on island
@@ -5533,14 +5524,7 @@ int atomisp_ospm_dphy_down(struct atomisp_device *isp)
 /*Turn on ISP dphy */
 int atomisp_ospm_dphy_up(struct atomisp_device *isp)
 {
-	unsigned long flags;
-
 	dev_dbg(isp->dev, "%s\n", __func__);
-
-	spin_lock_irqsave(&isp->lock, flags);
-	isp->sw_contex.power_state = ATOM_ISP_POWER_UP;
-	spin_unlock_irqrestore(&isp->lock, flags);
-
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index d9d158cdf09e..653e6d74a966 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -195,7 +195,6 @@ struct atomisp_regs {
 };
 
 struct atomisp_sw_contex {
-	int power_state;
 	int running_freq;
 };
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 43e899457b91..cb01ba65c88f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1461,10 +1461,11 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	struct video_device *vdev = &pipe->vdev;
 	struct atomisp_device *isp = asd->isp;
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
+	bool recreate_streams[MAX_STREAM_NUM] = {0};
 	enum ia_css_pipe_id css_pipe_id;
-	int ret;
-	unsigned long flags;
 	bool first_streamoff = false;
+	unsigned long flags;
+	int i, ret;
 
 	mutex_lock(&isp->mutex);
 
@@ -1563,49 +1564,43 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	 * ISP work around, need to reset isp
 	 * Is it correct time to reset ISP when first node does streamoff?
 	 */
-	if (isp->sw_contex.power_state == ATOM_ISP_POWER_UP) {
-		unsigned int i;
-		bool recreate_streams[MAX_STREAM_NUM] = {0};
-
-		if (isp->isp_timeout)
-			dev_err(isp->dev, "%s: Resetting with WA activated",
-				__func__);
-		/*
-		 * It is possible that the other asd stream is in the stage
-		 * that v4l2_setfmt is just get called on it, which will
-		 * create css stream on that stream. But at this point, there
-		 * is no way to destroy the css stream created on that stream.
-		 *
-		 * So force stream destroy here.
-		 */
-		for (i = 0; i < isp->num_of_streams; i++) {
-			if (isp->asd[i].stream_prepared) {
-				atomisp_destroy_pipes_stream_force(&isp->
-								   asd[i]);
-				recreate_streams[i] = true;
-			}
+	if (isp->isp_timeout)
+		dev_err(isp->dev, "%s: Resetting with WA activated",
+			__func__);
+	/*
+	 * It is possible that the other asd stream is in the stage
+	 * that v4l2_setfmt is just get called on it, which will
+	 * create css stream on that stream. But at this point, there
+	 * is no way to destroy the css stream created on that stream.
+	 *
+	 * So force stream destroy here.
+	 */
+	for (i = 0; i < isp->num_of_streams; i++) {
+		if (isp->asd[i].stream_prepared) {
+			atomisp_destroy_pipes_stream_force(&isp->asd[i]);
+			recreate_streams[i] = true;
 		}
+	}
 
-		/* disable  PUNIT/ISP acknowlede/handshake - SRSE=3 */
-		pci_write_config_dword(pdev, PCI_I_CONTROL,
-				       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
-		dev_err(isp->dev, "atomisp_reset");
-		atomisp_reset(isp);
-		for (i = 0; i < isp->num_of_streams; i++) {
-			if (recreate_streams[i]) {
-				int ret2;
-
-				ret2 = atomisp_create_pipes_stream(&isp->asd[i]);
-				if (ret2) {
-					dev_err(isp->dev, "%s error re-creating streams: %d\n",
-						__func__, ret2);
-					if (!ret)
-						ret = ret2;
-				}
+	/* disable  PUNIT/ISP acknowlede/handshake - SRSE=3 */
+	pci_write_config_dword(pdev, PCI_I_CONTROL,
+			       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
+	dev_err(isp->dev, "atomisp_reset");
+	atomisp_reset(isp);
+	for (i = 0; i < isp->num_of_streams; i++) {
+		if (recreate_streams[i]) {
+			int ret2;
+
+			ret2 = atomisp_create_pipes_stream(&isp->asd[i]);
+			if (ret2) {
+				dev_err(isp->dev, "%s error re-creating streams: %d\n",
+					__func__, ret2);
+				if (!ret)
+					ret = ret2;
 			}
 		}
-		isp->isp_timeout = false;
 	}
+	isp->isp_timeout = false;
 out_unlock:
 	mutex_unlock(&isp->mutex);
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index f009a1bfd3ea..579cbf502fd1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -573,11 +573,7 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 	unsigned long flags;
 
 	spin_lock_irqsave(&isp->lock, flags);
-	if (isp->sw_contex.power_state == ATOM_ISP_POWER_DOWN) {
-		spin_unlock_irqrestore(&isp->lock, flags);
-		dev_dbg(isp->dev, "<%s %d.\n", __func__, __LINE__);
-		return 0;
-	}
+
 	/*
 	 * MRFLD HAS requirement: cannot power off i-unit if
 	 * ISP has IRQ not serviced.
@@ -753,13 +749,11 @@ int atomisp_runtime_resume(struct device *dev)
 		return ret;
 
 	cpu_latency_qos_update_request(&isp->pm_qos, isp->max_isr_latency);
-	if (isp->sw_contex.power_state == ATOM_ISP_POWER_DOWN) {
-		/*Turn on ISP d-phy */
-		ret = atomisp_ospm_dphy_up(isp);
-		if (ret) {
-			dev_err(isp->dev, "Failed to power up ISP!.\n");
-			return -EINVAL;
-		}
+	/*Turn on ISP d-phy */
+	ret = atomisp_ospm_dphy_up(isp);
+	if (ret) {
+		dev_err(isp->dev, "Failed to power up ISP!.\n");
+		return -EINVAL;
 	}
 
 	/*restore register values for iUnit and iUnitPHY registers*/
@@ -1447,7 +1441,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	isp->dev = &pdev->dev;
 	isp->base = pcim_iomap_table(pdev)[ATOM_ISP_PCI_BAR];
-	isp->sw_contex.power_state = ATOM_ISP_POWER_UP;
 	isp->saved_regs.ispmmadr = start;
 
 	dev_dbg(&pdev->dev, "atomisp mmio base: %p\n", isp->base);
-- 
2.38.1

