Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F31DF2DAA
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 12:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733207AbfKGLp1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 06:45:27 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40929 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfKGLp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 06:45:26 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iSgE9-0001DL-Gn
        for linux-media@vger.kernel.org; Thu, 07 Nov 2019 12:45:25 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] v4l2-compliance: encoders should not support capture side G_PARM
Date:   Thu,  7 Nov 2019 12:45:19 +0100
Message-Id: <20191107114519.16624-1-p.zabel@pengutronix.de>
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

Encoders that implement output side G/S_PARM and ENUM_FRAMEINTERVALS
to allow setting the nominal bitstream frame rate cause compliance
failures:

		fail: v4l2-test-formats.cpp(1330): ret && node->has_frmintervals
	test VIDIOC_G/S_PARM: FAIL

because v4l2-compliance is missing capture side G/S_PARM. Skip the
frameinterval check and make sure that capture side G_PARM fails.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 utils/v4l2-compliance/v4l2-test-formats.cpp | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index b87e59c8be69..7336a823a269 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -1283,6 +1283,11 @@ static int testParmType(struct node *node, unsigned type)
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		if (IS_ENCODER(node)) {
+			fail_on_test(ret == 0);
+			break;
+		}
+		/* fallthrough */
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		if (type && (node->g_caps() & buftype2cap[type]))
-- 
2.20.1

