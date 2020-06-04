Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2031EE180
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgFDJke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727879AbgFDJke (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:40:34 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48F9C03E96E
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 02:40:33 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:c96f:783c:a430:4a5a])
        by andre.telenet-ops.be with bizsmtp
        id mxgX2200t0MBGRv01xgXJU; Thu, 04 Jun 2020 11:40:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jgmMR-0001SK-Rn; Thu, 04 Jun 2020 11:40:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jgmMR-0003xi-Qh; Thu, 04 Jun 2020 11:40:31 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] media: Remove superfluous dependency for MEDIA_SUPPORT_FILTER
Date:   Thu,  4 Jun 2020 11:40:30 +0200
Message-Id: <20200604094030.14564-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MEDIA_SUPPORT_FILTER configuration option is located inside a block
protected by "#if MEDIA_SUPPORT", so there is no need to have an
explicit dependency on MEDIA_SUPPORT.  Drop it.

Fixes: c6774ee035dcb878 ("media: Kconfig: make filtering devices optional")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/media/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index a6d073f2e036aa34..6222b3ae220ba85b 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -24,7 +24,6 @@ if MEDIA_SUPPORT
 
 config MEDIA_SUPPORT_FILTER
 	bool "Filter media drivers"
-	depends on MEDIA_SUPPORT
 	default y if !EMBEDDED && !EXPERT
 	help
 	   Configuring the media subsystem can be complex, as there are
-- 
2.17.1

