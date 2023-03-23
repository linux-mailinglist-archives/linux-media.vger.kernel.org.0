Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25F506C6CB0
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 16:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbjCWPyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 11:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232215AbjCWPyQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 11:54:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F8C22101
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 08:54:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A95E6B821A3
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 15:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5273C433EF;
        Thu, 23 Mar 2023 15:54:01 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 17/19] media: mxb: allow tuner/input/audio ioctls for vbi
Date:   Thu, 23 Mar 2023 16:53:41 +0100
Message-Id: <20230323155343.2399473-18-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
References: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vbi stream comes from the same video input as the video
stream. So all the related ioctls to that are just as valid
for the vbi stream.

Add these.

This fixes a V4L2 compliance issue.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/saa7146/mxb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index 3b0c475c7ab4..8f1843baa732 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -706,6 +706,17 @@ static int mxb_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_data
 	vv_data.vid_ops.vidioc_g_register = vidioc_g_register;
 	vv_data.vid_ops.vidioc_s_register = vidioc_s_register;
 #endif
+	vv_data.vbi_ops.vidioc_enum_input = vidioc_enum_input;
+	vv_data.vbi_ops.vidioc_g_input = vidioc_g_input;
+	vv_data.vbi_ops.vidioc_s_input = vidioc_s_input;
+	vv_data.vbi_ops.vidioc_querystd = vidioc_querystd;
+	vv_data.vbi_ops.vidioc_g_tuner = vidioc_g_tuner;
+	vv_data.vbi_ops.vidioc_s_tuner = vidioc_s_tuner;
+	vv_data.vbi_ops.vidioc_g_frequency = vidioc_g_frequency;
+	vv_data.vbi_ops.vidioc_s_frequency = vidioc_s_frequency;
+	vv_data.vbi_ops.vidioc_enumaudio = vidioc_enumaudio;
+	vv_data.vbi_ops.vidioc_g_audio = vidioc_g_audio;
+	vv_data.vbi_ops.vidioc_s_audio = vidioc_s_audio;
 	if (saa7146_register_device(&mxb->video_dev, dev, "mxb", VFL_TYPE_VIDEO)) {
 		ERR("cannot register capture v4l2 device. skipping.\n");
 		saa7146_vv_release(dev);
-- 
2.39.2

