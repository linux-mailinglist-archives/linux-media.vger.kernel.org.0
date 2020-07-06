Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02F3216118
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 23:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgGFVyf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 17:54:35 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:3927 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgGFVye (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 17:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=zH7tX8PPrQOiC8YQYfNApiiYgPL8wf8hdlJJn7cx1Rc=;
        b=YoIQFPcJX23K4CfU4auvTouFdT/J035h8AJE9Py+DXVx+HiFocDTHIKMR4sU/q5+ebKd
        SnjjrxkFIXmWqyK1Mmqzo3j8MrIyuxj5sMpBGhDEN2xboGAGp797rYqw8lei6CtOnvwRoN
        r6pLbjS3vK1YXJkV68S/75j5kn5RkcxVY=
Received: by filterdrecv-p3iad2-5b55dcd864-pbk2w with SMTP id filterdrecv-p3iad2-5b55dcd864-pbk2w-17-5F039D99-1F
        2020-07-06 21:54:33.351928764 +0000 UTC m=+881113.475332882
Received: from bionic.localdomain (unknown)
        by ismtpd0008p1lon1.sendgrid.net (SG) with ESMTP
        id coCc3ZK0SEeNipq-mYYnXg
        Mon, 06 Jul 2020 21:54:33.104 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 00/12] media: rkvdec: Add H.264 High 10 and 4:2:2 profile
 support
Date:   Mon, 06 Jul 2020 21:54:33 +0000 (UTC)
Message-Id: <20200706215430.22859-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701215616.30874-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hypXKcIOeSYpNSUeY?=
 =?us-ascii?Q?emRpIrZd9puwQGdPqGdlyH4xQt+Xy=2Fer833ML+Z?=
 =?us-ascii?Q?Yb0lIUcPP=2FZt=2F5FyizZgascWuYLH4=2FBkxMfldDK?=
 =?us-ascii?Q?PxuMCZ8UMswwiueYRXhpFNZWbAlHgnDyB56lvKF?=
 =?us-ascii?Q?YV2tE9fLtwWBYcgDZJZNvUte9v+h513VfDqQ7V4?=
 =?us-ascii?Q?9OF2sDnnkLuAwicWQpFow=3D=3D?=
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series contains minor fixes and adds H.264 High 10 and 4:2:2 profile
support to the Rockchip Video Decoder driver.

Patch 1 and 3 fixes two issues when decoding field encoded content. Patch 2
ensures CAPTURE buffer is same resolution or larger than OUTPUT buffer.

Patch 5 allows userspace to set OUTPUT sizeimage.

Patch 6 updates the v4l2_format helpers to consider block width and height
when calculating plane bytesperline and sizeimage.

Patch 7 adds two new pixelformats for 10-bit 4:2:0/4:2:2.

Patch 8 change to use bytesperline and buffer height to configure strides.

Patch 9 and 10 add support for limit/lock down a pixelformat based on SPS.

Patch 11 adds final bits to support H.264 High 10 and 4:2:2 profiles.

Patch 12 adds profile and level controls.

Changes in v2:
- Collect r-b tags
- SPS pic width and height in mbs validation moved to rkvdec_try_ctrl
- New patch to not override output buffer sizeimage
- Reworked pixel format validation
- Only align decoded buffer instead of changing frmsize step_width
See indivitual patch for changes.

This series depend on the "handle unsupported H.264 bitstreams" series at [1]
with a small fixup, s/p_cur/p_new/.

To fully runtime test this series you may need drm patches from [2] and
ffmpeg patches from [3], this series and drm patches is also available at [4].

[1] https://patchwork.linuxtv.org/cover/64977/
[2] https://patchwork.freedesktop.org/series/78099/
[3] https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.3-rkvdec-high-10
[4] https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-high-10-v2

Regards,
Jonas

Jonas Karlman (12):
  media: rkvdec: h264: Fix reference frame_num wrap for second field
  media: rkvdec: Ensure decoded resolution fit coded resolution
  media: rkvdec: h264: Validate and use pic width and height in mbs
  media: rkvdec: h264: Fix bit depth wrap in pps packet
  media: rkvdec: h264: Do not override output buffer sizeimage
  media: v4l2-common: Add helpers to calculate bytesperline and
    sizeimage
  media: v4l2: Add NV15 and NV20 pixel formats
  media: rkvdec: h264: Use bytesperline and buffer height to calculate
    stride
  media: rkvdec: Extract rkvdec_fill_decoded_pixfmt helper method
  media: rkvdec: Lock capture pixel format in s_ctrl and s_fmt
  media: rkvdec: h264: Support High 10 and 4:2:2 profiles
  media: rkvdec: h264: Support profile and level controls

 .../userspace-api/media/v4l/pixfmt-nv15.rst   | 101 ++++++++++++++
 .../userspace-api/media/v4l/pixfmt-nv20.rst   |  99 +++++++++++++
 .../userspace-api/media/v4l/yuv-formats.rst   |   2 +
 drivers/media/v4l2-core/v4l2-common.c         |  80 +++++------
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 drivers/staging/media/rkvdec/rkvdec-h264.c    |  45 ++++--
 drivers/staging/media/rkvdec/rkvdec.c         | 130 ++++++++++++++----
 drivers/staging/media/rkvdec/rkvdec.h         |   2 +
 include/uapi/linux/videodev2.h                |   3 +
 9 files changed, 384 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv15.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv20.rst

-- 
2.17.1

