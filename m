Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510A1444184
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 13:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbhKCMbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 08:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbhKCMbL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 08:31:11 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF601C061714
        for <linux-media@vger.kernel.org>; Wed,  3 Nov 2021 05:28:34 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iFNXmWlFt030KiFNYmUbfG; Wed, 03 Nov 2021 13:28:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635942512; bh=qkwueg2i/aRf+Gme8VO6MU2H73SYOkJv13HBSDoSbFA=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BFFs8Qe+Rr7VoRWdWcGYXbyqpioxfW/DJrC5YVgf3W+tiIc1Jow33Ja1XX2CfIHUO
         SxZMMTnU3Wf9xX9GVnwd1Of6uezrcWcCxdAxpAHMeLDjaOq++pe3wF6EohVdwat8jm
         sSbgkJ8Xe9V/ZPqrGUgyjtJwWyCxvxPua/6CNvdIHqYBuzndqTgnMjB1e/Pmmbo9cB
         nJf4R1YMDUSF4s1Eaode0qqxf+sjf+xricbo3nJR7HP3bG0y29fHUHuk3GHWJeWUye
         43oqjmhKSO6dGUcgEtCBAZPkr2xR02XXfYcYfsdB9TkrHyRG/frzHyIxpagIZrmhk7
         xkHUs0xDB8x5Q==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-ioctl.c: readbuffers depends on V4L2_CAP_READWRITE
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <4f89b139-13b7-eee6-9662-996626b778b0@xs4all.nl>
Date:   Wed, 3 Nov 2021 13:28:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC+b2JayTR/fX0sidOPZ/nQMrqrd6lZBot5HXGmuLDdjJq59P5U/TTJRuy31ddR5L07+pwk7xLkv3y+waxfhHuE9aUD+6YUFu8SsT0XmGd+5JebDv3pE
 nUpLCCOnnsHulMR+Q8I9OQ+v1+jcuP/IrgU3q4Sb1EKel6rQyW8qn2AphJyJmu/Mlx8nKJs2Kel3I+hGI7XNh1yY19o0WrdFbiOiYwu5jQWKW3M1KNBeJofK
 EUyuILa3o5yvZImUWmt4zFRKdKL4fuxulnp18Qls1nUgvnuod0GE5MoHqoSe2gLp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If V4L2_CAP_READWRITE is not set, then readbuffers must be set to 0,
otherwise v4l2-compliance will complain.

A note on the Fixes tag below: this patch does not really fix that commit,
but it can be applied from that commit onwards. For older code there is no
guarantee that device_caps is set, so even though this patch would apply,
it will not work reliably.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 049e684f2de9 (media: v4l2-dev: fix WARN_ON(!vdev->device_caps))
Cc: <stable@vger.kernel.org>
---
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 31d0109ce5a8..69b74d0e8a90 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2090,6 +2090,7 @@ static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
 static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
+	struct video_device *vfd = video_devdata(file);
 	struct v4l2_streamparm *p = arg;
 	v4l2_std_id std;
 	int ret = check_fmt(file, p->type);
@@ -2101,7 +2102,8 @@ static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
 	if (p->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
 	    p->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
 		return -EINVAL;
-	p->parm.capture.readbuffers = 2;
+	if (vfd->device_caps & V4L2_CAP_READWRITE)
+		p->parm.capture.readbuffers = 2;
 	ret = ops->vidioc_g_std(file, fh, &std);
 	if (ret == 0)
 		v4l2_video_std_frame_period(std, &p->parm.capture.timeperframe);
