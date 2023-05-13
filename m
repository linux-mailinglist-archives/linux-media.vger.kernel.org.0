Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B999B7016B1
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238456AbjEMMe2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbjEMMe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC8F3AB8
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981163;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LT444Or55/pPp7e4nc1tqkdx10ZLZpYhdvaoJXXOSUA=;
        b=FR5n8EoE+eFa+RhWiJATQWdrxzFPOiN5yP+qdp6+aEeVBNJP2Iyp4iGYG8BDzxfzUhaYLh
        6vArJNoHnVu6JMCDP0ORz6iXNppHSb4/63khO1fPlJUj+PKk/jOyv+Rlw186gZzT/sbZkD
        Nl2zCb6xu9GCjRa4l5b8+Te6722MCq0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-ZfqbSyv8M6yVP5MLkBhS-Q-1; Sat, 13 May 2023 08:32:40 -0400
X-MC-Unique: ZfqbSyv8M6yVP5MLkBhS-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BBC3802A95;
        Sat, 13 May 2023 12:32:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D746F40C2076;
        Sat, 13 May 2023 12:32:37 +0000 (UTC)
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
Subject: [PATCH 21/30] media: atomisp: Remove no longer used atomisp_css_flush()
Date:   Sat, 13 May 2023 14:31:50 +0200
Message-Id: <20230513123159.33234-22-hdegoede@redhat.com>
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

Remove the no longer used atomisp_css_flush() function and merge
atomisp_assert_recovery_work() and __atomisp_css_recover() into
a single function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 25 +++++--------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  2 --
 2 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 26a194251a76..1482184a9ea5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -935,18 +935,20 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		atomisp_qbuffers_to_css(asd);
 }
 
-static void __atomisp_css_recover(struct atomisp_device *isp)
+void atomisp_assert_recovery_work(struct work_struct *work)
 {
+	struct atomisp_device *isp = container_of(work, struct atomisp_device,
+						  assert_recovery_work);
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
 	bool stream_restart = false;
 	unsigned long flags;
 	int ret;
 
-	lockdep_assert_held(&isp->mutex);
+	mutex_lock(&isp->mutex);
 
 	if (!atomisp_streaming_count(isp))
-		return;
+		goto out_unlock;
 
 	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
 
@@ -1028,26 +1030,11 @@ static void __atomisp_css_recover(struct atomisp_device *isp)
 			dev_warn(isp->dev,
 				 "can't start streaming on sensor!\n");
 	}
-}
 
-void atomisp_assert_recovery_work(struct work_struct *work)
-{
-	struct atomisp_device *isp = container_of(work, struct atomisp_device,
-						  assert_recovery_work);
-
-	mutex_lock(&isp->mutex);
-	__atomisp_css_recover(isp);
+out_unlock:
 	mutex_unlock(&isp->mutex);
 }
 
-void atomisp_css_flush(struct atomisp_device *isp)
-{
-	/* Start recover */
-	__atomisp_css_recover(isp);
-
-	dev_dbg(isp->dev, "atomisp css flush done\n");
-}
-
 void atomisp_setup_flash(struct atomisp_sub_device *asd)
 {
 	struct atomisp_device *isp = asd->isp;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 1cb973ddf2dc..783fb1e6f4f9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -282,8 +282,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		      enum ia_css_pipe_id css_pipe_id,
 		      bool q_buffers, enum atomisp_input_stream_id stream_id);
 
-void atomisp_css_flush(struct atomisp_device *isp);
-
 /* Events. Only one event has to be exported for now. */
 void atomisp_eof_event(struct atomisp_sub_device *asd, uint8_t exp_id);
 
-- 
2.40.1

