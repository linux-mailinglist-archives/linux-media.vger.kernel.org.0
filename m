Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E854A27BB82
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 05:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbgI2D0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 23:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgI2D0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 23:26:36 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF932C061755;
        Mon, 28 Sep 2020 20:26:35 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id h1so1617638qvo.9;
        Mon, 28 Sep 2020 20:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xNL+JIXJEkaTd9PqUlCjJsAHaPEKb5MgmMlSqxfrt/Q=;
        b=d7Jb0pMRJ6Mu6/iNZqXuhoefJjUkSrhyahenPRxDqAO1HvA231sPyjNFpbsrvcumja
         zXJLlyfiDtGHJrHavukLFo/gBFQ5j1kj3djbs8JiwTo5HTYaIVs7RI8I5QTzoTBXvnNG
         BlaX9PclaaXrtKLNeSIhXBQO/7haT30eYJvAr9BxhvKUvUxJxO4dRgZVpQbC5Lae8mYL
         TUIhyG1BYI2zN67lgDbPmFmdBTJ7jdVze18P8vZE25HvwtCcwVkQZU4kL3PFxXzUupbQ
         r9wjpsLW+jTygNBiQbhXqwJOf502BwdCQv7YxsNVekPcJ1ghBiRRvXzvX7FgWI12ETpo
         jCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xNL+JIXJEkaTd9PqUlCjJsAHaPEKb5MgmMlSqxfrt/Q=;
        b=mt72rqLJ/Z5QTGIhzaguhmN5YnnBK4cZt/dVIazNns95SUSTmjnqBRinYbIY3wq5/s
         Th5+dCkuGA51+AM08VjLQT+H7PoFizXW17exF6qWFcE9SJYbOB9je4ZyTLRYC+h2wA7+
         akOhfDrTZaHI0o5zrnrsaQdeUUvYu0zQdGRG6YlkkmBoNQ60xzOVY+lX+g7lxceMGGWQ
         ZQz0jfSULPZ+lNn0RmPL2RHSrSvBvB6v54rM8Ucs6Yl0sUDSL6UrBfoOfzqjn5kuFBQo
         zoOHXp1FFpjvDeWs0vPgIFutRfkKeHjlDM7yyTqQOOmDoQU2WQ3rpTHoK23llf0raWoj
         S2DA==
X-Gm-Message-State: AOAM530w/w9Gl8UX5kXB0rRCuKmIaEA+07jCCK7Q2l0GA66s2mQO0B7D
        nAIywI8XMi1a58ztbinW+k4=
X-Google-Smtp-Source: ABdhPJwwB0/KE7j2Zf+eBeNKBpGgEmc3dFw3ABr7bF9Zbo9+hRwQ2Ouy9oGVxwsPFibQb3HFuccanQ==
X-Received: by 2002:a0c:a085:: with SMTP id c5mr2774834qva.30.1601349994899;
        Mon, 28 Sep 2020 20:26:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c40sm4010313qtb.72.2020.09.28.20.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 20:26:34 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH WIP 1/6] media: vidtv: extract the initial CRC value to into a #define
Date:   Tue, 29 Sep 2020 00:26:20 -0300
Message-Id: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

The same constant (0xffffffff) is used in three different functions.

Extract it into a #define to avoid repetition.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 3151b300a91b..a24e84adc8ce 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -30,6 +30,7 @@
 
 #define CRC_SIZE_IN_BYTES 4
 #define MAX_VERSION_NUM 32
+#define INITIAL_CRC 0xffffffff
 
 static const u32 CRC_LUT[256] = {
 	/* from libdvbv5 */
@@ -794,7 +795,7 @@ u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args)
 	/* the number of bytes written by this function */
 	u32 nbytes = 0;
 	const u16 pat_pid = VIDTV_PAT_PID;
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_pat_program *p = args.pat->program;
 
@@ -990,7 +991,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 {
 	/* the number of bytes written by this function */
 	u32 nbytes = 0;
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
 	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
@@ -1143,7 +1144,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 	u32 nbytes  = 0;
 	u16 sdt_pid = VIDTV_SDT_PID;  /* see ETSI EN 300 468 v1.15.1 p. 11 */
 
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
 	struct vidtv_psi_desc *service_desc = (args.sdt->service) ?
-- 
2.28.0

