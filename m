Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3190E19323A
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 21:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgCYU5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 16:57:14 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:34838 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgCYU5O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 16:57:14 -0400
Received: by mail-pj1-f68.google.com with SMTP id g9so1522589pjp.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=g8PMREI45krrfKGXVv90/j3U7ZUWFxhnJ91n7OAeL7o=;
        b=j1dV94+YwpQvRWCXHU6PrOPRHgkUIVMFl5RRTSA+ulI86iK9DssyBjbH7t2pj6/K9J
         scXDEwrxuVdirmoD6KA4BDsCxjX8+da639Vtp0PC4/7yPlfkBwWwqkD6r3UptDJrFcxf
         pKzE4onqzApyYbcIWJVjXzDV8BdRNA/W/I8SyoUm3Hp5QVpUL7XEBdAAFqXSozMPqYNK
         VuvAIC8r+yVkEQRTfQttysAdkcRqIFlgt479FK9YwjKOOG6Wln7jFCg0V28cXC5uznwZ
         M90V+q76Ss6SPGymfwlH5rMKR+VIgI393xVjrk9Zeal0z8qW0AXqKIZhZR7AFiZ9Y1zb
         8s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=g8PMREI45krrfKGXVv90/j3U7ZUWFxhnJ91n7OAeL7o=;
        b=jnxsay2BxjfAyOQlOR92Crq0koAq2F1jW+5JXkLyhDoy8T8OAGKpLVhxadBxdhPnnM
         Yzsl8XXm+LmHlVGRcZV9zAOjnPYes0IPzEJ4nqaaFi/awh+0XfE+jBu/ENKdMQrsH4cu
         VNxrwjv7f/DCyCBv8N0+YMtB4vISJxgA7UoyF3AZuJS53Zjau1BZsV+Ugt88Lbhh6pcM
         3yDjA6kKsadnIu+ikDBSGGvqMvsaZxwTxLCDltaQlGk3C4RnIjxkfu4e5OARWce5aQe7
         oDKdxRHK7uEB0rSxpupydx6HLjwXUd24T9tOyqCX4aW/e1VEA4vKxjfRS06M86lDZaI7
         Sz7A==
X-Gm-Message-State: ANhLgQ1Nggn0qlXvhA880yqDv/QvAitUAjOX/ZRh7cDGDCHN7PeByqKR
        ZVbjGlqiEDQjmTKuSqT6trEqk9/8
X-Google-Smtp-Source: ADFU+vt2cd1Gimyp/0yJLYasiv274qonL+zkdQaMWfZ1m9pKQ4kqgHeoU0R6UXz9ynoiXVJozslWKg==
X-Received: by 2002:a17:902:7201:: with SMTP id ba1mr5089296plb.198.1585169832879;
        Wed, 25 Mar 2020 13:57:12 -0700 (PDT)
Received: from deeUbuntu ([103.228.147.248])
        by smtp.gmail.com with ESMTPSA id i20sm39894pfd.89.2020.03.25.13.57.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Mar 2020 13:57:12 -0700 (PDT)
Date:   Thu, 26 Mar 2020 02:26:44 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org,
        daniel.baluta@gmail.com, kieran.bingham@ideasonboard.com
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: staging/intel-ipu3: Remove extra blank lines
Message-ID: <20200325205632.GA31257@deeUbuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove extra blank lines from the code blocks.

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

---
NOTE: Resending patch to linux-media list as suggested by Sakari Ailus.
No changes since last version.

 drivers/staging/media/ipu3/ipu3-v4l2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 097c10d9da2a..e8f33539a217 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -152,7 +152,6 @@ static int imgu_subdev_set_fmt(struct v4l2_subdev *sd,
 	struct imgu_v4l2_subdev *imgu_sd = container_of(sd,
 							struct imgu_v4l2_subdev,
 							subdev);
-
 	struct v4l2_mbus_framefmt *mf;
 	u32 pad = fmt->pad;
 	unsigned int pipe = imgu_sd->pipe;
@@ -485,7 +484,6 @@ static int imgu_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (r < 0)
 		goto fail_return_bufs;
 
-
 	if (!imgu_all_nodes_streaming(imgu, node))
 		return 0;
 
-- 
2.17.1

