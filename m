Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A08E192497
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbgCYJtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:51324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727339AbgCYJtk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:40 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D89A62078E;
        Wed, 25 Mar 2020 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129780;
        bh=CwWUh6a9Zdx+QXALv97ZfMpOnRIavxM761SQ/GAwY1E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lt5cekGIHAt32qGaQdE5QnbtX0Ga8x3fQf8Bg3gLiurvr/PB7fUyWjDTjbtdY09Ec
         8475xnrw6bJ60NX5LgLIUQXpdJRloLXhR6r4QiKyAiibMXHKVY44cE+2yjAAIIqsTF
         ItNP5gid5mMynzUT7N6RfYkkVVfI6cWb+wKGPxEQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HTP-4d; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 05/22] media: reorganize the drivers menu options
Date:   Wed, 25 Mar 2020 10:49:19 +0100
Message-Id: <36513cd58de8edfed812b1a291b4346f26eabbe0.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The comments before some of the drivers support look
weird, because their Kconfig have their own "comment"
directive inside it. So, rearrange them to make it
look a little nicer for the ones with are not too
familiar with the media system.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 184c7f4f057b..e2023a268af9 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -176,6 +176,9 @@ source "drivers/media/usb/Kconfig"
 source "drivers/media/pci/Kconfig"
 source "drivers/media/radio/Kconfig"
 
+# Common driver options
+source "drivers/media/common/Kconfig"
+
 if MEDIA_PLATFORM_SUPPORT
 source "drivers/media/platform/Kconfig"
 source "drivers/media/mmc/Kconfig"
@@ -185,9 +188,6 @@ comment "Supported FireWire (IEEE 1394) Adapters"
 	depends on DVB_CORE && FIREWIRE
 source "drivers/media/firewire/Kconfig"
 
-# Common driver options
-source "drivers/media/common/Kconfig"
-
 comment "Media ancillary drivers (tuners, sensors, i2c, spi, frontends)"
 
 #
-- 
2.25.1

