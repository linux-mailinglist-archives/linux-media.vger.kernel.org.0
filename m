Return-Path: <linux-media+bounces-3813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E68830903
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 16:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B234A288541
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 15:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DED21371;
	Wed, 17 Jan 2024 15:02:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05EC20B35
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503763; cv=none; b=PjBrxPz50+5tlPJX3kBZ/F+WqMoKN5vh4rD6+hK7Kiii1juT2Al1wCVZjf7vVxJIiMSssGwwlq27fZgCrv2W10LMJcB72z1MP0AX6LF99of1ETmHkol80yxUji6QpzSRqzWBQ41mpDfMGAYxx1IA9zCgG77WLUp8Cic+53+HXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503763; c=relaxed/simple;
	bh=LrGiV2mdGsMPCAdXVZozUjPusVyFIfH5TlLORvgYBNc=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding; b=EmiC9jTep8TJiEfj53Tt3t+BpIC8EcwkARmzUv34rPy7JxtaAmR1tjVw+ypJuD+BzFksW+uWditXQF5Bri5UBqKC89eJCLt9FO3eHyDxn5Qdz6x4fPR6zyjfzmd6EY+9imJ/0HBY5zw6l6iaQd0NA8UxRyhnV6CDq+5CxHDYLHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37BDC433C7;
	Wed, 17 Jan 2024 15:02:42 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 04/10] libmedia_dev: support v4l-audio
Date: Wed, 17 Jan 2024 16:02:12 +0100
Message-ID: <a1544a011a801bc07007a632d07e0868dec0cbeb.1705503477.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
References: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
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


