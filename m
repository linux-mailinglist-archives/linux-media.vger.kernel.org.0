Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E08AC1A178D
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 23:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgDGV5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 17:57:32 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:10415 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726380AbgDGV5c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Apr 2020 17:57:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586296651; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9iFqM9zTj++rDFA03fAusevw7VnMwBpRPBogkohm+gQ=; b=SuMGsmCHJ9JLHZZCsN+g+VPW5KuOeJOX4nHzmnfch3IKX96/faST6M8wU4RUtXF2dbti2niU
 /Fgg878hdcKsR7OmoznGLqoge7PUlQZURx5UazDnrms/+YFs3bkUoz63+Aas4ThidAKDG1Te
 fSZ9BwMye93oikmGMzOb0B8uPk4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8cf746.7f1ccb48eab0-smtp-out-n03;
 Tue, 07 Apr 2020 21:57:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 15333C44788; Tue,  7 Apr 2020 21:57:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from majja-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: majja)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D294DC433F2;
        Tue,  7 Apr 2020 21:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D294DC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=majja@codeaurora.org
From:   Maheshwar Ajja <majja@codeaurora.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ezequiel@collabora.com, paul.kocialkowski@bootlin.com,
        p.zabel@pengutronix.de, boris.brezillon@collabora.com,
        posciak@chromium.org, jonas@kwiboo.se, linfish@google.com
Cc:     Maheshwar Ajja <majja@codeaurora.org>
Subject: [PATCH] media: uapi: h264: Add new profile and levels
Date:   Tue,  7 Apr 2020 14:55:26 -0700
Message-Id: <1586296526-9451-1-git-send-email-majja@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add H264 profile "Contrained High" and H264 levels "5.2",
"6.0", "6.1" and "6.2".

Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index d4fc5f2..c02b9a8 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -756,6 +756,14 @@ enum v4l2_mpeg_video_h264_level -
       - Level 5.0
     * - ``V4L2_MPEG_VIDEO_H264_LEVEL_5_1``
       - Level 5.1
+    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_5_2``
+      - Level 5.2
+    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_6_0``
+      - Level 6.0
+    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_6_1``
+      - Level 6.1
+    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_6_2``
+      - Level 6.2
 
 
 
@@ -868,6 +876,8 @@ enum v4l2_mpeg_video_h264_profile -
       - Stereo High profile
     * - ``V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH``
       - Multiview High profile
+    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH``
+      - Constrained High profile
 
 
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
