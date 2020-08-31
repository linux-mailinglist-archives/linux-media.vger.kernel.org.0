Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A36257AE2
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 15:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgHaNwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 09:52:24 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:37845 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727939AbgHaNwN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 09:52:13 -0400
Received: from nexussix.ar.arcelik (unknown [84.44.14.226])
        (Authenticated sender: cengiz@kernel.wtf)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3594D240010;
        Mon, 31 Aug 2020 13:52:06 +0000 (UTC)
From:   Cengiz Can <cengiz@kernel.wtf>
To:     dan.carpenter@oracle.com
Cc:     andriy.shevchenko@linux.intel.com, cengiz@kernel.wtf,
        devel@driverdev.osuosl.org, gustavoars@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com
Subject: [PATCH v2] staging: atomisp: Remove unnecessary 'fallthrough'
Date:   Mon, 31 Aug 2020 16:51:04 +0300
Message-Id: <20200831135103.93399-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831134021.GV8299@kadam>
References: <20200831134021.GV8299@kadam>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

commit df561f6688fe ("treewide: Use fallthrough pseudo-keyword") from
Gustavo A. R. Silva replaced and standardized /* fallthrough */ comments
with 'fallthrough' pseudo-keyword.

However, in one of the switch-case statements, Coverity Static Analyzer
throws a warning that 'fallthrough' is unreachable due to the adjacent
'return false' statement. (Coverity ID CID 1466511)

In order to fix the unreachable code warning, remove unnecessary
fallthrough keyword.

Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 1b2b2c68025b..feb26c221e96 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -711,7 +711,6 @@ static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
 			return true;
 
 		return false;
-		fallthrough;
 	case ATOMISP_RUN_MODE_VIDEO:
 		if (!asd->continuous_mode->val) {
 			if (pipe_id == IA_CSS_PIPE_ID_VIDEO ||
-- 
2.28.0

