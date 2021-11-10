Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1A844BF59
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 11:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhKJLCA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 06:02:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:38760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231344AbhKJLB7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 06:01:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 59A4061205;
        Wed, 10 Nov 2021 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636541952;
        bh=lrO+JY2QDNzmXXL3NwoO4JWc7UMB3ftP9XCOGAxG6Qo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ggSMzIbB/yz1AWLoILW3lJ7p+JCvoN2xJmnfaX7rvGHp43H0DszcoOr0lIb6EZTtx
         ndi/nHK25x5lyoBwCEjd2DgdRKYSme3901q3CYujZcq9K/E0byynw8iFiA0DnI7wHD
         5xzOLKGDy5ClimLt8ivFanE0mOuGOk/HzyzFvxuNVC96o0UIuvdC4X/5xll0gbLe65
         IDrSb3JVhhxltMlcibNkgQ7sOgpCEpY3X3UQ8PA8vlcv0s8z2ELAFy3jK68whppOJ5
         KUqTvUYsTgb/WAGGIQofK826pe2nSQaZbIpGUy03suxFbQQUj2Q4nxvZkxuJi2FKZj
         qvYMAyqND0zFw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mklJt-002rxG-8u; Wed, 10 Nov 2021 10:59:09 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 2/2] media: atomisp-ov2680: properly set the vts value
Date:   Wed, 10 Nov 2021 10:59:08 +0000
Message-Id: <4bada6cb5cb0d70d736ecb93f9c6dc2719d4241c.1636541941.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <46ec939d911fc94b8a5e217874655e60512ad773.1636541941.git.mchehab+huawei@kernel.org>
References: <46ec939d911fc94b8a5e217874655e60512ad773.1636541941.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vts value should be set before being checked, as otherwise a
warning will arise:

	drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: In function 'ov2680_set_fmt':
	drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:873:33: warning: 'vts' may be used uninitialized
	[-Wmaybe-uninitialized]
	  873 |         if (dev->exposure > vts - OV2680_INTEGRATION_TIME_MARGIN)

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>
Fixes: 62b984359b6f ("media: atomisp-ov2680: Fix ov2680_set_fmt() messing up high exposure settings")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 497884d332e1..d24f8830fd94 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -869,11 +869,11 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		dev_err(&client->dev,
 			"ov2680 write resolution register err: %d\n", ret);
 
+	vts = dev->res->lines_per_frame;
+
 	/* If necessary increase the VTS to match exposure + MARGIN */
 	if (dev->exposure > vts - OV2680_INTEGRATION_TIME_MARGIN)
 		vts = dev->exposure + OV2680_INTEGRATION_TIME_MARGIN;
-	else
-		vts = dev->res->lines_per_frame;
 
 	ret = ov2680_write_reg(client, 2, OV2680_TIMING_VTS_H, vts);
 	if (ret)
-- 
2.33.1

