Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB452722D8
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 13:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgIULn4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 07:43:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:60134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726541AbgIULnw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 07:43:52 -0400
Received: from mail.kernel.org (ip5f5ad5b1.dynamic.kabel-deutschland.de [95.90.213.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C01121531;
        Mon, 21 Sep 2020 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600688631;
        bh=KMwGZxk2FiX2doZrX3ZRZ3aq9R/Lq6ePUUBFeMnPv2I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o54OzUTPiRzwTF7EwywbT8tgGAgzoUktmvY2psLJEhB5C/lStXu+xGUVC/GtOOxGH
         BIoJCjGzMuyUPw+z8gEg4SuntFhYEL4gD9/TwmcWVOyKZcFGippbxLLD78W6TQr9+w
         gfOm1GMFaPNpBlyBhkSOnmNEFDXb32pDJmc490w8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kKKEW-0004VC-3I; Mon, 21 Sep 2020 13:43:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 4/9] media: vidtv: cleanup PSI version numbers
Date:   Mon, 21 Sep 2020 13:43:41 +0200
Message-Id: <257cd4d86305d17ee0f895c5d36d2a95432efc2d.1600688419.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600688419.git.mchehab+huawei@kernel.org>
References: <cover.1600688419.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no reason to use static vars to store PSI version
numbers.

Also, currently, version numbers are starting with 0x01,
because there's a code being called that increases it to
1 for all table initializer code, as the code may support
dynamic changes at the PS tables on some future.

So, let's just initialize them to 0x1f, in order for the
versions to be reported as starting from 0.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 5fe3fbb765b8..82cf67dd27c0 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -756,7 +756,6 @@ vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
 struct vidtv_psi_table_pat *vidtv_psi_pat_table_init(u16 transport_stream_id)
 {
 	struct vidtv_psi_table_pat *pat = kzalloc(sizeof(*pat), GFP_KERNEL);
-	static u8 pat_version;
 	const u16 SYNTAX = 0x1;
 	const u16 ZERO = 0x0;
 	const u16 ONES = 0x03;
@@ -767,7 +766,7 @@ struct vidtv_psi_table_pat *vidtv_psi_pat_table_init(u16 transport_stream_id)
 	pat->header.id           = cpu_to_be16(transport_stream_id);
 	pat->header.current_next = 0x1;
 
-	pat->header.version = pat_version;
+	pat->header.version = 0x1f;
 
 	pat->header.one2         = 0x03;
 	pat->header.section_id   = 0x0;
@@ -935,7 +934,6 @@ struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
 						     u16 pcr_pid)
 {
 	struct vidtv_psi_table_pmt *pmt = kzalloc(sizeof(*pmt), GFP_KERNEL);
-	static u8 pmt_version;
 	const u16 SYNTAX = 0x1;
 	const u16 ZERO = 0x0;
 	const u16 ONES = 0x03;
@@ -953,7 +951,7 @@ struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
 	pmt->header.id = cpu_to_be16(program_number);
 	pmt->header.current_next = 0x1;
 
-	pmt->header.version = pmt_version;
+	pmt->header.version = 0x1f;
 
 	pmt->header.one2 = ONES;
 	pmt->header.section_id   = 0;
@@ -1083,7 +1081,6 @@ void vidtv_psi_pmt_table_destroy(struct vidtv_psi_table_pmt *pmt)
 struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 transport_stream_id)
 {
 	struct vidtv_psi_table_sdt *sdt = kzalloc(sizeof(*sdt), GFP_KERNEL);
-	static u8 sdt_version;
 	const u16 SYNTAX = 0x1;
 	const u16 ONE = 0x1;
 	const u16 ONES = 0x03;
@@ -1101,7 +1098,7 @@ struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 transport_stream_id)
 	sdt->header.id = cpu_to_be16(transport_stream_id);
 	sdt->header.current_next = ONE;
 
-	sdt->header.version = sdt_version;
+	sdt->header.version = 0x1f;
 
 	sdt->header.one2  = ONES;
 	sdt->header.section_id   = 0;
-- 
2.26.2

