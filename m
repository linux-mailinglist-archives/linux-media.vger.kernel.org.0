Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE76534B15
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 16:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbfFDO5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 10:57:15 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55746 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbfFDO5P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 10:57:15 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hYAqJ-0001XK-SM; Tue, 04 Jun 2019 14:55:15 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: vivid: fix incorrect assignment operation when setting video mode
Date:   Tue,  4 Jun 2019 15:55:15 +0100
Message-Id: <20190604145515.20669-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assigment of FB_VMODE_NONINTERLACE to var->vmode should be a
bit-wise or of FB_VMODE_NONINTERLACE instead of an assignment,
otherwise the previous clearing of the FB_VMODE_MASK bits of
var->vmode makes no sense and is redundant.

Addresses-Coverity: ("Unused value")
Fixes: ad4e02d5081d ("[media] vivid: add a simple framebuffer device for overlay testing")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/vivid/vivid-osd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/vivid/vivid-osd.c b/drivers/media/platform/vivid/vivid-osd.c
index 1a89593b0c86..f2e789bdf4a6 100644
--- a/drivers/media/platform/vivid/vivid-osd.c
+++ b/drivers/media/platform/vivid/vivid-osd.c
@@ -155,7 +155,7 @@ static int _vivid_fb_check_var(struct fb_var_screeninfo *var, struct vivid_dev *
 	var->nonstd = 0;
 
 	var->vmode &= ~FB_VMODE_MASK;
-	var->vmode = FB_VMODE_NONINTERLACED;
+	var->vmode |= FB_VMODE_NONINTERLACED;
 
 	/* Dummy values */
 	var->hsync_len = 24;
-- 
2.20.1

