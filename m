Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 521C06933D8
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 21:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjBKUzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 15:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjBKUzD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 15:55:03 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73EB614E82
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 12:55:02 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id m14so8557507wrg.13
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 12:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYlxwB+2dIIFaYeb6W4/G/F7mYnyq57RNQAaa+ab3RY=;
        b=TXqR8ihihKPfYSdqm3+VnbBjYp4AFUntljh7vTiWF2vr8uUGi4cKRr/PuJMRDKF2nE
         AE0eaaCbw4+/dbHkw0VwHZHzDJvWFEB9LSS6iy4aUu+2MLcffvifFS600KUflho2gmeK
         2TDjz1Un2rfGdY1DAOPTd8UZib2lg2NuCdufLM9IWrqAaS7IWDm5WoYJkyD8CwZ20dnD
         lKPtzqS9OQJXpmyteQZPsM9EcfF/9VmuF/5BVEvYGpC8B68083P1eF+MHpUmvUPBB0Lt
         3fRAHpAO6lOJxxPhIBS/0+sqbmMom3yBrNN93xGb260cpghawuvZWpA2L3WVDgzRhJm4
         /4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYlxwB+2dIIFaYeb6W4/G/F7mYnyq57RNQAaa+ab3RY=;
        b=ixkDJVPAYySO2CnPoKh6Fg13v54+2qRYiB9rmZp+FWns8/m/N/nhJygSad8vXat5rP
         mlC29Jo1Bzv+ZsXVX8ko8MpJedMJ99fSG8iI2ZEXBuNlJYquNXEXtT+QxCH7ROgDcx/d
         gaALTJwSQsqlxzVvNb4SWF2HdONfCmDDqWMgPpJ2ylcoFs1ukZcdVJmQSEHCyRe+TEcU
         4GTYhfNXszA4XBYMfPmSpGUoNZNzHBeJoKfjFPD7rg+BNx6FvdzH01qUkugkXKzHMoQK
         EehA27K7v3X4C4FwKysGC/kpiUpomOjD0aLGd+XLWGylP9+yg2pkinWJQWs/fJVDspeW
         Cmcg==
X-Gm-Message-State: AO0yUKU6vPYRjh7sC1p3d4ycpFE0TRAyPIMhs/1T/zTU+a8zFoYKS+SS
        u13vPDkdkLKsWN7NEhzAK9tULg==
X-Google-Smtp-Source: AK7set/6Dy7dWZa2AFGHa5pS99q/OkSJXEZ+caNDpDjIedejlhqYVwR6GZEASZPg5ILmCZThtpFG8Q==
X-Received: by 2002:adf:fd02:0:b0:2c5:4c7f:c91 with SMTP id e2-20020adffd02000000b002c54c7f0c91mr4134363wrr.66.1676148901022;
        Sat, 11 Feb 2023 12:55:01 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id q4-20020a05600000c400b002c54737e908sm5095531wrx.91.2023.02.11.12.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 12:55:00 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] media: rcar-vin: Gen3 can not scale NV12
Date:   Sat, 11 Feb 2023 21:54:31 +0100
Message-Id: <20230211205432.493102-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211205432.493102-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211205432.493102-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VIN modules on Gen3 can not scale NV12, fail format validation if
the user tries. Currently no frames are produced if this is attempted.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 98bfd445a649..cc6b59e5621a 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1312,6 +1312,11 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 	}
 
 	if (rvin_scaler_needed(vin)) {
+		/* Gen3 can't scale NV12 */
+		if (vin->info->model == RCAR_GEN3 &&
+		    vin->format.pixelformat == V4L2_PIX_FMT_NV12)
+			return -EPIPE;
+
 		if (!vin->scaler)
 			return -EPIPE;
 	} else {
-- 
2.39.1

