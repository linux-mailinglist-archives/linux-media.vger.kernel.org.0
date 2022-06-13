Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29023549FD9
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350427AbiFMUqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345765AbiFMUpL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D2C8927CE3
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/+JtaiCUEn9t0GONNbuN/ZQHjlw77uDS3sePZWK6ExA=;
        b=WYs55xeaG/mAtkF+mGyFMY7wLkoiG/P/JlF0l5gY3fatiaWN8wdhvjOl0TrPzzmbHvEwux
        DGjCNScHPLWzy832SSRDR7gBNew8ager8Bq5Q5MXHPOroV7kz1SIXPUPy9PAXyRMCokBZR
        7X4SHgIuR3iiZoPO/c7jRw4bwArh+Nc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-ueZQyMT5Ps2nN7EqmOok-A-1; Mon, 13 Jun 2022 15:52:40 -0400
X-MC-Unique: ueZQyMT5Ps2nN7EqmOok-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F67618E528A;
        Mon, 13 Jun 2022 19:52:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A79FA2166B26;
        Mon, 13 Jun 2022 19:52:38 +0000 (UTC)
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
Subject: [PATCH 34/40] media: atomisp: add error checking to atomisp_create_pipes_stream()
Date:   Mon, 13 Jun 2022 21:51:31 +0200
Message-Id: <20220613195137.8117-35-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The functions called by atomisp_create_pipes_stream() can fail,
add error checking for them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_compat.h        |  2 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  | 20 ++++++++++++++++---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 13 ++++++++++--
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 809f1a8c9974..3393ae6824f0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -240,7 +240,7 @@ int atomisp_css_input_configure_port(struct atomisp_sub_device *asd,
 				     unsigned int metadata_width,
 				     unsigned int metadata_height);
 
-void atomisp_create_pipes_stream(struct atomisp_sub_device *asd);
+int atomisp_create_pipes_stream(struct atomisp_sub_device *asd);
 void atomisp_destroy_pipes_stream_force(struct atomisp_sub_device *asd);
 
 void atomisp_css_stop(struct atomisp_sub_device *asd,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index d03b29add5c3..6375cfb839d4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -785,10 +785,24 @@ static int __create_pipes(struct atomisp_sub_device *asd)
 	return -EINVAL;
 }
 
-void atomisp_create_pipes_stream(struct atomisp_sub_device *asd)
+int atomisp_create_pipes_stream(struct atomisp_sub_device *asd)
 {
-	__create_pipes(asd);
-	__create_streams(asd);
+	int ret;
+
+	ret = __create_pipes(asd);
+	if (ret) {
+		dev_err(asd->isp->dev, "create pipe failed %d.\n", ret);
+		return ret;
+	}
+
+	ret = __create_streams(asd);
+	if (ret) {
+		dev_warn(asd->isp->dev, "create stream failed %d.\n", ret);
+		__destroy_pipes(asd, true);
+		return ret;
+	}
+
+	return 0;
 }
 
 int atomisp_css_update_stream(struct atomisp_sub_device *asd)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 73906902600c..459645c2e2a7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -2267,8 +2267,17 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 		dev_err(isp->dev, "atomisp_reset");
 		atomisp_reset(isp);
 		for (i = 0; i < isp->num_of_streams; i++) {
-			if (recreate_streams[i])
-				atomisp_create_pipes_stream(&isp->asd[i]);
+			if (recreate_streams[i]) {
+				int ret2;
+
+				ret2 = atomisp_create_pipes_stream(&isp->asd[i]);
+				if (ret2) {
+					dev_err(isp->dev, "%s error re-creating streams: %d\n",
+						__func__, ret2);
+					if (!ret)
+						ret = ret2;
+				}
+			}
 		}
 		isp->isp_timeout = false;
 	}
-- 
2.36.0

