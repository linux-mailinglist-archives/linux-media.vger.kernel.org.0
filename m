Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7E347A369
	for <lists+linux-media@lfdr.de>; Mon, 20 Dec 2021 03:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237140AbhLTCDO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Dec 2021 21:03:14 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:64907 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237009AbhLTCDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Dec 2021 21:03:13 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1BK1uUFn075901;
        Mon, 20 Dec 2021 09:56:30 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 20 Dec
 2021 10:01:47 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <hverkuil-cisco@xs4all.nl>, <sakari.ailus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <eajames@linux.ibm.com>,
        <mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
        <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 2/4] media: v4l2-ctrls: Reserve controls for ASPEED
Date:   Mon, 20 Dec 2021 10:01:41 +0800
Message-ID: <20211220020143.1216-3-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220020143.1216-1-jammy_huang@aspeedtech.com>
References: <20211220020143.1216-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BK1uUFn075901
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reserve controls for ASPEED video family. Aspeed video engine contains a
few features which improve video quality, reduce amount of compressed
data, and etc. Hence, 16 controls are reserved for these aspeed
proprietary features.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
v7:
  - no update
v6:
  - no update
v5:
  - no update
v4:
  - new
---
 include/uapi/linux/v4l2-controls.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a2669b79b294..e7c425a6fa9f 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -192,6 +192,11 @@ enum v4l2_colorfx {
  * We reserve 16 controls for this driver. */
 #define V4L2_CID_USER_IMX_BASE			(V4L2_CID_USER_BASE + 0x10b0)
 
+/* The base for the aspeed driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_ASPEED_BASE		(V4L2_CID_USER_BASE + 0x10c0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.25.1

