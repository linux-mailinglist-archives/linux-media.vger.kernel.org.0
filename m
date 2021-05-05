Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622A4373601
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 10:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbhEEIHa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 04:07:30 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:37439 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231520AbhEEIHa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 04:07:30 -0400
X-UUID: b70482be0ff743979648f56659c1cadc-20210505
X-UUID: b70482be0ff743979648f56659c1cadc-20210505
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1695147659; Wed, 05 May 2021 16:06:30 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 16:06:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 5 May 2021 16:06:29 +0800
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
Subject: [RFC PATCH V0 2/4] media: subdev: support which in v4l2_subdev_frame_interval
Date:   Wed, 5 May 2021 16:06:24 +0800
Message-ID: <20210505080626.15432-3-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210505080626.15432-1-louis.kuo@mediatek.com>
References: <20210505080626.15432-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is to support try or set of VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL
through which parameter.
This behavior is already supported in some similar V4L2 IOCTLs such as
VIDIOC_SUBDEV_ENUM_FRAME_SIZE for the same reason.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 include/uapi/linux/v4l2-subdev.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index d6ffd5981c68..9d64feaa693b 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -120,12 +120,13 @@ struct v4l2_subdev_frame_size_enum {
  * struct v4l2_subdev_frame_interval - Pad-level frame rate
  * @pad: pad number, as reported by the media API
  * @interval: frame interval in seconds
- * @reserved: drivers and applications must zero this array
+ * @which: format type (from enum v4l2_subdev_format_whence)
  */
 struct v4l2_subdev_frame_interval {
 	__u32 pad;
 	struct v4l2_fract interval;
-	__u32 reserved[9];
+	__u32 which;
+	__u32 reserved[8];
 };
 
 /**
-- 
2.18.0

