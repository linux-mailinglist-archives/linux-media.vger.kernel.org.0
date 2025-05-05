Return-Path: <linux-media+bounces-31782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E732DAAABE7
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4D357A4BA3
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74415383E1D;
	Mon,  5 May 2025 23:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEmLlIc8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F1F2EE4AE;
	Mon,  5 May 2025 23:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486583; cv=none; b=oIWiky8NYxsBoS5dOAWxlFp94n1nySL2zo9k5gEoclKlU7Po4LNZuzwyYtUBWB96IWdpmWrdRwm6wLVO+y+Z8kxe+Ag2xKBRl3gVZGpNb3wsJp7pljRzBDG3hH4Xf+oXRW0fY6/MH9c+rdF8dwDFkUbKSNzrk01SJ5bIwSCyKgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486583; c=relaxed/simple;
	bh=+espPTqWdtGY5fu055kbMiWdUdSJbhnfuL4I/7MRnYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BvsBSPBJNlHTkwfsWJa1yT3vlxOI/VBAqFky6I+6zuukRw9KbinjM1FOCzijRc5+Yv5SwPAoUdjJmKUxg8xu6pNa9dCIuSZ7K7fE17mXkYCE/yVgvgveoFe9lbQGKOuDiQVGHp/S7O7ncda2qs9q9paUWEkC0e870PEZdhLUfvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEmLlIc8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9BFC4CEEE;
	Mon,  5 May 2025 23:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486582;
	bh=+espPTqWdtGY5fu055kbMiWdUdSJbhnfuL4I/7MRnYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tEmLlIc8RYnX1Uejslz4pwpAtf5ocZrHUa8Y3JmKuZiyfHgAfx4b9fKtp9omrr+oj
	 MLtc7M8kyAH6U/FCQ5DM/lq5N4iHYdbNqQvLQu9V6kc5JGHnWLwc2C7F31D6vDQb2r
	 rFHkZaxxCARWaMPYh1rRyXbW+QiWXHvl8SY3+y8gYvxDhufcYOkR7pEDuHeVw8ODqH
	 tQvkWqpKkQyI/w4dI6C4j+ChxWrztkazHGawfpraLFpQEi72Tg7HY1gV3lCnBHtdMu
	 nQOpte38fDg0Jbikz7wy1qy8Xn2VdTtf0xA8nWSNbS0eh2t5JwkHjLnd0dUHzFC/Fg
	 K6C0nkJ5q5Khg==
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
Subject: [PATCH AUTOSEL 6.1 101/212] media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
Date: Mon,  5 May 2025 19:04:33 -0400
Message-Id: <20250505230624.2692522-101-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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
index bd4677a6e653a..0aaa4fce61dae 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -36,6 +36,12 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 	unsigned int size;
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


