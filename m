Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1BAC60692F
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 21:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbiJTTzz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 15:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiJTTzw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 15:55:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33DD105341
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 12:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666295751;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ih1fLJDty9tJEpj13ee4LV7nQlVfKVmChokICFtDDZI=;
        b=SRpgGZbrR47dWTh25eQVk8WkMzGookbRDKUjj0LR+8OBIYNYDlXT0MHzm0u6rqDmVc+v0E
        VqEOJWnQ2vqtMcK+jNehCayKUq5SnSEeLgLglxFuXA3wm4SD6C0riEHsnn6l/AvpVRzB8E
        oySnW9UuBiwFfMRQHGjLsu5Ij9+FaiU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-kH1YFEUUOquxEQuSzVWgKg-1; Thu, 20 Oct 2022 15:55:46 -0400
X-MC-Unique: kH1YFEUUOquxEQuSzVWgKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4215811E84;
        Thu, 20 Oct 2022 19:55:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4E31D40C6EC2;
        Thu, 20 Oct 2022 19:55:44 +0000 (UTC)
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
Subject: [PATCH v2 03/17] media: atomisp: Make atomisp_q_video_buffers_to_css() static
Date:   Thu, 20 Oct 2022 21:55:19 +0200
Message-Id: <20221020195533.114049-4-hdegoede@redhat.com>
In-Reply-To: <20221020195533.114049-1-hdegoede@redhat.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_q_video_buffers_to_css() is only used insidd atomisp_fops.c, make
it static.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 10 +++++-----
 drivers/staging/media/atomisp/pci/atomisp_fops.h |  6 ------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 84a84e0cdeef..d47b7f19125f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -206,11 +206,11 @@ static int atomisp_q_one_dis_buffer(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
-				   struct atomisp_video_pipe *pipe,
-				   enum atomisp_input_stream_id stream_id,
-				   enum ia_css_buffer_type css_buf_type,
-				   enum ia_css_pipe_id css_pipe_id)
+static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
+					  struct atomisp_video_pipe *pipe,
+					  enum atomisp_input_stream_id stream_id,
+					  enum ia_css_buffer_type css_buf_type,
+					  enum ia_css_pipe_id css_pipe_id)
 {
 	struct videobuf_vmalloc_memory *vm_mem;
 	struct atomisp_css_params_with_list *param;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.h b/drivers/staging/media/atomisp/pci/atomisp_fops.h
index 3f1e442ba782..8d3ea33a7d9a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.h
@@ -22,12 +22,6 @@
 #define	__ATOMISP_FOPS_H__
 #include "atomisp_subdev.h"
 
-int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
-				   struct atomisp_video_pipe *pipe,
-				   enum atomisp_input_stream_id stream_id,
-				   enum ia_css_buffer_type css_buf_type,
-				   enum ia_css_pipe_id css_pipe_id);
-
 unsigned int atomisp_dev_users(struct atomisp_device *isp);
 unsigned int atomisp_sub_dev_users(struct atomisp_sub_device *asd);
 
-- 
2.37.3

