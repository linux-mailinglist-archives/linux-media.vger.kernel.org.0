Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93B1D6316EB
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiKTWnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiKTWnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:43:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAAD423BE4
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984087;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rq0qMDVBJncm9OTj6Q4TlvW58xhJmVCUHL2CKOziY6Q=;
        b=OgKp649+4pQXAN5JQMM1S5qVYhjvw5rwD60h5JrsYlwTtRKyliwxLTkzxP4G6oNlSn23md
        khUzxilKIm+QYM7qDVwVEBEJ5fu8ccny2MxHL4TftDkqNjX8kOeL7xaSdvTUK8NcKSy+8I
        n6oeXe2OJOgYwGwQ9/oaMYbM7ug/jlE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-6En_P5naM1-ulHDYtao5zQ-1; Sun, 20 Nov 2022 17:41:21 -0500
X-MC-Unique: 6En_P5naM1-ulHDYtao5zQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B48B6833A06;
        Sun, 20 Nov 2022 22:41:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4231047505E;
        Sun, 20 Nov 2022 22:41:19 +0000 (UTC)
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
Subject: [PATCH 06/20] media: atomisp: Fix deadlock when the /dev/video# node is closed while still streaming
Date:   Sun, 20 Nov 2022 23:40:47 +0100
Message-Id: <20221120224101.746199-7-hdegoede@redhat.com>
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

atomisp_release() was taking pipe->vb_queue_mutex + isp->mutex at the
same time. But if the /dev/video# node is closed while still streaming
then vb2_queue_release() will call atomisp_stop_streaming() which takes
isp->mutex itself, leading to a deadlock.

To fix this only take isp->mutex after cleaning up the v4l2_fh /
the vb2_queue. While at it switch to vb2_fop_release() which will take
pipe->vb_queue_mutex for us, which also resolves a FIXME comment.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  | 21 +++++--------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 21ca276831ce..8cff26d42b82 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -861,23 +861,14 @@ static int atomisp_release(struct file *file)
 
 	v4l2_fh_init(&fh.vfh, vdev);
 
-	mutex_lock(&pipe->vb_queue_mutex);
-	mutex_lock(&isp->mutex);
-
 	dev_dbg(isp->dev, "release device %s\n", vdev->name);
 
 	asd->subdev.devnode = vdev;
 
-	/*
-	 * FIXME This if is copied from _vb2_fop_release, this cannot use that
-	 * because that calls v4l2_fh_release() earlier then this function.
-	 * Maybe we can release the fh earlier though, it does not look like
-	 * anything needs it after this.
-	 */
-	if (file->private_data == vdev->queue->owner) {
-		vb2_queue_release(vdev->queue);
-		vdev->queue->owner = NULL;
-	}
+	/* Note file must not be used after this! */
+	vb2_fop_release(file);
+
+	mutex_lock(&isp->mutex);
 
 	pipe->users--;
 	if (pipe->users)
@@ -940,9 +931,7 @@ static int atomisp_release(struct file *file)
 				     V4L2_SEL_TGT_COMPOSE, 0,
 				     &clear_compose);
 	mutex_unlock(&isp->mutex);
-	mutex_unlock(&pipe->vb_queue_mutex);
-
-	return v4l2_fh_release(file);
+	return 0;
 }
 
 const struct v4l2_file_operations atomisp_fops = {
-- 
2.38.1

