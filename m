Return-Path: <linux-media+bounces-21887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 042AF9D6FB0
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D472B162221
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2541E00A6;
	Sun, 24 Nov 2024 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVFZ+NpR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0211DFE3D;
	Sun, 24 Nov 2024 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452818; cv=none; b=XgovFrs+RG1q5Eo6VuoO4euMxMFgi9ifYMaeQ/2QkUXSiKk6SAjXjcZu6Gg+hVSfn+ZQk2ss5GPoIcRCWHiQqsgLrS1EKe+fLcLVFOxPWt/cId5nlSHaF6dirZda81uFYSRJCjBYMltwKABdXxcxZTY2v7Pd2fOsxsNFuoE4D3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452818; c=relaxed/simple;
	bh=H4XOj3p6UbCVFQq6KHKUPeocakoyp+gDFGMxJXrgK8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3rXF9yDEsZNwDf0uNDMNwM7tlM1tvtTbKu1+uWPktGV0VxjtW+tA1UMNLfh+iqXwfL/xJZN/PS++Qf++z62O6TEGqgr15KrVNNw2dnmNat+5eKwSFsCpPbFv6qEmbGnwkv9cczuc/p4jQ3UG5sgwDzxRF0m8yScWg4pvgaqwSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVFZ+NpR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503D2C4CECC;
	Sun, 24 Nov 2024 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452817;
	bh=H4XOj3p6UbCVFQq6KHKUPeocakoyp+gDFGMxJXrgK8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CVFZ+NpRWy/0IkvUlYogbxrGJZO8xWxNcb7hcAoG25pnwmFZ5/hhHQw7qbkoPiMS3
	 2AGkQS+TQUITdyxaV7iVocbNjVNCgTTOjaiYmB5+lEKFIT3Wg49cikF0GZ6xojLV7x
	 eI5tjS76svWAXohJkICkCPm45dsAckaTAie+uxUuZjkCo2vLn0c/byi1c83DvvA+8M
	 A0zKXxl1D1NRujvr15+bFbaHGYIqNzaoMQ/4GrTgrGwdziOKFzWJ3ojF7n4DBdN9lv
	 4KnIEUxbBL0C4HPfD4bFSTg+YZdBWh2mCjjJg7hMaISiXrDw2TLwJithjuM4Pj/fHd
	 7u2XcR4vKOkIg==
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
	dg@cowlark.com,
	ribalda@chromium.org,
	quic_jjohnson@quicinc.com,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 04/16] media: uvcvideo: Add luma 16-bit interlaced pixel format
Date: Sun, 24 Nov 2024 07:52:22 -0500
Message-ID: <20241124125311.3340223-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125311.3340223-1-sashal@kernel.org>
References: <20241124125311.3340223-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
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
index 9c0ba7a6c185b..246fb6da5903e 100644
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


