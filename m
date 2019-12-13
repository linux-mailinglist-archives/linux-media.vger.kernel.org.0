Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8789B11E7E0
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 17:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbfLMQPa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 11:15:30 -0500
Received: from mailoutvs57.siol.net ([185.57.226.248]:33488 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727939AbfLMQPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 11:15:30 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 70F23520277;
        Fri, 13 Dec 2019 17:15:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id v4c9BKFbUs_S; Fri, 13 Dec 2019 17:15:27 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 287565203BE;
        Fri, 13 Dec 2019 17:15:27 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id D1E0352459E;
        Fri, 13 Dec 2019 17:15:24 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, hverkuil@xs4all.nl
Cc:     gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] media: cedrus: hevc: Add luma bit depth
Date:   Fri, 13 Dec 2019 17:15:16 +0100
Message-Id: <20191213161516.54688-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213161516.54688-1-jernej.skrabec@siol.net>
References: <20191213161516.54688-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
index 5a207f1e137c..13e58977309f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -420,6 +420,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	      VE_DEC_H265_DEC_SPS_HDR_LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE(=
sps->log2_diff_max_min_luma_coding_block_size) |
 	      VE_DEC_H265_DEC_SPS_HDR_LOG2_MIN_LUMA_CODING_BLOCK_SIZE_MINUS3(sp=
s->log2_min_luma_coding_block_size_minus3) |
 	      VE_DEC_H265_DEC_SPS_HDR_BIT_DEPTH_CHROMA_MINUS8(sps->bit_depth_ch=
roma_minus8) |
+	      VE_DEC_H265_DEC_SPS_HDR_BIT_DEPTH_LUMA_MINUS8(sps->bit_depth_luma=
_minus8) |
 	      VE_DEC_H265_DEC_SPS_HDR_CHROMA_FORMAT_IDC(sps->chroma_format_idc)=
;
=20
 	reg |=3D VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SPS_HDR_FLAG_STRONG_INTRA_SMO=
OTHING_ENABLE,
--=20
2.24.0

