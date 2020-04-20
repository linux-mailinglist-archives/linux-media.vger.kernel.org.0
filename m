Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16FAB1AFF46
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgDTAjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726089AbgDTAjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:54 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BBEC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:53 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id kb16so3802494pjb.1
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jtajOtLt4o8DXOswYzYCoa3CZyiQQIMpXDBoB7VJNMQ=;
        b=UXzFqw9vVHBYj7XN31XK3qo8rlLF9OHfEkMFykcuSYOiW+Za2gwEk/9BDZHVVkwWlk
         ip5aHhYfSyitIBkvCWMMIBqTn5+Rh6h3z4Bol7d83v6WAi9rCqEJ1Cy5vTtNr6A8PVkP
         +6HOIXKzyRzInqhyKK8a95n6dUv1Wdk/0U3UR4O6WDuJM63NVYOyMEN/UBgUy2XWC5du
         Wi/o3qJVHCEc6+XCcKpCq2fWwuHRH6FKw3ddS50js8xpyNkohIiFBRp8KcfSVD7WwFNF
         HkQ2g8q+jhqDsZG0SgDXRiCNyjRaTfHvysaLMGBWnYlTrAQt+EERfPtd5W0u92Dj2YcH
         TvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jtajOtLt4o8DXOswYzYCoa3CZyiQQIMpXDBoB7VJNMQ=;
        b=MXwj0AYXapAgTGzMfKkceVzox2ixouy/r/UKwGn4E6STwjclB5tmB+E5IwyIDJ9WO4
         JXkNSEDPkbmmY5274oBNRvJCiWErTy8PEmbeiAUYH48HR2nnrosYNCSGnsQHAB1G/8ck
         jRre2Cvs9cN37TYKqONtWWCWCmtYE8hHV5AODfZSV0hKbWqHl1plI1HYqT4ti+K0/bnt
         qO2dzIZRWiC6IysFYqfeiQP0nYn4SkjBRKEl4fGG4WNwcKJXJ//m2WRmKB/FAZDeyZDL
         1q/7JnsI+OrX/fXmzh8/A2hZFY2zR3O0Os8/OSXf2JdZ95qeaiQltWHH8Ls/eu8iGuZM
         FRVw==
X-Gm-Message-State: AGi0PuaQo1sMv5Gg+mbWQcMkpdPO2OKZt6U3wJ0Y4xL22RyzW7yKfxfp
        IHTl0gib4SdTKq0xMr2eWzfX/egjSUE=
X-Google-Smtp-Source: APiQypKxNqx5GNuMmEnjs9So+TwG8pU1qd+hXS6iqa++kUN74AuTRI+lOY7spqF0oiQLAFbaIqMjCQ==
X-Received: by 2002:a17:90a:fa17:: with SMTP id cm23mr18802037pjb.121.1587343192463;
        Sun, 19 Apr 2020 17:39:52 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:51 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 11/23] media: imx: imx7-mipi-csis: Implement get_fwnode_pad op
Date:   Sun, 19 Apr 2020 17:39:18 -0700
Message-Id: <20200420003930.11463-12-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_subdev_get_fwnode_pad_default() as the get_fwnode_pad operation.
The imx7-mipi-csis maps port numbers and pad indexes 1:1.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index b66299c1136d..1b3af031d136 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -906,6 +906,7 @@ static const struct v4l2_subdev_core_ops mipi_csis_core_ops = {
 static const struct media_entity_operations mipi_csis_entity_ops = {
 	.link_setup	= mipi_csis_link_setup,
 	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_default,
 };
 
 static const struct v4l2_subdev_video_ops mipi_csis_video_ops = {
-- 
2.17.1

