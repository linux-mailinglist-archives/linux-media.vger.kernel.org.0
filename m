Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400292C91A5
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730734AbgK3Wxi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:53:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729392AbgK3Wxi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:53:38 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38CE3C061A04
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 14:52:23 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DDE3A844;
        Mon, 30 Nov 2020 22:52:22 +0000 (UTC)
Date:   Mon, 30 Nov 2020 15:52:21 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] media: stop pretending to maintain cafe and ov7670
Message-ID: <20201130155221.4ad4c2b7@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's been a long time since I could credibly claim to be maintaining these
drivers; I'm not even sure my hardware works anymore.  Mark them orphan.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 MAINTAINERS | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3da6d8c154e4..b3358e2aa990 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3869,9 +3869,8 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/radio/radio-cadet*
 
 CAFE CMOS INTEGRATED CAMERA CONTROLLER DRIVER
-M:	Jonathan Corbet <corbet@lwn.net>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/admin-guide/media/cafe_ccic*
 F:	drivers/media/platform/marvell-ccic/
@@ -12926,9 +12925,8 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov5695.c
 
 OMNIVISION OV7670 SENSOR DRIVER
-M:	Jonathan Corbet <corbet@lwn.net>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ov7670.txt
 F:	drivers/media/i2c/ov7670.c
-- 
2.28.0

