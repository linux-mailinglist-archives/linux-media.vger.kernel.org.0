Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660A06C12AE
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 14:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjCTNGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 09:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbjCTNGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 09:06:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE9A1F5EB
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 06:06:34 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1peFDc-0002Gc-HQ; Mon, 20 Mar 2023 14:06:32 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     mtr@pengutronix.de
Subject: [v4l-utils PATCH] v4l2-compliance: Add gadget. as bus_info prefix
Date:   Mon, 20 Mar 2023 14:06:32 +0100
Message-Id: <20230320130632.3091933-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The UVC gadget uses "gadget." as businfo prefix for its V4L2 OUTPUT
device. Allow it as a valid bus_info prefix.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 8aebae2ea932..830c2578134c 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -653,7 +653,8 @@ static int testCap(struct node *node)
 	    memcmp(vcap.bus_info, "parport", 7) &&
 	    memcmp(vcap.bus_info, "platform:", 9) &&
 	    memcmp(vcap.bus_info, "rmi4:", 5) &&
-	    memcmp(vcap.bus_info, "libcamera:", 10))
+	    memcmp(vcap.bus_info, "libcamera:", 10) &&
+	    memcmp(vcap.bus_info, "gadget.", 7))
 		return fail("missing bus_info prefix ('%s')\n", vcap.bus_info);
 	if (!node->media_bus_info.empty() &&
 	    node->media_bus_info != std::string(reinterpret_cast<const char *>(vcap.bus_info)))
-- 
2.30.2

