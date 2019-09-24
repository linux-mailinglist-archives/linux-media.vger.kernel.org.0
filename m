Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3691BCA4D
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 16:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441382AbfIXOfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 10:35:37 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:53893 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2441383AbfIXOff (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 10:35:35 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2577:813c:89fd:7ccb:168c])
        by smtp-cloud9.xs4all.net with ESMTPA
        id CluaiEzGfz6EACluei89st; Tue, 24 Sep 2019 16:35:33 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv5 2/3] v4l2-dev: simplify the SDR checks
Date:   Tue, 24 Sep 2019 16:35:27 +0200
Message-Id: <20190924143528.121869-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190924143528.121869-1-hverkuil-cisco@xs4all.nl>
References: <20190924143528.121869-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJJEMRM9GvjLfqE5prqzJWaN4W/Ivijr+Noxw5q1oWCutWmlYitvj5xxy9bnRWQhVdtVcXarklE31DVGwha4EecBtWvNb7g5PezNMo8ki1jw+GsCrI+O
 jYSJ8BcgfMkF4e9ord5rORrDTwjgWbTxi29BtQoqkV/YwOScn2pjoZc+RNZTBMCXkq6j6ZprPFWzHRvgl6kwrqr+V/fYl84vaqNIUJl6Dojb3S0OThGTfk10
 Um7oxlgJNGbFQfm9455qIwH9H+G0nelJM/db7bXHaaT3sCYTPOpXYgaJmUqK3Sb4VzYWIUFxDAyvD+064TxD1aF2IKlPZ2RkvDzyNJ/r4P71eOyDY8EeDtvm
 kP3Ms5U6NtuEWXj4X03FjnYcdPkJTiTRUTb22Clc6acETt4w1drtcO9ynLqYMwRFiG0fdafs
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In determine_valid_ioctls() we can use SET_VALID_IOCTL to enable
ioctls for SDR, simplifying the code.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index db1e3d5e0a44..14266a2acbcc 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -677,24 +677,16 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_G_SLICED_VBI_CAP, vidioc_g_sliced_vbi_cap);
 	} else if (is_sdr && is_rx) {
 		/* SDR receiver specific ioctls */
-		if (ops->vidioc_enum_fmt_sdr_cap)
-			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
-		if (ops->vidioc_g_fmt_sdr_cap)
-			set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
-		if (ops->vidioc_s_fmt_sdr_cap)
-			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
-		if (ops->vidioc_try_fmt_sdr_cap)
-			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_sdr_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_sdr_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_sdr_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_sdr_cap);
 	} else if (is_sdr && is_tx) {
 		/* SDR transmitter specific ioctls */
-		if (ops->vidioc_enum_fmt_sdr_out)
-			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
-		if (ops->vidioc_g_fmt_sdr_out)
-			set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
-		if (ops->vidioc_s_fmt_sdr_out)
-			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
-		if (ops->vidioc_try_fmt_sdr_out)
-			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_sdr_out);
+		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_sdr_out);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_sdr_out);
+		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_sdr_out);
 	}
 
 	if (is_vid || is_vbi || is_sdr || is_tch || is_meta) {
-- 
2.23.0.rc1

