Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501712C23CE
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732497AbgKXLGf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:33616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731503AbgKXLGb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:31 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF94B2076E;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=1hgr4H/Y3E+5rC+VMcP15LNhT9jHeBrIaycrAt8YDTM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wht49JwlLoLIf68gxlnfpoFCvE6OdVW38VFgWZWSsF815qM/CSOtLw6NThmIJKWl7
         8ajhHQM1v1D9ABHLRDo3/1ydTF3yvOAkQSdvmbfaX3p3y2YpJRmtwSfheIUACv9QqP
         jHSZae4ugCA+doOG2S3ehLWcXMCbUhJVO+GRsVKw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZr-TQ; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 12/31] media: vidtv: cleanup null packet initialization logic
Date:   Tue, 24 Nov 2020 12:06:08 +0100
Message-Id: <f5c1b027b92afa8e89cbde98a1abaa8d0ebc6331.1606215584.git.mchehab+huawei@kernel.org>
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

Initialize the destination buffer/size and the initial
offset when creating the local var.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 728ae7c78827..e0cc74e98632 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -348,7 +348,11 @@ static u32 vidtv_mux_poll_encoders(struct vidtv_mux *m)
 
 static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
 {
-	struct null_packet_write_args args = {};
+	struct null_packet_write_args args = {
+		.dest_buf           = m->mux_buf,
+		.buf_sz             = m->mux_buf_sz,
+		.dest_offset        = m->mux_buf_offset,
+	};
 	u32 initial_offset = m->mux_buf_offset;
 	struct vidtv_mux_pid_ctx *ctx;
 	u32 nbytes;
@@ -356,10 +360,7 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
 
 	ctx = vidtv_mux_get_pid_ctx(m, TS_NULL_PACKET_PID);
 
-	args.dest_buf           = m->mux_buf;
-	args.buf_sz             = m->mux_buf_sz;
 	args.continuity_counter = &ctx->cc;
-	args.dest_offset        = m->mux_buf_offset;
 
 	for (i = 0; i < npkts; ++i) {
 		m->mux_buf_offset += vidtv_ts_null_write_into(args);
-- 
2.28.0

