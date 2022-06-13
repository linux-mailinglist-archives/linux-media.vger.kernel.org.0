Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4A7549FB5
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345969AbiFMUpG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351476AbiFMUoK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A676B13D1C
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3lc8c+K7a9TB8r2rvGeZvWpIGxfhAdnnP6oHZpj5cCI=;
        b=C/9BzE2sK9dCvjMv/rhvx0swhI33D8RYxYxbP/OUHOAGyUb/+2z6nlf/6+U36BzT3S5JgY
        QnrOs5pk+udXlZ/VeDbyJFMMjwgIVmnoTBLnKQfwbKWVUobiIirmksdLViEw4qBnI9UMYN
        8AN15v7YpHfXXEzpAB9lKbcZEfVxSQM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-iztFeZr3O6-Jc7Vs7pQp2Q-1; Mon, 13 Jun 2022 15:51:48 -0400
X-MC-Unique: iztFeZr3O6-Jc7Vs7pQp2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D94518E5280;
        Mon, 13 Jun 2022 19:51:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B5F082166B26;
        Mon, 13 Jun 2022 19:51:46 +0000 (UTC)
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
Subject: [PATCH 05/40] media: atomisp: drop contiguous argument from frame_create()
Date:   Mon, 13 Jun 2022 21:51:02 +0200
Message-Id: <20220613195137.8117-6-hdegoede@redhat.com>
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

Drop the contiguous argument from frame_create()
all callers always passes false.

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

