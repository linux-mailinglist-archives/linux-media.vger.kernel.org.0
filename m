Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF7ECB36C2
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 11:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731551AbfIPJAw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 05:00:52 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:36625 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729814AbfIPJAv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 05:00:51 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9msJiUOo68SjN9msLiWV3r; Mon, 16 Sep 2019 11:00:49 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] videodev2.h: add macros to print a fourcc
Date:   Mon, 16 Sep 2019 11:00:46 +0200
Message-Id: <20190916090047.122078-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916090047.122078-1-hverkuil-cisco@xs4all.nl>
References: <20190916090047.122078-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBKUNAtJA02TwDJGfI0gzwqKrt/XUx/l9vp2yjnt4oQxuIpKKbR08s9ZYvRK53ZHWZSJPU/M7BQmuTVaupZuIZ0JlQGjlukv38iBLTXh5GrPi6Zq4sAP
 LlfV61JkZEqHXtQvFvB1v1OJcQn1H5dmjIDFbGjDepaT5fkjbi/J9QO5r36wAli7W2cUCYdKxM3IrmhSikdvhAxM0ZQYUG+i1F7JQGYpoR/hqsa/UMd0c1zq
 dM49qc124C2/6jdtKbcpDT4nHbavKzqbMRs09r6I8mfKxc/eCko4fSwUd7bErXx2NbkDrCPzs/oN0ATRCXPs8YakMVocBvjJ1g5VoUF7vp306XXEghogeJBJ
 QsMaZGKp
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new macros V4L2_FOURCC_CONV and V4L2_FOURCC_ARGS for use
in code that prints a fourcc. These macros can be used in both
kernel and userspace.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Suggested-by: Sakari Ailus <sakari.ailus@iki.fi>
---
 include/uapi/linux/videodev2.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 530638dffd93..7a34eb93437e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -82,6 +82,19 @@
 	((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
 #define v4l2_fourcc_be(a, b, c, d)	(v4l2_fourcc(a, b, c, d) | (1U << 31))
 
+/*
+ * Helper macros to print a fourcc in a standard format. E.g.:
+ *
+ * printf("fourcc is " V4L2_FOURCC_CONV "\n", V4L2_FOURCC_ARGS(fourcc));
+ *
+ * Note that V4L2_FOURCC_ARGS reuses fourcc, so this can't be an
+ * expression with side-effects.
+ */
+#define V4L2_FOURCC_CONV "%c%c%c%c%s"
+#define V4L2_FOURCC_ARGS(fourcc) \
+	(fourcc) & 0x7f, ((fourcc) >> 8) & 0x7f, ((fourcc) >> 16) & 0x7f, \
+	((fourcc) >> 24) & 0x7f, ((fourcc) & (1U << 31) ? "-BE" : "")
+
 /*
  *	E N U M S
  */
-- 
2.20.1

