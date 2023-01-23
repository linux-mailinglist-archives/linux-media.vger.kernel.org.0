Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF407677BF3
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbjAWMzw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbjAWMzu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23D912050
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478503;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=16MnBMk2IU1/t2ec244aWVhCzqiNnyAcC3F8mtqfB38=;
        b=Cq/O8uceICOs9KP1BXt3HK3Y9x8OJnPs3zfRFbYHVeFriC9hRy7bv1ppvjMyIZUcKrNKGf
        7HV8T8hhyQqNleXDDlVXU+9Uu2239cym0RJBINwxiK0Gzb+Y+dsu1W2gwinuKa8id9cfMZ
        uP45HvvytpLPFuahkEu1nNuNFudCDxw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-sXXPwZ77MW6y-vZjVmJkNg-1; Mon, 23 Jan 2023 07:54:59 -0500
X-MC-Unique: sXXPwZ77MW6y-vZjVmJkNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F9471C07540;
        Mon, 23 Jan 2023 12:54:59 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 00C62C15BA0;
        Mon, 23 Jan 2023 12:54:55 +0000 (UTC)
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
        Brent Pappas <bpappas@pappasbrent.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Dan Carpenter <error27@gmail.com>
Subject: [PATCH 57/57] media: atomisp: pci: sh_css: Inline single invocation of macro STATS_ENABLED()
Date:   Mon, 23 Jan 2023 13:52:05 +0100
Message-Id: <20230123125205.622152-58-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Brent Pappas <bpappas@pappasbrent.com>

Inline the single invocation of the macro STATS_ENABLED().
The macro abstraction is not necessary because the logic behind it is only
used once.

Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/r/20230120171408.16099-1-bpappas@pappasbrent.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 726cb7aa4ecd..93789500416f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -97,9 +97,6 @@
  */
 #define JPEG_BYTES (16 * 1024 * 1024)
 
-#define STATS_ENABLED(stage) (stage && stage->binary && stage->binary->info && \
-	(stage->binary->info->sp.enable.s3a || stage->binary->info->sp.enable.dis))
-
 struct sh_css my_css;
 
 int  __printf(1, 0) (*sh_css_printf)(const char *fmt, va_list args) = NULL;
@@ -3743,7 +3740,9 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 			 * The SP will read the params after it got
 			 * empty 3a and dis
 			 */
-			if (STATS_ENABLED(stage)) {
+			if (stage->binary && stage->binary->info &&
+			    (stage->binary->info->sp.enable.s3a ||
+			     stage->binary->info->sp.enable.dis)) {
 				/* there is a stage that needs it */
 				return_err = ia_css_bufq_enqueue_buffer(thread_id,
 									queue_id,
-- 
2.39.0

