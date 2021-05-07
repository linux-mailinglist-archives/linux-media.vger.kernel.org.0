Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540B937615F
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 09:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235659AbhEGHrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 03:47:18 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50345 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235624AbhEGHrR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 03:47:17 -0400
X-UUID: ca193e4bb80b4063b8cbe0f5190911cd-20210507
X-UUID: ca193e4bb80b4063b8cbe0f5190911cd-20210507
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 210566960; Fri, 07 May 2021 15:46:13 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 15:46:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 May 2021 15:46:11 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <matthias.bgg@gmail.com>, <hverkuil-cisco@xs4all.nl>,
        <arnd@arndb.de>, <louis.kuo@mediatek.com>,
        <sergey.senozhatsky@gmail.com>, <helen.koike@collabora.com>,
        <niklas.soderlund+renesas@ragnatech.se>, <yepeilin.cs@gmail.com>
CC:     <frederic.chen@mediatek.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [RESENT PATCH V0 3/4] media: v4l2-ctrl: Add ISP Camsys user control
Date:   Fri, 7 May 2021 15:46:03 +0800
Message-ID: <20210507074604.15079-4-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210507074604.15079-1-louis.kuo@mediatek.com>
References: <20210507074604.15079-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 6BA450B502D3B2C084112B9B12478CCC6F63A90150F67F045AFBCA2C6778DB472000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is to add V4L2_CID_USER_MTK_CAM_BASE for Mediatek ISP-only
features. For example, we have some hits from user to let driver select
internal path and resource usage.
(e.g. use multiple engine or bining the image or use higher clk and power).

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 include/uapi/linux/v4l2-controls.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d43bec5f1afd..5f664b98fc58 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -194,6 +194,10 @@ enum v4l2_colorfx {
  * We reserve 16 controls for this driver. */
 #define V4L2_CID_USER_IMX_BASE			(V4L2_CID_USER_BASE + 0x10b0)
 
+/* The base for the mediatek camsys driver controls */
+/* We reserve 48 controls for this driver. */
+#define V4L2_CID_USER_MTK_CAM_BASE		(V4L2_CID_USER_BASE + 0x10d0)
+
 /*
  * The base for the atmel isc driver controls.
  * We reserve 32 controls for this driver.
-- 
2.18.0

