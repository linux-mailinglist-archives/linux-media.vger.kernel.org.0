Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B12E415236F
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgBDXty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:49:54 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35291 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727850AbgBDXty (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:54 -0500
Received: by mail-pg1-f194.google.com with SMTP id l24so10628pgk.2;
        Tue, 04 Feb 2020 15:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WaBGbAVLvbw1Oa8PBijA4rVNFNBvvrFDnIgEYRds3L8=;
        b=mNmZy7R7sQunr/esl0X7WuD/YOJo3oXWxaM/3fWtqDaXMU3tA9oX7QpNB7L4WidlZN
         +0FhiBowT1jvElbnHRqgGrwPJslvNHKFlOxLIYgVKADNM/DLj9EVLyJKAxRSkrN2eoVX
         +VHxwPTpyQ3sxjsa7GNJp69XguyefpuqpxO9o1JVFfdKdevURPuboIluRlx+LVz6tOvw
         1gJrULMLL3f0l435h35yYSu9MMc0rDFcWgCx1W+bs8Vn2JXjhCVn3Kyt4guYO1WDMl07
         t6NUmqBpb1HOS8/HzuYODmWSMGIX0dReYtzHzhC8qOSWtTAemf0mNu2uistyoFL6widC
         RXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WaBGbAVLvbw1Oa8PBijA4rVNFNBvvrFDnIgEYRds3L8=;
        b=DBoP00jIi05wV4IF/TVLM69XmHIgc64rbhVM2HOsfzXodI/PRzUB8QUiEdTno/64Uj
         MTw/J2xRIvQL5f2Uwkc0JHFnu7F8Scl8PcGqNAigpJuJAnmj4HcoKJlnHgw2fagcT8nH
         HGHhf4CbNlL0lUWI8Sbi5E2iS5UetcNOauTqZrR5SQjrMz2UlUEodxNksQuV32wSuIEk
         +L4HPxt9cjurPulh2SPQXRYKAVhbF3TaqA12nab7RWk7ooteZugyOHwcau7nI+S8DuEq
         EPK9FtTKgp2t+lYszvS5Z/qWh+k72TLNU4yDVl7cVPOSVlHLjoqsAiesqdj7vNfdkHFr
         NgPQ==
X-Gm-Message-State: APjAAAW1GU6aE+1io9o8Z7o0Jmk+7Wv7RpflIfePiQlWiwg10MdGdcdR
        78b7DAqs/l5qEtQv3skRWYfQlEwS
X-Google-Smtp-Source: APXvYqygTNtxMuKauV7T3oKQAYlxYOiFZwSb0Z9tzIiXotDDLSjz0Ow+4RbPSU47FigltJmiEujr5Q==
X-Received: by 2002:a62:878a:: with SMTP id i132mr23451540pfe.8.1580860193128;
        Tue, 04 Feb 2020 15:49:53 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:52 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 12/17] media: imx: csi: Add missing notifier unregister/cleanup
Date:   Tue,  4 Feb 2020 15:49:13 -0800
Message-Id: <20200204234918.20425-13-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204234918.20425-1-slongerbeam@gmail.com>
References: <20200204234918.20425-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the missing calls to unregister and cleanup the subdev notifier in
imx_csi_remove().

Fixes: c893500a16baf ("media: imx: csi: Register a subdev notifier")
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 3e2afdd59276..bea6a70cc353 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -2030,6 +2030,8 @@ static int imx_csi_remove(struct platform_device *pdev)
 
 	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
 	mutex_destroy(&priv->lock);
+	v4l2_async_notifier_unregister(&priv->notifier);
+	v4l2_async_notifier_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 
-- 
2.17.1

