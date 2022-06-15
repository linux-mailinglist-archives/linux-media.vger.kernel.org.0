Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC99E54D2F2
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346434AbiFOUu6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346775AbiFOUu5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:50:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7943955214
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ycIILxJA+RnfwC8ZPDDauRKf6IpTvt6KV5DLrCFQmJE=;
        b=KqDifFQXsHzcmFSuxfw/rgGov8mF0ls9kide2o6etC8qfD+mwU4NFUgJ5LnhrlLTeHHdP5
        ZO5Ys7sacMV5t3qV1e6Ya1/OmuKyGrFQ7T3U06WWd2hlnhd6Cjfun5PEN7HvfAFJxE8x0+
        3EDu2TasxFPdRZvuiCR+vqiGFN1LI0o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-N2ODAB4KPM6vfPsZjmv9vQ-1; Wed, 15 Jun 2022 16:50:49 -0400
X-MC-Unique: N2ODAB4KPM6vfPsZjmv9vQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46C5285A580;
        Wed, 15 Jun 2022 20:50:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A845F18EB3;
        Wed, 15 Jun 2022 20:50:47 +0000 (UTC)
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
Subject: [PATCH v2 05/40] media: atomisp: drop contiguous argument from frame_create()
Date:   Wed, 15 Jun 2022 22:50:02 +0200
Message-Id: <20220615205037.16549-6-hdegoede@redhat.com>
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

Drop the contiguous argument from frame_create()
all callers always passes false.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/runtime/frame/src/frame.c   | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 4f9c8b839da2..af23fbb831d6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -84,7 +84,6 @@ static struct ia_css_frame *frame_create(unsigned int width,
 	enum ia_css_frame_format format,
 	unsigned int padded_width,
 	unsigned int raw_bit_depth,
-	bool contiguous,
 	bool valid);
 
 static unsigned
@@ -215,7 +214,6 @@ int ia_css_frame_create_from_info(struct ia_css_frame **frame,
 			  info->format,
 			  info->padded_width,
 			  info->raw_bit_depth,
-			  false,
 			  false);
 	if (!me) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
@@ -492,7 +490,7 @@ int ia_css_frame_allocate_with_buffer_size(struct ia_css_frame **frame,
 	int err;
 	struct ia_css_frame *me = frame_create(0, 0,
 					       IA_CSS_FRAME_FORMAT_NUM,/* Not valid format yet */
-					       0, 0, false, false);
+					       0, 0, false);
 
 	if (!me)
 		return -ENOMEM;
@@ -780,7 +778,6 @@ static int frame_allocate_with_data(struct ia_css_frame **frame,
 					       format,
 					       padded_width,
 					       raw_bit_depth,
-					       false,
 					       true);
 
 	if (!me)
@@ -810,7 +807,6 @@ static struct ia_css_frame *frame_create(unsigned int width,
 	enum ia_css_frame_format format,
 	unsigned int padded_width,
 	unsigned int raw_bit_depth,
-	bool contiguous,
 	bool valid)
 {
 	struct ia_css_frame *me = kvmalloc(sizeof(*me), GFP_KERNEL);
@@ -824,7 +820,7 @@ static struct ia_css_frame *frame_create(unsigned int width,
 	me->info.format = format;
 	me->info.padded_width = padded_width;
 	me->info.raw_bit_depth = raw_bit_depth;
-	me->contiguous = contiguous;
+	me->contiguous = false;
 	me->valid = valid;
 	me->data_bytes = 0;
 	me->data = mmgr_NULL;
-- 
2.36.0

