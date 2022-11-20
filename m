Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00AC46316EE
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiKTWnW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:43:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbiKTWnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0A3248C5
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984096;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S0UtkBCP79CbX4HC5j9osnoAbl+WZJiovxaTKMd1zGs=;
        b=VNAq08snO+Erp6FZ7j6rXvezI8gMQFlXYEyQbKfUSGNRuvzbzEnBIZ5L7Ia7K/0z2gqone
        BqKeuYPP7f7l9YXzmou0ydAadkEaBCBssVNEloDkhrtvYccg4CtnOcLHVcrSs1CZVkDyUf
        W5POuwGtb3QkilzS/LR1lMQClWf1v0w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-xIXREmFYMse3npL2dS0jyA-1; Sun, 20 Nov 2022 17:41:30 -0500
X-MC-Unique: xIXREmFYMse3npL2dS0jyA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CB2B85A588;
        Sun, 20 Nov 2022 22:41:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A0CBF47505E;
        Sun, 20 Nov 2022 22:41:28 +0000 (UTC)
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
Subject: [PATCH 11/20] media: atomisp: Remove double atomisp_mrfld_power_down()/_up() calls from atomisp_reset()
Date:   Sun, 20 Nov 2022 23:40:52 +0100
Message-Id: <20221120224101.746199-12-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_reset() calls atomisp_mrfld_power_down() after calling
atomisp_runtime_suspend(), which already calls
atomisp_mrfld_power_down() itself.

And the some goes for atomisp_runtime_resume() / atomisp_mrfld_power_up().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c  | 16 +++++-----------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h  |  2 --
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c |  4 ++--
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 7f33a2f1e3fc..c69a646aa4d5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -311,17 +311,11 @@ int atomisp_reset(struct atomisp_device *isp)
 	ret = atomisp_runtime_suspend(isp->dev);
 	if (ret < 0)
 		dev_err(isp->dev, "atomisp_runtime_suspend failed, %d\n", ret);
-	ret = atomisp_mrfld_power_down(isp);
-	if (ret < 0) {
-		dev_err(isp->dev, "can not disable ISP power\n");
-	} else {
-		ret = atomisp_mrfld_power_up(isp);
-		if (ret < 0)
-			dev_err(isp->dev, "can not enable ISP power\n");
-		ret = atomisp_runtime_resume(isp->dev);
-		if (ret < 0)
-			dev_err(isp->dev, "atomisp_runtime_resume failed, %d\n", ret);
-	}
+
+	ret = atomisp_runtime_resume(isp->dev);
+	if (ret < 0)
+		dev_err(isp->dev, "atomisp_runtime_resume failed, %d\n", ret);
+
 	ret = atomisp_css_resume(isp);
 	if (ret)
 		isp->isp_fatal_error = true;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index d9110bba8c28..61cbdc1215de 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -341,8 +341,6 @@ int atomisp_inject_a_fake_event(struct atomisp_sub_device *asd, int *event);
 int atomisp_get_invalid_frame_num(struct video_device *vdev,
 				  int *invalid_frame_num);
 
-int atomisp_mrfld_power_up(struct atomisp_device *isp);
-int atomisp_mrfld_power_down(struct atomisp_device *isp);
 int atomisp_runtime_suspend(struct device *dev);
 int atomisp_runtime_resume(struct device *dev);
 #endif /* __ATOMISP_CMD_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index d5bb9906ca6f..d7fb700252fa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -725,13 +725,13 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 }
 
 /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
-int atomisp_mrfld_power_down(struct atomisp_device *isp)
+static int atomisp_mrfld_power_down(struct atomisp_device *isp)
 {
 	return atomisp_mrfld_power(isp, false);
 }
 
 /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
-int atomisp_mrfld_power_up(struct atomisp_device *isp)
+static int atomisp_mrfld_power_up(struct atomisp_device *isp)
 {
 	return atomisp_mrfld_power(isp, true);
 }
-- 
2.38.1

