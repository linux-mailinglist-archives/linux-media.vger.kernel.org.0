Return-Path: <linux-media+bounces-7236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB9987F44A
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 00:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FE0A1F23743
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 23:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC965FDB1;
	Mon, 18 Mar 2024 23:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ev+nXVVz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFEA5FB8F
	for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710806136; cv=none; b=RL6SX0qxn2YJtJXtSXRXYIG5rqixgxHuRCY73Uq5gv5bn3DNynzan7zbCgR7g12qAeOsLGMfDuYu7l2F+r/Rz+NeHlf7ynzOyAOk+l+SJnRwxx4/tRCwbZtcbVepLZY0v8CCAT6bu32MDSMnwHDXulQ5/Mh+COSwzHbkGeWkSIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710806136; c=relaxed/simple;
	bh=JgStlDiQfZLuPMGKv3DaZ3yiTPKdweveDZLgce6gw7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SaQpMA4qSbGA8n8oqRh1D7UmQ6/AFGH2MZrKHwt7TrX6cNKLuet7zEaaYmITfSjlpt8DyF5/EY0qSJ8gxERf1vMXSpyAHLs9qZH4LFdUs9sATfPGhcdDzBbL7kv6bH3a2SIUNSZ3e6bTWdRHNk4IXrKVr9IDWipNQnRLbc82/oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ev+nXVVz; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6e67451b084so2763114a34.2
        for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 16:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710806134; x=1711410934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDfVk65v2Kryzs73ZS+XanGLJ5n6XE9OWpKXOA8TdPw=;
        b=ev+nXVVzTPd/3nEetP3ZhvnCUHQAhlGmv+3MAhk9YytQjQ6+7uXzT6frrUZvjiGPak
         9405pCEeFiyxOnFL05vsE1MayZUKqGw8vpUIbTtyO24LKaZLxi1nDo/xbSq/nRKH0gvo
         tdEgN+3WgnVGo6lpwR2dWWVtPne/bCPS2UOz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710806134; x=1711410934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDfVk65v2Kryzs73ZS+XanGLJ5n6XE9OWpKXOA8TdPw=;
        b=R7qH1xo1lpzg3oOx5SVUaw58NOdX7FYUj9CfjElCU2F1VnFQvpRKecMwQsNVsVHUrz
         ut80j/pXrf2wLVEcFSbTomKkbXKL/AyIu12uw4yYUc0NVjA+kd9iqz2bSrYEeHCIiIoY
         QBsFTdK+vc9OZ+dCYkbhrSZpGouE5+Wtrhcoikx2muIX4Zox1203kTZcnfJNAdsaOE49
         BQFhq+tgEco2rUqNIVVAhHf3twBo0AlfKK0irqk3AHQExrfgNI3r6a3wsg8YJmquY3qd
         6NpL/jDAVZKzeVjzNTLcX7ZOk8ADkw8BFNSBD9Jvd6SR0+4dcRkPZspG2dnoqL0lR+jy
         QwAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYWiBeAhpYAsD/UqjbnxBmA0vbzaiBku+sW7w/mqW6i6IojrkRFe5dJCDoo4zJnJ1Vu+ySSm7T+eg3qvxuOdLw3ZfgkC6uBjBtRpc=
X-Gm-Message-State: AOJu0YyEQ9cgGVsenLgrkIjbGIO3915CKPQxa4+/Cv8/ATLeUgTvBAp5
	r5UjHrobY2jW5ZjYgPDwweRk7ZEsfubdm+1pv6Q23JU9lvSe8sZuAjR6rmAVFZo0nXcvbWAZUo1
	CQA==
X-Google-Smtp-Source: AGHT+IEqw3Om+E+WiBkhsreCuDRwhJ/oxsIj60O1ACXBKx8LGEyOak5+XpYIUJJs1nAgbFDiD6agAw==
X-Received: by 2002:a9d:65d2:0:b0:6e6:7dde:d048 with SMTP id z18-20020a9d65d2000000b006e67dded048mr11309934oth.15.1710806134300;
        Mon, 18 Mar 2024 16:55:34 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id h15-20020ae9ec0f000000b00787930320b6sm4991690qkg.70.2024.03.18.16.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 16:55:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Mar 2024 23:55:25 +0000
Subject: [PATCH 3/5] media: uvcvideo: Probe the PLF characteristics
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-billion-v1-3-2f7bc0ee2030@chromium.org>
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
In-Reply-To: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The UVC 1.5 standard defines 4 values for the PLF control: Off, 50Hz,
60Hz and Auto. But it does not clearly define if all the values must be
implemented or not.

Instead of just using the UVC version to determine what the PLF control
can do, probe it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 54 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 67522143c6c85..9a0b81aca30d1 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -501,12 +501,58 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
 {
+	const struct uvc_control_mapping *out_mapping =
+					&uvc_ctrl_power_line_mapping_uvc11;
+	u8 init_val;
+	u8 *buf;
+	int ret;
+
+	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/* Save the default PLF value, so we can restore it. */
+	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
+			     chain->dev->intfnum, ctrl->info.selector,
+			     buf, sizeof(*buf));
+	/* If we cannot read the control skip it. */
+	if (ret) {
+		kfree(buf);
+		return ret;
+	}
+	init_val = *buf;
+
+	/* If PLF value cannot be set to off, it is limited. */
+	*buf = V4L2_CID_POWER_LINE_FREQUENCY_DISABLED;
+	ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
+			     chain->dev->intfnum, ctrl->info.selector,
+			     buf, sizeof(*buf));
+	if (ret) {
+		out_mapping = &uvc_ctrl_power_line_mapping_limited;
+		goto end;
+	}
+
+	/* UVC 1.1 does not define auto, we can exit. */
 	if (chain->dev->uvc_version < 0x150)
-		return __uvc_ctrl_add_mapping(chain, ctrl,
-					      &uvc_ctrl_power_line_mapping_uvc11);
+		goto end;
+
+	/* Check if the device supports auto. */
+	*buf = V4L2_CID_POWER_LINE_FREQUENCY_AUTO;
+	ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
+			     chain->dev->intfnum, ctrl->info.selector,
+			     buf, sizeof(*buf));
+	if (!ret)
+		out_mapping = &uvc_ctrl_power_line_mapping_uvc15;
+
+end:
+	/* Restore initial value and add mapping. */
+	*buf = init_val;
+	uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
+		       chain->dev->intfnum, ctrl->info.selector,
+		       buf, sizeof(*buf));
 
-	return __uvc_ctrl_add_mapping(chain, ctrl,
-				      &uvc_ctrl_power_line_mapping_uvc15);
+	kfree(buf);
+	return __uvc_ctrl_add_mapping(chain, ctrl, out_mapping);
 }
 
 static const struct uvc_control_mapping uvc_ctrl_mappings[] = {

-- 
2.44.0.291.gc1ea87d7ee-goog


