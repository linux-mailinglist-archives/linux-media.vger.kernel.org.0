Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF305A9385
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 11:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233915AbiIAJrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 05:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbiIAJrN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 05:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DB1135D0A
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662025632;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qBTFeFUsgyheBteIxjPta3sYomgjNp8DPEbLv13/mio=;
        b=KbIFWW8ptivZxcvCTW5Vqs0hF4fcJVKVB6jrHql5TzzvT5Atp6DLTfFjnk7PrIJxgCrvdD
        l5ifiyojQqhPdRdV3DtQgx+fFoYQVr6xtZwp+leGBeuEnEy3PTvzZipaQSNSTjLWqNoq9F
        Y8KobyZwvEoJWk6YOP9szC11kbz4zi4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-UDpz6HEyPOumwgscDIENrw-1; Thu, 01 Sep 2022 05:47:08 -0400
X-MC-Unique: UDpz6HEyPOumwgscDIENrw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 161C5964F79;
        Thu,  1 Sep 2022 09:46:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 939C9403352;
        Thu,  1 Sep 2022 09:46:48 +0000 (UTC)
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
Subject: [PATCH 07/14] media: atomisp: Remove some further ATOMISP_ACC_* related dead code
Date:   Thu,  1 Sep 2022 11:46:19 +0200
Message-Id: <20220901094626.11513-8-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove some more code which is no longer referenced after the removal
of the ATOMISP_ACC_* custom ioctls.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/linux/atomisp.h     | 14 ------------
 .../media/atomisp/pci/atomisp_compat.h        |  3 ---
 .../media/atomisp/pci/atomisp_compat_css20.c  | 18 ---------------
 .../media/atomisp/pci/atomisp_subdev.h        | 22 -------------------
 4 files changed, 57 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index f96f5adbd9de..3f602b5aaff9 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -740,20 +740,6 @@ enum atomisp_frame_status {
 	ATOMISP_FRAME_STATUS_FLASH_FAILED,
 };
 
-/* ISP memories, isp2400 */
-enum atomisp_acc_memory {
-	ATOMISP_ACC_MEMORY_PMEM0 = 0,
-	ATOMISP_ACC_MEMORY_DMEM0,
-	/* for backward compatibility */
-	ATOMISP_ACC_MEMORY_DMEM = ATOMISP_ACC_MEMORY_DMEM0,
-	ATOMISP_ACC_MEMORY_VMEM0,
-	ATOMISP_ACC_MEMORY_VAMEM0,
-	ATOMISP_ACC_MEMORY_VAMEM1,
-	ATOMISP_ACC_MEMORY_VAMEM2,
-	ATOMISP_ACC_MEMORY_HMEM0,
-	ATOMISP_ACC_NR_MEMORY
-};
-
 enum atomisp_ext_isp_id {
 	EXT_ISP_CID_ISO = 0,
 	EXT_ISP_CID_CAPTURE_HDR,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 3393ae6824f0..54c57bbf4c4d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -442,9 +442,6 @@ int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 
 int atomisp_css_update_stream(struct atomisp_sub_device *asd);
 
-struct atomisp_acc_fw;
-int atomisp_css_set_acc_parameters(struct atomisp_acc_fw *acc_fw);
-
 int atomisp_css_isr_thread(struct atomisp_device *isp,
 			   bool *frame_done_found,
 			   bool *css_pipe_done);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 5aa108a1724c..ec47d84698ba 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3771,24 +3771,6 @@ void atomisp_css_set_cont_prev_start_time(struct atomisp_device *isp,
 	return;
 }
 
-/* Set the ACC binary arguments */
-int atomisp_css_set_acc_parameters(struct atomisp_acc_fw *acc_fw)
-{
-	unsigned int mem;
-
-	for (mem = 0; mem < ATOMISP_ACC_NR_MEMORY; mem++) {
-		if (acc_fw->args[mem].length == 0)
-			continue;
-
-		ia_css_isp_param_set_css_mem_init(&acc_fw->fw->mem_initializers,
-						  IA_CSS_PARAM_CLASS_PARAM, mem,
-						  acc_fw->args[mem].css_ptr,
-						  acc_fw->args[mem].length);
-	}
-
-	return 0;
-}
-
 static struct atomisp_sub_device *__get_atomisp_subdev(
     struct ia_css_pipe *css_pipe,
     struct atomisp_device *isp,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index e36e112c3b29..d1a9857e5d68 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -258,28 +258,6 @@ struct atomisp_css_params_with_list {
 	struct list_head list;
 };
 
-struct atomisp_acc_fw {
-	struct ia_css_fw_info *fw;
-	unsigned int handle;
-	unsigned int flags;
-	unsigned int type;
-	struct {
-		size_t length;
-		unsigned long css_ptr;
-	} args[ATOMISP_ACC_NR_MEMORY];
-	struct list_head list;
-};
-
-struct atomisp_map {
-	ia_css_ptr ptr;
-	size_t length;
-	struct list_head list;
-	/* FIXME: should keep book which maps are currently used
-	 * by binaries and not allow releasing those
-	 * which are in use. Implement by reference counting.
-	 */
-};
-
 struct atomisp_sub_device {
 	struct v4l2_subdev subdev;
 	struct media_pad pads[ATOMISP_SUBDEV_PADS_NUM];
-- 
2.37.2

