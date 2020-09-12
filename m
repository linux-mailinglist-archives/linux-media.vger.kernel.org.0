Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528B8267938
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 11:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgILJie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 05:38:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:60146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbgILJic (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 05:38:32 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2E0C208B3;
        Sat, 12 Sep 2020 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599903512;
        bh=wtWr/uv4YptSfy3vfLKpz9nXj+q8TtXd2IlsaXU5w28=;
        h=From:To:Cc:Subject:Date:From;
        b=HTHO8i5+4TJ6K9xaLstbXGV0L5J8PNdlNCmC3H26j1Av2ke9Vag+Pru6JPVbW5RRX
         OnLg0HMXQP3u3PgmUUCsKmCnxoTyabwSP0z+DHav/+l/zEZfmV1q/RvDeny7YdsgP5
         mqd4AobuVBGiPg/qNV74FgDvG0qcvmtNSjRNkMVU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kH1zJ-001cQi-9k; Sat, 12 Sep 2020 11:38:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v2] media: vidtv: fix 32-bit warnings
Date:   Sat, 12 Sep 2020 11:38:27 +0200
Message-Id: <542c6b0339aaf6636d996592763ea3b2c82640b1.1599903505.git.mchehab+huawei@kernel.org>
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
index 467470295942..59e056fb6d33 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -415,7 +415,7 @@ static void vidtv_s302m_write_frames(struct vidtv_encoder *e)
 		au->nbytes = nbytes_per_unit;
 
 		if (au_sz + sizeof(struct vidtv_smpte_s302m_es) != nbytes_per_unit) {
-			pr_warn_ratelimited("write size was %d, expected %lu\n",
+			pr_warn_ratelimited("write size was %u, expected %zu\n",
 					    nbytes_per_unit,
 					    au_sz + sizeof(struct vidtv_smpte_s302m_es));
 		}
-- 
2.26.2

