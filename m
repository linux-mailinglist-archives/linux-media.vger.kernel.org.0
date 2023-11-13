Return-Path: <linux-media+bounces-204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6867E9A25
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DF8BB20837
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C8E1CA85;
	Mon, 13 Nov 2023 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BBD1C6A2
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AB3C433C9;
	Mon, 13 Nov 2023 10:22:12 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/8] libmedia_dev: support v4l-audio
Date: Mon, 13 Nov 2023 11:18:45 +0100
Message-ID: <45d2bae97fa5a317cfe35cf4e156fc141fef01d9.1699870530.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
References: <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detect v4l-audioX devices.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/libmedia_dev/get_media_devices.c | 4 ++++
 utils/libmedia_dev/get_media_devices.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/utils/libmedia_dev/get_media_devices.c b/utils/libmedia_dev/get_media_devices.c
index 21920867..51635acf 100644
--- a/utils/libmedia_dev/get_media_devices.c
+++ b/utils/libmedia_dev/get_media_devices.c
@@ -226,6 +226,8 @@ static int add_v4l_class(struct media_device_entry *md)
 		md->type = MEDIA_V4L_RADIO;
 	else if (strstr(md->node, "v4l-touch"))
 		md->type = MEDIA_V4L_TOUCH;
+	else if (strstr(md->node, "v4l-audio"))
+		md->type = MEDIA_V4L_AUDIO;
 	else if (strstr(md->node, "v4l-subdev"))
 		md->type = MEDIA_V4L_SUBDEV;
 
@@ -379,6 +381,8 @@ const char *media_device_type(enum device_type type)
 		return "swradio";
 	case MEDIA_V4L_TOUCH:
 		return "v4l-touch";
+	case MEDIA_V4L_AUDIO:
+		return "v4l-audio";
 	case MEDIA_V4L_SUBDEV:
 		return "v4l subdevice";
 
diff --git a/utils/libmedia_dev/get_media_devices.h b/utils/libmedia_dev/get_media_devices.h
index 1a62c54e..235a8c4a 100644
--- a/utils/libmedia_dev/get_media_devices.h
+++ b/utils/libmedia_dev/get_media_devices.h
@@ -37,6 +37,7 @@ enum device_type {
 	MEDIA_V4L_RADIO,
 	MEDIA_V4L_SWRADIO,
 	MEDIA_V4L_TOUCH,
+	MEDIA_V4L_AUDIO,
 	MEDIA_V4L_SUBDEV,
 
 	MEDIA_DVB_VIDEO = 100,
-- 
2.42.0


