Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8E5284A72
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 12:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgJFKoS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 06:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgJFKoR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 06:44:17 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DA2C061755
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 03:44:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6969F28B999
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 3/6] coda: Clarify device registered log
Date:   Tue,  6 Oct 2020 07:44:11 -0300
Message-Id: <20201006104414.67984-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201006104414.67984-1-ezequiel@collabora.com>
References: <20201006104414.67984-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of printing just the device type, let's use
the device name, which makes the message more useful.

With this commit, the messages shown when the driver
is registered are:

coda 2040000.vpu: Firmware code revision: 570363
coda 2040000.vpu: Initialized CODA960.
coda 2040000.vpu: Firmware version: 3.1.1
coda 2040000.vpu: coda-jpeg-encoder registered as video0
coda 2040000.vpu: coda-jpeg-decoder registered as video1
coda 2040000.vpu: coda-video-encoder registered as video2
coda 2040000.vpu: coda-video-decoder registered as video3

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/coda/coda-common.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 87a2c706f747..a72ea4bb37d7 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -172,7 +172,7 @@ struct coda_video_device {
 };
 
 static const struct coda_video_device coda_bit_encoder = {
-	.name = "coda-encoder",
+	.name = "coda-video-encoder",
 	.type = CODA_INST_ENCODER,
 	.ops = &coda_bit_encode_ops,
 	.src_formats = {
@@ -202,7 +202,7 @@ static const struct coda_video_device coda_bit_jpeg_encoder = {
 };
 
 static const struct coda_video_device coda_bit_decoder = {
-	.name = "coda-decoder",
+	.name = "coda-video-decoder",
 	.type = CODA_INST_DECODER,
 	.ops = &coda_bit_decode_ops,
 	.src_formats = {
@@ -2851,12 +2851,12 @@ static int coda_hw_init(struct coda_dev *dev)
 static int coda_register_device(struct coda_dev *dev, int i)
 {
 	struct video_device *vfd = &dev->vfd[i];
-	enum coda_inst_type type;
+	const char *name;
 	int ret;
 
 	if (i >= dev->devtype->num_vdevs)
 		return -EINVAL;
-	type = dev->devtype->vdevs[i]->type;
+	name = dev->devtype->vdevs[i]->name;
 
 	strscpy(vfd->name, dev->devtype->vdevs[i]->name, sizeof(vfd->name));
 	vfd->fops	= &coda_fops;
@@ -2876,8 +2876,7 @@ static int coda_register_device(struct coda_dev *dev, int i)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (!ret)
 		v4l2_info(&dev->v4l2_dev, "%s registered as %s\n",
-			  type == CODA_INST_ENCODER ? "encoder" : "decoder",
-			  video_device_node_name(vfd));
+			  name, video_device_node_name(vfd));
 	return ret;
 }
 
-- 
2.27.0

