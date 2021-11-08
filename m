Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1D344A251
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 02:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241713AbhKIBRg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 20:17:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:40458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237415AbhKIBMT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 20:12:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D293E61A08;
        Tue,  9 Nov 2021 01:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636419908;
        bh=SJCeg+ceJ5loPiJYCQQ9sna2PGT7CQ760HDRBYPiSqQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P0xwWcMWrHXUmqJ+vYfJaW2wU/2Siutzae5so1e5xwkURpJO65WyApeMlekASGIRm
         Rll6oT14Pz6btxzqbBk7saNp3J9N84hBTx/kO4/ckfhX3WdVUXMOl2Idc2qzBDkNXE
         BwY7dMhu/y9XDDQlv5MKTOFr3T86visqKRPSh9xVQNOOZviDXdzYzNlMlpjI4g9EpN
         EP4JudY6vhEqzEgakBjo34hvaxqw15QoEQ85a8WAP+NYEOxw2y4AVqrHckkO2PWdX9
         9DjvVFmdD8T1N1Ei/lno+Wl9l3m+ormZY/ek6sUIGKu0NEILy9ZdJPP9bQ6LvN6BkN
         PPE6t/3JadkTw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 24/74] media: uvcvideo: Set unique vdev name based in type
Date:   Mon,  8 Nov 2021 12:48:51 -0500
Message-Id: <20211108174942.1189927-24-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174942.1189927-1-sashal@kernel.org>
References: <20211108174942.1189927-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit e3f60e7e1a2b451f538f9926763432249bcf39c4 ]

All the entities must have a unique name. We can have a descriptive and
unique name by appending the function and the entity->id.

This is even resilent to multi chain devices.

Fixes v4l2-compliance:
Media Controller ioctls:
                fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
        test MEDIA_IOC_G_TOPOLOGY: FAIL
                fail: v4l2-test-media.cpp(394): num_data_links != num_links
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 40ca1d4e03483..378cfc46fc195 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1972,6 +1972,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 			      const struct v4l2_file_operations *fops,
 			      const struct v4l2_ioctl_ops *ioctl_ops)
 {
+	const char *name;
 	int ret;
 
 	/* Initialize the video buffers queue. */
@@ -2000,16 +2001,20 @@ int uvc_register_video_device(struct uvc_device *dev,
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	default:
 		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+		name = "Video Capture";
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 		vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
+		name = "Video Output";
 		break;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+		name = "Metadata";
 		break;
 	}
 
-	strscpy(vdev->name, dev->name, sizeof(vdev->name));
+	snprintf(vdev->name, sizeof(vdev->name), "%s %u", name,
+		 stream->header.bTerminalLink);
 
 	/*
 	 * Set the driver data before calling video_register_device, otherwise
-- 
2.33.0

