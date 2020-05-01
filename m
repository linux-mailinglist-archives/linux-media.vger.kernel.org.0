Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D901C1B60
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729391AbgEARQO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:14 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401F6C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:14 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s18so4801743pgl.12
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Dg8KbWlDnXHLMKnZ1WrAv3cvcCZ02gA3fmDwwT1MLdE=;
        b=MZAqA2CjwAT26XTGJdTdHWTS8QFPG66KdQsvoxIaMfUcb9SW1nhNkk0FbcyQ7rDWzT
         pKPp6q0cVV8bn+jP2V/ayKAsw0T1mj3/2Bv+vuD2YOLTcewnbRK8R76y+bX4z8s7ldsr
         cRiYQkCAHE3S2NDrnrj6hbJnG3WNeDp09SDNyNoJxbC3NLjS8XUgzdxnFDH1AnmGyCOc
         rnSlAgolEWfcBUXYUUXh0BdTKFsayXO1pAcBCrO6WnPWE2wxOLuSUtEmBz9DUn0++6Al
         uLvR4c8IX1zZPcj3wmz92H2HR4NTK5BTK6qN3IXDcjRdKimfXhNSSz1hUP//XdD07g80
         EhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Dg8KbWlDnXHLMKnZ1WrAv3cvcCZ02gA3fmDwwT1MLdE=;
        b=ORGzeu+TL4d6ygC4eopodgFkF5a37tq1GuZDvvcCSQ1q06JovLhZY/JyhC2FbDWWIm
         TN58YX8wPzq+AaNq0PVM6nDQJTaX/ycdsRJZe4+iXLN4xl4EibqGK9ef3bn2lWhyBZhm
         2OHijGQ2HBbfeoBHpIUVgUNQCKdi9m2rZ2h0vifzc9QaptpX/OjFkVAEgPcNj8Voo+70
         e+qXPBKgV+2uMzQXpcIo1P/083lkM+yVwwtGKnE7U8aCk0hPeYdiWHA0UdW1QGeh3DAm
         F40/AITE8+QfmWbPJkTplnwKinSLg5388B+iSR2tEU+Dan8sd4jQ98ay8P58yT2et9Z8
         3muQ==
X-Gm-Message-State: AGi0PuZsbHdI1yTFTR/s1f/wQIy+odd9ZZugiCv712iNMniD+eQoqNBk
        fscmRPmNBmnaKH+0wwV8itm7aVli
X-Google-Smtp-Source: APiQypKjpyvPjhTSlYMGrs9b6jk6kWM/eW7i7uxdOlWjbDnawVoR6fGbEE6rJxmf7NrQdvEpRmk6og==
X-Received: by 2002:a62:7ece:: with SMTP id z197mr5309425pfc.244.1588353373272;
        Fri, 01 May 2020 10:16:13 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:12 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 08/22] media: video-mux: Implement get_fwnode_pad op
Date:   Fri,  1 May 2020 10:15:42 -0700
Message-Id: <20200501171556.14731-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_subdev_get_fwnode_pad_1_to_1() as the get_fwnode_pad operation.
The video mux maps fwnode port numbers and pad indexes 1:1.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/platform/video-mux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 7b6c96a29aa5..9f148f403603 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -97,6 +97,7 @@ static int video_mux_link_setup(struct media_entity *entity,
 static const struct media_entity_operations video_mux_ops = {
 	.link_setup = video_mux_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 };
 
 static int video_mux_s_stream(struct v4l2_subdev *sd, int enable)
-- 
2.17.1

