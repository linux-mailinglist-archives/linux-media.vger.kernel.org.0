Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36E36C6CAF
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 16:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbjCWPyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 11:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbjCWPyQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 11:54:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF5722031
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 08:54:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BF120B82193
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 15:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC42C4339B;
        Thu, 23 Mar 2023 15:54:00 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 16/19] media: common: saa7146: add support for missing .vidioc_try_fmt_vbi_cap
Date:   Thu, 23 Mar 2023 16:53:40 +0100
Message-Id: <20230323155343.2399473-17-hverkuil-cisco@xs4all.nl>
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

Support for VIDIOC_TRY_FMT for the vbi device was missing.
Add it.

This fixes a V4L2 compliance issue.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index af7a74cb91c2..314f44305586 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -517,6 +517,7 @@ const struct v4l2_ioctl_ops saa7146_video_ioctl_ops = {
 const struct v4l2_ioctl_ops saa7146_vbi_ioctl_ops = {
 	.vidioc_querycap             = vidioc_querycap,
 	.vidioc_g_fmt_vbi_cap        = vidioc_g_fmt_vbi_cap,
+	.vidioc_try_fmt_vbi_cap      = vidioc_g_fmt_vbi_cap,
 	.vidioc_s_fmt_vbi_cap        = vidioc_g_fmt_vbi_cap,
 	.vidioc_g_std                = vidioc_g_std,
 	.vidioc_s_std                = vidioc_s_std,
-- 
2.39.2

