Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C0B1AFF47
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgDTAjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726105AbgDTAjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:54 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D491C061A0F
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:54 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id g30so4127611pfr.3
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d7Ga9Qri/PF+o8gVigrVdhDIKmYgrogZBpx8dtUnaXA=;
        b=HlheNYZ8lvjl0jAY3Q0KKsGVlIPFmDViW1sGHgzWQMYZHGssX6ggdjqQE98nFYbLVL
         eKNvNHL20HNCBY+ES0mMz9+GCJFDkGHbCHz12P6vHo3ktRLsUrlVeKISGQXLU3yQXNuS
         KxVNbj79p76+dUF7lqD+qkv9WbOomAUI6BAthxm7DxynM87JUDfI61dKpJ/6radVdEeA
         Fm+NyWg4iHUCKMkNNzscfQI0EdLFbpUoeggHWhTHBFJGyR1S/2AF6DdcpQAqcELn7o9P
         FoYoiwhee1Ck7QeKrm6wliYIFFCaCVmLqXW2Tg4cc9uCE0i9ILOyVRirSeC7xpkEnAQ3
         28vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d7Ga9Qri/PF+o8gVigrVdhDIKmYgrogZBpx8dtUnaXA=;
        b=YjE6YllV48ceyAsj1FfQNGyHmiOBeQM80Jx5Yzww6hafbOgpw1CjYvjqX+bBcIhdy5
         WLT3dHKKMZ4TD117cZAMDBor1Okbas7jnLNd/phNM6cTAZyeqJ7wzPtrIU1I4bpa+fRP
         lnJOXrc6qQF40K6mFZ07rK2BTtrutZbkpnjjVxVtdrWUs+CM6McBDFG6jsp/mW7T/Y6G
         CrIL+RdmmzxncENat9k94Z0L11sjPg/Sfehawem7PcfNbIcbBu4qhfoW0HUBQJe25TQy
         iI9if3yfrWelA3aXqh8Qe25Uu1d1ZkyipNhD1aapKLoudk/buLooeP42a+saYRqvfNuk
         7X+A==
X-Gm-Message-State: AGi0PuYsKbm6/zp2l42ytYBFEHz9o4fXONKJFZ9AVdgR4z65qMQCVECE
        LRzO89zytkfPXQPWujNitNmi6tPcYUw=
X-Google-Smtp-Source: APiQypLrPALgjXcw5daVnMims9bfSSMk3fRCeYUwTvXiBUYCyzLLQKzjqT7vYkl3oONxBSxw8HLXGg==
X-Received: by 2002:aa7:84cd:: with SMTP id x13mr13902096pfn.41.1587343193821;
        Sun, 19 Apr 2020 17:39:53 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:53 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 12/23] media: imx: imx7-media-csi: Implement get_fwnode_pad op
Date:   Sun, 19 Apr 2020 17:39:19 -0700
Message-Id: <20200420003930.11463-13-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_subdev_get_fwnode_pad_default() as the get_fwnode_pad operation.
The i.MX7 CSI maps port numbers and pad indexes 1:1.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index aaa0b5870c53..e27d8f896a62 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1178,6 +1178,7 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 static const struct media_entity_operations imx7_csi_entity_ops = {
 	.link_setup	= imx7_csi_link_setup,
 	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_default,
 };
 
 static const struct v4l2_subdev_video_ops imx7_csi_video_ops = {
-- 
2.17.1

