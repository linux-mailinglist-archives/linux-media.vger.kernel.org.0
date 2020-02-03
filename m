Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9B2A15058D
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbgBCLma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:42:30 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:33539 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726836AbgBCLm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 06:42:29 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ya7UiS6YMn7E5ya7Yi3UgF; Mon, 03 Feb 2020 12:42:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580730148; bh=dlccWD8GAlE7fPJNpjV/AkghTr7rjBVy7OI59msSyk8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=KzfS0EA6+PE744K7SnrE61v2kfXtTS5Cw21TpsSiMVowk9nB5Dp7uloSAewaKxVX6
         O5QBxxezow9NXzlZybC5zKWSeu5sMoSLGTgkmaTVNk4tV4PrgDf71jPANFAwI7sEfg
         r8eRMb4DC41oknK3uc9xxuOa8GSv3jWQIL82V8Q9C6f7YmDttytPjc2AvW+GVeStEP
         jhDYpDYIqNKsxuj+qsjPYQa1CNIeHVw9Vc2TyJQXy+ERDeFNPxKvfT3UalDX27Aqlb
         EF/MtF8xmhp3etFYxZNB1ewfUQOv7C6++T90xOeNb91w9IE+BXzc3SPz0FQmHmSl5F
         yeSxcXPdI885A==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 05/11] staging/most: rename VFL_TYPE_GRABBER to _VIDEO
Date:   Mon,  3 Feb 2020 12:41:13 +0100
Message-Id: <20200203114119.1177490-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBlm7j4ipVFsMKZB5UP8rL6vsDJFKc+XUHKEXnXCviY/Cv3BJy3qjHKnit9fCljxAR0+Nwtb7KTuELdz7IrElv6I9eyk4LfVVXdnN9FlC5bq5/fVzAvR
 Yrr5Kcanwk8MeXOeY9KeGNxQPvBo8hN/WOd626QvMYSsWqF7T36b3g22mYJklbnPhV96gL+2UjMQlPJXfuKw899ScamiGrFSUG0gnu0KbuXukDz883+L2nWM
 W3rxDYSzZiI2r06PVGrpCRwYJqVE/2xVyProgCsIxEqoQqPsQPjubBmVpLaRq9rWQNRYFq3Yt5w+Sen3ot78DA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'GRABBER' is a weird name, all other types map to the /dev
device names. Rename to 'VIDEO' to be consistent with the
other types.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Gromm <christian.gromm@microchip.com>
---
 drivers/staging/most/video/video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 10c1ef7e3a3e..2c706bcf068a 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -74,7 +74,7 @@ static int comp_vdev_open(struct file *filp)
 	struct comp_fh *fh;
 
 	switch (vdev->vfl_type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		break;
 	default:
 		return -EINVAL;
@@ -424,7 +424,7 @@ static int comp_register_videodev(struct most_video_dev *mdev)
 
 	/* Register the v4l2 device */
 	video_set_drvdata(mdev->vdev, mdev);
-	ret = video_register_device(mdev->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(mdev->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&mdev->v4l2_dev, "video_register_device failed (%d)\n",
 			 ret);
-- 
2.24.0

