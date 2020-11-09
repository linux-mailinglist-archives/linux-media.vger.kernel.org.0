Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8911D2AC3FD
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 19:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgKISiI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 13:38:08 -0500
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:40198 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729491AbgKISiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 13:38:05 -0500
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id EA159F41592; Mon,  9 Nov 2020 17:23:10 +0100 (CET)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: [RESEND PATCH 2/2] media: hantro: Use VP8 lengths defined in uapi
Date:   Mon,  9 Nov 2020 17:22:44 +0100
Message-Id: <20201109162244.16531-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109162244.16531-1-linkmauve@linkmauve.fr>
References: <20201109162244.16531-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 drivers/staging/media/hantro/hantro_vp8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_vp8.c b/drivers/staging/media/hantro/hantro_vp8.c
index 0e02d147b189..91ec9a05645b 100644
--- a/drivers/staging/media/hantro/hantro_vp8.c
+++ b/drivers/staging/media/hantro/hantro_vp8.c
@@ -23,11 +23,11 @@ struct vp8_prob_tbl_packed {
 	u8 padding1;
 
 	/* mv prob */
-	u8 prob_mv_context[2][19];
+	u8 prob_mv_context[2][V4L2_VP8_MV_PROB_CNT];
 	u8 padding2[2];
 
 	/* coeff probs */
-	u8 prob_coeffs[4][8][3][11];
+	u8 prob_coeffs[4][8][3][V4L2_VP8_COEFF_PROB_CNT];
 	u8 padding3[96];
 };
 
-- 
2.29.2

