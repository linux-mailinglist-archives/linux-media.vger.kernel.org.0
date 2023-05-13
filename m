Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 229697016AC
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238790AbjEMMd7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238348AbjEMMdu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77D03A9B
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=heqcN4jTMo6yfHmwFTyUUf1HPQ6qbBteOI7JTQsqDpA=;
        b=ipVcB+EMG4SXU39LlUAI6q/6KllWScZdrRhMHyQ/r7SR3EOAN2k9l5byqea1dS720q2Qnf
        17j9uL4xLoRxlq845fEOWXrfK749pTiLzAlgmfIlJ+DCqSbUVMjlE6plFrGyQ3Mqo17mbB
        Lts7CNPV3qqX2mQvxs7cHTmSMnhJZ6Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-H8Y3IY0ZOIGnodFoV6pxXA-1; Sat, 13 May 2023 08:32:27 -0400
X-MC-Unique: H8Y3IY0ZOIGnodFoV6pxXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E43E3C025CC;
        Sat, 13 May 2023 12:32:27 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7D57740C2076;
        Sat, 13 May 2023 12:32:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 14/30] media: atomisp: Remove isp_timeout flag
Date:   Sat, 13 May 2023 14:31:43 +0200
Message-Id: <20230513123159.33234-15-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

isp_timeout only ever gets set in __atomisp_css_recover() and then
immediately gets cleared again after calling atomisp_reset().

All this happens with isp->mutex held.

The only consumer of isp->isp_timeout is atomisp_stop_streaming(), which
also holds isp->mutex and which is *not* called by atomisp_reset().

Since both hold isp->mutex and since __atomisp_css_recover() clears
isp_timeout before releasing the mutex, atomisp_stop_streaming() can
never see isp_timeout being true, so just remove the flag.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c      | 8 +++-----
 drivers/staging/media/atomisp/pci/atomisp_internal.h | 2 --
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c    | 7 +------
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 42a2a8f0da06..ea07ddcdd7f1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -935,7 +935,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		atomisp_qbuffers_to_css(asd);
 }
 
-static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
+static void __atomisp_css_recover(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
@@ -992,9 +992,7 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 			       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);
 
 	/* reset ISP and restore its state */
-	isp->isp_timeout = true;
 	atomisp_reset(isp);
-	isp->isp_timeout = false;
 
 	if (stream_restart) {
 		atomisp_css_input_set_mode(&isp->asd, IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
@@ -1043,14 +1041,14 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 						  assert_recovery_work);
 
 	mutex_lock(&isp->mutex);
-	__atomisp_css_recover(isp, true);
+	__atomisp_css_recover(isp);
 	mutex_unlock(&isp->mutex);
 }
 
 void atomisp_css_flush(struct atomisp_device *isp)
 {
 	/* Start recover */
-	__atomisp_css_recover(isp, false);
+	__atomisp_css_recover(isp);
 
 	dev_dbg(isp->dev, "atomisp css flush done\n");
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index cec0ac92726e..3d4f0f632f44 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -204,8 +204,6 @@ struct atomisp_device {
 	struct atomisp_regs saved_regs;
 	struct atomisp_css_env css_env;
 
-	/* isp timeout status flag */
-	bool isp_timeout;
 	bool isp_fatal_error;
 	struct work_struct assert_recovery_work;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 8e2b5b647670..e0a8616ecf05 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1369,11 +1369,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	/*
 	 * ISP work around, need to reset isp
 	 * Is it correct time to reset ISP when first node does streamoff?
-	 */
-	if (isp->isp_timeout)
-		dev_err(isp->dev, "%s: Resetting with WA activated",
-			__func__);
-	/*
+	 *
 	 * It is possible that the other asd stream is in the stage
 	 * that v4l2_setfmt is just get called on it, which will
 	 * create css stream on that stream. But at this point, there
@@ -1403,7 +1399,6 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 		}
 	}
 
-	isp->isp_timeout = false;
 out_unlock:
 	mutex_unlock(&isp->mutex);
 }
-- 
2.40.1

