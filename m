Return-Path: <linux-media+bounces-31770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33903AAAE5D
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C53C1A85C33
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341BF36F897;
	Mon,  5 May 2025 22:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyFuK95+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA75C2BD929;
	Mon,  5 May 2025 22:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485225; cv=none; b=GFBh1tXdQlPPiX1kHJk1v955ghaGEib9LATB3bPL8R5zrqbvUE9a4qvc4JnchnHgoQDLt1qKBM0yMYJCK/RHihKymonSRRYtCKxrMpS8yEuhIcLsIh6de3y3yew5A9aien1tB5QWCUVhYVSoneeKN2Zh7XvYxURipYto3FqKT9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485225; c=relaxed/simple;
	bh=Ub6PdLgiefo3FBM8ruVdwmPBjmudDho0/TLuszB7rsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g0SCjoqnRqZEimuHumV9qWVYcF14sSYBtvb/TG/kyc1LAOGTjF4bXG7AbkkmZXgNShCJLYtVj8y5XIYIR2YE7utXKubr3rugAiIlL58pp3+AQLsmVwLyA8LKhZ3fduABx6aNduagG+wccaox06d9myn+hA+MlgBtlBjsRihtiXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyFuK95+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1A0C4CEE4;
	Mon,  5 May 2025 22:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485224;
	bh=Ub6PdLgiefo3FBM8ruVdwmPBjmudDho0/TLuszB7rsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iyFuK95+f+wl46eII72V0JKya7MxI1NFAdnHd0JIaU3oU4ecUl1FkGfDejh4f/RDH
	 kFUSXdl9DPkTmQcDzEcP5gwxocf+DSx0k1sl4DPF/nZu4b+NRJGhdMsrslx7H4lWjL
	 ES/FBC1ip32FQpU3QlYJ2IsaDEyrvrepBsAdM4qtdTnbf/TKisfFeMa7IFemjndRkh
	 EADgMvCsde1b0ImfroBtSQnphEwcHQr90Ed7CROlNhK4v9PpG29oS8AThI7TGJgCg1
	 Bn+XC7zcJOVNtp681jpUnFP1hQS5mB4OmKvaA01cZLC01wgMBO73r6oqYss7Sx4dgA
	 sEnNVteRTr4fA==
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
Subject: [PATCH AUTOSEL 6.12 220/486] media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
Date: Mon,  5 May 2025 18:34:56 -0400
Message-Id: <20250505223922.2682012-220-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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


