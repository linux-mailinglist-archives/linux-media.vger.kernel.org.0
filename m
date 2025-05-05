Return-Path: <linux-media+bounces-31776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 662D0AAAAE3
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 03:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48EBC188A541
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810842ECE31;
	Mon,  5 May 2025 23:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3izLVbC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6295388C54;
	Mon,  5 May 2025 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486052; cv=none; b=i3lCxs/6hi+1xiAdMwZReX77+kHwEFVO6dPpz06t6UygwmxqBFe48EKH/hUONqmX/Vwb98BD+ar8Jnei+feVcFbIyWS675J6ZexvUgbKHDaQkM0JLpUvil2WxC2hm/B4NCvCXcgK/wUgy6hN/KPKcpBFHMIZdtU96CZl2ARpRc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486052; c=relaxed/simple;
	bh=Ub6PdLgiefo3FBM8ruVdwmPBjmudDho0/TLuszB7rsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K+ljm09wFh0ALNHo+Pp0Sl8bTxaAI0sYzNuu/41I/6YjqcT43QIf0p5G/+Um2o+nhTi4QqZBUB0etkD+2LsgBto6Kt9gnyvB//r1TUZ0cAFGsB8FmT9WJUp7dFW8LXLgDjl0KbW25o/4W+yTtGtkZIlMMaimxapFiS29PzmVyRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3izLVbC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8350FC4CEEE;
	Mon,  5 May 2025 23:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486051;
	bh=Ub6PdLgiefo3FBM8ruVdwmPBjmudDho0/TLuszB7rsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d3izLVbCkjqGXTtJWsA1W7sl57HnNOWITrsw7sftZ944XvmDgikfu3sd2AjQuviOQ
	 M7mdYLM5UwjxrAcRcB9Wu4R3riwrBK6DyX6kfjJ4CstPMRefDKvakMaGY3hSEnHEp2
	 JG8/2BlAdhIHAEJ/DY9bn7K7oKT1EScS72ksW08TeeY/juIgdUCiDId75LCjeSUB+p
	 s7qG/wklYs2qwy5puqSLWziLpkgV4zoG/vkVGq6vw8ftvOzE0OcIoYIf+cdePJl8+8
	 zvSDTjEizeNtaPlN6+vyMhEg0xhkWEMJvLUrfy2FxM0xyFwmvbtbSC1FUqzMPqXMPZ
	 sBD93f9Yq/EhA==
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
Subject: [PATCH AUTOSEL 6.6 128/294] media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
Date: Mon,  5 May 2025 18:53:48 -0400
Message-Id: <20250505225634.2688578-128-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 7bcd706281daf..cb7d9fb589fca 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -106,6 +106,12 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
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


