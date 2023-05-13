Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D11870169A
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238206AbjEMMdE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjEMMdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD80830C3
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7OFnEw8hW+DZB+1ZTdNNX82shgA4zEJhNmCN+I8HWss=;
        b=bCD50oX+Z9p5q6r3zPhRZsshCVmFAPg6XWeA7oRAOeJt5gsnS9PHcbVP0xMhRCD0468fsb
        G//79lR+tsu0oft4fEJfDLOH6TiC/s40fnS/b+udSynZldaD7emxyJrvk6ztYe2atL13pf
        ecPgI9zEsbrx3rKTIbQG9O7eibUp/cg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-C9R_vt4CMC2Lz21uUBP0Ew-1; Sat, 13 May 2023 08:32:08 -0400
X-MC-Unique: C9R_vt4CMC2Lz21uUBP0Ew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86988857E62;
        Sat, 13 May 2023 12:32:07 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5AEAE40C2076;
        Sat, 13 May 2023 12:32:05 +0000 (UTC)
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
Subject: [PATCH 03/30] media: atomisp: Remove isp->need_gfx_throttle field
Date:   Sat, 13 May 2023 14:31:32 +0200
Message-Id: <20230513123159.33234-4-hdegoede@redhat.com>
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

Remove the isp->need_gfx_throttle field it is only ever set and
never read.

Also the code setting it is broken, comparing run_mode->val to
ATOMISP_SUBDEV_PAD_SOURCE_VIDEO which are not of the same type /
not part of the same enum.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c      | 10 ----------
 drivers/staging/media/atomisp/pci/atomisp_fops.c     |  1 -
 drivers/staging/media/atomisp/pci/atomisp_internal.h |  2 --
 3 files changed, 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index bb49d6f2e67f..ed1a534b7c05 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4693,16 +4693,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	f->fmt.pix = pipe->pix;
 	f->fmt.pix.priv = PAGE_ALIGN(pipe->pix.width *
 				     pipe->pix.height * 2);
-
-	/*
-	 * If in video 480P case, no GFX throttle
-	 */
-	if (asd->run_mode->val == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO &&
-	    f->fmt.pix.width == 720 && f->fmt.pix.height == 480)
-		isp->need_gfx_throttle = false;
-	else
-		isp->need_gfx_throttle = true;
-
 	/* Report the needed sizes */
 	f->fmt.pix.sizeimage = pipe->pix.sizeimage;
 	f->fmt.pix.bytesperline = pipe->pix.bytesperline;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index fa362c8a37e8..a95c41d084c2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -539,7 +539,6 @@ static void atomisp_dev_init_struct(struct atomisp_device *isp)
 {
 	unsigned int i;
 
-	isp->need_gfx_throttle = true;
 	isp->isp_fatal_error = false;
 	isp->mipi_frame_size = 0;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 1fac99f4e2b0..e531f0c71a15 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -211,8 +211,6 @@ struct atomisp_device {
 
 	spinlock_t lock; /* Protects asd.streaming */
 
-	bool need_gfx_throttle;
-
 	unsigned int mipi_frame_size;
 	const struct atomisp_dfs_config *dfs;
 	unsigned int hpll_freq;
-- 
2.40.1

