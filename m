Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50710327DD3
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 13:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234349AbhCAMDv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 07:03:51 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:49131 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233966AbhCAMDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 07:03:47 -0500
X-IronPort-AV: E=Sophos;i="5.81,215,1610377200"; 
   d="scan'208";a="73495399"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Mar 2021 21:02:19 +0900
Received: from localhost.localdomain (unknown [172.29.52.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DF49340065CB;
        Mon,  1 Mar 2021 21:02:16 +0900 (JST)
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
Subject: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
Date:   Mon,  1 Mar 2021 12:02:08 +0000
Message-Id: <20210301120208.6707-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210301120208.6707-1-biju.das.jz@bp.renesas.com>
References: <20210301120208.6707-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RZ/G2L SoC has no UIF. This patch fixes null pointer access, when UIF
module is not used.

Fixes: 5e824f989e6e8("media: v4l: vsp1: Integrate DISCOM in display pipeline")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/platform/vsp1/vsp1_drm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index f6d2f47a4058..06f74d410973 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -462,9 +462,9 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
 	 * make sure it is present in the pipeline's list of entities if it
 	 * wasn't already.
 	 */
-	if (!use_uif) {
+	if (drm_pipe->uif && !use_uif) {
 		drm_pipe->uif->pipe = NULL;
-	} else if (!drm_pipe->uif->pipe) {
+	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {
 		drm_pipe->uif->pipe = pipe;
 		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
 	}
-- 
2.17.1

