Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 276DC549FBD
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348588AbiFMUpR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351506AbiFMUoO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 064FD13F45
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149919;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yYqjFzSGWXpbR9qLBmQD6O8oaicfA5w2+N//+uHKlCc=;
        b=ZJEZSB8uQFrS1MUUNbGSv0CHQ1NoB2IfuWJbTW1CYvT4neV9XuPRksuxBxUQQwqoAKiaDD
        m3gT6cPUom3hZveH8dhOJfpQ+75Dm4Z/OMw6jFcit+UaGyQ2LysS0vwUyBSPu5CzXhziVB
        p8cU9ZNm6PxaBsUscliPAjrS6LCTkUE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-pA0CfAXJNkyqz4sbVPbj6A-1; Mon, 13 Jun 2022 15:51:54 -0400
X-MC-Unique: pA0CfAXJNkyqz4sbVPbj6A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CB2B3801F4A;
        Mon, 13 Jun 2022 19:51:53 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E8F442166B26;
        Mon, 13 Jun 2022 19:51:51 +0000 (UTC)
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
Subject: [PATCH 08/40] media: atomisp: drop ATOMISP_MAP_FLAG_CONTIGUOUS
Date:   Mon, 13 Jun 2022 21:51:05 +0200
Message-Id: <20220613195137.8117-9-hdegoede@redhat.com>
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

Drop the ATOMISP_MAP_FLAG_CONTIGUOUS hmm_alloc flag. After the contiguous
flag removal done in previous patches in this series it is never set.

And hmm_alloc already did a WARN_ON on the flag and otherwise ignored it,
proving that contiguous support was already never used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/include/linux/atomisp.h | 3 +--
 drivers/staging/media/atomisp/pci/hmm/hmm.c           | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 22c4103b0385..a6ec9691afb2 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -915,8 +915,7 @@ struct atomisp_acc_map {
 
 #define ATOMISP_MAP_FLAG_NOFLUSH	0x0001	/* Do not flush cache */
 #define ATOMISP_MAP_FLAG_CACHED		0x0002	/* Enable cache */
-#define ATOMISP_MAP_FLAG_CONTIGUOUS	0x0004
-#define ATOMISP_MAP_FLAG_CLEARED	0x0008
+#define ATOMISP_MAP_FLAG_CLEARED	0x0004
 
 struct atomisp_acc_state {
 	__u32 flags;			/* Flags, see list below */
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 54188197c3dc..a4722155ddef 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -230,8 +230,6 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	bool cached = attrs & ATOMISP_MAP_FLAG_CACHED;
 	int ret;
 
-	WARN_ON(attrs & ATOMISP_MAP_FLAG_CONTIGUOUS);
-
 	/*
 	 * Check if we are initialized. In the ideal world we wouldn't need
 	 * this but we can tackle it once the driver is a lot cleaner
-- 
2.36.0

