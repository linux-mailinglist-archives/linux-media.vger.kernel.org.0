Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11751751E32
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 12:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbjGMKFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 06:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234425AbjGMKFT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 06:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA42270A
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689242639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I3nz2yTMHQJP+PKyZJFMJM528NFzS7d889pNq2pZCy0=;
        b=ddB2ZPxmk1Hxz9SFomlBxKieVB3JoradaKdsbha9Whk4H2NyYVEJbddCTBD/P8ih8B6cdY
        +XgS4ljiujwjn8TnlLuj3xv2dyNhsuijq37504a43alVMxyxpud2R3/uzMLJ2g4ikjoMhb
        pgIWrRmfwb9qtOf4LTOghvjbrSZdaCs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-L7IkvwnbMwu1hYkBV-FX8g-1; Thu, 13 Jul 2023 06:03:56 -0400
X-MC-Unique: L7IkvwnbMwu1hYkBV-FX8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E54DD1044592;
        Thu, 13 Jul 2023 10:03:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B9C0F1120ABB;
        Thu, 13 Jul 2023 10:03:51 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 06/11] media: atomisp: hive_isp_css_common: Removed #if defined(ISP2401) to make driver generic
Date:   Thu, 13 Jul 2023 18:02:26 +0800
Message-ID: <20230713100231.308923-7-hpa@redhat.com>
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

Removed #if defined(ISP2401) to make code generic.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 7a74c679ed92..c60f0d5b01c6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -15,7 +15,6 @@
 
 #include "system_global.h"
 
-#ifndef ISP2401
 
 #include "input_system.h"
 #include <type_support.h>
@@ -1714,4 +1713,3 @@ static input_system_err_t input_system_multiplexer_cfg(
 	*flags |= INPUT_SYSTEM_CFG_FLAG_SET;
 	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
-#endif
-- 
2.41.0

