Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BBE2C23D7
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732811AbgKXLIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:08:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:33618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731900AbgKXLGc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:32 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB64B2073C;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=E29yRqHDAxKKhkniYtM5PwuGkBSa5WeUgbjUjAiAehk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jRYKSORKq97+/Wl3PNZWu7hppyMY7IwnGatqemHl5SnHigvdCgoyFxpiQ1HcNgO6b
         L8M56Boy0y78Wwe/u4zKBBT+nSc4kQ/9gumCuv8YujyT2g3N8aeeZPaGQb7u9v/Mx1
         yFsqnsfR9qP+nyC+nvLbjOQhu9giLhca1PRG1aZY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZo-SZ; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 11/31] media: vidtv: pre-initialize mux arrays
Date:   Tue, 24 Nov 2020 12:06:07 +0100
Message-Id: <0969e607fe7f43aed2feb38d88e143f81164f426.1606215584.git.mchehab+huawei@kernel.org>
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

Instead of first zeroing all fields at the mux structs and
then filling, do some initialization for the const data
when they're created.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c | 46 +++++++++++---------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 6df9cfd7f33b..728ae7c78827 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -129,11 +129,32 @@ static void vidtv_mux_update_clk(struct vidtv_mux *m)
 
 static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 {
-	struct vidtv_psi_pat_write_args pat_args = {};
-	struct vidtv_psi_pmt_write_args pmt_args = {};
-	struct vidtv_psi_sdt_write_args sdt_args = {};
-	struct vidtv_psi_nit_write_args nit_args = {};
-	struct vidtv_psi_eit_write_args eit_args = {};
+	struct vidtv_psi_pat_write_args pat_args = {
+		.buf                = m->mux_buf,
+		.buf_sz             = m->mux_buf_sz,
+		.pat                = m->si.pat,
+	};
+	struct vidtv_psi_pmt_write_args pmt_args = {
+		.buf                = m->mux_buf,
+		.buf_sz             = m->mux_buf_sz,
+		.pcr_pid            = m->pcr_pid,
+	};
+	struct vidtv_psi_sdt_write_args sdt_args = {
+		.buf                = m->mux_buf,
+		.buf_sz             = m->mux_buf_sz,
+		.sdt                = m->si.sdt,
+	};
+	struct vidtv_psi_nit_write_args nit_args = {
+		.buf                = m->mux_buf,
+		.buf_sz             = m->mux_buf_sz,
+		.nit                = m->si.nit,
+
+	};
+	struct vidtv_psi_eit_write_args eit_args = {
+		.buf                = m->mux_buf,
+		.buf_sz             = m->mux_buf_sz,
+		.eit                = m->si.eit,
+	};
 	u32 initial_offset = m->mux_buf_offset;
 	struct vidtv_mux_pid_ctx *pat_ctx;
 	struct vidtv_mux_pid_ctx *pmt_ctx;
@@ -149,10 +170,7 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 	nit_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_NIT_PID);
 	eit_ctx = vidtv_mux_get_pid_ctx(m, VIDTV_EIT_PID);
 
-	pat_args.buf                = m->mux_buf;
 	pat_args.offset             = m->mux_buf_offset;
-	pat_args.pat                = m->si.pat;
-	pat_args.buf_sz             = m->mux_buf_sz;
 	pat_args.continuity_counter = &pat_ctx->cc;
 
 	m->mux_buf_offset += vidtv_psi_pat_write_into(pat_args);
@@ -169,38 +187,26 @@ static u32 vidtv_mux_push_si(struct vidtv_mux *m)
 
 		pmt_ctx = vidtv_mux_get_pid_ctx(m, pmt_pid);
 
-		pmt_args.buf                = m->mux_buf;
 		pmt_args.offset             = m->mux_buf_offset;
 		pmt_args.pmt                = m->si.pmt_secs[i];
 		pmt_args.pid                = pmt_pid;
-		pmt_args.buf_sz             = m->mux_buf_sz;
 		pmt_args.continuity_counter = &pmt_ctx->cc;
-		pmt_args.pcr_pid            = m->pcr_pid;
 
 		/* write each section into buffer */
 		m->mux_buf_offset += vidtv_psi_pmt_write_into(pmt_args);
 	}
 
-	sdt_args.buf                = m->mux_buf;
 	sdt_args.offset             = m->mux_buf_offset;
-	sdt_args.sdt                = m->si.sdt;
-	sdt_args.buf_sz             = m->mux_buf_sz;
 	sdt_args.continuity_counter = &sdt_ctx->cc;
 
 	m->mux_buf_offset += vidtv_psi_sdt_write_into(sdt_args);
 
-	nit_args.buf                = m->mux_buf;
 	nit_args.offset             = m->mux_buf_offset;
-	nit_args.nit                = m->si.nit;
-	nit_args.buf_sz             = m->mux_buf_sz;
 	nit_args.continuity_counter = &nit_ctx->cc;
 
 	m->mux_buf_offset += vidtv_psi_nit_write_into(nit_args);
 
-	eit_args.buf                = m->mux_buf;
 	eit_args.offset             = m->mux_buf_offset;
-	eit_args.eit                = m->si.eit;
-	eit_args.buf_sz             = m->mux_buf_sz;
 	eit_args.continuity_counter = &eit_ctx->cc;
 
 	m->mux_buf_offset += vidtv_psi_eit_write_into(eit_args);
-- 
2.28.0

