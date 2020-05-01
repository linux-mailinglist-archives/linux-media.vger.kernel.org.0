Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A881C1B62
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbgEARQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:16 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEDA0C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:16 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id b6so570674plz.13
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ew8ODtHZB2v9klvRNnpmtFZWxf7EehbfPJw388DD5Ig=;
        b=ekX8ni4HBJWGQDnPDSV7REbK9E4efv3nRbPgv5AmoAnbGZ2OTcXKXFUNvwODKDyU2d
         GA4xn0hS8SBXp8W7paEmlPkNw/cXmdoPfxrXD0RdD0XTP1nNaeV3JOWlp7yWjdNZLvmC
         19JLExz6aumQguIHcDet0E6aKNrphau6cayf9JKb9i2TW549SHBcwRmVx1Lm+F7TXAQ4
         dyCdOxGR9VcI9M0PNXh0mC+d84t1Z6O/iLkExwSkYg/Zf0Qo0JXPpkk+WEhUY/Y7FjiR
         rIcoPdjzlQrf/AnJ9UpzrtRTD8evoS41AT1piQxDHSoXxEpntPZ8k7ZjiYZF8TnKnAle
         25gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ew8ODtHZB2v9klvRNnpmtFZWxf7EehbfPJw388DD5Ig=;
        b=UWcvY4O+iQ2fe9IY+Dwj/aDHtE9YPBkWkXVkryPuuc5LbRfGAhg2w6TJeTi4Evw9lN
         rGNaTWXFLn79jkiIQlAs9/J0nqnC/fSqX/fjm/+6gqM2u5jieBEBlySXNOIvBKMzLcJY
         26rAQYtQR5oJ49pK7a9PbInsAjMgM/LQmdAkKttDxc781qALTpIOlhmjPQGo0mAu0IaY
         g/U2FwpA+xgLV3O5kr0n0O66IR0hRgub1b005po9ayg+SDlNmMMNM4ngR0Owqe9agFl3
         gGXnDRU0r/i8sHB6STYsVYBYIbCgwW9LOr1/IAAjFbR2oDfKf6aOUs99DYrD9FCiTooH
         RQ+A==
X-Gm-Message-State: AGi0Pubg/j/fowzrRKOJOLaQZ7SMyWVb9kkIScH+EW1Ugs3siDgfP3U5
        cBSbSA3fbhPXw+8q7dnAVPFxmh/I
X-Google-Smtp-Source: APiQypLqH8lJLySrWVJnqsD50s4VKr2/Ls881t2bEXV+tGt2rFdammAF85urgRVhuI31yBmqD9wxzw==
X-Received: by 2002:a17:90a:3343:: with SMTP id m61mr758801pjb.112.1588353375930;
        Fri, 01 May 2020 10:16:15 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:15 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 10/22] media: imx: imx7-mipi-csis: Implement get_fwnode_pad op
Date:   Fri,  1 May 2020 10:15:44 -0700
Message-Id: <20200501171556.14731-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_subdev_get_fwnode_pad_1_to_1() as the get_fwnode_pad operation.
The imx7-mipi-csis maps port numbers and pad indexes 1:1.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index b66299c1136d..7b5c3e662d0d 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -906,6 +906,7 @@ static const struct v4l2_subdev_core_ops mipi_csis_core_ops = {
 static const struct media_entity_operations mipi_csis_entity_ops = {
 	.link_setup	= mipi_csis_link_setup,
 	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 };
 
 static const struct v4l2_subdev_video_ops mipi_csis_video_ops = {
-- 
2.17.1

