Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF233B0771
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 16:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbhFVOec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 10:34:32 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10742 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231655AbhFVOeb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 10:34:31 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MEVYBV012854;
        Tue, 22 Jun 2021 14:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=92CyqA6/aSemzL7DWgbz3Tw61baadIkgZx9F6vQTcAw=;
 b=t4BSIq1EzZwagac4gs6jGUqrSwCvpn9QIPyrvbX/QKuKwVkKU08Eg9dzArq5jkd0xnnv
 M3123M8wjtU70a59j01K3uW7uSTmIh/H/Brqwcdu3aZHOM4pZ9XcUSH9J/K5kgA73l+8
 ButbEcfgnp0ixJ++TfP48gPSylom6XQf/rSkFKN7LxusTryaz2jJmHWNG3XIDYWaxVMs
 FtJcgpO8XerK0ZZuRXB9SU/5T3UUNoxJkqr0Jq1KZT9x9XzByZcUCmha7bIJ09iXjdhh
 0ZWWYm7SkUlnvkpUegIYIYVj7dytoG52IGOAqJPzkwRiJY0jksrJTdNU6netJRXjY1D9 pw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 39aqqvubjt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 14:32:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15MEVtiQ045085;
        Tue, 22 Jun 2021 14:32:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 3996mdjtuh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 14:32:10 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15MEW61p047011;
        Tue, 22 Jun 2021 14:32:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 3996mdjtqm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 14:32:05 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15MEW12F014822;
        Tue, 22 Jun 2021 14:32:01 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 22 Jun 2021 07:32:00 -0700
Date:   Tue, 22 Jun 2021 17:31:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: v4l2-subdev: fix some NULL vs IS_ERR() checks
Message-ID: <YNH0WU7BcQ/60UNG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: GAV83A8_oJr1VJNM41yd3-aVb1bUriad
X-Proofpoint-GUID: GAV83A8_oJr1VJNM41yd3-aVb1bUriad
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_subdev_alloc_state() function returns error pointers, it
doesn't return NULL.

Fixes: 0d346d2a6f54 ("media: v4l2-subdev: add subdev-wide state struct")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/vsp1/vsp1_entity.c | 4 ++--
 drivers/staging/media/tegra-video/vi.c | 4 ++--
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 ++--
 3 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
index 6f51e5c75543..823c15facd1b 100644
--- a/drivers/media/platform/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/vsp1/vsp1_entity.c
@@ -676,9 +676,9 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	 * rectangles.
 	 */
 	entity->config = v4l2_subdev_alloc_state(&entity->subdev);
-	if (entity->config == NULL) {
+	if (IS_ERR(entity->config)) {
 		media_entity_cleanup(&entity->subdev.entity);
-		return -ENOMEM;
+		return PTR_ERR(entity->config);
 	}
 
 	return 0;
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 89709cd06d4d..d321790b07d9 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -508,8 +508,8 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 		return -ENODEV;
 
 	sd_state = v4l2_subdev_alloc_state(subdev);
-	if (!sd_state)
-		return -ENOMEM;
+	if (IS_ERR(sd_state))
+		return PTR_ERR(sd_state);
 	/*
 	 * Retrieve the format information and if requested format isn't
 	 * supported, keep the current format.
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index cca15a10c0b3..0d141155f0e3 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -253,8 +253,8 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	int ret;
 
 	sd_state = v4l2_subdev_alloc_state(sd);
-	if (sd_state == NULL)
-		return -ENOMEM;
+	if (IS_ERR(sd_state))
+		return PTR_ERR(sd_state);
 
 	if (!rvin_format_from_pixel(vin, pix->pixelformat))
 		pix->pixelformat = RVIN_DEFAULT_FORMAT;
-- 
2.30.2

