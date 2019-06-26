Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95DA4565E3
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 11:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfFZJsY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 05:48:24 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:38705 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726131AbfFZJsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 05:48:24 -0400
Received: from [IPv6:2001:420:44c1:2579:95e:6256:39de:52a6] ([IPv6:2001:420:44c1:2579:95e:6256:39de:52a6])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g4XKhWFWlSfvXg4XNhK1Mz; Wed, 26 Jun 2019 11:48:22 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-ioctl: call v4l_pix_format_touch() for TRY_FMT
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Florian Echtler <floe@butterbrot.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Nick Dyer <nick.dyer@itdev.co.uk>
Message-ID: <95437142-2935-0d3f-073e-333dab4e17c0@xs4all.nl>
Date:   Wed, 26 Jun 2019 11:48:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFyoGzJEgEZd/47G76IOnkofGjuWcC7se4APHNvvHvtDgVMyqmMPLdxRuiUgoe6iB0YfKOEpGbwRg723viFg+UXV4wsTcO04V2miqnZ+oLs3UStP34H/
 9OZjrfjWZgCnypgUN7l50eNvGIR1EMmaMcm0XdzbbRxD6gjpMIjBZqrgR1sq2iZFdGHGpQxUivICYssaqM0AnbI7MZrEIpmVOlitl07Ot7vv0mtxlgH4SIES
 cW2EjwgNiV0dMBAJgRQDt/FEEU9+IdTonMZdlMPcSFV4z3OHb0VMr3RR+LUBYtOT9S7j0C0qTUh+x2t2Mc6OAUkYpsly1S3iSw0kHwbJ9RHDQr8+S9q3vD4U
 T9+NgyyOCtyilf4WyNaRrDtu/XGmRVFp4xhQWUbmnCCGY8zoB3aI8oGhcqi/mkfRmvxtIt2iF1G4qN7so40y5mEQlFXnWg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function v4l_pix_format_touch() is called for S_FMT to set
v4l2_pix_format fields to default values for a v4l-touch device,
but it wasn't called for TRY_FMT. Add this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b1f4b991dba6..c5c8c8ab7cf6 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1661,6 +1661,8 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 		ret = ops->vidioc_try_fmt_vid_cap(file, fh, arg);
 		/* just in case the driver zeroed it again */
 		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+		if (vfd->vfl_type == VFL_TYPE_TOUCH)
+			v4l_pix_format_touch(&p->fmt.pix);
 		return ret;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (unlikely(!ops->vidioc_try_fmt_vid_cap_mplane))
