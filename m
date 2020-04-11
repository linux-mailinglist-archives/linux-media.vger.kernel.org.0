Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B67C1A52C3
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2020 18:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgDKQGN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Apr 2020 12:06:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59566 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgDKQGN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Apr 2020 12:06:13 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 55A232A1235
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v4 2/6] media: staging: rkisp1: cap: fix value written to uv swap register in selfpath
Date:   Sat, 11 Apr 2020 18:05:58 +0200
Message-Id: <20200411160602.14637-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411160602.14637-1-dafna.hirschfeld@collabora.com>
References: <20200411160602.14637-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The value RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP should be
set to the register instead of masking with ~BIT(1)

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 8ce1d25d4c6f..5d0e489505f0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -423,8 +423,8 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
 	if (cap->pix.cfg->uv_swap) {
 		u32 reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
 
-		rkisp1_write(rkisp1, reg & ~BIT(1),
-			     RKISP1_CIF_MI_XTD_FORMAT_CTRL);
+		reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
+		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
 	}
 
 	rkisp1_mi_config_ctrl(cap);
-- 
2.20.1

