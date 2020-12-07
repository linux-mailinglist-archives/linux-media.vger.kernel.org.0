Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15D72D1995
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 20:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgLGTbx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 14:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgLGTbw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 14:31:52 -0500
Received: from faui03.informatik.uni-erlangen.de (faui03.informatik.uni-erlangen.de [IPv6:2001:638:a000:4130:131:188:30:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716F0C061749;
        Mon,  7 Dec 2020 11:31:12 -0800 (PST)
Received: from cipterm0.informatik.uni-erlangen.de (cipterm0.cip.cs.fau.de [IPv6:2001:638:a000:4130:131:188:30:90])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id DFF20240EC0;
        Mon,  7 Dec 2020 20:30:29 +0100 (CET)
Received: by cipterm0.informatik.uni-erlangen.de (Postfix, from userid 67858)
        id DCDE03280304; Mon,  7 Dec 2020 20:30:29 +0100 (CET)
From:   Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
To:     linux-kernel@vger.kernel.org
Cc:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org,
        ij72uhux@stud.informatik.uni-erlangen.de, linux-kernel@i4.cs.fau.de
Subject: [PATCH 07/12] media: atomisp: Fix funciton decleration
Date:   Mon,  7 Dec 2020 20:26:34 +0100
Message-Id: <20201207192638.15219-8-Philipp.Gerlesberger@fau.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
References: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Write return_type, function_name and parameters in one line
because lines should not end with a '(' [OPEN_ENDED_LINE]
Write open brace ’{’ on the next line to fix OPEN_BRACE Error

Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
---
 drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c b/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c
index 679ef8242574..00b54a0613bb 100644
--- a/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c
+++ b/drivers/staging/media/atomisp/pci/runtime/timer/src/timer.c
@@ -19,9 +19,8 @@
 #include "gp_timer.h" /*gp_timer_read()*/
 #include "assert_support.h"
 
-int
-ia_css_timer_get_current_tick(
-    struct ia_css_clock_tick *curr_ts) {
+int ia_css_timer_get_current_tick(struct ia_css_clock_tick *curr_ts)
+{
 	assert(curr_ts);
 	if (!curr_ts)
 	{
-- 
2.20.1

