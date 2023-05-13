Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4F77016BD
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238824AbjEMMem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238989AbjEMMef (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF1A3C16
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1lvcXdiTrLW95sr9qvO+mlncNVyiCzULs+rA+/pmOsw=;
        b=gVW8fnAyvua9CoGJNMyl4kS999RWVGWJI0Q9XhSa6fklHUR2vgJ4o4Tzoe+mgRgYivRWE/
        IdJ8ZXGEjmbQSa0noG+u6Oo2mPWaudEefD9CobnXLI6l/55zFhJR6BxiMp2ykcHUVObHeu
        ShO7RfkMAIkft0rcl/MrGY8Kdwkk0oA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-0ec4i7qcP1SbSFTAcOTRlg-1; Sat, 13 May 2023 08:32:47 -0400
X-MC-Unique: 0ec4i7qcP1SbSFTAcOTRlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 751831C060EB;
        Sat, 13 May 2023 12:32:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E596740C2076;
        Sat, 13 May 2023 12:32:44 +0000 (UTC)
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
Subject: [PATCH 25/30] media: atomisp: Allow system suspend to continue with open /dev/video# nodes
Date:   Sat, 13 May 2023 14:31:54 +0200
Message-Id: <20230513123159.33234-26-hdegoede@redhat.com>
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

Just having a /dev/video# node open is not a reason to block system
suspend. At least when userspace is not streaming.

In that case the worst case scenario is that streams have been created,
but we can just destroy those before powering off the ISP and
recreate the streams on resume.

Fixing suspend when streaming is left as a FIXME item for later.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_subdev.h        |  1 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 23 ++++++++++++-------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 49177386d57f..dc6970b48633 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -301,6 +301,7 @@ struct atomisp_sub_device {
 	 */
 	bool streaming;
 	bool stream_prepared; /* whether css stream is created */
+	bool recreate_streams_on_resume;
 
 	unsigned int latest_preview_exp_id; /* CSS ZSL/SDV raw buffer id */
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c68e9062743d..a76b60f8b411 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -664,13 +664,7 @@ static int atomisp_suspend(struct device *dev)
 				     dev_get_drvdata(dev);
 	unsigned long flags;
 
-	/*
-	 * FIXME: Suspend is not supported by sensors. Abort if any video
-	 * node was opened.
-	 */
-	if (atomisp_dev_users(isp))
-		return -EBUSY;
-
+	/* FIXME: Suspend is not supported by sensors. Abort if streaming. */
 	spin_lock_irqsave(&isp->lock, flags);
 	if (isp->asd.streaming) {
 		spin_unlock_irqrestore(&isp->lock, flags);
@@ -681,12 +675,25 @@ static int atomisp_suspend(struct device *dev)
 
 	pm_runtime_resume(dev);
 
+	isp->asd.recreate_streams_on_resume = isp->asd.stream_prepared;
+	atomisp_destroy_pipes_stream(&isp->asd);
+
 	return atomisp_power_off(dev);
 }
 
 static int atomisp_resume(struct device *dev)
 {
-	return atomisp_power_on(dev);
+	struct atomisp_device *isp = dev_get_drvdata(dev);
+	int ret;
+
+	ret = atomisp_power_on(dev);
+	if (ret)
+		return ret;
+
+	if (isp->asd.recreate_streams_on_resume)
+		ret = atomisp_create_pipes_stream(&isp->asd);
+
+	return ret;
 }
 
 int atomisp_csi_lane_config(struct atomisp_device *isp)
-- 
2.40.1

