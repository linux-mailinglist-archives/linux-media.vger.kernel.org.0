Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC7B751E29
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 12:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234522AbjGMKEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 06:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234534AbjGMKEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 06:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3112721
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689242589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tBd8xq5oyx9G3T/aPrKzHOWfuV70BpZA65HRhPaYPUs=;
        b=hvK99uxAsbz+TgPhut5d/daSTisRaseerL7n+dptDfFW3Elz/u5/lelN4tdSN+IOFaVMnq
        90oL93JkOyBNgIEfSSmojIkg516kvtAFaI2OOWR06IbA1ZTZ9IFTg6K8+Z+dta7u1C86iV
        SzLqniwS7xFbMtcTCf/gwJNrauZ9czQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-VR8OT-SNNs-kFLHdsZtaoA-1; Thu, 13 Jul 2023 06:03:06 -0400
X-MC-Unique: VR8OT-SNNs-kFLHdsZtaoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC5468F9E46;
        Thu, 13 Jul 2023 10:03:05 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 867A8111E3EB;
        Thu, 13 Jul 2023 10:03:01 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 03/11] media: atomisp: Included both input system headers
Date:   Thu, 13 Jul 2023 18:02:23 +0800
Message-ID: <20230713100231.308923-4-hpa@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
References: <20230713100231.308923-1-hpa@redhat.com>
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

Included necessary input system header files (local, private, public
scopes) for both types of atomisp. There is also a conflict of
declaration issue so the unused input_system_state_s is removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/atomisp/pci/input_system_local.h     | 7 ++-----
 drivers/staging/media/atomisp/pci/input_system_private.h   | 7 ++-----
 drivers/staging/media/atomisp/pci/input_system_public.h    | 4 +---
 .../staging/media/atomisp/pci/isp2400_input_system_local.h | 4 ++--
 .../media/atomisp/pci/isp2400_input_system_private.h       | 4 ++--
 .../media/atomisp/pci/isp2400_input_system_public.h        | 7 ++-----
 .../staging/media/atomisp/pci/isp2401_input_system_local.h | 4 ++--
 .../media/atomisp/pci/isp2401_input_system_private.h       | 4 ++--
 8 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/input_system_local.h b/drivers/staging/media/atomisp/pci/input_system_local.h
index 357987d629cd..12f7acfeb79c 100644
--- a/drivers/staging/media/atomisp/pci/input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/input_system_local.h
@@ -138,8 +138,5 @@ struct rx_cfg_s {
 	bool                is_two_ppc;
 };
 
-#ifdef ISP2401
-#  include "isp2401_input_system_local.h"
-#else
-#  include "isp2400_input_system_local.h"
-#endif
+#include "isp2401_input_system_local.h"
+#include "isp2400_input_system_local.h"
diff --git a/drivers/staging/media/atomisp/pci/input_system_private.h b/drivers/staging/media/atomisp/pci/input_system_private.h
index 889f204e77d5..148ba2ca2290 100644
--- a/drivers/staging/media/atomisp/pci/input_system_private.h
+++ b/drivers/staging/media/atomisp/pci/input_system_private.h
@@ -4,8 +4,5 @@
  *    (c) 2020 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  */
 
-#ifdef ISP2401
-#  include "isp2401_input_system_private.h"
-#else
-#  include "isp2400_input_system_private.h"
-#endif
+#include "isp2401_input_system_private.h"
+#include "isp2400_input_system_private.h"
diff --git a/drivers/staging/media/atomisp/pci/input_system_public.h b/drivers/staging/media/atomisp/pci/input_system_public.h
index 3f5167fd6643..06b19434b6c0 100644
--- a/drivers/staging/media/atomisp/pci/input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/input_system_public.h
@@ -4,6 +4,4 @@
  *    (c) 2020 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  */
 
-#ifndef ISP2401
-#  include "isp2400_input_system_public.h"
-#endif
+#include "isp2400_input_system_public.h"
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index 847ad7554eb7..e7b84fdbb4e0 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -13,8 +13,8 @@
  * more details.
  */
 
-#ifndef __INPUT_SYSTEM_LOCAL_H_INCLUDED__
-#define __INPUT_SYSTEM_LOCAL_H_INCLUDED__
+#ifndef __INPUT_SYSTEM_2400_LOCAL_H_INCLUDED__
+#define __INPUT_SYSTEM_2400_LOCAL_H_INCLUDED__
 
 #include "input_system_defs.h"		/* HIVE_ISYS_GPREG_MULTICAST_A_IDX,... */
 
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
index 9c39ca2da923..e011920f00e1 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
@@ -13,8 +13,8 @@
  * more details.
  */
 
-#ifndef __INPUT_SYSTEM_PRIVATE_H_INCLUDED__
-#define __INPUT_SYSTEM_PRIVATE_H_INCLUDED__
+#ifndef __INPUT_SYSTEM_2400_PRIVATE_H_INCLUDED__
+#define __INPUT_SYSTEM_2400_PRIVATE_H_INCLUDED__
 
 #include "input_system_public.h"
 
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index 6477be44a815..375c0db84b55 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -13,13 +13,11 @@
  * more details.
  */
 
-#ifndef __INPUT_SYSTEM_PUBLIC_H_INCLUDED__
-#define __INPUT_SYSTEM_PUBLIC_H_INCLUDED__
+#ifndef __INPUT_SYSTEM_2400_PUBLIC_H_INCLUDED__
+#define __INPUT_SYSTEM_2400_PUBLIC_H_INCLUDED__
 
 #include <type_support.h>
-#ifdef ISP2401
 #include "isys_public.h"
-#else
 
 typedef struct receiver_state_s			receiver_state_t;
 
@@ -359,6 +357,5 @@ input_system_err_t	input_system_gpfifo_channel_cfg(
     u32		nof_frames,
     target_cfg2400_t	target
 );
-#endif /* #ifdef ISP2401 */
 
 #endif /* __INPUT_SYSTEM_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
index 361a615bbcad..d9a8d575c58e 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
@@ -13,8 +13,8 @@
  * more details.
  */
 
-#ifndef __INPUT_SYSTEM_LOCAL_H_INCLUDED__
-#define __INPUT_SYSTEM_LOCAL_H_INCLUDED__
+#ifndef __INPUT_SYSTEM_2401_LOCAL_H_INCLUDED__
+#define __INPUT_SYSTEM_2401_LOCAL_H_INCLUDED__
 
 #include "csi_rx.h"
 #include "pixelgen.h"
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h
index f3fdd9a2a5e6..845ed0add027 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_private.h
@@ -13,8 +13,8 @@
  * more details.
  */
 
-#ifndef __INPUT_SYSTEM_PRIVATE_H_INCLUDED__
-#define __INPUT_SYSTEM_PRIVATE_H_INCLUDED__
+#ifndef __INPUT_SYSTEM_2401_PRIVATE_H_INCLUDED__
+#define __INPUT_SYSTEM_2401_PRIVATE_H_INCLUDED__
 
 #include "input_system_public.h"
 
-- 
2.41.0

