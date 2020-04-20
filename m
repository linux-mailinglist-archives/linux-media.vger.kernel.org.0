Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E71D1AFF44
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgDTAjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725991AbgDTAjv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:51 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584CEC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:50 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ms17so3682831pjb.0
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KL3F8Ry3F3mrrfiEfS5/cHlDdR5sJLqa+9CCe5yF5LU=;
        b=uuOWGvj8HDjyPEKlaIQtT/FsdQ0nnUzdobEbgxaQ0Xkia1lcIKWNg6DN/UUKhESAMP
         AA8xJ79tR/eGtv/fS22GlildTnBR+RW5vwNEuKhVTbj5a38AvtbdDc1Qr8nAbApD8fMU
         HEDT2+T+o/z2eQv2jXxpxuLovNMfVCQ1MAZ4cDJbCVmXAtCCfFGlocWhzMNrYKIktdTZ
         9FAUR8Bq6KiqHDTL5I1Dum+sso1swqpkwfuSm3E8iOJB5TjJE1LW85wioDBYOW4O9aEg
         SGt1ClTfcWo/NKiArHJxsjnoucosJln891o7r3NRt7eJ5QSUq7UStpWcHL8opQN6Q+6G
         Trig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KL3F8Ry3F3mrrfiEfS5/cHlDdR5sJLqa+9CCe5yF5LU=;
        b=T+0Vsb7WV43hv1R4ZuE0MsiHF3DI10yeg+O5YZmp+ps+HjKeaeIJmmveImf55RGbas
         rRTV90z6ABG2KcRz7GW/6EKsy6pxzSANN/hjvX4dKVbZ7AlTHOOytZnobS+NNvGRuD70
         HZcwjTkq1WIgUFGa41RzbTRqG/SmusN9GIKr9SMImqnyZBZnPwO1VIVOcdVb2zp8RgBZ
         2+NDWbI8OWMhv8mhlzxkd26F/uL8GxgEBkFhSFE4ZMm+A7qmy5ZCfYfyXlt1/+7sEtdk
         qVIO0SQvaHfjCHu/5AVlFbPUWe4CEdSMZU4zQFLSMSNakTsF0v974tCXFgN1u1F/gwuV
         MnUA==
X-Gm-Message-State: AGi0PuYdLAP9WqdH3SkhDd0Jw7tNkvLPx2/018lBctSDYxiK9WGuaxVo
        OsFKfgcjfF3qa3QCctA5ElDVJPsgNnM=
X-Google-Smtp-Source: APiQypJwxRSPM/Nt/U3QyNKyWz101KHI6RbEfMobBfX9FTVnP9+E7Bfj1lyXbK9fZwSH4h9m8xURNA==
X-Received: by 2002:a17:90a:23e2:: with SMTP id g89mr18702757pje.105.1587343189619;
        Sun, 19 Apr 2020 17:39:49 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:49 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 09/23] media: video-mux: Implement get_fwnode_pad op
Date:   Sun, 19 Apr 2020 17:39:16 -0700
Message-Id: <20200420003930.11463-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_subdev_get_fwnode_pad_default() as the get_fwnode_pad operation.
The video mux maps fwnode port numbers and pad indexes 1:1.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/platform/video-mux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 7b6c96a29aa5..a21b299ce0e7 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -97,6 +97,7 @@ static int video_mux_link_setup(struct media_entity *entity,
 static const struct media_entity_operations video_mux_ops = {
 	.link_setup = video_mux_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_default,
 };
 
 static int video_mux_s_stream(struct v4l2_subdev *sd, int enable)
-- 
2.17.1

