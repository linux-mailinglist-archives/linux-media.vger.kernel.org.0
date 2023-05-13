Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2CF87016A2
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238496AbjEMMdu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238374AbjEMMdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1233A8E
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y2pdsMkQtZiydY64bbIRar2WBol6/oWQ5LxtqS2y+w4=;
        b=ApF5mwzVi0PwcxRiah1onYUEp3iniXX3BHaSr7ri3SpjdNbe2Nncvdc8+AvJ8Pg8r8eoa+
        IcCdQbQXDxd1ham+DL6dHv/GWZydCfaR3vM85bzsC9xch8ebvMJ6uRzW4I0VCX50gB3kX1
        QJpZD6WUovO1Oo6ONUWGOlECSm7x0IY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-3YrEQhzYMSGX7XCF5nY8QQ-1; Sat, 13 May 2023 08:32:25 -0400
X-MC-Unique: 3YrEQhzYMSGX7XCF5nY8QQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 494EA88B767;
        Sat, 13 May 2023 12:32:25 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B91BD40C2076;
        Sat, 13 May 2023 12:32:23 +0000 (UTC)
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
Subject: [PATCH 13/30] media: atomisp: Remove unused mipi_frame_size field from atomisp_[sub_]device
Date:   Sat, 13 May 2023 14:31:42 +0200
Message-Id: <20230513123159.33234-14-hdegoede@redhat.com>
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

Both the atomisp_device and the atomisp_sub_device structs have
an used mipi_frame_size field, remove the field from both.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c     | 2 --
 drivers/staging/media/atomisp/pci/atomisp_internal.h | 1 -
 drivers/staging/media/atomisp/pci/atomisp_subdev.h   | 2 --
 3 files changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 39eba99feee0..37d8c8af3e8c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -448,7 +448,6 @@ static void atomisp_dev_init_struct(struct atomisp_device *isp)
 	unsigned int i;
 
 	isp->isp_fatal_error = false;
-	isp->mipi_frame_size = 0;
 
 	for (i = 0; i < isp->input_cnt; i++)
 		isp->inputs[i].asd = NULL;
@@ -478,7 +477,6 @@ static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
 	/* Add for channel */
 	asd->input_curr = 0;
 
-	asd->mipi_frame_size = 0;
 	asd->copy_mode = false;
 
 	asd->stream_prepared = false;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index e531f0c71a15..cec0ac92726e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -211,7 +211,6 @@ struct atomisp_device {
 
 	spinlock_t lock; /* Protects asd.streaming */
 
-	unsigned int mipi_frame_size;
 	const struct atomisp_dfs_config *dfs;
 	unsigned int hpll_freq;
 	unsigned int running_freq;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 28afcdd41ef3..a702890003f9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -304,8 +304,6 @@ struct atomisp_sub_device {
 
 	unsigned int latest_preview_exp_id; /* CSS ZSL/SDV raw buffer id */
 
-	unsigned int mipi_frame_size;
-
 	bool copy_mode; /* CSI2+ use copy mode */
 
 	int raw_buffer_bitmap[ATOMISP_MAX_EXP_ID / 32 +
-- 
2.40.1

