Return-Path: <linux-media+bounces-31785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70258AAAC9C
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 591361B66F4E
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB84839D980;
	Mon,  5 May 2025 23:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ia1eHzug"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E9D2F4781;
	Mon,  5 May 2025 23:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486946; cv=none; b=VP9WuzGWb/uvXYByMYOgprgc4LfYvllP0m8i7eMtHtwPFoIsQAA5hWQ8zhIP3QNihf+Wb+TvNtOKPXv4l+b654Q4RyN3a0BG3cBwXjkSD/7JQueJd0ONOPFqYYghKOxf/baUT1BusKq/b2waoeSi0MEw88jNDhPZpg6a3PRzV00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486946; c=relaxed/simple;
	bh=ggZCPrTSho50jbXEpTb8AGo+L5OS1xyB50R//QbDXlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jle0/ZgiZLydpxAm+bpsN6ZhvlvweyLaE9DAR7WB+Y0c/2F25r0zrKtbkeTp0yUuDr0bpoWGhknhmYgM94YX5AWSCYnQJJdatq40U7jCxIwehf1iG7xNzwwlObnN8QxvJfn4ULQVlfG+vN/U2FbxOS36YqzxAGmWv5pXbbHnVZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ia1eHzug; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62D0C4CEEE;
	Mon,  5 May 2025 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486945;
	bh=ggZCPrTSho50jbXEpTb8AGo+L5OS1xyB50R//QbDXlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ia1eHzugbr5Oui3HcexcgEErlAvVJiEVxy77fY2Gb694eTs7H+O1T57kGlFBdrSNq
	 MmRy7RYcYA/YEqzTfvFIB15KPGBGHjQFTENWhqOvTq/XCcVfpRjujt5tbwG3pVKGcL
	 C0q0lI2aKwyJK5J3Aoc/buWOgJa8HiVJJnkUr0iZQ39AaFjsco0HJ1G1X5pD3k36Sj
	 qwO/b1n4dJWO2Ib4+87hDHWGzB5NWBrUHRXaXnhQnnd2dUIE12lj/1mL53onM1q1V+
	 fKjlEOiU9vOK01vXLWh0vwg0I+1BfGH/UVm3Fb3UkWigpNtugeTx6d5/UyDQ45Zk1I
	 SqI1kZdB88bPw==
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
Subject: [PATCH AUTOSEL 5.15 072/153] media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
Date: Mon,  5 May 2025 19:11:59 -0400
Message-Id: <20250505231320.2695319-72-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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
index a86d470a9f98f..2f8b485ddde04 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -35,6 +35,12 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
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


