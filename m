Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C092B2A1875
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 16:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgJaPGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 11:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbgJaPGE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 11:06:04 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35BFC0617A6;
        Sat, 31 Oct 2020 08:06:04 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id dj6so186983qvb.3;
        Sat, 31 Oct 2020 08:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m9xs1oNvMMX6kSZRMG/5Ry3mal8f/IuqjXrtdUz49RA=;
        b=aZ0DfP3CqDR5TiCjp32FqF8eY05acVf9ArKmw7EW9jMJEf7LcI+m28oBMvVdMHY8aN
         LTmJ9QzFA/9pgZsQstltNh7eQPQfL/p9pFU5BCWR/asEtv/QU9mCITECUqIPUctExteg
         j7GSSVtIjNTBPlfRlZa4ULSEaVc6L0vayvJ5ey2rXEDnv8wrttgOscIQMmbtuSgzxXdM
         +BPak9f1/N49T0V0Zp3tNgReMevSWJAWQLtwXDN0HYFI+PxDk88C8ifE0iHX7KWBSVL3
         XL7akWK1JAxOpKF6t9pNjZCzCbcv0Mt/16UzNyBUUTL0JXClS3TBK0HMMUwolhXpvxrx
         feNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m9xs1oNvMMX6kSZRMG/5Ry3mal8f/IuqjXrtdUz49RA=;
        b=D1cPHzaPeRIJn2PXHuMjCKKLoc7Jo1oB+6pKTjD8C7xZuMYTFj7GPkUq1Mr4IsvAmw
         r3XF5b298SuauwGVAqbzPMUw3qoxyDmQAvPFix/9hRZpLZ9/ZMHI7No3IW6qF9o8OFDN
         /72008nxYdIgXk7DLhchzGDkp8RlO5ATbFtAtAiEgmMlUMA8jkycgyhngciwGJ8KcziS
         mZrb/5uu5+x1G145Jr9bg6PcxzYZ0PIuYsMQh/7meK3QtIXS8KkfHNOlIY0nbkZ4BVjR
         9F59npm6izsx3ButBc3Vr9j5I+2rGVd9maMFHW9RvkOpVHpTp7of6JN8a3/0Oxh7nz3T
         ZOCA==
X-Gm-Message-State: AOAM530fQUxtZwZi+Mv7NjHNthLpKjCRPV4sf4w6nbsrAg8hVmFywQpi
        o9E/FhE17FQThgF4fJz9RGE=
X-Google-Smtp-Source: ABdhPJyz2FgtBhzVYdk3HEUQI0hlZKrE6nWvqcC3vCiSJ5wqKBNnN9XJriLmgjpOiLKlKQOf98f2Og==
X-Received: by 2002:ad4:42ae:: with SMTP id e14mr13792036qvr.44.1604156763906;
        Sat, 31 Oct 2020 08:06:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 08:06:03 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] media: vidtv: extract the initial CRC value to into a #define
Date:   Sat, 31 Oct 2020 12:05:47 -0300
Message-Id: <20201031150552.663598-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201031150552.663598-1-dwlsalmeida@gmail.com>
References: <20201031150552.663598-1-dwlsalmeida@gmail.com>
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
index 82cf67dd27c0..f2e25e68c085 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -31,6 +31,7 @@
 
 #define CRC_SIZE_IN_BYTES 4
 #define MAX_VERSION_NUM 32
+#define INITIAL_CRC 0xffffffff
 
 static const u32 CRC_LUT[256] = {
 	/* from libdvbv5 */
@@ -784,7 +785,7 @@ u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args)
 	/* the number of bytes written by this function */
 	u32 nbytes = 0;
 	const u16 pat_pid = VIDTV_PAT_PID;
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_pat_program *p = args.pat->program;
 
@@ -974,7 +975,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 {
 	/* the number of bytes written by this function */
 	u32 nbytes = 0;
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
 	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
@@ -1124,7 +1125,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 	u32 nbytes  = 0;
 	u16 sdt_pid = VIDTV_SDT_PID;  /* see ETSI EN 300 468 v1.15.1 p. 11 */
 
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
 	struct vidtv_psi_desc *service_desc = (args.sdt->service) ?
-- 
2.29.2

