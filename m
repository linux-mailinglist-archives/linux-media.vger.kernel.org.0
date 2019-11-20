Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F28C8103C28
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 14:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730334AbfKTNlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 08:41:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:49000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729146AbfKTNlK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 08:41:10 -0500
Received: from localhost.localdomain (unknown [118.189.143.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EA5C224FC;
        Wed, 20 Nov 2019 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574257269;
        bh=xPj3YzRv9jWa1IqK+64ukpSnBw5wrrabNTKuHooPq1I=;
        h=From:To:Cc:Subject:Date:From;
        b=bFnUTI6aLpb4O9BQ34HPPPZVqyGRs3VExNMRKIEmRp7TapJ7/OUZOAUvqRjJGVWPo
         TfPkNgiQOnQLN2+d6drNE6TsjyBcjpgdKpP3TVTWMI3CW2MDZC7/gE4kjSqBRdRjTj
         FtdwYKOZ84kw2CoKLxP8vxhpQwUrq0f/trXy7T/s=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: Fix Kconfig indentation
Date:   Wed, 20 Nov 2019 21:41:05 +0800
Message-Id: <20191120134105.14799-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/media/Kconfig              | 6 +++---
 drivers/media/radio/si470x/Kconfig | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index b36a41332867..9dfea5c4b6ab 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -208,9 +208,9 @@ config MEDIA_SUBDRV_AUTOSELECT
 	  If unsure say Y.
 
 config MEDIA_HIDE_ANCILLARY_SUBDRV
-        bool
-        depends on MEDIA_SUBDRV_AUTOSELECT && !COMPILE_TEST && !EXPERT
-        default y
+	bool
+	depends on MEDIA_SUBDRV_AUTOSELECT && !COMPILE_TEST && !EXPERT
+	default y
 
 config MEDIA_ATTACH
 	bool
diff --git a/drivers/media/radio/si470x/Kconfig b/drivers/media/radio/si470x/Kconfig
index 537f8e1601f3..a1ba8bc54b62 100644
--- a/drivers/media/radio/si470x/Kconfig
+++ b/drivers/media/radio/si470x/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config RADIO_SI470X
-        tristate "Silicon Labs Si470x FM Radio Receiver support"
-        depends on VIDEO_V4L2
+	tristate "Silicon Labs Si470x FM Radio Receiver support"
+	depends on VIDEO_V4L2
 	help
 	  This is a driver for devices with the Silicon Labs SI470x
 	  chip (either via USB or I2C buses).
-- 
2.17.1

