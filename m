Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE64411559E
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 17:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbfLFQkW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 11:40:22 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:10287 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726325AbfLFQkV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Dec 2019 11:40:21 -0500
X-Halon-ID: 14b553ad-1847-11ea-8e92-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5865.dip0.t-ipconnect.de [84.172.88.101])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 14b553ad-1847-11ea-8e92-005056917f90;
        Fri, 06 Dec 2019 17:40:16 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] rcar-vin: Limit NV12 availability to supported VIN channels only
Date:   Fri,  6 Dec 2019 17:39:32 +0100
Message-Id: <20191206163932.3295865-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191206163932.3295865-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191206163932.3295865-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When adding support for NV12 it was overlooked that the pixel format is
only supported on some VIN channels. Fix this by adding a check to only
accept NV12 on the supported channels 0, 1, 4, 5, 8, 9, 12 and 13.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 7f6c40f1f264515d..9f556d2bee593c73 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -79,7 +79,11 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
 			return NULL;
 		break;
 	case V4L2_PIX_FMT_NV12:
-		if (!vin->info->nv12)
+		/*
+		 * If NV12 is supported it's only supported on channels 0, 1, 4,
+		 * 5, 8, 9, 12 and 13.
+		 */
+		if (!vin->info->nv12 || !(BIT(vin->id) & 0x3333))
 			return NULL;
 		break;
 	default:
-- 
2.24.0

