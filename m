Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD1EBCA4E
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 16:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406694AbfIXOfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 10:35:37 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:60051 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2441384AbfIXOff (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 10:35:35 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2577:813c:89fd:7ccb:168c])
        by smtp-cloud9.xs4all.net with ESMTPA
        id CluaiEzGfz6EAClufi89t0; Tue, 24 Sep 2019 16:35:33 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv5 3/3] v4l2-dev: fix is_tch checks
Date:   Tue, 24 Sep 2019 16:35:28 +0200
Message-Id: <20190924143528.121869-4-hverkuil-cisco@xs4all.nl>
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

Touch devices mark too many ioctls as valid. Restrict the list of
valid ioctls for touch devices.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 14266a2acbcc..cec588b04711 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -596,8 +596,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	if (ops->vidioc_enum_freq_bands || ops->vidioc_g_tuner || ops->vidioc_g_modulator)
 		set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
 
-	if (is_vid || is_tch) {
-		/* video and touch specific ioctls */
+	if (is_vid) {
+		/* video specific ioctls */
 		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
 			       ops->vidioc_enum_fmt_vid_overlay)) ||
 		    (is_tx && ops->vidioc_enum_fmt_vid_out))
@@ -675,6 +675,19 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			       ops->vidioc_try_fmt_sliced_vbi_out)))
 			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_G_SLICED_VBI_CAP, vidioc_g_sliced_vbi_cap);
+	} else if (is_tch) {
+		/* touch specific ioctls */
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_vid_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_vid_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_vid_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_vid_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMESIZES, vidioc_enum_framesizes);
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMEINTERVALS, vidioc_enum_frameintervals);
+		SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
+		SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
+		SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
+		SET_VALID_IOCTL(ops, VIDIOC_G_PARM, vidioc_g_parm);
+		SET_VALID_IOCTL(ops, VIDIOC_S_PARM, vidioc_s_parm);
 	} else if (is_sdr && is_rx) {
 		/* SDR receiver specific ioctls */
 		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_sdr_cap);
@@ -702,8 +715,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
 	}
 
-	if (is_vid || is_vbi || is_tch || is_meta) {
-		/* ioctls valid for video, vbi, touch and metadata */
+	if (is_vid || is_vbi || is_meta) {
+		/* ioctls valid for video, vbi and metadata */
 		if (ops->vidioc_s_std)
 			set_bit(_IOC_NR(VIDIOC_ENUMSTD), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_S_STD, vidioc_s_std);
-- 
2.23.0.rc1

