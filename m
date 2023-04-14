Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A080F6E2219
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjDNL2H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjDNL2C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:28:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11457D94
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:28:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B223864702
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 11:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B805C4339B;
        Fri, 14 Apr 2023 11:28:00 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 16/18] media: mxb: allow tuner/input/audio ioctls for vbi
Date:   Fri, 14 Apr 2023 13:27:40 +0200
Message-Id: <20230414112742.27749-17-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
References: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

