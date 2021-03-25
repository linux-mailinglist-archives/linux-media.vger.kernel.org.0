Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C72349A41
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 20:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhCYT2w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 15:28:52 -0400
Received: from mout02.posteo.de ([185.67.36.66]:50385 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230282AbhCYT2b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 15:28:31 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id E15002400FB
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 20:28:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1616700509; bh=EiJxPe4iT0Su0XpouQQ6ITs2EEQQHjTSvUgaZP3By04=;
        h=From:To:Cc:Subject:Date:From;
        b=ppMToE/khpBu5Wz+ORtbwyTF3MzEad2BM5rfDoKXL/vC5+xg/PYoSJgz3yCua/z9y
         kunZGiYv1EsmttXOFOYM0Q6xA+O7UIKwV/ZHz26g4a+GMvCDIsJdtksCB/H6ZNc67w
         qw55CQIm2iYxxTDfxaxxohX+2mmtej0mxSGv8TrKs6jI9itx6BLLP7UNaSJZhYJGk8
         ox0+oT4I2aSD+9Ac5AFmmut56mDDpyYJYa/XDK+kEgmIEmzGtQogJMjwve5SJwFBMJ
         wZOWWqPvpumkTQhjcv+xG28SLEd5AWIZdlTRR4dYZok/WpuZOxgHQscLkxAn/vHwtS
         nHnhUfibpZIiQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4F5wBN6Tqvz9rxn;
        Thu, 25 Mar 2021 20:28:28 +0100 (CET)
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, heiko@sntech.de,
        Sebastian Fricke <sebastian.fricke@posteo.net>
Subject: [PATCH 2/2] media: rkisp1: Limit the sink pad crop size
Date:   Thu, 25 Mar 2021 20:27:03 +0100
Message-Id: <20210325192700.21393-3-sebastian.fricke@posteo.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325192700.21393-1-sebastian.fricke@posteo.net>
References: <20210325192700.21393-1-sebastian.fricke@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RkISP can take higher input resolutions than 4032x3024, but the TRM
declares this size as the maximum size for handling black level calibration.
Crop the input resolution down to the expected size.

Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2e5b57e3aedc..06d3cca0c00c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -758,9 +758,13 @@ static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
 					  which);
 
 	sink_crop->left = ALIGN(r->left, 2);
-	sink_crop->width = ALIGN(r->width, 2);
+	sink_crop->width = clamp_t(u32, ALIGN(r->width, 2),
+				   RKISP1_ISP_MIN_WIDTH,
+				   RKISP1_ISP_MAX_WIDTH_PROCESSING);
 	sink_crop->top = r->top;
-	sink_crop->height = r->height;
+	sink_crop->height = clamp_t(u32, r->height,
+				    RKISP1_ISP_MIN_HEIGHT,
+				    RKISP1_ISP_MAX_HEIGHT_PROCESSING);
 	rkisp1_sd_adjust_crop(sink_crop, sink_fmt);
 
 	*r = *sink_crop;
-- 
2.25.1

