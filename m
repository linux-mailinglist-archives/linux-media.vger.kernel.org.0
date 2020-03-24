Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D89191318
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 15:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbgCXO01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 10:26:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:35806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727894AbgCXO00 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 10:26:26 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 76CD4208E0;
        Tue, 24 Mar 2020 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585059985;
        bh=cL0BLqma9/afGrVRw6wv2HjXvWZfwS9SlngDwmWrnZw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uXM6P83Dsxuo6s/hfOhIyrIi42bB1fXrK4HAFIrBK0e77IjeI2WsCTRywAS6xWdmR
         MMvUzAJ4UDHnwhTrQ7RoAKaRCqYy7zVqgUqR0IHb+Egs091+RrG5gSS4hvhF69n+t9
         6Vm/9OerIEiPn6rPTbQ1gf53q7GcyBh6vUgO95nc=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGkVb-00266j-MC; Tue, 24 Mar 2020 15:26:23 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 05/20] media: Kconfig: update the MEDIA_SUPPORT help message
Date:   Tue, 24 Mar 2020 15:26:06 +0100
Message-Id: <d3634df983d2db9052bb09808b683791981e1b3f.1585059896.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1585059896.git.mchehab+huawei@kernel.org>
References: <cover.1585059896.git.mchehab+huawei@kernel.org>
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
index 586d8931d9fc..18dea82d76d7 100644
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
2.24.1

