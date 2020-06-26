Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB8420B331
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 16:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728749AbgFZOFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 10:05:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:50128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729026AbgFZOFD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 10:05:03 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A9EF20EDD;
        Fri, 26 Jun 2020 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593180302;
        bh=KjUXv18kRVWp8rh+CiIbUnSk6gfL0GHohn7bUkALQFk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AESV5EUD0e8WEZrzl9aXz4Gd0P2ggCgehozgb9uBstrARhhWQN3M+/mz0rMEDjG4A
         yDlggtWH2dcI2m3p/5lKynujycqia2CjeThaS1//LyH5yPfmgTR+C0p8703qfjdmaB
         EjFcGG5+ljxemRjnm9YEqoSY6qC0B3uPTFr1cTN0=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jooyS-00HKwL-5c; Fri, 26 Jun 2020 16:05:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] media: atomisp: print info if gpio0 and gpio2 were detected
Date:   Fri, 26 Jun 2020 16:04:57 +0200
Message-Id: <de914595cdf8f45a98ffd5056708c87f869a5a91.1593180146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593180146.git.mchehab+huawei@kernel.org>
References: <cover.1593180146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the ACPI DSDT tables provide _CRS for the camera, the
GPIO core code should be able to handle them automatically.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e476cf1f3294..31ec21a3ba84 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -550,10 +550,14 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	gs->gpio0 = gpiod_get_index(dev, NULL, 0, GPIOD_OUT_LOW);
 	if (IS_ERR(gs->gpio0))
 		gs->gpio0 = NULL;
+	else
+		dev_info(dev, "will handle gpio0 via ACPI\n");
 
 	gs->gpio1 = gpiod_get_index(dev, NULL, 1, GPIOD_OUT_LOW);
 	if (IS_ERR(gs->gpio1))
 		gs->gpio1 = NULL;
+	else
+		dev_info(dev, "will handle gpio1 via ACPI\n");
 
 	/*
 	 * FIXME:
-- 
2.26.2

