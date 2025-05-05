Return-Path: <linux-media+bounces-31751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA86AAA40A
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D220018872C1
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9312FA130;
	Mon,  5 May 2025 22:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZAkrdFx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240C62FA11A;
	Mon,  5 May 2025 22:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483939; cv=none; b=LmLt3J9wQ9tQxzXdWK4MXh/ujvNV5VAdu6I/2hbHP8HqI0kGor00rOB2jP9fvhD4vUu2C75yoUc7Ab9q3Y+6At0mK/BOK1MJdiv0pf/06GexAIrxTrct8nqrIX4jMv0GTGMrUwmGfCxYJYvgbG6EPGfm3pwDvvF6W0MF2To8MvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483939; c=relaxed/simple;
	bh=OJ9wqeeaguHKt0CyVu45M6QZ7ddldda6eG983E4+FyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gfJq2A4zfZRdzEg5zMtfdzfK3yECAh83dd8t5u6rUjn9Poul83Zu7Je/61hwQNuo4alihf/Yxgkw5v4EndjKdRBek1s8PB9PSgkwN8FXa4pkAAb53JIyiFcXaLOCZHvTxOLgdW2o33YevKH0R8FuveVyqEifp1BROAqrlQsn9XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZAkrdFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767CFC4CEEE;
	Mon,  5 May 2025 22:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483938;
	bh=OJ9wqeeaguHKt0CyVu45M6QZ7ddldda6eG983E4+FyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pZAkrdFxaMhSVed5EBcShXvTrTcERJ1NfN2wvuxv9ttbiDJq9EiUNAAM/c6KykBFR
	 wlmiJqzLKwVaJkWvGMygVeEQJ5qaFg7XP7TgvIwTy7uik+/xxVpG+X2Xq9gfUzu2oo
	 eSHxq8PPxgePt5zPShuf1W5IbfUBjEMI/p8V7Urd0Qx+Zc28yszxX9Yvyyb4VG8L5f
	 /gQ5f8x44b20DpjrUFEZkHVto7Adgw+FBPdxAuFce+LhwGPxTqQrkcQ3cScKAJcFil
	 jfagjvWN28K+rbj/R0y/mUBJujcDDwQqO2bC0Qt4mLaUT9ro014kf6iunxgsLzj6vB
	 iFfs6tZ38baTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 279/642] media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
Date: Mon,  5 May 2025 18:08:15 -0400
Message-Id: <20250505221419.2672473-279-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 990262fdfce24d6055df9711424343d94d829e6a ]

Do not process unknown data types.

Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250203-uvc-roi-v17-15-5900a9fed613@chromium.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 93c6cdb238812..75216507cbdcf 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -108,6 +108,12 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *map;
 	int ret;
 
+	if (xmap->data_type > UVC_CTRL_DATA_TYPE_BITMASK) {
+		uvc_dbg(chain->dev, CONTROL,
+			"Unsupported UVC data type %u\n", xmap->data_type);
+		return -EINVAL;
+	}
+
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
 	if (map == NULL)
 		return -ENOMEM;
-- 
2.39.5


