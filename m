Return-Path: <linux-media+bounces-21880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFE79D6FBC
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAB49B30CA5
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68C51DE2C6;
	Sun, 24 Nov 2024 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPKezzJs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170371B21BE;
	Sun, 24 Nov 2024 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452713; cv=none; b=XkSHOJvJbjq8qmZFhgB3ZIK+i+T447DE3jWqMJAcg0c0seYlGHjfD8QiIowwCzvyA2JHiiIEPHYBB7OpL1p34h3abkk8kSNlcFuOWoJQAkOTVAZ+yokVp8FRUupsKMKRjHgU8xli4y1RY9tV2Rpw19aGRiV37gIdAgt0Gww3auE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452713; c=relaxed/simple;
	bh=EE9KCf0AlA8/AG8zFLz7NxT1ojAbGrH3rTSXHapOpUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kSPfWQNXntxN9P4ZWcOhg5akuGhxstHt0H7npFhv4gL4ttELyHVBtKqyn9YM7az/nf9Dbw3mJDZlf3B+KVfyT0LIJDzSFv3/MaSgR5IQ9wSFnoaXeBQEFpKlSmc0ZK6jNItYPzBb96FqCJC0MuotpaaL1w0V1RMh4+bVy6bI7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPKezzJs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1654BC4CED1;
	Sun, 24 Nov 2024 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452712;
	bh=EE9KCf0AlA8/AG8zFLz7NxT1ojAbGrH3rTSXHapOpUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BPKezzJsvyaQjHc++v74hvrXm3Yzr7YO/aMVhNRsp+Hbd4L1TjNtDVMKTcLS85n19
	 MBr6C1WuvmgG6dhJ/qYt3vsnzkmzP3+7ANctbmBmrNmYDo7bvdzrd7JKsIjz98nJJF
	 kxHxJKKRFpLuzRPvnISdYd3z0PvS9cQwzmaNQtGgsMqZCIcEe/PEj37wL4U5ZkXXFF
	 D3oW3zkEPJghKsNJ3zNg2IEEd1G5N+JBHvjt73SmbCpOKMs/21DygleFOpTcdmdLPj
	 dd95wTZzUQ5+7xXUp6ZjqMrROPrbtLOsrHdQV3+BSGbXqUvVWnDQjVHZivw2vePYiI
	 77yFVtGYlYXdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil@xs4all.nl,
	ribalda@chromium.org,
	quic_jjohnson@quicinc.com,
	dg@cowlark.com,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 06/20] media: uvcvideo: Add luma 16-bit interlaced pixel format
Date: Sun, 24 Nov 2024 07:50:36 -0500
Message-ID: <20241124125124.3339648-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125124.3339648-1-sashal@kernel.org>
References: <20241124125124.3339648-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Dmitry Perchanov <dmitry.perchanov@intel.com>

[ Upstream commit 55b834873e800a5809787ce6aedcb70ee49a596f ]

The formats added by this patch are:

        UVC_GUID_FORMAT_Y16I

Interlaced lumina format primary use in RealSense Depth cameras with
stereo stream for left and right image sensors.

Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/a717a912035b0a0f82b2f35719cca0c5269e995f.camel@intel.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/common/uvc.c | 4 ++++
 include/linux/usb/uvc.h    | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
index c54c2268fee61..027498d374642 100644
--- a/drivers/media/common/uvc.c
+++ b/drivers/media/common/uvc.c
@@ -120,6 +120,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_Y12I,
 		.fcc		= V4L2_PIX_FMT_Y12I,
 	},
+	{
+		.guid		= UVC_GUID_FORMAT_Y16I,
+		.fcc		= V4L2_PIX_FMT_Y16I,
+	},
 	{
 		.guid		= UVC_GUID_FORMAT_Z16,
 		.fcc		= V4L2_PIX_FMT_Z16,
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index 88d96095bcb16..1c16be20c9666 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -118,6 +118,9 @@
 #define UVC_GUID_FORMAT_Y12I \
 	{ 'Y',  '1',  '2',  'I', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y16I \
+	{ 'Y',  '1',  '6',  'I', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 #define UVC_GUID_FORMAT_Z16 \
 	{ 'Z',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-- 
2.43.0


