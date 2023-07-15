Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 531D0754A63
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 19:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjGORKD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jul 2023 13:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjGORKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jul 2023 13:10:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C8526B1
        for <linux-media@vger.kernel.org>; Sat, 15 Jul 2023 10:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689440954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KiYOXQR1dfJ4ohFM9TQtektSyJY5vyb0vgtjKDCem0c=;
        b=OVTX7bDCE1jEHgJmmuPBsKxXhBGRl7V17xKqr3637vfYhp9Idao5l4OgJbdty0wk5ybw7J
        ATUMwg0eGZQD0pS9OCqrFSeTTPYbDsMrBfvje0/HLmYR1mRyK8d+XVq4bjUyRKCcFcEGnf
        soXfhekyfY3KlvW+w8a5VD20NoGle7c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-Lf0VOJg2NPqr_C38y3bqrA-1; Sat, 15 Jul 2023 13:09:13 -0400
X-MC-Unique: Lf0VOJg2NPqr_C38y3bqrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 568C185A58A;
        Sat, 15 Jul 2023 17:09:12 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7B4D61121333;
        Sat, 15 Jul 2023 17:09:09 +0000 (UTC)
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
Subject: [PATCH 2/3] media: atomisp: Remove aliases for MIPI_FORMAT_2400_CUSTOM0
Date:   Sat, 15 Jul 2023 19:09:05 +0200
Message-ID: <20230715170906.3627-2-hdegoede@redhat.com>
In-Reply-To: <20230715170906.3627-1-hdegoede@redhat.com>
References: <20230715170906.3627-1-hdegoede@redhat.com>
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

isp2400_input_system_local.h defines 2 aliases for MIPI_FORMAT_2400_CUSTOM0
MIPI_FORMAT_JPEG, which is entirely unused and MIPI_FORMAT_BINARY_8 which
is used once in ia_css_isys_2400_set_fmt_type().

Drop these aliases and directly use MIPI_FORMAT_2400_CUSTOM0 in
ia_css_isys_2400_set_fmt_type().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/isp2400_input_system_local.h | 2 --
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c        | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index e7b84fdbb4e0..6319d6449f20 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -200,8 +200,6 @@ typedef enum {
 	N_MIPI_FORMAT_2400,
 } mipi_format_2400_t;
 
-#define MIPI_FORMAT_JPEG	MIPI_FORMAT_2400_CUSTOM0
-#define MIPI_FORMAT_BINARY_8	MIPI_FORMAT_2400_CUSTOM0
 #define N_MIPI_FORMAT_CUSTOM	8
 
 /* The number of stores for compressed format types */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index c8316e0965d0..deb4130f710c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -271,7 +271,7 @@ static int ia_css_isys_2400_set_fmt_type(enum atomisp_input_format input_format,
 		*fmt_type = MIPI_FORMAT_2400_RAW16;
 		break;
 	case ATOMISP_INPUT_FORMAT_BINARY_8:
-		*fmt_type = MIPI_FORMAT_BINARY_8;
+		*fmt_type = MIPI_FORMAT_2400_CUSTOM0;
 		break;
 	case ATOMISP_INPUT_FORMAT_YUV420_16:
 	case ATOMISP_INPUT_FORMAT_YUV422_16:
-- 
2.41.0

