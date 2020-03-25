Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928CD1924A7
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbgCYJtw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:51374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727487AbgCYJtl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:41 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3EDE82137B;
        Wed, 25 Mar 2020 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129780;
        bh=xJvPJCZSm+86XclpOcuvmuWHs8D1xY+L0mEkVTz/HRg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pJ+kTZMG2Im94U9TEpkvFWmMrbA2b2+sYb0p1oDvyKx+yu9xN46LKfrCFfFFE5e1M
         YQcVtdMpixW9JJdSxuUWkF0VrBLYmUbIDTDgV0D2xHyYBBcVLztniqxInVw4MxbI3B
         n6cNAH/lYhQ82BMO0udgl2X/ElGRwnYYVhg5sTZ4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HUI-G3; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 16/22] media: Kconfig: better organize menu items
Date:   Wed, 25 Mar 2020 10:49:30 +0100
Message-Id: <3fcb0701bc73f69036aefcbd41207ae21b707520.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Place all API specific bits together

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 3872e46545e6..4fbebb6bda15 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -130,10 +130,6 @@ endmenu # media device types
 
 comment "Media core options"
 
-source "drivers/media/cec/Kconfig"
-
-source "drivers/media/mc/Kconfig"
-
 #
 # Video4Linux support
 #	Only enables if one of the V4L2 types (ATV, webcam, radio) is selected
@@ -153,8 +149,6 @@ config MEDIA_CONTROLLER
 
 	  This API is mostly used by camera interfaces in embedded platforms.
 
-source "drivers/media/v4l2-core/Kconfig"
-
 #
 # DVB Core
 #	Only enables if one of DTV is selected
@@ -170,7 +164,10 @@ config DVB_CORE
 
 	help
 
+source "drivers/media/v4l2-core/Kconfig"
+source "drivers/media/mc/Kconfig"
 source "drivers/media/dvb-core/Kconfig"
+source "drivers/media/cec/Kconfig"
 
 comment "Media drivers"
 
-- 
2.25.1

