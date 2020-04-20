Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CED11AFF45
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgDTAjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726089AbgDTAjv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:51 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5B7C061A0F
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:51 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so4104502pfc.12
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Nvvo/ZkObgnXossv1+5kaEIkJOJDxLCpF9rPZosUJGc=;
        b=gQVzbHDIHGDd5lN0ZFPofHK5LRJhqUXAVo7vTpKYU1+2sXaXDSiRE4aOhCHuMnY6BH
         XmzDeSe8x2K/G227ell7ScXeC5j1uBkof80gsFfODCdoGXY1mFzfG3hWFd0FKXiprR3G
         hKr6+bum5aYjhyEUdLuSd7CBGFA8PqTXPuot9+YdpUssOJZeJutObLoSTCYjk5gHQQUp
         aKatXRaD3ZCPy+hrg/aOFOSyya6JN4wIoey6s5ZjPYS8oh0nPSaZqJF8JZQr0L+6+LqT
         FAuT5XCcrskQROu0y99xWpFNmUSFefaqA7k4mVvqYieDi7bzlo+sTC0Mu9wtyhLEGiGZ
         UaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Nvvo/ZkObgnXossv1+5kaEIkJOJDxLCpF9rPZosUJGc=;
        b=aM1k4GdxlqAt8SwPvQr3oaOIyzVy0jjyjyAc1JTr5Mo6vYVHpl9HUzONZkzY0+P1lE
         MathLaPccHiodnhs0fH7IzMTrLP2jaNjybJPGTus3xpX/v4nLOPNRxsPouOZVOXvIt8y
         aes0bTgNy7ruWJDC1DpzWaHSZPrtpLLleRtOU5COZ9iMkw9w5wqao5VNBgGdTAnrvg6B
         KDTo+cFTTpraTnlgRT/9z5js/Wyvsuy5CbRm+jROra1PMrCViY3aJLPqasQ0SXYU19t1
         WDkZ6H1J3o5+n4e3ZbfSD1aedrHu5srA2uhbRsKnPAXUoQO96659FvMctr7WLq/7FPYs
         xrUQ==
X-Gm-Message-State: AGi0PubLG7X4PjmCcdFrPg6W//PtxB+QfVeON481VB+CqvKXQGCYz3+S
        7nSdICSuxGmHV4cFm571w7+gwPL/Z8k=
X-Google-Smtp-Source: APiQypJkQdZ2Dg0zja2g4lEPGyB5Z+W6JtmWCMssS4JpILRY3TpooF8nV2Qmnw2D6SVDqaNaL+J46w==
X-Received: by 2002:aa7:8259:: with SMTP id e25mr14236188pfn.82.1587343191036;
        Sun, 19 Apr 2020 17:39:51 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:50 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 10/23] media: imx: mipi csi-2: Implement get_fwnode_pad op
Date:   Sun, 19 Apr 2020 17:39:17 -0700
Message-Id: <20200420003930.11463-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_subdev_get_fwnode_pad_default() as the get_fwnode_pad operation.
The MIPI CSI-2 receiver maps port numbers and pad indexes 1:1.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 332d77aec8aa..5f5aef658a04 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -510,6 +510,7 @@ static int csi2_registered(struct v4l2_subdev *sd)
 static const struct media_entity_operations csi2_entity_ops = {
 	.link_setup = csi2_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_default,
 };
 
 static const struct v4l2_subdev_video_ops csi2_video_ops = {
-- 
2.17.1

