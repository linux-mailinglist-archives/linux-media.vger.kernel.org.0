Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B29D25B0F2
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgIBQMi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:12:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:54044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728356AbgIBQLB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:11:01 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7F92221EE;
        Wed,  2 Sep 2020 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=Bybq2rNfz8+YFu+79t9vTEYCcLnK9U6RRVeZrJpy54M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zH/UCAIh8bJ9EuRI41MVaF3pj51wP/SxGs/N8KbuRrylHJyFovC5ocPUUQCVEpLo/
         fr3wQ0HUKt/nzEp7Jx5gJU+a251Y2RQwY58GYhJBqLZjNfCbB3bZHOYdjDtfvnxgCn
         UM1YrCjIzdOCDEruGClldRk3AxV16j9CgNNrxObU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tBP-Sq; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 37/38] media: atomisp: atomisp_gmin_platform: check before use
Date:   Wed,  2 Sep 2020 18:10:40 +0200
Message-Id: <7778f1f6c8cbc303f6f7377e0daca28a6825f862.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

solve this smatch warning:
	drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:842 gmin_v1p8_ctrl() warn: variable dereferenced before check 'gs' (see line 832)

By moving the check to happen before its usage.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index c49d27038d27..8652f71dfff6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -829,6 +829,9 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 	int ret;
 	int value;
 
+	if (!gs || gs->v1p8_on == on)
+		return 0;
+
 	if (gs->v1p8_gpio >= 0) {
 		pr_info("atomisp_gmin_platform: 1.8v power on GPIO %d\n",
 			gs->v1p8_gpio);
@@ -839,8 +842,6 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 			pr_err("V1P8 GPIO initialization failed\n");
 	}
 
-	if (!gs || gs->v1p8_on == on)
-		return 0;
 	gs->v1p8_on = on;
 
 	if (gs->v1p8_gpio >= 0)
-- 
2.26.2

