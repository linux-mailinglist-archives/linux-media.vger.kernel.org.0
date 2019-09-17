Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7E59B4F65
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 15:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbfIQNgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 09:36:53 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:56487 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728292AbfIQNgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 09:36:52 -0400
Received: from test-nl.fritz.box ([80.101.105.217])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ADexixpvVV17OADf1iLHks; Tue, 17 Sep 2019 15:36:51 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4 2/3] v4l2-dev: simplify the SDR checks
Date:   Tue, 17 Sep 2019 15:36:46 +0200
Message-Id: <20190917133647.17533-3-hverkuil-cisco@xs4all.nl>
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

In determine_valid_ioctls() we can use SET_VALID_IOCTL to enable
ioctls for SDR, simplifying the code.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 27b93280d342..c7132eb72071 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -657,24 +657,16 @@ static void determine_valid_ioctls(struct video_device *vdev)
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
 	} else if (is_meta && is_rx) {
 		/* metadata capture specific ioctls */
 		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_meta_cap);
-- 
2.20.1

