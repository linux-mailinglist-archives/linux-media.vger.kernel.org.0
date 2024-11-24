Return-Path: <linux-media+bounces-21873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 576599D6F4F
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D7BC2815FE
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFD51D5AB6;
	Sun, 24 Nov 2024 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGvY1sjm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F591D54CD;
	Sun, 24 Nov 2024 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452608; cv=none; b=UHQXMLqjDrRPq4HOp8Fhsdnzlut2SIHnHR5Cns3k2RmibtZDq8mGAz0uBOwVDitf8tSORyHE2kyZZjBCQ+4HaZ7deWvZitSoiuaoUVVNV8aPR4USZvkTzMO9e88ZLX3K40Ajr9i7RNtw/zGKkAOcNKdox+swOP677l4XiREraUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452608; c=relaxed/simple;
	bh=EE9KCf0AlA8/AG8zFLz7NxT1ojAbGrH3rTSXHapOpUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oEzswGvFwh4R1l0QhzgLdj6nSLyAPeKOiFdY1C4Nmp+lunLJ+moPxrrxO8BsY0zcNLtcashJ1iYmYIM/9VLs7ockAa7FC7OWRawYu0Ja4tv7fm50WRhF6W88gGothZdkEsJUNb9ceM1Z7R8Jim9oqdwgYkbDJyJFl3T0ECvo6VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGvY1sjm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837C2C4CECC;
	Sun, 24 Nov 2024 12:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452608;
	bh=EE9KCf0AlA8/AG8zFLz7NxT1ojAbGrH3rTSXHapOpUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dGvY1sjmcLBafV0hidFWDymUow/EpVwKszS/twqfXs9hggjf5TVXn60FN6kVzGr9W
	 nMc4HsugCmOglME0AtlaRimyHGNw73xzLYsVMK7qsxfWrMvDHSABc2iw0MdYUIIWbB
	 fN4NtPwA2rb3TPPtgc/b6kjGEik2AvP5umYNuRT88spHABKwRrB6wLXMnetptoByyr
	 vd00QzIumrkxxv4qlvmo5fmVO5MusTV5Zt81OpBeQ7GFulPvTcIzDQg8iyCyZlCudC
	 PSmw3LuW47wxBKVsl8Hrex6oeJTu1FOGaq5dbWoWR0Dy83Yjk8OWqy7R4CCa/LccBG
	 zCWGk1i2fLM2Q==
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
	kieran.bingham@ideasonboard.com,
	dg@cowlark.com,
	quic_jjohnson@quicinc.com,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 08/23] media: uvcvideo: Add luma 16-bit interlaced pixel format
Date: Sun, 24 Nov 2024 07:48:19 -0500
Message-ID: <20241124124919.3338752-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124919.3338752-1-sashal@kernel.org>
References: <20241124124919.3338752-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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


