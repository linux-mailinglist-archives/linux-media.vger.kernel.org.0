Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4DEA17DD22
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgCIKOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:54 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36465 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgCIKOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:51 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003mN-63; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001lk-MG; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v12 03/19] media: v4l: link dt-bindings and uapi
Date:   Mon,  9 Mar 2020 11:14:12 +0100
Message-Id: <20200309101428.15267-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since we expose the definition to the dt-bindings we need to keep those
definitions in sync. To address this the patch adds a simple cross
reference to the dt-bindings.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changelog:

v11:
- new patch since the split https://patchwork.linuxtv.org/patch/58491/

v2-v10:
- nothing
---
 include/uapi/linux/videodev2.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5f9357dcb060..f48e47e230c3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1242,6 +1242,10 @@ struct v4l2_selection {
 
 typedef __u64 v4l2_std_id;
 
+/*
+ * Attention: Keep the V4L2_STD_* bit definitions in sync with
+ * include/dt-bindings/display/sdtv-standards.h SDTV_STD_* bit definitions.
+ */
 /* one bit for each */
 #define V4L2_STD_PAL_B          ((v4l2_std_id)0x00000001)
 #define V4L2_STD_PAL_B1         ((v4l2_std_id)0x00000002)
-- 
2.20.1

