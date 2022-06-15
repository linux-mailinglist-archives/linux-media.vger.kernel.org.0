Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6343E54D31A
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347569AbiFOUvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347158AbiFOUvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD7C055226
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mOuqoy6G7oDdh5nvH0GFZG4b1fTZx7w1CFHhC2sXeCU=;
        b=QkOp21yZrVCjfRLfHxFXn8J0WqprSfvDNREj2/OLRNFtzZSX+JxhI/r8RvNqQ8kYp5JDiN
        YzAlnrMl9S6uyoZmWMJKImbCKXUXOJ4eEA0TgJIHf+DuGd2Vt611+9qxouqsMaEye4wAPf
        yDrjVC2dtlt3gS/l25QhKW2Aa0naqVU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-VIw_oMF0OeW_N6qjf3n2zg-1; Wed, 15 Jun 2022 16:51:04 -0400
X-MC-Unique: VIw_oMF0OeW_N6qjf3n2zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA19C299E776;
        Wed, 15 Jun 2022 20:51:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1B22D111F5;
        Wed, 15 Jun 2022 20:51:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 13/40] media: atomisp: remove pool related kernel cmdline options
Date:   Wed, 15 Jun 2022 22:50:10 +0200
Message-Id: <20220615205037.16549-14-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since we have removed the hmm pools these are completely meaningless now.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h |  2 --
 .../staging/media/atomisp/pci/atomisp_v4l2.c    | 17 -----------------
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 5d72e2baa1f2..37366e333744 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -87,8 +87,6 @@ ia_css_ptr hmm_host_vaddr_to_hrt_vaddr(const void *ptr);
  */
 int hmm_mmap(struct vm_area_struct *vma, ia_css_ptr virt);
 
-extern bool dypool_enable;
-extern unsigned int dypool_pgnr;
 extern struct hmm_bo_device bo_device;
 
 #endif
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 0ec3f5b98ae1..88d8dd6ff0c4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -59,23 +59,6 @@ static uint skip_fwload;
 module_param(skip_fwload, uint, 0644);
 MODULE_PARM_DESC(skip_fwload, "Skip atomisp firmware load");
 
-/* set reserved memory pool size in page */
-static unsigned int repool_pgnr = 32768;
-module_param(repool_pgnr, uint, 0644);
-MODULE_PARM_DESC(repool_pgnr,
-		 "Set the reserved memory pool size in page (default:32768)");
-
-/* set dynamic memory pool size in page */
-unsigned int dypool_pgnr = UINT_MAX;
-module_param(dypool_pgnr, uint, 0644);
-MODULE_PARM_DESC(dypool_pgnr,
-		 "Set the dynamic memory pool size in page (default: unlimited)");
-
-bool dypool_enable = true;
-module_param(dypool_enable, bool, 0644);
-MODULE_PARM_DESC(dypool_enable,
-		 "dynamic memory pool enable/disable (default:enabled)");
-
 /* memory optimization: deferred firmware loading */
 bool defer_fw_load;
 module_param(defer_fw_load, bool, 0644);
-- 
2.36.0

