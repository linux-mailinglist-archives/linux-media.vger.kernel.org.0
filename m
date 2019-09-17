Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A708EB4F67
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 15:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbfIQNgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 09:36:54 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:38189 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728296AbfIQNgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 09:36:53 -0400
Received: from test-nl.fritz.box ([80.101.105.217])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ADexixpvVV17OADf1iLHl0; Tue, 17 Sep 2019 15:36:51 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4 3/3] v4l2-dev: fix is_tch checks
Date:   Tue, 17 Sep 2019 15:36:47 +0200
Message-Id: <20190917133647.17533-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917133647.17533-1-hverkuil-cisco@xs4all.nl>
References: <20190917133647.17533-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLFjHL/S3/dDsbzzbdvSIj6EpMuVP+Cvx1Mprec3OGrqLkTRiInL6Vf9WxQms4SW8rleTTrx/IbnCN8s7svlqPy123KEmJU7noyeQOuyrXNEqrG8iw3+
 AHEdDHg+nHheZBB5XiExIfTJzBo8UyHNIjvjd2IWDhuyYn7mr+4Z2oJJtIE63sO8hMsQbS537e8I7F+OUmsE1vvH+D2aae3W0l4J/lI/tyCQtjGdgBu2+KCH
 3jcPFjunr9g3ilkNXHy/xSIF4Q+egyibNrMGeaDJDza6g+jNExdckao/mWPD5c4SswDvwLbNMpQ+Gjx7bWAKUoYWPjEPJdBwuFQC//lr33txec+WOgB/jtXO
 /18qFi7O
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
index c7132eb72071..fd6792cb0d57 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -590,8 +590,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	if (ops->vidioc_enum_freq_bands || ops->vidioc_g_tuner || ops->vidioc_g_modulator)
 		set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
 
-	if (is_vid || is_tch) {
-		/* video and touch specific ioctls */
+	if (is_vid) {
+		/* video specific ioctls */
 		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
 			       ops->vidioc_enum_fmt_vid_overlay)) ||
 		    (is_tx && ops->vidioc_enum_fmt_vid_out))
@@ -667,6 +667,19 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_sdr_out);
 		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_sdr_out);
 		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_sdr_out);
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
 	} else if (is_meta && is_rx) {
 		/* metadata capture specific ioctls */
 		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_meta_cap);
@@ -694,8 +707,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
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
2.20.1

