Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7BE327DE6
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 13:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhCAMJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 07:09:37 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:29814 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232954AbhCAMJ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 07:09:28 -0500
X-IronPort-AV: E=Sophos;i="5.81,215,1610377200"; 
   d="scan'208";a="73742490"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Mar 2021 21:08:36 +0900
Received: from localhost.localdomain (unknown [172.29.52.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B00F40062A0;
        Mon,  1 Mar 2021 21:08:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] media: v4l: vsp1: Fix bru null pointer access
Date:   Mon,  1 Mar 2021 12:08:27 +0000
Message-Id: <20210301120828.6945-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RZ/G2L SoC has only BRS. This patch fixes null pointer access,when only
BRS is enabled.

Fixes: cbb7fa49c7466("media: v4l: vsp1: Rename BRU to BRx")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/platform/vsp1/vsp1_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index 86d5e3f4b1ff..f6d2f47a4058 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -245,7 +245,7 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_device *vsp1,
 		brx = &vsp1->bru->entity;
 	else if (pipe->brx && !drm_pipe->force_brx_release)
 		brx = pipe->brx;
-	else if (!vsp1->bru->entity.pipe)
+	else if (vsp1_feature(vsp1, VSP1_HAS_BRU) && !vsp1->bru->entity.pipe)
 		brx = &vsp1->bru->entity;
 	else
 		brx = &vsp1->brs->entity;
-- 
2.17.1

