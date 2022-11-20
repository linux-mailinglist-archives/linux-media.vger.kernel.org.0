Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360216316F5
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiKTWoE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:44:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiKTWoD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65DF25298
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jVRxNHmpUpoYya9NVzeB/X2X7WHsUEEp3vxfkQSRbmw=;
        b=Xz7Ndf0uVSC7tz3WaEHTsCNhkdAQ7w4Vuoek2aHWBddSprr1vR1fOL/o/+oEeDwKu+Gxse
        6YMe6bEox35FeoEqsxKrAWURBOlOqRN+nJq+3qni96hqspGwJv7ghu6i3p+qhjy8jSKZAf
        q5Ki8SiO5FHGTnvTomcZ1nhBDXD/khg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-xmMWABslMbCeZFIwR5Pf4g-1; Sun, 20 Nov 2022 17:41:40 -0500
X-MC-Unique: xmMWABslMbCeZFIwR5Pf4g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31BA83C0DDA0;
        Sun, 20 Nov 2022 22:41:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B752647505E;
        Sun, 20 Nov 2022 22:41:38 +0000 (UTC)
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
Subject: [PATCH 17/20] media: atomisp: Move calling of css_[un]init() to power_on()/_off()
Date:   Sun, 20 Nov 2022 23:40:58 +0100
Message-Id: <20221120224101.746199-18-hdegoede@redhat.com>
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

atomisp_css_init() is always called after calling atomisp_power_on()
either directly or through getting a runtime-pm reference.

Likewise atomisp_css_uninit() is always called after calling
atomisp_power_off().

Move the call site of these 2 functions to inside atomisp_power_on() /
atomisp_power_off() to make this more explicit.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c  | 8 +++-----
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 9 ---------
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 5 ++++-
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index dac19db55625..7821bbd1e8da 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -302,18 +302,16 @@ int atomisp_reset(struct atomisp_device *isp)
 	int ret = 0;
 
 	dev_dbg(isp->dev, "%s\n", __func__);
-	atomisp_css_uninit(isp);
+
 	ret = atomisp_power_off(isp->dev);
 	if (ret < 0)
 		dev_err(isp->dev, "atomisp_power_off failed, %d\n", ret);
 
 	ret = atomisp_power_on(isp->dev);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(isp->dev, "atomisp_power_on failed, %d\n", ret);
-
-	ret = atomisp_css_init(isp);
-	if (ret)
 		isp->isp_fatal_error = true;
+	}
 
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 8cff26d42b82..0123429d94f4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -809,13 +809,6 @@ static int atomisp_open(struct file *file)
 		goto error;
 	}
 
-	/* Init ISP */
-	if (atomisp_css_init(isp)) {
-		ret = -EINVAL;
-		/* Need to clean up CSS init if it fails. */
-		goto css_error;
-	}
-
 	atomisp_dev_init_struct(isp);
 
 	ret = v4l2_subdev_call(isp->flash, core, s_power, 1);
@@ -840,7 +833,6 @@ static int atomisp_open(struct file *file)
 	return 0;
 
 css_error:
-	atomisp_css_uninit(isp);
 	pm_runtime_put(vdev->v4l2_dev->dev);
 error:
 	mutex_unlock(&isp->mutex);
@@ -909,7 +901,6 @@ static int atomisp_release(struct file *file)
 		goto done;
 
 	atomisp_destroy_pipes_stream_force(asd);
-	atomisp_css_uninit(isp);
 
 	if (defer_fw_load) {
 		ia_css_unload_firmware();
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index f670517bc141..f46046d7ef50 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -726,6 +726,8 @@ int atomisp_power_off(struct device *dev)
 				     dev_get_drvdata(dev);
 	int ret;
 
+	atomisp_css_uninit(isp);
+
 	ret = atomisp_mrfld_pre_power_down(isp);
 	if (ret)
 		return ret;
@@ -761,7 +763,8 @@ int atomisp_power_on(struct device *dev)
 		atomisp_restore_iunit_reg(isp);
 
 	atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_LOW, true);
-	return 0;
+
+	return atomisp_css_init(isp);
 }
 
 static int __maybe_unused atomisp_suspend(struct device *dev)
-- 
2.38.1

