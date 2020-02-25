Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49C7616C318
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 14:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbgBYN7X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 08:59:23 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38053 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729411AbgBYN7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 08:59:22 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1j6ak4-0005iC-QS; Tue, 25 Feb 2020 14:59:20 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Marian Cichy <m.cichy@pengutronix.de>
Subject: [PATCH v4l-utils] v4l2-compliance: fix assert on only read/write-only controls
Date:   Tue, 25 Feb 2020 14:59:17 +0100
Message-Id: <20200225135917.25466-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the driver only contains read-only (or write-only) controls,
total_vec is empty. In that case return immediately instead of
trying to access total_vec[0].

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 utils/v4l2-compliance/v4l2-test-controls.cpp | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 735bc5a13c09..2a3f64e8bbec 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -749,6 +749,8 @@ int testExtendedControls(struct node *node)
 			multiple_classes = true;
 		total_vec.push_back(ctrl);
 	}
+	if (total_vec.empty())
+		return 0;
 
 	ctrls.count = total_vec.size();
 	ctrls.controls = &total_vec[0];
-- 
2.20.1

