Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3266B56395
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfFZHod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:33 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:57443 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727001AbfFZHo2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:28 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bThhHoO; Wed, 26 Jun 2019 09:44:27 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 06/16] mx2_emmaprp: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:11 +0200
Message-Id: <20190626074421.38739-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfK5lngGVNa+o3sMUctkGWqBSwmYTdwh9qXbm6bcB1vfyH7RxcPDxrwCVg8cgs+jACveYg4HHrUQnKwy+MnlHag+f1uaaf99B+b+4kJd9myxOnEnMgUhc
 v/3Wvz9gnARXXwv3HmHZWFUDjFCSKmcwlamPmGmqPF7BJC/1Mq3N3o5Pq8cPHkSxzfqafaa2BAH26h6oASjgOAKCMwCrn5tS1yKx1aT+8bdv6Oy6y7ykeetU
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/mx2_emmaprp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mx2_emmaprp.c b/drivers/media/platform/mx2_emmaprp.c
index 333324c75027..a77fff122467 100644
--- a/drivers/media/platform/mx2_emmaprp.c
+++ b/drivers/media/platform/mx2_emmaprp.c
@@ -383,8 +383,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 {
 	strscpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver));
 	strscpy(cap->card, MEM2MEM_NAME, sizeof(cap->card));
-	cap->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -866,6 +864,7 @@ static const struct video_device emmaprp_videodev = {
 	.minor		= -1,
 	.release	= video_device_release,
 	.vfl_dir	= VFL_DIR_M2M,
+	.device_caps	= V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
 };
 
 static const struct v4l2_m2m_ops m2m_ops = {
-- 
2.20.1

