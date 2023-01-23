Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1DE7677BBC
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbjAWMxV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbjAWMxU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F596EA0
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478356;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k49w3FB7U89RPB+dgCfbA6Xcr5aEbMfG4yU0fCOxZKU=;
        b=esbfd9xL1s0ION9EIVGGByAC1rM5D+nqcGEI+mlbBDU3aMLXy6E6WIn9pTNeMtfzD7fVA1
        7ZQGk0Kz8YbwQ8gr7tBkhQs7hqmitX3toEB61q7JQUgM/qKFpHQDBp2b3SDj2RW3dMVxhw
        1c0CThr2bxLU7gWz7blTlL2pffvSw98=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-hLtaUlsuOvydlbVjrYXanw-1; Mon, 23 Jan 2023 07:52:19 -0500
X-MC-Unique: hLtaUlsuOvydlbVjrYXanw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B71F18A6463;
        Mon, 23 Jan 2023 12:52:19 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 71C9FC15BA0;
        Mon, 23 Jan 2023 12:52:16 +0000 (UTC)
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
Subject: [PATCH 03/57] media: atomisp: Remove atomisp_sw_contex struct
Date:   Mon, 23 Jan 2023 13:51:11 +0100
Message-Id: <20230123125205.622152-4-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the atomisp_sw_contex struct, it has only 1 member: running_freq,
instead store running_freq directly.

While at it also change running_freq from an int to an unsigned int,
all values stored in it are unsigned and it is compared to the also
unsigned new_freq variable.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c      | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_fops.c     | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_internal.h | 6 +-----
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index d8c7e7367386..5cea1df48b7d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -280,14 +280,14 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 done:
 	dev_dbg(isp->dev, "DFS target frequency=%d.\n", new_freq);
 
-	if ((new_freq == isp->sw_contex.running_freq) && !force)
+	if ((new_freq == isp->running_freq) && !force)
 		return 0;
 
 	dev_dbg(isp->dev, "Programming DFS frequency to %d\n", new_freq);
 
 	ret = write_target_freq_to_hw(isp, new_freq);
 	if (!ret) {
-		isp->sw_contex.running_freq = new_freq;
+		isp->running_freq = new_freq;
 		trace_ipu_pstate(new_freq, -1);
 	}
 	return ret;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index acea7492847d..4643bb0db995 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -681,7 +681,7 @@ static void atomisp_dev_init_struct(struct atomisp_device *isp)
 	 * For Merrifield, frequency is scalable.
 	 * After boot-up, the default frequency is 200MHz.
 	 */
-	isp->sw_contex.running_freq = ISP_FREQ_200MHZ;
+	isp->running_freq = ISP_FREQ_200MHZ;
 }
 
 static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 653e6d74a966..675007d7d9af 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -194,10 +194,6 @@ struct atomisp_regs {
 	u32 csi_access_viol;
 };
 
-struct atomisp_sw_contex {
-	int running_freq;
-};
-
 #define ATOMISP_DEVICE_STREAMING_DISABLED	0
 #define ATOMISP_DEVICE_STREAMING_ENABLED	1
 #define ATOMISP_DEVICE_STREAMING_STOPPING	2
@@ -242,7 +238,6 @@ struct atomisp_device {
 	struct v4l2_subdev *motor;
 
 	struct atomisp_regs saved_regs;
-	struct atomisp_sw_contex sw_contex;
 	struct atomisp_css_env css_env;
 
 	/* isp timeout status flag */
@@ -257,6 +252,7 @@ struct atomisp_device {
 	unsigned int mipi_frame_size;
 	const struct atomisp_dfs_config *dfs;
 	unsigned int hpll_freq;
+	unsigned int running_freq;
 
 	bool css_initialized;
 };
-- 
2.39.0

