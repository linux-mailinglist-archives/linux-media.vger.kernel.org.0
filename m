Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89672364A7B
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241684AbhDSTXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:23:48 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:54543 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239503AbhDSTXr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:23:47 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3983660004;
        Mon, 19 Apr 2021 19:23:14 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 3/8] staging: media: atomisp: Remove a superfluous else clause in sh_css.c
Date:   Mon, 19 Apr 2021 15:25:57 -0400
Message-Id: <20210419192602.498815-4-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192602.498815-1-vrzh@vrzh.net>
References: <20210419192602.498815-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove a superfluous else clause in ia_css_pipe_check_format()

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 8484c83ad29f..4d4f030e0fe0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5247,11 +5247,9 @@ ia_css_pipe_check_format(struct ia_css_pipe *pipe,
 		IA_CSS_ERROR("Requested format is not supported by binary");
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
-	} else
-	{
-		IA_CSS_LEAVE_ERR_PRIVATE(0);
-		return 0;
 	}
+	IA_CSS_LEAVE_ERR_PRIVATE(0);
+	return 0;
 }
 
 static int load_video_binaries(struct ia_css_pipe *pipe)
-- 
2.31.1

