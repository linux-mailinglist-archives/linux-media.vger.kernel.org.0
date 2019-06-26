Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2C45638F
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfFZHo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:29 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:39193 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727027AbfFZHo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:29 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bUhhHot; Wed, 26 Jun 2019 09:44:28 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH 09/16] bdisp: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:14 +0200
Message-Id: <20190626074421.38739-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAMxzN4FUyPeZTym9v7gc0ycLbc7FiT7ilC6KdR/vAZsnW1y5GPq1P9y+j+zRAZI5JfoUdgzCy7wAJHBCrMWWq2CxD0K8657n1s8OscrvzuZi7obxnHF
 0UXPVB1NsmhM63YiZyqDNyUTGrsrXUkgA5hUUoSgIXUf3BlewD6xgmxfB0dZPbqgj7p0RcK/Rhoc7ifO+06IdgvAr5mKRU1Img6h0+lOWL0FzUHaOShWTdJ9
 d8gleJkQVH2PuZTH88lV3g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
index 79f7db1a9d18..e90f1ba30574 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
@@ -692,11 +692,6 @@ static int bdisp_querycap(struct file *file, void *fh,
 	strscpy(cap->card, bdisp->pdev->name, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s%d",
 		 BDISP_NAME, bdisp->id);
-
-	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M;
-
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -1059,6 +1054,7 @@ static int bdisp_register_device(struct bdisp_dev *bdisp)
 	bdisp->vdev.lock        = &bdisp->lock;
 	bdisp->vdev.vfl_dir     = VFL_DIR_M2M;
 	bdisp->vdev.v4l2_dev    = &bdisp->v4l2_dev;
+	bdisp->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M;
 	snprintf(bdisp->vdev.name, sizeof(bdisp->vdev.name), "%s.%d",
 		 BDISP_NAME, bdisp->id);
 
-- 
2.20.1

