Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69BC3701698
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238046AbjEMMc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjEMMc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7FE2D62
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q4JPZZs8QoS0IAP91TjsoQvkx4xlW5UcQSUCa1N2bAU=;
        b=Oixx83fd9XHgThdaz1epPTpPnbgs0MZAnPDmr180O4zowswU5mP3rGEKhsTIiqTujm73qJ
        ARZpXiTu3USKrdWzxigA/PJO06jciV9E1G/pG/cttBgnp4Nf/SJ54Hgi6/VgNunNAWJaWI
        /tafBrgqxQnGZn06ynk/6TdxWyyCvnU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-mYcZIg5uOc6jQmnYh-ob-g-1; Sat, 13 May 2023 08:32:05 -0400
X-MC-Unique: mYcZIg5uOc6jQmnYh-ob-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 266243C0D858;
        Sat, 13 May 2023 12:32:05 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 91A3E40C2076;
        Sat, 13 May 2023 12:32:03 +0000 (UTC)
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
Subject: [PATCH 02/30] media: atomisp: Remove Continuous capture and SDV run-modes
Date:   Sat, 13 May 2023 14:31:31 +0200
Message-Id: <20230513123159.33234-3-hdegoede@redhat.com>
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

Since we no longer support Continuous mode, setting the run_mode to
ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE no longer make sense, so remove
this.

While at it also remove ATOMISP_RUN_MODE_SDV, which was never exposed
to userspace in the first place.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  5 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  | 12 ---
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  3 -
 .../media/atomisp/pci/atomisp_subdev.c        |  5 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 91 -------------------
 5 files changed, 3 insertions(+), 113 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index c7ec56a1c064..2a94fb7b4073 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -38,7 +38,6 @@
 #define CI_MODE_PREVIEW		0x8000
 #define CI_MODE_VIDEO		0x4000
 #define CI_MODE_STILL_CAPTURE	0x2000
-#define CI_MODE_CONTINUOUS	0x1000
 #define CI_MODE_NONE		0x0000
 
 #define OUTPUT_MODE_FILE 0x0100
