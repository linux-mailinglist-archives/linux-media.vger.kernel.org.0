Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98155191AE5
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 21:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgCXU0B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 16:26:01 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:50009 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbgCXU0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 16:26:00 -0400
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 25711100004;
        Tue, 24 Mar 2020 20:25:57 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com
Subject: [PATCH 4/4] media: bcm2835: Fix trivial whitespace error
Date:   Tue, 24 Mar 2020 21:28:44 +0100
Message-Id: <20200324202844.1518292-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324202844.1518292-1-jacopo@jmondi.org>
References: <20200324202844.1518292-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cosmetic change only.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/bcm2835/bcm2835-unicam.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/bcm2835/bcm2835-unicam.c b/drivers/media/platform/bcm2835/bcm2835-unicam.c
index 5001976dcebc..65534a18d3d4 100644
--- a/drivers/media/platform/bcm2835/bcm2835-unicam.c
+++ b/drivers/media/platform/bcm2835/bcm2835-unicam.c
@@ -2462,7 +2462,7 @@ static int unicam_set_ctrl(struct v4l2_ctrl *ctrl)
 		/* Change the number of frames of delay we believe there
 		 * to be between updating analogue gain and it taking effect.
 		 */
-		return unicam_update_delay(unicam, 
+		return unicam_update_delay(unicam,
 			V4L2_CID_ANALOGUE_GAIN, ctrl->val);
 
 	default:
-- 
2.25.1

