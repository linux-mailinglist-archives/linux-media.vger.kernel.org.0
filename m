Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795FC46AF3F
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 01:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378530AbhLGAmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 19:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378497AbhLGAmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 19:42:14 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE5FC061359
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 16:38:44 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id r25so49860737edq.7
        for <linux-media@vger.kernel.org>; Mon, 06 Dec 2021 16:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G5ttIxz5XV1R8mB4AQEIj3LEMb5zIef+xA+it1IYM0A=;
        b=fxULTE43khr6HR3nEpuNEBCZ3vxOtIjvgO+qsh/t/MYiz/pcjcUm4ceQBaCIbt6V1O
         9VQN3PxhCSxhe7UPODei/pT+cZPxVQ3rLFSHnyAzZmrA680WCK2162MoEHFS4Q5E5clu
         ficTuYn6q11h/+4WmiPEWa4D1M1601MnTRwx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G5ttIxz5XV1R8mB4AQEIj3LEMb5zIef+xA+it1IYM0A=;
        b=YTXwljaMiEiJEsnOeTaUsTyN01etAXw5WQOzp8SiD7gP6J4ux9ZRcU9Y07Yn+a8OTE
         Jx0rETkprpHaS6XW73zZPIiwyqiOmr1YPlid4Qg5oOxG0Y1uidEXWQKnfXw177r4PPIO
         M94OpxkKcVbqCYL+kPlNvgKqGrFi5BAl65rsuR7AQ8eTTmJ7s6Fn7KXUrziqDE/gNkEC
         gcpzFI5VAV3q02wRNbbCN4m1tQiubUZ64AWnUFGe8pQ+OLP2IiADU27NndVMwy5tJij9
         8C/X7Q94lnd0GAslLvvjCRCGXQojw5ZElw7VS2DITnypq2QNLTzpWNbtZZZ8xi+Jh4yd
         Ql9Q==
X-Gm-Message-State: AOAM531ZtI4CIJq/Tzgsw8qY0m0ZhKVj5J5oM/5AbJVNbc6YBx2eayWM
        /43YT9QbSg04Xt0tWWIWSwTeVA==
X-Google-Smtp-Source: ABdhPJzyB/H3kstbdpwZhrTKrE9GYUydqXMwZxZnch221LvMd/xWTQsQ2dnz4mfV4fFPDTx23odp/Q==
X-Received: by 2002:a17:906:c9d2:: with SMTP id hk18mr47496273ejb.523.1638837522949;
        Mon, 06 Dec 2021 16:38:42 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hg19sm7422531ejc.1.2021.12.06.16.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 16:38:42 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 2/4] media: v4l2-dev.c: Allow driver-defined entity names
Date:   Tue,  7 Dec 2021 01:38:38 +0100
Message-Id: <20211207003840.1212374-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
In-Reply-To: <20211207003840.1212374-1-ribalda@chromium.org>
References: <20211207003840.1212374-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the driver provides an name for an entity, use it.
This is particularly useful for drivers that export multiple video
devices for the same hardware (i.e. metadata and data).

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d03ace324db0..4c00503b9349 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -832,7 +832,9 @@ static int video_register_media_controller(struct video_device *vdev)
 	}
 
 	if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN) {
-		vdev->entity.name = vdev->name;
+		/* Use entity names provided by the driver, if available. */
+		if (!vdev->entity.name)
+			vdev->entity.name = vdev->name;
 
 		/* Needed just for backward compatibility with legacy MC API */
 		vdev->entity.info.dev.major = VIDEO_MAJOR;
-- 
2.34.1.400.ga245620fadb-goog

