Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D483619C958
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 21:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389638AbgDBTE3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 15:04:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46044 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388843AbgDBTE3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 15:04:29 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:20a2:167a:3b62:26be])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 68294294DA2;
        Thu,  2 Apr 2020 20:04:27 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 1/5] media: staging: rkisp1: cap: cleanup in mainpath config for uv swap format
Date:   Thu,  2 Apr 2020 21:04:15 +0200
Message-Id: <20200402190419.15155-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
References: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The value RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP equals BIT(0),
Therefore when writing it to the register there is no need to mask
it first with ~BIT(0).

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 45d237a77ca4..5700d7be2819 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -432,8 +432,7 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 	if (cap->pix.cfg->uv_swap) {
 		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
 
-		reg = (reg & ~BIT(0)) |
-		      RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
+		reg = reg | RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
 		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
 	}
 
-- 
2.17.1

