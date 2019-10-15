Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE05D7413
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 12:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731631AbfJOK6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 06:58:54 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:34719 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726054AbfJOK6y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 06:58:54 -0400
X-IronPort-AV: E=Sophos;i="5.67,299,1566831600"; 
   d="scan'208";a="28927871"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2019 19:58:52 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8327240065DE;
        Tue, 15 Oct 2019 19:58:50 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 4/4] media: rcar-csi2: Enable support for R8A774B1
Date:   Tue, 15 Oct 2019 11:57:58 +0100
Message-Id: <1571137078-28922-5-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
References: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the MIPI CSI-2 driver support for RZ/G2N(R8A774B1) SoC.
The CSI-2 module of RZ/G2N is similar to R-Car M3-N.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index c14af1b..faa9fb2 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -1082,6 +1082,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
 		.data = &rcar_csi2_info_r8a7796,
 	},
 	{
+		.compatible = "renesas,r8a774b1-csi2",
+		.data = &rcar_csi2_info_r8a77965,
+	},
+	{
 		.compatible = "renesas,r8a774c0-csi2",
 		.data = &rcar_csi2_info_r8a77990,
 	},
-- 
2.7.4

