Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E20D0751E31
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 12:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233976AbjGMKF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 06:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234239AbjGMKFL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 06:05:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41C726BD
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689242632;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ap+X2t78sySvi00h8AzgFnMtAYAITpWKdoZI1uIAFcs=;
        b=OpXhZbgGMie65+wgLWu3KKO2ASdyKe+awdACtUUVn4IBu0w5r45yvxVnefddQf+bhQNBAU
        /hEBMV0U6I/C3HmZTlL+zAvBEXRdv+znKVn5hnfQBTcd83mocNndFSlUeY/rw/NeVBFgwt
        lkVSf8BUV/6U8IPmwE9rMkX79KFRa4E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-pXfvsAwfNkeN_myUHRvamA-1; Thu, 13 Jul 2023 06:03:49 -0400
X-MC-Unique: pXfvsAwfNkeN_myUHRvamA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AE84858F1E;
        Thu, 13 Jul 2023 10:03:48 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 56148111E3EB;
        Thu, 13 Jul 2023 10:03:43 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 05/11] media: atomisp: isys: Removed #if defined(ISP2401) to make driver generic
Date:   Thu, 13 Jul 2023 18:02:25 +0800
Message-ID: <20230713100231.308923-6-hpa@redhat.com>
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

Removed #if defined(ISP2401) to make code generic.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../atomisp/pci/hive_isp_css_include/host/isys_dma_public.h     | 2 --
 .../atomisp/pci/hive_isp_css_include/host/isys_irq_public.h     | 2 --
 .../staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h   | 2 --
 3 files changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
index d9b6af898c06..f18a057adb0f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_dma_public.h
@@ -16,7 +16,6 @@
 #ifndef __ISYS_DMA_PUBLIC_H_INCLUDED__
 #define __ISYS_DMA_PUBLIC_H_INCLUDED__
 
-#ifdef ISP2401
 
 #include "system_local.h"
 #include "type_support.h"
@@ -34,6 +33,5 @@ void isys2401_dma_set_max_burst_size(
     const isys2401_dma_ID_t dma_id,
     uint32_t		max_burst_size);
 
-#endif /* ISP2401 */
 
 #endif /* __ISYS_DMA_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
index 736cbc4e3705..2b13688256cf 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_irq_public.h
@@ -19,7 +19,6 @@
 #include "isys_irq_global.h"
 #include "isys_irq_local.h"
 
-#if defined(ISP2401)
 
 void isys_irqc_state_get(const isys_irq_ID_t	isys_irqc_id,
 			 isys_irqc_state_t	*state);
@@ -36,6 +35,5 @@ hrt_data isys_irqc_reg_load(const isys_irq_ID_t	isys_irqc_id,
 
 void isys_irqc_status_enable(const isys_irq_ID_t isys_irqc_id);
 
-#endif /* defined(ISP2401) */
 
 #endif	/* __ISYS_IRQ_PUBLIC_H__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
index 001c55ea970b..952b633fdca7 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/isys_irq.h
@@ -19,10 +19,8 @@
 #include <type_support.h>
 #include <system_local.h>
 
-#if defined(ISP2401)
 
 #include "isys_irq_public.h"
 
-#endif /* defined(ISP2401) */
 
 #endif	/* __IA_CSS_ISYS_IRQ_H__ */
-- 
2.41.0

