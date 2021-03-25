Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D484349A2C
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 20:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhCYT2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 15:28:20 -0400
Received: from mout02.posteo.de ([185.67.36.66]:43595 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230189AbhCYT2P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 15:28:15 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 8CC4B2400FE
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 20:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1616700493; bh=dKKpN44ZYVEDaO79znPOIgtvqlJqY5SPbiTkjKa9rxQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Vh/dN2Ib6X6SZK58YojUjU/6nzYeeImqKDd3CtEPIjoExQK6v17jHhrpl6r51EHW8
         HuPjn4VLCgFcHjxdXbd2xQlhED3Zu5X32o4ZLJopTFVH/XsM7BV/lUuxMnxndo7E8p
         1b32Yo2BLvfGEl1OCl3Sby2fxI/hcNrTfFgMtURSMGYjPGNUMak8XYtUr/IcN6VO/h
         k9e8kpME3Sxay1lYkBxt1F9OxleIaFffrEnXFYrwf1UZI/5fNxyX0ar5rBwhZAqO1t
         YHkmZk9FCR41FimwwCjBxD+eEcNfjWZfEjiM7cMBa6qWtEmu7FMCpeiA5eZi8xbmAA
         jm6MO/1oudhjg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4F5wB44PZ4z9rxN;
        Thu, 25 Mar 2021 20:28:12 +0100 (CET)
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, heiko@sntech.de,
        Sebastian Fricke <sebastian.fricke@posteo.net>
Subject: [PATCH 1/2] media: rkisp1: Increase ISP input resolution limit
Date:   Thu, 25 Mar 2021 20:27:01 +0100
Message-Id: <20210325192700.21393-2-sebastian.fricke@posteo.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325192700.21393-1-sebastian.fricke@posteo.net>
References: <20210325192700.21393-1-sebastian.fricke@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The incentive for this patch was to overcome the inability of the
ISP device to work with resolutions greater than 4032x3024.
Increase the limit to 4416x3312 to allow higher input resolutions.
Use the old resolution to crop the input resolution down to the maximum
size for the ISP to process frames.

Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 038c303a8aed..553effda4d5e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -30,10 +30,12 @@
 #define RKISP1_ISP_SD_SINK BIT(1)
 
 /* min and max values for the widths and heights of the entities */
-#define RKISP1_ISP_MAX_WIDTH		4032
-#define RKISP1_ISP_MAX_HEIGHT		3024
-#define RKISP1_ISP_MIN_WIDTH		32
-#define RKISP1_ISP_MIN_HEIGHT		32
+#define RKISP1_ISP_MAX_WIDTH			4416
+#define RKISP1_ISP_MAX_HEIGHT			3312
+#define RKISP1_ISP_MAX_WIDTH_PROCESSING		4032
+#define RKISP1_ISP_MAX_HEIGHT_PROCESSING	3024
+#define RKISP1_ISP_MIN_WIDTH			32
+#define RKISP1_ISP_MIN_HEIGHT			32
 
 #define RKISP1_RSZ_MP_SRC_MAX_WIDTH		4416
 #define RKISP1_RSZ_MP_SRC_MAX_HEIGHT		3312
-- 
2.25.1

