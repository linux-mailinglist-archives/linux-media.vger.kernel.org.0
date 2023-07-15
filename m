Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B639B754A62
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 19:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjGORKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jul 2023 13:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjGORKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jul 2023 13:10:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB85B5
        for <linux-media@vger.kernel.org>; Sat, 15 Jul 2023 10:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689440953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=oHXr+MtQ2j8i+hspLgMsd1NTyA2+o+iCzUHxpN9ilvo=;
        b=X5dbAi0UWK+ywBRmaHeDXizoWKenzyVwHHqyYyRBT3ESiF2u5ree81f5dTSOZS0e6E9Ae6
        EstZVYn7akzXttzNGA5D2ZzupO32KNuDOMAlc5qUVz9mPSlFAEaxuPT6xdvuKchcMu/J7f
        kvPzvXa+CcnaI84/DsaoCw3efdtz1co=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-x-31gPfONuuhBBIE7GBnZw-1; Sat, 15 Jul 2023 13:09:09 -0400
X-MC-Unique: x-31gPfONuuhBBIE7GBnZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47F3C101A54E;
        Sat, 15 Jul 2023 17:09:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 993D21121333;
        Sat, 15 Jul 2023 17:09:07 +0000 (UTC)
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
Subject: [PATCH 1/3] media: atomisp: Remove empty isys_public.h
Date:   Sat, 15 Jul 2023 19:09:04 +0200
Message-ID: <20230715170906.3627-1-hdegoede@redhat.com>
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

isys_public.h is empty, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../hive_isp_css_include/host/isys_public.h   | 19 -------------------
 .../atomisp/pci/isp2400_input_system_public.h |  1 -
 2 files changed, 20 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
deleted file mode 100644
index 9dacef7a5cc1..000000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- */
-
-#ifndef __ISYS_PUBLIC_H_INCLUDED__
-#define __ISYS_PUBLIC_H_INCLUDED__
-
-#endif /* __ISYS_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index 375c0db84b55..b1360eeb58df 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -17,7 +17,6 @@
 #define __INPUT_SYSTEM_2400_PUBLIC_H_INCLUDED__
 
 #include <type_support.h>
-#include "isys_public.h"
 
 typedef struct receiver_state_s			receiver_state_t;
 
-- 
2.41.0

