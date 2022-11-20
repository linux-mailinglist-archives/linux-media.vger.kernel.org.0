Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69A296316E8
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiKTWnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiKTWnG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:43:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3208A2409A
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984089;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DAD6xe8b5l/xn4R/xSvBVRuhZESnJFjuxGvn67OZsQI=;
        b=cuwrGCgM9u+2lIDWcHrmgCmEeaMKhniR7Q4PpiSolAiAeCxqHOkji78w/QXRiIHNOg0qlI
        kSMPpfDgaWaQwGtJHPpH6vY5o1UQ2wOLmd2/7VGano6gBlvOarDTGOXKlAsOWya6km1SSu
        aJMpk5Mo1AR+SJZiBVydCghBvMHRsgM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-XZBCZbGYMBSV1bXhrDCouA-1; Sun, 20 Nov 2022 17:41:12 -0500
X-MC-Unique: XZBCZbGYMBSV1bXhrDCouA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 376333804072;
        Sun, 20 Nov 2022 22:41:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 66EF147505E;
        Sun, 20 Nov 2022 22:41:10 +0000 (UTC)
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
Subject: [PATCH 01/20] media: atomisp: Silence: 'atomisp_q_one_s3a_buffer: drop one s3a stat which has exp_id xx' log messages
Date:   Sun, 20 Nov 2022 23:40:42 +0100
Message-Id: <20221120224101.746199-2-hdegoede@redhat.com>
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

Standard v4l2 userspace apps do not consume the s3a statistics block
data. Until we have a userspace consumer for this (libcamera), which
might also involve changing the API for this, lower the log level
of these messages to dev_dbg() to avoid them filling up the logs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index f3f5b54bd347..21ca276831ce 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -181,8 +181,8 @@ static int atomisp_q_one_s3a_buffer(struct atomisp_sub_device *asd,
 	} else {
 		list_add_tail(&s3a_buf->list, &asd->s3a_stats_in_css);
 		if (s3a_list == &asd->s3a_stats_ready)
-			dev_warn(asd->isp->dev, "%s: drop one s3a stat which has exp_id %d!\n",
-				 __func__, exp_id);
+			dev_dbg(asd->isp->dev, "%s: drop one s3a stat which has exp_id %d!\n",
+				__func__, exp_id);
 	}
 
 	asd->s3a_bufs_in_css[css_pipe_id]++;
-- 
2.38.1

