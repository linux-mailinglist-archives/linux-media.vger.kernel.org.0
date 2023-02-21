Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 873A669E2E3
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234588AbjBUPAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234578AbjBUPAc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:00:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C941E5DE
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676991584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=90px5i4rRfIXxe5wQUs/OIEz0jYuXtqNMDf179nVdzA=;
        b=L3/kPcOdcyD2Zuq9PvHL1GZ2icQBSpe2iNXSIudzZOf65wGwMuVbQbRUmZB2oI1olOHMb3
        /hz9zuBURQAzCXrx1RIpO12ES/AoWA220oFPi3T2c5n3zm2jkvOQi8GylaUIRlhK8vjhwF
        cxMBKOAOpUSjQ7PXlC9CWpHmjoofoWc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-wcmTsapmODOg3kl-DCpHhg-1; Tue, 21 Feb 2023 09:59:41 -0500
X-MC-Unique: wcmTsapmODOg3kl-DCpHhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73ED53806118;
        Tue, 21 Feb 2023 14:59:40 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 764972026D4B;
        Tue, 21 Feb 2023 14:59:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 06/10] media: atomisp: Remove atomisp_get_metadata_type()
Date:   Tue, 21 Feb 2023 15:59:02 +0100
Message-Id: <20230221145906.8113-7-hdegoede@redhat.com>
In-Reply-To: <20230221145906.8113-1-hdegoede@redhat.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_get_metadata_type() always returns ATOMISP_MAIN_METADATA,
replace its uses with ATOMISP_MAIN_METADATA and remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c  | 9 +--------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h  | 5 -----
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 3 +--
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 22b8e13e9c2e..2c73af9f039f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -728,13 +728,6 @@ static void atomisp_recover_params_queue(struct atomisp_video_pipe *pipe)
 	atomisp_handle_parameter_and_buffer(pipe);
 }
 
-enum atomisp_metadata_type
-atomisp_get_metadata_type(struct atomisp_sub_device *asd,
-			  enum ia_css_pipe_id pipe_id)
-{
-	return ATOMISP_MAIN_METADATA;
-}
-
 void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		      enum ia_css_buffer_type buf_type,
 		      enum ia_css_pipe_id css_pipe_id,
@@ -806,7 +799,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		if (error)
 			break;
 
-		md_type = atomisp_get_metadata_type(asd, css_pipe_id);
+		md_type = ATOMISP_MAIN_METADATA;
 		list_for_each_entry_safe(md_iter, _md_buf_tmp,
 					 &asd->metadata_in_css[md_type], list) {
 			if (md_iter->metadata ==
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index d26593cc648e..399b549bcf83 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -313,11 +313,6 @@ void atomisp_init_raw_buffer_bitmap(struct atomisp_sub_device *asd);
 int atomisp_enable_dz_capt_pipe(struct atomisp_sub_device *asd,
 				unsigned int *enable);
 
-/* Function to get metadata type bu pipe id */
-enum atomisp_metadata_type
-atomisp_get_metadata_type(struct atomisp_sub_device *asd,
-			  enum ia_css_pipe_id pipe_id);
-
 u32 atomisp_get_pixel_depth(u32 pixelformat);
 
 /* Function for HAL to inject a fake event to wake up poll thread */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 28649a522683..55c9ff87c112 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -112,8 +112,7 @@ static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
 	enum ia_css_pipe_id css_pipe_id)
 {
 	struct atomisp_metadata_buf *metadata_buf;
-	enum atomisp_metadata_type md_type =
-	    atomisp_get_metadata_type(asd, css_pipe_id);
+	enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
 	struct list_head *metadata_list;
 
 	if (asd->metadata_bufs_in_css[stream_id][css_pipe_id] >=
-- 
2.39.1

