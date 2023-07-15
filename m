Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F56754A64
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 19:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjGORKJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jul 2023 13:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjGORKH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jul 2023 13:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE3E26B2
        for <linux-media@vger.kernel.org>; Sat, 15 Jul 2023 10:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689440960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aq+EG35HOtgUCV8xZKFZmNK1P5mj+t/i6l/MjJyilLE=;
        b=Rv2GSXx53DNgxmBCod5iHCxzYxP+MLekWI5yGg8b3cpx+H3nhci8bRHwZ3wdO/6m3nZECO
        5hb+rDX3BDISezk5pv02tXys9UICPJVsmhTeRNMXs0xAlAQLCmwKXFq71HT+MSVGvXBLGW
        hUNVpqBXXTzL/41xY3Br4IBO/fWq9+Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-8srJJYUIMCCchUDUA2pEew-1; Sat, 15 Jul 2023 13:09:14 -0400
X-MC-Unique: 8srJJYUIMCCchUDUA2pEew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4754687321B;
        Sat, 15 Jul 2023 17:09:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8A0D11121333;
        Sat, 15 Jul 2023 17:09:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 3/3] media: atomisp: Mark ia_css_isys_240?_init() static
Date:   Sat, 15 Jul 2023 19:09:06 +0200
Message-ID: <20230715170906.3627-3-hdegoede@redhat.com>
In-Reply-To: <20230715170906.3627-1-hdegoede@redhat.com>
References: <20230715170906.3627-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ia_css_isys_240?_init() are only used inside the C file where they are
declared, mark them as static fixing:

drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:24:20:
   warning: no previous prototype for 'ia_css_isys_2400_init'
   24 | input_system_err_t ia_css_isys_2400_init(void)
      |                    ^~~~~~~~~~~~~~~~~~~~~
drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:87:20:
   warning: no previous prototype for 'ia_css_isys_2401_init'
   87 | input_system_err_t ia_css_isys_2401_init(void)
      |                    ^~~~~~~~~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307152046.rvhFGrbz-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/runtime/isys/src/isys_init.c    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
index 1a7b45bb4544..18bfe1010989 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
@@ -21,7 +21,7 @@
 #include "isys_dma_public.h"	/* isys2401_dma_set_max_burst_size() */
 #include "isys_irq.h"
 
-input_system_err_t ia_css_isys_2400_init(void)
+static input_system_err_t ia_css_isys_2400_init(void)
 {
 	backend_channel_cfg_t backend_ch0;
 	backend_channel_cfg_t backend_ch1;
@@ -84,7 +84,7 @@ input_system_err_t ia_css_isys_2400_init(void)
 	return error;
 }
 
-input_system_err_t ia_css_isys_2401_init(void)
+static input_system_err_t ia_css_isys_2401_init(void)
 {
 	ia_css_isys_csi_rx_lut_rmgr_init();
 	ia_css_isys_ibuf_rmgr_init();
-- 
2.41.0