@@ -1059,9 +1058,7 @@ struct atomisp_sensor_ae_bracketing_lut {
 #define V4L2_CID_RUN_MODE			(V4L2_CID_CAMERA_LASTP1 + 20)
 #define ATOMISP_RUN_MODE_VIDEO			1
 #define ATOMISP_RUN_MODE_STILL_CAPTURE		2
-#define ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE	3
-#define ATOMISP_RUN_MODE_PREVIEW		4
-#define ATOMISP_RUN_MODE_SDV			5
+#define ATOMISP_RUN_MODE_PREVIEW		3
 
 #define V4L2_CID_ENABLE_VFPP			(V4L2_CID_CAMERA_LASTP1 + 21)
 #define V4L2_CID_ATOMISP_CONTINUOUS_MODE	(V4L2_CID_CAMERA_LASTP1 + 22)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 1dae2a7cfdd9..e8c26e66ae7e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -649,23 +649,11 @@ static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
 		if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
 			return true;
 
-		return false;
-	case ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE:
-		if (pipe_id == IA_CSS_PIPE_ID_CAPTURE ||
-		    pipe_id == IA_CSS_PIPE_ID_PREVIEW)
-			return true;
-
 		return false;
 	case ATOMISP_RUN_MODE_VIDEO:
 		if (pipe_id == IA_CSS_PIPE_ID_VIDEO || pipe_id == IA_CSS_PIPE_ID_YUVPP)
 			return true;
 
-		return false;
-	case ATOMISP_RUN_MODE_SDV:
-		if (pipe_id == IA_CSS_PIPE_ID_CAPTURE ||
-		    pipe_id == IA_CSS_PIPE_ID_VIDEO)
-			return true;
-
 		return false;
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 4d927799f53b..7f031db28476 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1902,9 +1902,6 @@ static int atomisp_s_parm(struct file *file, void *fh,
 	case CI_MODE_STILL_CAPTURE:
 		mode = ATOMISP_RUN_MODE_STILL_CAPTURE;
 		break;
-	case CI_MODE_CONTINUOUS:
-		mode = ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE;
-		break;
 	case CI_MODE_PREVIEW:
 		mode = ATOMISP_RUN_MODE_PREVIEW;
 		break;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index a0acfdb87177..cb8ab0e47d1a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -758,7 +758,6 @@ static const char *const ctrl_run_mode_menu[] = {
 	NULL,
 	"Video",
 	"Still capture",
-	"Continuous capture",
 	"Preview",
 };
 
@@ -769,7 +768,7 @@ static const struct v4l2_ctrl_config ctrl_run_mode = {
 	.type = V4L2_CTRL_TYPE_MENU,
 	.min = 1,
 	.def = 1,
-	.max = 4,
+	.max = 3,
 	.qmenu = ctrl_run_mode_menu,
 };
 
@@ -971,7 +970,7 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 		return ret;
 
 	ret = atomisp_video_init(&asd->video_out_vf, "VIEWFINDER",
-				 ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE);
+				 ATOMISP_RUN_MODE_STILL_CAPTURE);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 3f315dabbeeb..4370d560308e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -119,13 +119,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_merr[] = {
 		.isp_freq = ISP_FREQ_400MHZ,
 		.run_mode = ATOMISP_RUN_MODE_STILL_CAPTURE,
 	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_400MHZ,
-		.run_mode = ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE,
-	},
 	{
 		.width = ISP_FREQ_RULE_ANY,
 		.height = ISP_FREQ_RULE_ANY,
@@ -133,13 +126,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_merr[] = {
 		.isp_freq = ISP_FREQ_400MHZ,
 		.run_mode = ATOMISP_RUN_MODE_PREVIEW,
 	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_457MHZ,
-		.run_mode = ATOMISP_RUN_MODE_SDV,
-	},
 };
 
 /* Merrifield and Moorefield DFS rules */
@@ -166,13 +152,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_merr_1179[] = {
 		.isp_freq = ISP_FREQ_400MHZ,
 		.run_mode = ATOMISP_RUN_MODE_STILL_CAPTURE,
 	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_400MHZ,
-		.run_mode = ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE,
-	},
 	{
 		.width = ISP_FREQ_RULE_ANY,
 		.height = ISP_FREQ_RULE_ANY,
@@ -180,13 +159,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_merr_1179[] = {
 		.isp_freq = ISP_FREQ_400MHZ,
 		.run_mode = ATOMISP_RUN_MODE_PREVIEW,
 	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_400MHZ,
-		.run_mode = ATOMISP_RUN_MODE_SDV,
-	},
 };
 
 static const struct atomisp_dfs_config dfs_config_merr_1179 = {
@@ -247,13 +219,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_merr_117a[] = {
 		.isp_freq = ISP_FREQ_400MHZ,
 		.run_mode = ATOMISP_RUN_MODE_STILL_CAPTURE,
 	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_400MHZ,
-		.run_mode = ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE,
-	},
 	{
 		.width = ISP_FREQ_RULE_ANY,
 		.height = ISP_FREQ_RULE_ANY,
@@ -261,13 +226,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_merr_117a[] = {
 		.isp_freq = ISP_FREQ_200MHZ,
 		.run_mode = ATOMISP_RUN_MODE_PREVIEW,
 	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_400MHZ,
-		.run_mode = ATOMISP_RUN_MODE_SDV,
-	},
 };
 
 static struct atomisp_dfs_config dfs_config_merr_117a = {
@@ -293,13 +251,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_byt[] = {
 		.isp_freq = ISP_FREQ_400MHZ,
 		.run_mode = ATOMISP_RUN_MODE_STILL_CAPTURE,
 	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_400MHZ,
-		.run_mode = ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE,
-	},
 	{
 		.width = ISP_FREQ_RULE_ANY,
 		.height = ISP_FREQ_RULE_ANY,
@@ -307,13 +258,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_byt[] = {
 		.isp_freq = ISP_FREQ_400MHZ,
 		.run_mode = ATOMISP_RUN_MODE_PREVIEW,
 	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_400MHZ,
-		.run_mode = ATOMISP_RUN_MODE_SDV,
-	},
 };
 
 static const struct atomisp_dfs_config dfs_config_byt = {
@@ -339,13 +283,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_cht[] = {
 		.isp_freq = ISP_FREQ_356MHZ,
 		.run_mode = ATOMISP_RUN_MODE_STILL_CAPTURE,
 	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_320MHZ,
-		.run_mode = ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE,
-	},
 	{
 		.width = ISP_FREQ_RULE_ANY,
 		.height = ISP_FREQ_RULE_ANY,
@@ -353,20 +290,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_cht[] = {
 		.isp_freq = ISP_FREQ_320MHZ,
 		.run_mode = ATOMISP_RUN_MODE_PREVIEW,
 	},
-	{
-		.width = 1280,
-		.height = 720,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_320MHZ,
-		.run_mode = ATOMISP_RUN_MODE_SDV,
-	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_356MHZ,
-		.run_mode = ATOMISP_RUN_MODE_SDV,
-	},
 };
 
 static const struct atomisp_freq_scaling_rule dfs_rules_cht_soc[] = {
@@ -384,13 +307,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_cht_soc[] = {
 		.isp_freq = ISP_FREQ_356MHZ,
 		.run_mode = ATOMISP_RUN_MODE_STILL_CAPTURE,
 	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_320MHZ,
-		.run_mode = ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE,
-	},
 	{
 		.width = ISP_FREQ_RULE_ANY,
 		.height = ISP_FREQ_RULE_ANY,
@@ -398,13 +314,6 @@ static const struct atomisp_freq_scaling_rule dfs_rules_cht_soc[] = {
 		.isp_freq = ISP_FREQ_320MHZ,
 		.run_mode = ATOMISP_RUN_MODE_PREVIEW,
 	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_356MHZ,
-		.run_mode = ATOMISP_RUN_MODE_SDV,
-	},
 };
 
 static const struct atomisp_dfs_config dfs_config_cht = {
-- 
2.40.1

