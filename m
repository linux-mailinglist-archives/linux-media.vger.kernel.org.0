Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD5AD6E2207
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjDNL1t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbjDNL1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:27:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E2E10F2
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:27:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 75CCE646ED
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 11:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52795C433D2;
        Fri, 14 Apr 2023 11:27:46 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 02/18] common/saa7146: fix VFL direction for vbi output
Date:   Fri, 14 Apr 2023 13:27:26 +0200
Message-Id: <20230414112742.27749-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
References: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VBI output device didn't have VFL_DIR_TX set, so this didn't work
anymore since the V4L2 core thought that it was a capture device instead.

Fix this. Also drop invalid capabilities for the VBI output device.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_fops.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index 08c8e73cef2c..90de44315304 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -589,12 +589,16 @@ int saa7146_register_device(struct video_device *vfd, struct saa7146_dev *dev,
 	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE |
 			   V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
 	vfd->device_caps |= dev->ext_vv_data->capabilities;
-	if (type == VFL_TYPE_VIDEO)
+	if (type == VFL_TYPE_VIDEO) {
 		vfd->device_caps &=
 			~(V4L2_CAP_VBI_CAPTURE | V4L2_CAP_SLICED_VBI_OUTPUT);
-	else
-		vfd->device_caps &=
-			~(V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_AUDIO);
+	} else if (vfd->device_caps & V4L2_CAP_SLICED_VBI_OUTPUT) {
+		vfd->vfl_dir = VFL_DIR_TX;
+		vfd->device_caps &= ~(V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				      V4L2_CAP_AUDIO | V4L2_CAP_TUNER);
+	} else {
+		vfd->device_caps &= ~V4L2_CAP_VIDEO_CAPTURE;
+	}
 	video_set_drvdata(vfd, dev);
 
 	err = video_register_device(vfd, type, -1);
-- 
2.39.2

