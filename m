Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF2F35CA48
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 17:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243213AbhDLPo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 11:44:27 -0400
Received: from mailoutvs32.siol.net ([185.57.226.223]:38577 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S243167AbhDLPoW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 11:44:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id AAD38523A64;
        Mon, 12 Apr 2021 17:44:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id IdI5XYwZbO6v; Mon, 12 Apr 2021 17:44:01 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 3B96E5257CF;
        Mon, 12 Apr 2021 17:44:01 +0200 (CEST)
Received: from kista.localdomain (cpe-86-58-17-133.cable.triera.net [86.58.17.133])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id A1664523A64;
        Mon, 12 Apr 2021 17:44:00 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: cedrus: Fix H265 status definitions
Date:   Mon, 12 Apr 2021 17:43:49 +0200
Message-Id: <20210412154349.1989045-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some of the H265 status flags are wrong. Redefine them to corespond to
Allwinner CedarC open source userspace library. Only one of these flags
is actually used and new value also matches value used in libvdpau-sunxi
library, which is proven to be working.

Note that wrong (old) value in right circumstances (in combination with
another H265 decoding bug) causes driver lock up. With this fix decoding
is still broken (green output) but at least driver doesn't lock up.

Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
This is the sample which locks up driver:
http://jernej.libreelec.tv/videos/h265/hevc-breakage.mkv

Second bug is actually in HEVC API - dependent slice flag for slice is
missing. Similar flag in PPS exists, but that only tells if this
feature is enabled and should not be used for slice.

This will be fixed later.

 .../staging/media/sunxi/cedrus/cedrus_regs.h    | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/s=
taging/media/sunxi/cedrus/cedrus_regs.h
index 6cb1c279790f..7ab3a2b0aa10 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -443,16 +443,17 @@
 #define VE_DEC_H265_STATUS_STCD_BUSY		BIT(21)
 #define VE_DEC_H265_STATUS_WB_BUSY		BIT(20)
 #define VE_DEC_H265_STATUS_BS_DMA_BUSY		BIT(19)
-#define VE_DEC_H265_STATUS_IQIT_BUSY		BIT(18)
+#define VE_DEC_H265_STATUS_IT_BUSY		BIT(18)
 #define VE_DEC_H265_STATUS_INTER_BUSY		BIT(17)
 #define VE_DEC_H265_STATUS_MORE_DATA		BIT(16)
-#define VE_DEC_H265_STATUS_VLD_BUSY		BIT(14)
-#define VE_DEC_H265_STATUS_DEBLOCKING_BUSY	BIT(13)
-#define VE_DEC_H265_STATUS_DEBLOCKING_DRAM_BUSY	BIT(12)
-#define VE_DEC_H265_STATUS_INTRA_BUSY		BIT(11)
-#define VE_DEC_H265_STATUS_SAO_BUSY		BIT(10)
-#define VE_DEC_H265_STATUS_MVP_BUSY		BIT(9)
-#define VE_DEC_H265_STATUS_SWDEC_BUSY		BIT(8)
+#define VE_DEC_H265_STATUS_DBLK_BUSY		BIT(15)
+#define VE_DEC_H265_STATUS_IREC_BUSY		BIT(14)
+#define VE_DEC_H265_STATUS_INTRA_BUSY		BIT(13)
+#define VE_DEC_H265_STATUS_MCRI_BUSY		BIT(12)
+#define VE_DEC_H265_STATUS_IQIT_BUSY		BIT(11)
+#define VE_DEC_H265_STATUS_MVP_BUSY		BIT(10)
+#define VE_DEC_H265_STATUS_IS_BUSY		BIT(9)
+#define VE_DEC_H265_STATUS_VLD_BUSY		BIT(8)
 #define VE_DEC_H265_STATUS_OVER_TIME		BIT(3)
 #define VE_DEC_H265_STATUS_VLD_DATA_REQ		BIT(2)
 #define VE_DEC_H265_STATUS_ERROR		BIT(1)
--=20
2.31.1

