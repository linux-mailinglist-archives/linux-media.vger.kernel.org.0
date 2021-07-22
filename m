Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344C83D2DC4
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbhGVTyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbhGVTx7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:53:59 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB41C06175F;
        Thu, 22 Jul 2021 13:34:33 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j2so30599wrx.9;
        Thu, 22 Jul 2021 13:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pPYPamu3BTSvC4xDyNwMS1rZ00+Vamo+vGwg9BlQGtg=;
        b=QU64f1ey246ueY7K6FvQaR+tNFW7/c2ASWKR7EbrVG8mHVYrWdttwIfkiTuXn6WySv
         EQ4tlcU0qfG8G9OY8tJfcPowVYwtXs2rGlF9opDSKHClD076pik9LwAxbXPjKiLmf2uy
         hRuveWJGiMDZax4GPRPscX1uL4J4b1gHOex18wSRYNhrHhSCI5LkKyk1hYvzrAUmpfRv
         j26ddwvFEc1IxxfaWJoWoRwUSmePz04LnRBGNMeBfAuQWt0yj4xrPD3MaD3XUa4B1vXt
         8Gr8szSFzGDEM4/Qv6M/Y1Df4DKJTeVRevVrlG+Pt0X4cwprQjC9CKcENBAWyEg5rGDb
         yAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pPYPamu3BTSvC4xDyNwMS1rZ00+Vamo+vGwg9BlQGtg=;
        b=SJRvFiEXFGMBy3WE1ULwx46gapyJQEpMg4xm8DMhK0ZhupvJPiZgjtIYRWa3BgwZbb
         1opzNl0nuffEzXbPcEIrcdFdReF/IsE9oYA5CjvxEE3fHxxHX+gsgQDozi/1MpeWKMTg
         Y2XS5qmEN0BxnhQu4XNyfE5t3Gkiod3pLiRAHE+YHhFUtFYYQjg5JOuSrPePNYqIL0Uc
         yrFzNA1oL0mTa7ZjG7VJvdR8IFw/7miAzIp1cYymRh3htRYw7PdgRT9Idin4HFSwhlaY
         V4otLuwd2QpDh8YpOhpvVJjaMheh6eKrbbHAPqb1rHtP0CGX9p3HLbpGh/XlKiXhuU4T
         bu5g==
X-Gm-Message-State: AOAM5314GLDEqGs0dK4MikXwBRhMdMrmUljY3eYI+JAtJKSYyrAKY6Ey
        NEzqyt4A/K45liDod0LAej0=
X-Google-Smtp-Source: ABdhPJwuQtSj3WdwEsIQAuebOcWSO4nxHjoXKk5zgWs2KV9+vs5ewXxHifizW3b6wheZ3rAIXQ6CxQ==
X-Received: by 2002:adf:f74f:: with SMTP id z15mr1788475wrp.54.1626986072117;
        Thu, 22 Jul 2021 13:34:32 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:31 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 06/13] media: i2c: Switch control to V4L2_CID_ANALOGUE_GAIN
Date:   Thu, 22 Jul 2021 21:34:00 +0100
Message-Id: <20210722203407.3588046-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_CID_GAIN control for this driver configures registers that
the datasheet specifies as analogue gain. Switch the control's ID
to V4L2_CID_ANALOGUE_GAIN.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index c012f5cb11ab..09558a3342dd 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2137,7 +2137,7 @@ static int ov8865_exposure_configure(struct ov8865_sensor *sensor, u32 exposure)
 
 /* Gain */
 
-static int ov8865_gain_configure(struct ov8865_sensor *sensor, u32 gain)
+static int ov8865_analog_gain_configure(struct ov8865_sensor *sensor, u32 gain)
 {
 	int ret;
 
@@ -2447,8 +2447,8 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
 		if (ret)
 			return ret;
 		break;
-	case V4L2_CID_GAIN:
-		ret = ov8865_gain_configure(sensor, ctrl->val);
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ov8865_analog_gain_configure(sensor, ctrl->val);
 		if (ret)
 			return ret;
 		break;
@@ -2493,7 +2493,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Gain */
 
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_GAIN, 128, 8191, 128, 128);
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_ANALOGUE_GAIN, 128, 8191, 128, 128);
 
 	/* White Balance */
 
-- 
2.25.1

