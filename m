Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97B53A3B7E
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 07:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhFKFvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 01:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhFKFvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 01:51:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABFBC061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 22:49:33 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74649B75;
        Fri, 11 Jun 2021 07:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623390570;
        bh=qMFtmk7Jl4DMe5PtH/xh3jr+qldEWXs55LPZSCgqlXk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B+lg9PPoDhcJigWrimntBKPmBuKitAPadikfopyaO53KTZVEbotExruyqMXgX20Bp
         2MlKjLmhp48RR3Uhu11PBObWjCroGzsQMMWoxQG/qBVQU6DPrDPjHu0ReKCdNFf082
         pqvrMbjCLeU5oL5asT/1wYcQOC7ywr5jb0p8VOyM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 10/9] media: mt9v111: fix compilation when !VIDEO_V4L2_SUBDEV_API
Date:   Fri, 11 Jun 2021 08:49:09 +0300
Message-Id: <20210611054909.28155-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
References: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Patch "media: v4l2-subdev: add subdev-wide state struct" describes the
semantic patch used to convert drivers to the new subdev-wide state. For
some reason the semantic patch didn't catch a single case of:

	#if IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API)
		this was patched
	#else
		this was not patched
	#endif

Manually fix this one case.

Note that this patch is meant to be squashed into the main patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/mt9v111.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index b438f8c077d5..2dc4a0f24ce8 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -800,7 +800,7 @@ static struct v4l2_mbus_framefmt *__mt9v111_get_pad_format(
 #if IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API)
 		return v4l2_subdev_get_try_format(&mt9v111->sd, sd_state, pad);
 #else
-		return &cfg->try_fmt;
+		return &sd_state->pads->try_fmt;
 #endif
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9v111->fmt;
-- 
2.25.1

