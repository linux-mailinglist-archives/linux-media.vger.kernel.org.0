Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0364626791D
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 11:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgILJW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 05:22:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:56598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgILJWv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 05:22:51 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A89F20796;
        Sat, 12 Sep 2020 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599902571;
        bh=6Q+AbG3QWiHA3HGr6g8w/t8tM48q/RSUlhmIjzNTm2c=;
        h=From:To:Cc:Subject:Date:From;
        b=taXULLzJdemj1hNMoUcfGjFKmY8SoaoJ31nKoJ8mgmCQj8NYfBoYtJeP+0a05pCru
         j6QT0xU8t/cCQvlRdOrtvIONqvArorto45uojn6zMLnINTYiY0w6DoUPlAR2HSAew0
         1wqVzt37O7P09wNXFUHt8kFln6gMfNQQPzNH6E+0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kH1k7-001cEl-Kd; Sat, 12 Sep 2020 11:22:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: vidtv: fix 32-bit warnings
Date:   Sat, 12 Sep 2020 11:22:46 +0200
Message-Id: <008267108695f5cdf6744d861b2b6e5084bedfee.1599902564.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several warnings produced when the driver is built
for 32-bit archs. Solve them.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_common.c |  4 ++--
 drivers/media/test-drivers/vidtv/vidtv_pes.c    | 12 ++++++------
 drivers/media/test-drivers/vidtv/vidtv_s302m.c  |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
index 9093df32e0ab..63b3055bd715 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_common.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
@@ -42,7 +42,7 @@ u32 vidtv_memcpy(void *to,
 		 size_t len)
 {
 	if (unlikely(to_offset + len > to_size)) {
-		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size. Needed %lu, had %zu\n",
+		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size. Needed %zu, had %zu\n",
 				   to_offset + len,
 				   to_size);
 		return 0;
@@ -78,7 +78,7 @@ u32 vidtv_memset(void *to,
 		 size_t len)
 {
 	if (unlikely(to_offset + len > to_size)) {
-		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size. Needed %lu, had %zu\n",
+		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size. Needed %zu, had %zu\n",
 				   to_offset + len,
 				   to_size);
 		return 0;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.c b/drivers/media/test-drivers/vidtv/vidtv_pes.c
index 8237434f3fc2..4ffc4a1c33ee 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.c
@@ -91,13 +91,13 @@ static u32 vidtv_pes_write_pts_dts(struct pes_header_write_args args)
 		return 0;
 
 	#ifdef __BIG_ENDIAN
-	mask1 = GENMASK(30, 32);
-	mask2 = GENMASK(15, 29);
-	mask3 = GENMASK(0, 14);
+	mask1 = GENMASK_ULL(30, 32);
+	mask2 = GENMASK_ULL(15, 29);
+	mask3 = GENMASK_ULL(0, 14);
 	#else
-	mask1 = GENMASK(32, 30);
-	mask2 = GENMASK(29, 15);
-	mask3 = GENMASK(14, 0);
+	mask1 = GENMASK_ULL(32, 30);
+	mask2 = GENMASK_ULL(29, 15);
+	mask3 = GENMASK_ULL(14, 0);
 	#endif
 
 	/* see ISO/IEC 13818-1 : 2000 p. 32 */
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 467470295942..7cabc71b26e4 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -415,7 +415,7 @@ static void vidtv_s302m_write_frames(struct vidtv_encoder *e)
 		au->nbytes = nbytes_per_unit;
 
 		if (au_sz + sizeof(struct vidtv_smpte_s302m_es) != nbytes_per_unit) {
-			pr_warn_ratelimited("write size was %d, expected %lu\n",
+			pr_warn_ratelimited("write size was %zu, expected %zu\n",
 					    nbytes_per_unit,
 					    au_sz + sizeof(struct vidtv_smpte_s302m_es));
 		}
-- 
2.26.2

