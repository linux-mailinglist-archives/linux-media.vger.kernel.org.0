Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24563339EA4
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbhCMOnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:51 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:43475 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234042AbhCMOnb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:31 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UIlV5er; Sat, 13 Mar 2021 15:43:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646610; bh=xny3+yi1N0Br60VZ0WZXRQBJhH0eTTdKwkvrYNNReEs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=jBa9y+Ic/0bn6IkbLbtEXVGxz3Ktw2LQPZH6bh1JdzitNq9qlWY5qpRBkiOyg0Iv2
         7oHYRvUdlinvotHpWr/VeAqRFPRviYrir6uMXGr/1iaFScn/U1XyR1ItlG5CdShrlC
         Qhr+l7KyhtMmvOCK4YcjYE0koc0wOqnejCyZMnnjq8yNQy5kRe/m1sGOlVRdTxCJFL
         WM9vv0NYuCLwE8nZ41UvIv25DdA0EzBP2kukbmcVnwpsxH8/UgNFHo1go9StyVmlGC
         wXDSCHGpGW/og0DfkBfvJKjqcKluGvEAY8xE0+pprTCSoN8vWY6bn2KY5eXMNaPdWH
         3q4HWNBHSzMQg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 10/15] media/test-drivers: rename MPEG to CODEC
Date:   Sat, 13 Mar 2021 15:43:18 +0100
Message-Id: <20210313144323.143600-11-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIh2kl1GkjNDZ839RU89rU7JIlz/Dpg9Ug6+sf1vZ9aM0wB9FTrQXLWmvRXqms0kreacuBi5YkmdKj8bnJ7Us4Gy4qoOzqpcs4oOLhG6c8fl+fqFphUO
 1TZh4fS6XwQ55u2ThsAxwVG6eSvUBoa++FhjYoPSEXsZ9IW4dbt/w40or9IiDT8zCwxsthOKeQpMVFDUd5ev739T3PfS5/CVs4/drG+I1k3ijeMjLpPblhXY
 xUOk0qRK6etC493qrR/4UOfwre0isvld9zigxomdadiZfqxJU+X6o54Kyhh5zz+avLBwf84TfGR8iOwbDAlosIPHZfK/A+gTaafjHx68aEr8EiLULp9tnanO
 aPnx8e2oupAaJjV3ZgzBcUbkVZvpqQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Historically all codec-related data structures and defines used the
MPEG prefix. This is confusing. Rename MPEG to CODEC to make it clear
that the MPEG prefix isn't MPEG specific.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 33f1c893c1b6..b198e2d6f3d1 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1785,7 +1785,7 @@ static int vicodec_s_ctrl(struct v4l2_ctrl *ctrl)
 	const struct v4l2_ctrl_fwht_params *params;
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:
 		ctx->state.gop_size = ctrl->val;
 		return 0;
 	case V4L2_CID_FWHT_I_FRAME_QP:
@@ -1846,7 +1846,7 @@ static int vicodec_open(struct file *file)
 	ctx->dev = dev;
 	hdl = &ctx->hdl;
 	v4l2_ctrl_handler_init(hdl, 5);
-	v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops, V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+	v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops, V4L2_CID_CODEC_VIDEO_GOP_SIZE,
 			  1, 16, 1, 10);
 	v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops, V4L2_CID_FWHT_I_FRAME_QP,
 			  1, 31, 1, 20);
-- 
2.30.1

