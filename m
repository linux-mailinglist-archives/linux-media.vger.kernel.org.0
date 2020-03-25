Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1CC61924A1
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgCYJtr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:51354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727498AbgCYJtl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:41 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61B8E216FD;
        Wed, 25 Mar 2020 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129780;
        bh=goebKDPYxdQMig2uMfeGKfDFiiRzNxXgdbzpL7eda4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mmzYbBK6o3qzzhVAtaTg6bvBONORiOg2Kq7Nue2wIrzcA9WN7QpiWdzoz/JTXZs/9
         NFelzxdIC/ZXUsnxNvogxGKIqR4c5LRfd+r9ByztZLAPv3vImjM7zC10xwQmgECgfK
         KWdYfYTrCmL8y1+JTYrNWvakOLDH8bMS2inMlLXo=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HUh-KV; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 21/22] media: Kconfig: simplify some dependencies
Date:   Wed, 25 Mar 2020 10:49:35 +0100
Message-Id: <5c84bcccafa952dbd3b22083bcbd3ed0eeeb4225.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

both DVB_CORE and VIDEO_DEV already depends on MEDIA_SUPPORT,
as they're below an if block.

So, remove this double dependency.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index c900263438a7..2a69b8024a0f 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -156,7 +156,6 @@ menu "Media core support"
 
 config VIDEO_DEV
 	tristate "Video4Linux core"
-	depends on MEDIA_SUPPORT
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT
 	help
 	  Enables the V4L2 API, used by cameras, analog TV, video grabbers,
@@ -173,7 +172,6 @@ config MEDIA_CONTROLLER
 
 config DVB_CORE
 	tristate "Digital TV core"
-	depends on MEDIA_SUPPORT
 	default MEDIA_DIGITAL_TV_SUPPORT
 	depends on (I2C || I2C=n)
 	select CRC32
-- 
2.25.1

