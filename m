Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADCAE3381
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 15:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502353AbfJXNJU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 09:09:20 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:42252 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730867AbfJXNJT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 09:09:19 -0400
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id HR9H2100S5USYZQ06R9HnV; Thu, 24 Oct 2019 15:09:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNcrd-00067F-Dq; Thu, 24 Oct 2019 15:09:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNcrd-0004Hy-Bf; Thu, 24 Oct 2019 15:09:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: fdp1: Fix R-Car M3-N naming in debug message
Date:   Thu, 24 Oct 2019 15:09:16 +0200
Message-Id: <20191024130916.16444-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The official name is "R-Car M3-N", not "R-Car M3N".

Fixes: 4e8c120de9268fc2 ("media: fdp1: Support M3N and E3 platforms")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/rcar_fdp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index cb93a13e1777a53e..97bed45360f088d0 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -2369,7 +2369,7 @@ static int fdp1_probe(struct platform_device *pdev)
 		dprintk(fdp1, "FDP1 Version R-Car H3\n");
 		break;
 	case FD1_IP_M3N:
-		dprintk(fdp1, "FDP1 Version R-Car M3N\n");
+		dprintk(fdp1, "FDP1 Version R-Car M3-N\n");
 		break;
 	case FD1_IP_E3:
 		dprintk(fdp1, "FDP1 Version R-Car E3\n");
-- 
2.17.1

