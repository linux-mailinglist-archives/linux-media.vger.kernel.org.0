Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8BB2C23B8
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732686AbgKXLHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:33806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732500AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23D7521534;
        Tue, 24 Nov 2020 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=hA+Hp1F1U3SzbaT/vCbm8FR+9RlEJ1EetZ8a2k907LA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KLJ9qJhhpXM5SXj/EYeC1upbN378ye63jHpEVbKcbQpT/sZyW1KQYbvyjzT5jghW9
         zU0APHEW3n66Yq2lhKc2M0TRIych8wf8IY8WVCU8Rb2XL3sMeb0j0yf+vHd4WmGQL6
         ed/hfVqMQ0Ad1Orw8jFJ/IGDMzMCQ4V6fFZ+01Go=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000FaG-5D; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 21/31] media: vidtv: simplify the crc writing logic
Date:   Tue, 24 Nov 2020 12:06:17 +0100
Message-Id: <7c0c37d86968c17104357164a675f46132f9c5c6.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cleanup the table_section_crc32_write_into() function
by initializing struct psi_write_args only once and by
passing the args as a pointer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 39 +++++++++-----------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 36f1c56d9e24..423b4fa2e473 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -254,26 +254,23 @@ static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args *args)
 	return nbytes;
 }
 
-static u32 table_section_crc32_write_into(struct crc32_write_args args)
+static u32 table_section_crc32_write_into(struct crc32_write_args *args)
 {
-	struct psi_write_args psi_args = {};
-	u32 nbytes = 0;
+	struct psi_write_args psi_args = {
+		.dest_buf           = args->dest_buf,
+		.from               = &args->crc,
+		.len                = CRC_SIZE_IN_BYTES,
+		.dest_offset        = args->dest_offset,
+		.pid                = args->pid,
+		.new_psi_section    = false,
+		.continuity_counter = args->continuity_counter,
+		.is_crc             = true,
+		.dest_buf_sz        = args->dest_buf_sz,
+	};
 
 	/* the CRC is the last entry in the section */
 
-	psi_args.dest_buf           = args.dest_buf;
-	psi_args.from               = &args.crc;
-	psi_args.len                = CRC_SIZE_IN_BYTES;
-	psi_args.dest_offset        = args.dest_offset;
-	psi_args.pid                = args.pid;
-	psi_args.new_psi_section    = false;
-	psi_args.continuity_counter = args.continuity_counter;
-	psi_args.is_crc             = true;
-	psi_args.dest_buf_sz        = args.dest_buf_sz;
-
-	nbytes += vidtv_psi_ts_psi_write_into(&psi_args);
-
-	return nbytes;
+	return vidtv_psi_ts_psi_write_into(&psi_args);
 }
 
 static void vidtv_psi_desc_chain(struct vidtv_psi_desc *head, struct vidtv_psi_desc *desc)
@@ -1023,7 +1020,7 @@ u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args)
 	c_args.dest_buf_sz        = args.buf_sz;
 
 	/* Write the CRC32 at the end */
-	nbytes += table_section_crc32_write_into(c_args);
+	nbytes += table_section_crc32_write_into(&c_args);
 
 	return nbytes;
 }
@@ -1258,7 +1255,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 	c_args.dest_buf_sz        = args.buf_sz;
 
 	/* Write the CRC32 at the end */
-	nbytes += table_section_crc32_write_into(c_args);
+	nbytes += table_section_crc32_write_into(&c_args);
 
 	return nbytes;
 }
@@ -1397,7 +1394,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 	c_args.dest_buf_sz        = args.buf_sz;
 
 	/* Write the CRC at the end */
-	nbytes += table_section_crc32_write_into(c_args);
+	nbytes += table_section_crc32_write_into(&c_args);
 
 	return nbytes;
 }
@@ -1754,7 +1751,7 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 	c_args.dest_buf_sz        = args.buf_sz;
 
 	/* Write the CRC32 at the end */
-	nbytes += table_section_crc32_write_into(c_args);
+	nbytes += table_section_crc32_write_into(&c_args);
 
 	return nbytes;
 }
@@ -1944,7 +1941,7 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 	c_args.dest_buf_sz        = args.buf_sz;
 
 	/* Write the CRC at the end */
-	nbytes += table_section_crc32_write_into(c_args);
+	nbytes += table_section_crc32_write_into(&c_args);
 
 	return nbytes;
 }
-- 
2.28.0

