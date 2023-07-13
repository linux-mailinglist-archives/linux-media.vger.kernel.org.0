Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236FC751E33
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 12:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234429AbjGMKFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 06:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234215AbjGMKFU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 06:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FCE271E
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689242653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4w6JCt8xhkAp7WrGBI0D8ORfC5IimxZn6ab1tqrxkKw=;
        b=gX5nNLR49oKa/n5CvvQ/oPOncD0DjOq1pJmjIG0huwKUuIL+iGgQX2vUeam4drMKzQxGYj
        YhTBzZxZJLcTuGxFOcB0JjEWrvTwUd9epeDqbhSGohuZT1uqpsk/TTu1mFkH5vnpCYZrOB
        rpvd0VlzOUwbKmtk+rqAGb2BdHloxII=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-4-YnDJHeOF2hcMb5FneZIA-1; Thu, 13 Jul 2023 06:04:10 -0400
X-MC-Unique: 4-YnDJHeOF2hcMb5FneZIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A13563C0D84F;
        Thu, 13 Jul 2023 10:04:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 245E1111E3EB;
        Thu, 13 Jul 2023 10:04:04 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 08/11] media: atomisp: ifmtr: Removed #if defined(ISP2401) to make driver generic
Date:   Thu, 13 Jul 2023 18:02:28 +0800
Message-ID: <20230713100231.308923-9-hpa@redhat.com>
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

Removed #if defined(ISP2401) to make driver generic.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../atomisp/pci/hive_isp_css_common/host/input_formatter.c      | 2 --
 drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c     | 2 --
 drivers/staging/media/atomisp/pci/sh_css_sp.c                   | 2 --
 drivers/staging/media/atomisp/pci/sh_css_sp.h                   | 2 --
 4 files changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index 5cd6136f21a2..e01f30f137a0 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -15,7 +15,6 @@
 
 #include "system_global.h"
 
-#ifndef ISP2401
 
 #include "input_formatter.h"
 #include <type_support.h>
@@ -243,4 +242,3 @@ void input_formatter_bin_get_state(
 				  HIVE_STR2MEM_EN_STAT_UPDATE_ADDRESS);
 	return;
 }
-#endif
diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index 6d9f47629fbc..86254888f676 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -16,7 +16,6 @@
 #include "system_global.h"
 #include <linux/kernel.h>
 
-#ifndef ISP2401
 
 #include "ia_css_ifmtr.h"
 #include <math_support.h>
@@ -550,4 +549,3 @@ static int ifmtr_input_start_line(
 	return 0;
 }
 
-#endif
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 297e1b981720..4ef1c9e61ea8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -632,7 +632,6 @@ set_view_finder_buffer(const struct ia_css_frame *frame)
 	return 0;
 }
 
-#if !defined(ISP2401)
 void sh_css_sp_set_if_configs(
     const input_formatter_cfg_t	*config_a,
     const input_formatter_cfg_t	*config_b,
@@ -654,7 +653,6 @@ void sh_css_sp_set_if_configs(
 
 	return;
 }
-#endif
 
 #if !defined(ISP2401)
 void
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.h b/drivers/staging/media/atomisp/pci/sh_css_sp.h
index f69a79b0b0da..b052c40e69bc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.h
@@ -149,13 +149,11 @@ sh_css_sp_get_debug_state(struct sh_css_sp_debug_state *state);
 
 #endif
 
-#if !defined(ISP2401)
 void
 sh_css_sp_set_if_configs(
     const input_formatter_cfg_t	*config_a,
     const input_formatter_cfg_t	*config_b,
     const uint8_t		if_config_index);
-#endif
 
 void
 sh_css_sp_program_input_circuit(int fmt_type,
-- 
2.41.0

