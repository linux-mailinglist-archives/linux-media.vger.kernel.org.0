Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8C62722D3
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 13:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgIULnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 07:43:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:60112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726541AbgIULnu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 07:43:50 -0400
Received: from mail.kernel.org (ip5f5ad5b1.dynamic.kabel-deutschland.de [95.90.213.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5477221789;
        Mon, 21 Sep 2020 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600688630;
        bh=Tr3XjPMHoh3ljJ2LS3yggJgTKP0SEFpFt6kiLoOs+WA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vkPF86P1L3jgfc2igfRRYIZxohEnyQnpwEwxwJzdmJNmUUDk9+QrvLYIxsaUme6nF
         HuHh7h20Wa5+ID8CO51T0i4OTatdks208l7zmqckap8lH+F45rHp7TnwrO1nIgi+Kh
         eEC+Q8zG8BnK2lVxg2nS0EkNgfAwj6TO/8xEcRms=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kKKEW-0004V8-1E; Mon, 21 Sep 2020 13:43:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/9] media: vidtv: remove more ENDIAN_BITFIELD nonsense
Date:   Mon, 21 Sep 2020 13:43:39 +0200
Message-Id: <415936c12d1506a363d088726f87651e54dd133e.1600688419.git.mchehab+huawei@kernel.org>
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

Changeset 870e350d4e39 ("media: vidtv: get rid of ENDIAN_BITFIELD nonsense")
was incomplete. There are still some wrong endannes logic at
the driver. Get rid of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.h |  8 --------
 drivers/media/test-drivers/vidtv/vidtv_ts.h  | 13 -------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index c9e059bfb6eb..3f962cc78278 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -132,17 +132,9 @@ struct vidtv_psi_table_pat {
  */
 struct vidtv_psi_table_sdt_service {
 	__be16 service_id;
-#if defined(__LITTLE_ENDIAN_BITFIELD)
 	u8 EIT_present_following:1;
 	u8 EIT_schedule:1;
 	u8 reserved:6;
-#elif defined(__BIG_ENDIAN_BITFIELD)
-	u8 reserved:6;
-	u8 EIT_schedule:1;
-	u8 EIT_present_following:1;
-#else
-#error  "Unknown bitfield ordering"
-#endif
 	__be16 bitfield; /* running_status: 3, free_ca:1, desc_loop_len:12 */
 	struct vidtv_psi_desc *descriptor;
 	struct vidtv_psi_table_sdt_service *next;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
index fab523723633..83dcc9183b45 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_ts.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
@@ -24,7 +24,6 @@
 struct vidtv_mpeg_ts_adaption {
 	u8 length;
 	struct {
-#if defined(__LITTLE_ENDIAN_BITFIELD)
 		u8 extension:1;
 		u8 private_data:1;
 		u8 splicing_point:1;
@@ -33,18 +32,6 @@ struct vidtv_mpeg_ts_adaption {
 		u8 priority:1;
 		u8 random_access:1;
 		u8 discontinued:1;
-#elif defined(__BIG_ENDIAN_BITFIELD)
-		u8 discontinued:1;
-		u8 random_access:1;
-		u8 priority:1;
-		u8 PCR:1;
-		u8 OPCR:1;
-		u8 splicing_point:1;
-		u8 private_data:1;
-		u8 extension:1;
-#else
-#error  "Unknown bitfield ordering"
-#endif
 	} __packed;
 	u8 data[];
 } __packed;
-- 
2.26.2

