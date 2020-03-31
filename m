Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621C6199512
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730708AbgCaLMk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:57900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730574AbgCaLMO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:14 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E77B21556;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=5b8/husZDb2f9SszVvpguwS14cJy1XWj19PL+VLn3vc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X/0WdSsHwR/EqFschBD/ivgPfoiVFnHWfHt/yqUNLeP04FSpSocufGLOkIl7ncYrH
         4lWKSQOEJmRONps5q6M37cZGfJNVEXlBLHgAfh7JfiGm6CCPQta8/vxmqDkywb7rC2
         vcq4TiHGocI1B8d8HX9glYPfMP2h+nTlmcHoEB+k=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bqC-4w; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 05/33] media: Kconfig: update the MEDIA_SUPPORT help message
Date:   Tue, 31 Mar 2020 13:11:41 +0200
Message-Id: <f35673b7dd282c7fc1510f2846c9f01a6907bd6c.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are more things than just cameras and TV devices on
media. Update the help message accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 31fbdb2a8d41..72d4f3e0b081 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -18,8 +18,10 @@ menuconfig MEDIA_SUPPORT
 	tristate "Multimedia support"
 	depends on HAS_IOMEM
 	help
-	  If you want to use Webcams, Video grabber devices and/or TV devices
-	  enable this option and other options below.
+	  If you want to use media devices, including Webcams, Video grabber
+	  devices and/or TV devices, V4L2 codecs, etc, enable this option
+	  and other options below.
+
 	  Additional info and docs are available on the web at
 	  <https://linuxtv.org>
 
-- 
2.25.1

