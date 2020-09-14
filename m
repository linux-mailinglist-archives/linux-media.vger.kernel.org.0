Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6389A2687E7
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 11:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgINJEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 05:04:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:37682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgINJDc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 05:03:32 -0400
Received: from mail.kernel.org (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F47221741;
        Mon, 14 Sep 2020 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600074211;
        bh=4IMF1YyMrDjVjNyzMc5sg5d+r3DMhGTnklBhVqgY1RI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MzeMcpqxYyfeF3qP9RCLqO5rWRsjausW+UPIce68cWG/j30sGBeYPFdI+X/ig2p/e
         3fYkzp+hhPAjDgs4nM9geKOujQzZpFOhBQ9gili9A1rt5cphkiCBuaLWmz900Oy8hS
         xQCUXs2fYhiA3qE5KbbDFhlXHDW75Ivfkiivj9oQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kHkOW-002dzd-3Q; Mon, 14 Sep 2020 11:03:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH RFC 06/11] media: vidtv: get rid of some endiannes nonsense
Date:   Mon, 14 Sep 2020 11:03:21 +0200
Message-Id: <47ccbcbd23e44159bbb11274b540d7c2bb66be7c.1600073975.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600073975.git.mchehab+huawei@kernel.org>
References: <cover.1600073975.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Genmask is always highest order to low order. It doesn't make
any sense to make it depends on endiannes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 32 --------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 761034d10d9d..b8b638244b1d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -99,11 +99,7 @@ static inline u16 vidtv_psi_sdt_serv_get_desc_loop_len(struct vidtv_psi_table_sd
 	u16 mask;
 	u16 ret;
 
-	#if defined(__BIG_ENDIAN)
-	mask = GENMASK(0, 11);
-	#else
 	mask = GENMASK(11, 0);
-	#endif
 
 	ret = be16_to_cpu(s->bitfield) & mask;
 	return ret;
@@ -114,11 +110,7 @@ static inline u16 vidtv_psi_pmt_stream_get_desc_loop_len(struct vidtv_psi_table_
 	u16 mask;
 	u16 ret;
 
-	#if defined(__BIG_ENDIAN)
-	mask = GENMASK(0, 9);
-	#else
 	mask = GENMASK(9, 0);
-	#endif
 
 	ret = be16_to_cpu(s->bitfield2) & mask;
 	return ret;
@@ -129,11 +121,7 @@ static inline u16 vidtv_psi_pmt_get_desc_loop_len(struct vidtv_psi_table_pmt *p)
 	u16 mask;
 	u16 ret;
 
-	#if defined(__BIG_ENDIAN)
-	mask = GENMASK(0, 9);
-	#else
 	mask = GENMASK(9, 0);
-	#endif
 
 	ret = be16_to_cpu(p->bitfield2) & mask;
 	return ret;
@@ -144,11 +132,7 @@ static inline u16 vidtv_psi_get_sec_len(struct vidtv_psi_table_header *h)
 	u16 mask;
 	u16 ret;
 
-	#if defined(__BIG_ENDIAN)
-	mask = GENMASK(0, 11);
-	#else
 	mask = GENMASK(11, 0);
-	#endif
 
 	ret = be16_to_cpu(h->bitfield) & mask;
 	return ret;
@@ -159,11 +143,7 @@ inline u16 vidtv_psi_get_pat_program_pid(struct vidtv_psi_table_pat_program *p)
 	u16 mask;
 	u16 ret;
 
-	#if defined(__BIG_ENDIAN)
-	mask = GENMASK(0, 12);
-	#else
 	mask = GENMASK(12, 0);
-	#endif
 
 	ret = be16_to_cpu(p->bitfield) & mask;
 	return ret;
@@ -174,11 +154,7 @@ inline u16 vidtv_psi_pmt_stream_get_elem_pid(struct vidtv_psi_table_pmt_stream *
 	u16 mask;
 	u16 ret;
 
-	#if defined(__BIG_ENDIAN)
-	mask = GENMASK(0, 12);
-	#else
 	mask = GENMASK(12, 0);
-	#endif
 
 	ret = be16_to_cpu(s->bitfield) & mask;
 	return ret;
@@ -189,11 +165,7 @@ static inline void vidtv_psi_set_desc_loop_len(__be16 *bitfield, u16 new_len, u8
 	u16 mask;
 	__be16 new;
 
-	#if defined(__BIG_ENDIAN)
-	mask = GENMASK(desc_len_nbits, 15);
-	#else
 	mask = GENMASK(15, desc_len_nbits);
-	#endif
 
 	new = cpu_to_be16((be16_to_cpu(*bitfield) & mask) | new_len);
 	*bitfield = new;
@@ -205,11 +177,7 @@ static void vidtv_psi_set_sec_len(struct vidtv_psi_table_header *h, u16 new_len)
 	__be16 new;
 	u16 mask;
 
-	#if defined(__BIG_ENDIAN)
-	mask = GENMASK(13, 15);
-	#else
 	mask = GENMASK(15, 13);
-	#endif
 
 	new = cpu_to_be16((be16_to_cpu(h->bitfield) & mask) | new_len);
 
-- 
2.26.2

