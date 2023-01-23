Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E68677BF4
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbjAWMzw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbjAWMzv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3057610242
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n6jh7l4Ac7bZgyhvHj1SvpODNBVaS174AfoY/F7nqAQ=;
        b=SsxcqT+K9kJWap2usnC65StaEiJEJciyAJqQby64j6bH0r9v28OpFF/+T82MqMykQXc+RP
        2YGIMT8lps5Alq2v1JfersIMO0LfLsOSnuIccGg7XbD7uZvO7MS9BwsMpVkSV3sSsxQCD1
        FQBfim5ID55HSKkdI89KLSPX4O3uanM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-_kwng64HNlu_HKyoDaxJpw-1; Mon, 23 Jan 2023 07:54:56 -0500
X-MC-Unique: _kwng64HNlu_HKyoDaxJpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5E93101A55E;
        Mon, 23 Jan 2023 12:54:55 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 44D7BC15BA0;
        Mon, 23 Jan 2023 12:54:53 +0000 (UTC)
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
        Brent Pappas <bpappas@pappasbrent.com>
Subject: [PATCH 56/57] media: atomisp: pci: hive_isp_css_common: host: vmem: Replace SUBWORD macros with functions
Date:   Mon, 23 Jan 2023 13:52:04 +0100
Message-Id: <20230123125205.622152-57-hdegoede@redhat.com>
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

Replace the macros SUBWORD() and INV_SUBWORD() with functions to comply
with Linux coding style standards.

Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
Link: https://lore.kernel.org/r/20230120182625.23227-1-bpappas@pappasbrent.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../pci/hive_isp_css_common/host/vmem.c       | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 6620f091442f..d9cdfbc50197 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -28,10 +28,18 @@ typedef hive_uedge *hive_wide;
 /* Copied from SDK: sim_semantics.c */
 
 /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[00000000xxxx]LSB */
-#define SUBWORD(w, start, end)     (((w) & (((1ULL << ((end) - 1)) - 1) << 1 | 1)) >> (start))
+static inline hive_uedge
+subword(hive_uedge w, unsigned int start, unsigned int end)
+{
+	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
+}
 
 /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx]LSB */
-#define INV_SUBWORD(w, start, end) ((w) & (~(((1ULL << ((end) - 1)) - 1) << 1 | 1) | ((1ULL << (start)) - 1)))
+static inline hive_uedge
+inv_subword(hive_uedge w, unsigned int start, unsigned int end)
+{
+	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
+}
 
 #define uedge_bits (8 * sizeof(hive_uedge))
 #define move_lower_bits(target, target_bit, src, src_bit) move_subword(target, target_bit, src, 0, src_bit)
@@ -50,18 +58,18 @@ move_subword(
 	unsigned int start_bit  = target_bit % uedge_bits;
 	unsigned int subword_width = src_end - src_start;
 
-	hive_uedge src_subword = SUBWORD(src, src_start, src_end);
+	hive_uedge src_subword = subword(src, src_start, src_end);
 
 	if (subword_width + start_bit > uedge_bits) { /* overlap */
 		hive_uedge old_val1;
-		hive_uedge old_val0 = INV_SUBWORD(target[start_elem], start_bit, uedge_bits);
+		hive_uedge old_val0 = inv_subword(target[start_elem], start_bit, uedge_bits);
 
 		target[start_elem] = old_val0 | (src_subword << start_bit);
-		old_val1 = INV_SUBWORD(target[start_elem + 1], 0,
+		old_val1 = inv_subword(target[start_elem + 1], 0,
 				       subword_width + start_bit - uedge_bits);
 		target[start_elem + 1] = old_val1 | (src_subword >> (uedge_bits - start_bit));
 	} else {
-		hive_uedge old_val = INV_SUBWORD(target[start_elem], start_bit,
+		hive_uedge old_val = inv_subword(target[start_elem], start_bit,
 						 start_bit + subword_width);
 
 		target[start_elem] = old_val | (src_subword << start_bit);
-- 
2.39.0

