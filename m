Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8F91A201B
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 13:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbgDHLsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 07:48:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51226 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728552AbgDHLsi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 07:48:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8811C29683E
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 1/6] media: staging: rkisp1: cap: cleanup in mainpath config for uv swap format
Date:   Wed,  8 Apr 2020 13:48:17 +0200
Message-Id: <20200408114822.27360-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408114822.27360-1-dafna.hirschfeld@collabora.com>
References: <20200408114822.27360-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The value RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP equals BIT(0),
Therefore when writing it to the register there is no need to mask
it first with ~BIT(0).

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index fbf62399fe3d..8ce1d25d4c6f 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -386,8 +386,7 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 	if (cap->pix.cfg->uv_swap) {
 		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
 
-		reg = (reg & ~BIT(0)) |
-		      RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
+		reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
 		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
 	}
 
-- 
2.20.1

