Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E57D2E27DB
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 16:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728439AbgLXPEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 10:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgLXPEy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 10:04:54 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C7AC061573;
        Thu, 24 Dec 2020 07:04:29 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id p14so2250170qke.6;
        Thu, 24 Dec 2020 07:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o/IisbDukaJFzBqxu964rS+3N2VqdxzPbVgg8PjT41o=;
        b=l/9LME7nqH0Bw4sD3e3OW3OYmn8PVvlAM8FrWFi0owdacStKQQzqou2ivQ+gp+XmtI
         +uPWhI8E9VHPlqKrp8E+QV870z0FVM34Z087dI3kF6nFJolS8Y4RIYK/dzAVHzyGz9yu
         X+Gav/mNAEf7/oOlSWlmPgo2SJtsHPAOtxIFCjIbLJGspKWkLtIUn+GG0zsGolxowkjX
         JbJJmNihGxKyNSGvIJPImHVnC2KVuaOfUKALsYdEidWNZ4/Rh/yjtv5BWslSmsR4BLpD
         Odsq0vdp6+XAyJaYYtWU0Hb49j/7RRSSH7AmUm9sm5pBxuvCWQ0SJKyMjRuLNF7GK097
         kDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o/IisbDukaJFzBqxu964rS+3N2VqdxzPbVgg8PjT41o=;
        b=hGGKJowxpbVac4rJQ8g7Ys9AoMQ+rzSZXoIwbXzpCytgjl/R/9VBbPdQXvWXKj+DHP
         AkeC7rpnCuF4ZAbuH/XsrvkxE/DDyRhFoXpGI50HUY7h7BAtNfqU/5TDDbdnzjGa7ZmG
         Z9sB+aPsBxO97jUqpwqmaAXAzT68MkQrTfw3G1aJgXH2l6HkCLCGRRzXY2T0kfE/EZek
         iLqwOHJtp9ni9v//PMJT2GW8YimwrwpY9fMYIDU7XFsDOxZSmfU5OfSAHKM/uOyAasHR
         Xe4cds+V7YcUjCHet6bATSzXmb2U8Uby4m+9h0IMWkqqxIZkCQOabFRAyYIE3bBQqFG5
         Y/Dw==
X-Gm-Message-State: AOAM5318gZUKA5chVUZ7JcIc39DIpxgmvHI/OcHAYNV0uQdPC17w545G
        7qGksAAd7dEGtf66N1QOyWI=
X-Google-Smtp-Source: ABdhPJzdhDLVpyNwY49XuT1FiQcBgGQ2QXFo8AlFeIwbOfbdet6zNRD61EB9U7VVGajz/ebsb1uZQA==
X-Received: by 2002:a05:620a:544:: with SMTP id o4mr32244012qko.19.1608822268280;
        Thu, 24 Dec 2020 07:04:28 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:74c8:8f67:61c5:55b9])
        by smtp.gmail.com with ESMTPSA id e38sm10322215qtb.30.2020.12.24.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 07:04:27 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.o,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] vidtv: psi: fix missing crc for PMT
Date:   Thu, 24 Dec 2020 12:04:00 -0300
Message-Id: <20201224150402.1945788-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

The PMT write function was refactored and this broke the CRC computation.

Fix it.

Fixes: db9569f67e2e ("media: vidtv: cleanup PMT write table function")
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 4511a2a98405..1724bb485e67 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1164,6 +1164,8 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args *args)
 	struct vidtv_psi_desc *table_descriptor   = args->pmt->descriptor;
 	struct vidtv_psi_table_pmt_stream *stream = args->pmt->stream;
 	struct vidtv_psi_desc *stream_descriptor;
+	u32 crc = INITIAL_CRC;
+	u32 nbytes = 0;
 	struct header_write_args h_args = {
 		.dest_buf           = args->buf,
 		.dest_offset        = args->offset,
@@ -1181,6 +1183,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args *args)
 		.new_psi_section    = false,
 		.is_crc             = false,
 		.dest_buf_sz        = args->buf_sz,
+		.crc                = &crc,
 	};
 	struct desc_write_args d_args   = {
 		.dest_buf           = args->buf,
@@ -1193,8 +1196,6 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args *args)
 		.pid                = args->pid,
 		.dest_buf_sz        = args->buf_sz,
 	};
-	u32 crc = INITIAL_CRC;
-	u32 nbytes = 0;
 
 	vidtv_psi_pmt_table_update_sec_len(args->pmt);
 
-- 
2.29.2

