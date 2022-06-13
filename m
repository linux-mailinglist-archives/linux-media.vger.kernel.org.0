Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83921549FCA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240990AbiFMUpn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244572AbiFMUod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6CAE921828
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149951;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gpwpiRW4jsDLRObhFrtMue3aO01xP1Nap7uU7hBPk4s=;
        b=UNAWzk+aWkTduWSMdWmi6zwoi51w7Sl+nggSvPpoYHv0gvdjD6rEFIgUQ77xnhJnuI3bt2
        vNLCsO3QB/N9N4PNExkUmZ9LKy6BbW/TAbSGmRFjtfp3lcarX35H0B7Mxe1t90tcwjFvgI
        0h/S9gDcNZoS4TtmwF9HCYAGdEg52fQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-oeb1Odh6PVGTpCn2GkaVqQ-1; Mon, 13 Jun 2022 15:52:02 -0400
X-MC-Unique: oeb1Odh6PVGTpCn2GkaVqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 163583C10148;
        Mon, 13 Jun 2022 19:52:02 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 926622166B26;
        Mon, 13 Jun 2022 19:52:00 +0000 (UTC)
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
Subject: [PATCH 13/40] media: atomisp: remove pool related kernel cmdline options
Date:   Mon, 13 Jun 2022 21:51:10 +0200
Message-Id: <20220613195137.8117-14-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since we have removed the hmm pools these are completely meaningless now.

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

