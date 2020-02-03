Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA78A15058F
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbgBCLmb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:42:31 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35347 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727044AbgBCLma (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 06:42:30 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ya7UiS6YMn7E5ya7Yi3Ugj; Mon, 03 Feb 2020 12:42:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580730148; bh=yDS7R9sp8IWp2NrCq1Ate6q8JqZ3IGC5cyLGrWGjXOw=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=gmuia25IUhCAnyppw2AuPhDBwnSJps68CCV10CUltR0TBT5aCs4Sjph3jAuFc3H8+
         GCdbLOcOfI5oGndh8/JPcmivSmETtM7oljMyKCOGy0zbyI4vwuHOZPCaFZvc6a8QGG
         nMH/fNNn/RS1S/RK9A9A1niwy96uYQ1zZFFQUWcUN3e5gL1t4Fm6B2j1e25SROfy9+
         mw4oN05rt3NgIcjHHA86nM9y0Z/BrevIiTWK/0JqtJyaH2uNICuTLon+SzFG3xEAq2
         3fQcGZLk+5YM8xeIsJNNtaeJhFjGWxKIEZkb0CKLRewD8fdgKkD2yVwxUBMqkbt3bt
         3dEgBepCH7LBA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 07/11] media/common/saa7146: rename VFL_TYPE_GRABBER to _VIDEO
Date:   Mon,  3 Feb 2020 12:41:15 +0100
Message-Id: <20200203114119.1177490-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBlm7j4ipVFsMKZB5UP8rL6vsDJFKc+XUHKEXnXCviY/Cv3BJy3qjHKnit9fCljxAR0+Nwtb7KTuELdz7IrElv6I9eyk4LfVVXdnN9FlC5bq5/fVzAvR
 Yrr5Kcanwk8MeQeVh7T2woIPtqPgogRHAwlMBwWmbREFH3aFAwQyQJjUIU7BwMjtx/r2l5ziK7DQNtXN0m4BFuMoYfsD6DFVn5vopZJUqrBKh96IK4QNQTI7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'GRABBER' is a weird name, all other types map to the /dev
device names. Rename to 'VIDEO' to be consistent with the
other types.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_fops.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index aabb830e7468..5aedfdc2ac01 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -296,7 +296,7 @@ static int fops_mmap(struct file *file, struct vm_area_struct * vma)
 	int res;
 
 	switch (vdev->vfl_type) {
-	case VFL_TYPE_GRABBER: {
+	case VFL_TYPE_VIDEO: {
 		DEB_EE("V4L2_BUF_TYPE_VIDEO_CAPTURE: file:%p, vma:%p\n",
 		       file, vma);
 		q = &fh->video_q;
@@ -378,7 +378,7 @@ static ssize_t fops_read(struct file *file, char __user *data, size_t count, lof
 	int ret;
 
 	switch (vdev->vfl_type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 /*
 		DEB_EE("V4L2_BUF_TYPE_VIDEO_CAPTURE: file:%p, data:%p, count:%lun",
 		       file, data, (unsigned long)count);
@@ -409,7 +409,7 @@ static ssize_t fops_write(struct file *file, const char __user *data, size_t cou
 	int ret;
 
 	switch (vdev->vfl_type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		return -EINVAL;
 	case VFL_TYPE_VBI:
 		if (fh->dev->ext_vv_data->vbi_fops.write) {
@@ -597,7 +597,7 @@ int saa7146_register_device(struct video_device *vfd, struct saa7146_dev *dev,
 	DEB_EE("dev:%p, name:'%s', type:%d\n", dev, name, type);
 
 	vfd->fops = &video_fops;
-	if (type == VFL_TYPE_GRABBER)
+	if (type == VFL_TYPE_VIDEO)
 		vfd->ioctl_ops = &dev->ext_vv_data->vid_ops;
 	else
 		vfd->ioctl_ops = &dev->ext_vv_data->vbi_ops;
@@ -611,7 +611,7 @@ int saa7146_register_device(struct video_device *vfd, struct saa7146_dev *dev,
 	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY |
 			   V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
 	vfd->device_caps |= dev->ext_vv_data->capabilities;
-	if (type == VFL_TYPE_GRABBER)
+	if (type == VFL_TYPE_VIDEO)
 		vfd->device_caps &=
 			~(V4L2_CAP_VBI_CAPTURE | V4L2_CAP_SLICED_VBI_OUTPUT);
 	else
-- 
2.24.0

