Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACF673545B
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 12:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbjFSKzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 06:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232349AbjFSKym (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 06:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88F8170D
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 03:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687171950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rocdS1G7kg2dzftmRc7177VXemHXk6WwFOcw3sbeAgo=;
        b=TKwtntC492I+8ILmAUKv5Z9nQkL50GEk3+qdG2amhqCz4bzMBxVe7/wJZMD4sM42Od5Ao+
        NOzH6PCkY+Z41XAChp2EL441cw2U54ffSqMOGpxOV2UiI0I9qU4G6NQgi0/FBSrVnnBFqT
        vLVLqDKT7Ha9iLDTPTSmAaDfFi9pckc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-Mck3YCOEPlGymSYRi3FGJA-1; Mon, 19 Jun 2023 06:52:27 -0400
X-MC-Unique: Mck3YCOEPlGymSYRi3FGJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3F36380671B;
        Mon, 19 Jun 2023 10:52:26 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D453112132C;
        Mon, 19 Jun 2023 10:52:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 7/7] media: atomisp: Remove v4l2_ctrl_s_ctrl(asd->run_mode) calls from atomisp_open()
Date:   Mon, 19 Jun 2023 12:52:12 +0200
Message-Id: <20230619105212.303653-7-hdegoede@redhat.com>
In-Reply-To: <20230619105212.303653-1-hdegoede@redhat.com>
References: <20230619105212.303653-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_ctrl_s_ctrl(asd->run_mode) call in atomisp_subdev_init_struct()
gets immediately overridden by a second call directly after
atomisp_subdev_init_struct() is called.

And the second call in atomisp_open() also is not helpful.
ATOMISP_RUN_MODE_PREVIEW is the default and if changed controls
are supposed to stay changed over an open/close of the /dev/video#
node. So drop both calls.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index a09087dccbcb..4dba6120af39 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -460,7 +460,6 @@ static void atomisp_dev_init_struct(struct atomisp_device *isp)
 
 static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
 {
-	v4l2_ctrl_s_ctrl(asd->run_mode, ATOMISP_RUN_MODE_STILL_CAPTURE);
 	memset(&asd->params.css_param, 0, sizeof(asd->params.css_param));
 	asd->params.color_effect = V4L2_COLORFX_NONE;
 	asd->params.bad_pixel_en = true;
@@ -533,8 +532,6 @@ static int atomisp_open(struct file *file)
 	}
 
 	atomisp_subdev_init_struct(asd);
-	/* Ensure that a mode is set */
-	v4l2_ctrl_s_ctrl(asd->run_mode, ATOMISP_RUN_MODE_PREVIEW);
 
 	pipe->users++;
 	mutex_unlock(&isp->mutex);
-- 
2.40.1

