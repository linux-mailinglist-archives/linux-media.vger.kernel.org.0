Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2522687DD
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 11:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgINJEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 05:04:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:37870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbgINJDh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 05:03:37 -0400
Received: from mail.kernel.org (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B6D522243;
        Mon, 14 Sep 2020 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600074215;
        bh=ZOLnx3GySRUhJqLY4PjVLNQVlgiKXnHP9eP1aqGNMz8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H/jbcHPScyCp6gI8o1YQW10cDBSFTmebHCaiK3PbO7oqiRuB5+02sVkJ0fWYSp6rH
         zr4plKaY3Rp3P+GrRRP4m3oJpZAW2eHzMi7zdQfeEuxp9yeu96GtedDGEQsPD1LEeO
         XPoMUdMxaDkFn3z0jjgW7ZBd6ah6rot44a80R8OE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kHkOW-002dzV-0J; Mon, 14 Sep 2020 11:03:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH RFC 03/11] media: vidtv: fix 32-bit warnings
Date:   Mon, 14 Sep 2020 11:03:18 +0200
Message-Id: <c94dfae64cb893be7917ac6d373ac2a07babf7ee.1600073975.git.mchehab+huawei@kernel.org>
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

There are several warnings produced when the driver is built
for 32-bit archs. Solve them.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_common.c |  4 ++--
 drivers/media/test-drivers/vidtv/vidtv_pes.c    | 12 +++---------
 drivers/media/test-drivers/vidtv/vidtv_s302m.c  |  2 +-
 3 files changed, 6 insertions(+), 12 deletions(-)

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
index 8237434f3fc2..34518ef042f7 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.c
@@ -90,15 +90,9 @@ static u32 vidtv_pes_write_pts_dts(struct pes_header_write_args args)
 	if (!args.send_pts && args.send_dts)
 		return 0;
 
-	#ifdef __BIG_ENDIAN
-	mask1 = GENMASK(30, 32);
-	mask2 = GENMASK(15, 29);
-	mask3 = GENMASK(0, 14);
-	#else
-	mask1 = GENMASK(32, 30);
-	mask2 = GENMASK(29, 15);
-	mask3 = GENMASK(14, 0);
-	#endif
+	mask1 = GENMASK_ULL(32, 30);
+	mask2 = GENMASK_ULL(29, 15);
+	mask3 = GENMASK_ULL(14, 0);
 
 	/* see ISO/IEC 13818-1 : 2000 p. 32 */
 	if (args.send_pts && args.send_dts) {
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 3b20a26d8721..5ae2ede951eb 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -422,7 +422,7 @@ static void vidtv_s302m_write_frames(struct vidtv_encoder *e)
 		au->nbytes = nbytes_per_unit;
 
 		if (au_sz + sizeof(struct vidtv_smpte_s302m_es) != nbytes_per_unit) {
-			pr_warn_ratelimited("write size was %d, expected %lu\n",
+			pr_warn_ratelimited("write size was %u, expected %zu\n",
 					    nbytes_per_unit,
 					    au_sz + sizeof(struct vidtv_smpte_s302m_es));
 		}
-- 
2.26.2

