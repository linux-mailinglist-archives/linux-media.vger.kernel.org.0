Return-Path: <linux-media+bounces-23105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B9C9EBB71
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 22:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2917285494
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 21:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5FC230246;
	Tue, 10 Dec 2024 21:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Rsv6JGFb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010C922FAE4;
	Tue, 10 Dec 2024 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733864589; cv=none; b=oO5sHoG5wvaRBLgnT+L+wJKGLMcdfWs84aaKgxfcDIp+eBqr7rnV8v4ti0ysh/Z2yEkbB+pkfKmSBC1lyPs/Yqr4wrzZ41zIM6snesarCI04L9ZEHq6BCzKURQHfUmlrj6HfK/Kelw5fM4loNNucW5tpByBIImlBAHCzLaGJ2BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733864589; c=relaxed/simple;
	bh=6tzx2irdLbp6pBi4vyG6Y04JV4zmpppZc7d+CGdzfTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qccg3NfxlGibuKxvMGXrih20Vm947EZX5LYZa5AuYZsyCxATWwU6IUd5HlrxpdMPioc/ehIwBtkgUqVOUbbJZ7DjEb2OaJpjPDSk3XB95gc4IiA7Z64BvtYhKS0K6ETenoz2y5azw4OhVn2baXGzSCVog1sEnXY8XDp8qfyeQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Rsv6JGFb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733864586;
	bh=6tzx2irdLbp6pBi4vyG6Y04JV4zmpppZc7d+CGdzfTQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Rsv6JGFbDdP9VkD+io1+VqdFRzts1HzNB+ezIhDvnJGY2F3SkaHQXuDV29POgBRcT
	 pk7PAw4loDnoZ9Hidc1i7GtWf4vy5xxkEvCIS3OttQF2qSEoLhT8jenDNv0vFyfJ6R
	 aAIUNoyaVaKErCO5F9R/YI08PEmvVmnbyQzlMOOqAx26G93H/kFle+oxelkjn+WOFg
	 LvnY1I5ZCet3qnpmiXA+hyjwYg9OdhrmgcRjR0BvM8477KaM3fi0vSu/CB/8/ZYI87
	 bh2H6O++KpTpWqJVlx4pfVt7ErAJi759Z7IRsfa7VBFlW11v9kvBSBAeldDJSCxj9h
	 nFgiW3iUc+kKQ==
Received: from nicolas-tpx395.lan (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A4CF17E3803;
	Tue, 10 Dec 2024 22:03:05 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: visl: Fix ERANGE error when setting enums controls
Date: Tue, 10 Dec 2024 16:02:53 -0500
Message-ID: <20241210210255.1583747-1-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The visl driver supports both frame and slice mode, with and without
start-code. Though, the range and default for these enum control was
not set, which limits currently its use to the enums with value 0.
This fixes setting decoder mode and start code controls for both
H.264 and HEVC codec.

Fixes: 0c078e310b6d ("media: visl: add virtual stateless decoder driver")
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/test-drivers/visl/visl-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/test-drivers/visl/visl-core.c b/drivers/media/test-drivers/visl/visl-core.c
index c46464bcaf2e..93239391f2cf 100644
--- a/drivers/media/test-drivers/visl/visl-core.c
+++ b/drivers/media/test-drivers/visl/visl-core.c
@@ -161,9 +161,15 @@ static const struct visl_ctrl_desc visl_h264_ctrl_descs[] = {
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
+		.cfg.min = V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
+		.cfg.max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+		.cfg.def = V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_H264_START_CODE,
+		.cfg.min = V4L2_STATELESS_H264_START_CODE_NONE,
+		.cfg.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
+		.cfg.def = V4L2_STATELESS_H264_START_CODE_NONE,
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_H264_SLICE_PARAMS,
@@ -198,9 +204,15 @@ static const struct visl_ctrl_desc visl_hevc_ctrl_descs[] = {
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
+		.cfg.min = V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
+		.cfg.max = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+		.cfg.def = V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_START_CODE,
+		.cfg.min = V4L2_STATELESS_HEVC_START_CODE_NONE,
+		.cfg.max = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+		.cfg.def = V4L2_STATELESS_HEVC_START_CODE_NONE,
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS,

base-commit: ecf2b43018da9579842c774b7f35dbe11b5c38dd
-- 
2.47.1


