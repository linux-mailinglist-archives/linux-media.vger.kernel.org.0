Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE53751E2D
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 12:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234421AbjGMKFN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 06:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234036AbjGMKE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 06:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAFB30E8
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689242626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YkGeLXhoWJDeywqUqjCfob2UyIVcBht1YEVSXyCqSX8=;
        b=P50LGcPLtFVUA32phq1DkUuSwWjkjrQx1A3Ewv9hH0CNS9fA0z55+a7I6xXbJbel7RSg1j
        nLGegL3b2wpvCbuQNpRyc9g5sQJ4YdVR+YY6IPYs09Vuui7AO3wbZkFh5lyrBoAJqF+cwJ
        QZ29SWmE/j0l7+R9xAipdrO364FGAnQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-qNa3D6HSPaq0X2frunkvxw-1; Thu, 13 Jul 2023 06:03:42 -0400
X-MC-Unique: qNa3D6HSPaq0X2frunkvxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A7558F2996;
        Thu, 13 Jul 2023 10:03:42 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 067D0111E3EC;
        Thu, 13 Jul 2023 10:03:10 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 04/11] media: atomisp: css_2401_system: Remove #ifdef ISP2401 to make the driver generic
Date:   Thu, 13 Jul 2023 18:02:24 +0800
Message-ID: <20230713100231.308923-5-hpa@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
References: <20230713100231.308923-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed #if defined(2401) to make the driver generic.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../media/atomisp/pci/css_2401_system/host/isys_irq_local.h    | 3 ---
 .../media/atomisp/pci/css_2401_system/host/isys_irq_private.h  | 2 --
 .../media/atomisp/pci/css_2401_system/isys_irq_global.h        | 2 --
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h
index a76987190292..0f585a7e0fa4 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_local.h
@@ -18,8 +18,6 @@
 
 #include <type_support.h>
 
-#if defined(ISP2401)
-
 typedef struct isys_irqc_state_s isys_irqc_state_t;
 
 struct isys_irqc_state_s {
@@ -31,6 +29,5 @@ struct isys_irqc_state_s {
 	/*hrt_data clear;	*/	/* write-only register */
 };
 
-#endif /* defined(ISP2401) */
 
 #endif	/* __ISYS_IRQ_LOCAL_H__ */
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
index fb168c25bdfc..d94c8e6add72 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
@@ -19,7 +19,6 @@
 #include "isys_irq_global.h"
 #include "isys_irq_local.h"
 
-#if defined(ISP2401)
 
 /* -------------------------------------------------------+
  |             Native command interface (NCI)             |
@@ -102,6 +101,5 @@ hrt_data isys_irqc_reg_load(
 
 /* end of DLI */
 
-#endif /* defined(ISP2401) */
 
 #endif	/* __ISYS_IRQ_PRIVATE_H__ */
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h
index a81e4d13ac9f..16336ed73036 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/isys_irq_global.h
@@ -16,7 +16,6 @@
 #ifndef __ISYS_IRQ_GLOBAL_H__
 #define __ISYS_IRQ_GLOBAL_H__
 
-#if defined(ISP2401)
 
 /* Register offset/index from base location */
 #define ISYS_IRQ_EDGE_REG_IDX		(0)
@@ -31,6 +30,5 @@
 #define ISYS_IRQ_CLEAR_REG_VALUE	(0xFFFF)
 #define ISYS_IRQ_ENABLE_REG_VALUE	(0xFFFF)
 
-#endif /* defined(ISP2401) */
 
 #endif	/* __ISYS_IRQ_GLOBAL_H__ */
-- 
2.41.0

