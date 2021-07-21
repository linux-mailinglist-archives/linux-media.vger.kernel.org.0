Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F173D1252
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 17:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239797AbhGUOou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 10:44:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:35192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237983AbhGUOou (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 10:44:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E8D761019;
        Wed, 21 Jul 2021 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626881126;
        bh=q0qmFKoQHFOjKVXrivEKxEo8pwCPzGuiEq0fkOew1ws=;
        h=From:To:Cc:Subject:Date:From;
        b=EjUc+ZGi3vqpbw+zT5T1m6aYf2iKBQFXxnlst/1u7eRlQnHjnt3I5D7fSw9w1cWm7
         f/70hlkaPSDXZ42nJ0qhDut6Vki3N9K27omo53aMnRlIREGXIP2ot8XNIzRVzjfwXj
         Fe/qyHukrmqOOM+rFW6BMwCZpIYovAC5oVRTq/o2LjhjMKaGfbn0uQVsXJkkcDbkUb
         vvR5dHqbmKtnWyQH6qAHbrlPnoOiIq3AYxA3CQh/TsL8pJjM2l0xSP9ytIvPCiqN3i
         MU9mqXgruNBb2Waan88gGgI2QvAGaVNuEN3U54lOm72wCx81wqRyIg/keo7StpD4Ey
         2vtpeczphi3fw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     niklas.soderlund+renesas@ragnatech.se, geert+renesas@glider.be,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: rcar_drif: select CONFIG_V4L2_ASYNC
Date:   Wed, 21 Jul 2021 17:24:59 +0200
Message-Id: <20210721152522.2928952-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Without this, I see a randconfig link failure:

aarch64-linux-ld: drivers/media/platform/rcar_drif.o: in function `rcar_drif_remove':
rcar_drif.c:(.text+0x2a8): undefined reference to `v4l2_async_notifier_unregister'
aarch64-linux-ld: rcar_drif.c:(.text+0x2b0): undefined reference to `v4l2_async_notifier_cleanup'
aarch64-linux-ld: drivers/media/platform/rcar_drif.o: in function `rcar_drif_sdr_probe':
rcar_drif.c:(.text+0x1444): undefined reference to `v4l2_async_notifier_init'
aarch64-linux-ld: rcar_drif.c:(.text+0x14a0): undefined reference to `v4l2_async_notifier_register'
aarch64-linux-ld: rcar_drif.c:(.text+0x14d8): undefined reference to `v4l2_async_notifier_cleanup'
aarch64-linux-ld: rcar_drif.c:(.text+0x15a8): undefined reference to `__v4l2_async_notifier_add_fwnode_subdev'

I could not easily figure out when this was introduced, as this code
has not changed in a while but I only saw the problem recently.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 157c924686e4..c5d1c83bd582 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -635,6 +635,7 @@ config VIDEO_RCAR_DRIF
 	depends on VIDEO_V4L2
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select VIDEOBUF2_VMALLOC
+	select V4L2_ASYNC
 	help
 	  Say Y if you want to enable R-Car Gen3 DRIF support. DRIF is Digital
 	  Radio Interface that interfaces with an RF front end chip. It is a
-- 
2.29.2

