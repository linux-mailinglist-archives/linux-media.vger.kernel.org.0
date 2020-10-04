Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFABC282BA0
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 18:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgJDQAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 12:00:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:37812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbgJDQAg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Oct 2020 12:00:36 -0400
Received: from mail.kernel.org (ip5f5ad5a6.dynamic.kabel-deutschland.de [95.90.213.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32B7B206C1;
        Sun,  4 Oct 2020 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601827235;
        bh=7ffqmwDcNKq4pWlTL0AOzTA9uCl5ZE31pG3i8SCLvKM=;
        h=From:To:Cc:Subject:Date:From;
        b=uFKswsHeB63Uvpt3WKgSqQEoBSFe5mIBCVnNEoEJTxAVxB0KON+h9SroHmjcwlIzl
         44HPpR2+5Lzv+SIgqSTPvVvDGsfNQROYPWZlQltc5Y9DlgnoyAZCE3kU/sWp8IjVbn
         UAVQaVC/BMwfh21+BOoFjU24fJztwOrSx5OW/2d4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kP6R6-00056H-Ab; Sun, 04 Oct 2020 18:00:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Corentin Labbe <clabbe@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, mjpeg-users@lists.sourceforge.net
Subject: [PATCH] media: zoran.rst: place it at the right place this time
Date:   Sun,  4 Oct 2020 18:00:30 +0200
Message-Id: <0cef13d883e4644b4cf9b521d3f3e45355e60566.1601827201.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I was too quick moving zoran.rst... it ends that the original
patch didn't do the right thing and forgot to update the files
that references it.

Fix it.

Fixes: 6b90346919d4 ("media: zoran: move documentation file to the right place")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../driver-api/media/drivers/{v4l-drivers => }/zoran.rst        | 0
 MAINTAINERS                                                     | 2 +-
 drivers/staging/media/zoran/Kconfig                             | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/driver-api/media/drivers/{v4l-drivers => }/zoran.rst (100%)

diff --git a/Documentation/driver-api/media/drivers/v4l-drivers/zoran.rst b/Documentation/driver-api/media/drivers/zoran.rst
similarity index 100%
rename from Documentation/driver-api/media/drivers/v4l-drivers/zoran.rst
rename to Documentation/driver-api/media/drivers/zoran.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index ba5eb1dff9c2..7a12633747c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19247,7 +19247,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	http://mjpeg.sourceforge.net/driver-zoran/
 Q:	https://patchwork.linuxtv.org/project/linux-media/list/
-F:	Documentation/media/v4l-drivers/zoran.rst
+F:	Documentation/driver-api/media/drivers/zoran.rst
 F:	drivers/staging/media/zoran/
 
 ZPOOL COMPRESSED PAGE STORAGE API
diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
index 492507030276..7874842033ca 100644
--- a/drivers/staging/media/zoran/Kconfig
+++ b/drivers/staging/media/zoran/Kconfig
@@ -8,7 +8,7 @@ config VIDEO_ZORAN
 	  36057/36067 PCI controller chipset. This includes the Iomega
 	  Buz, Pinnacle DC10+ and the Linux Media Labs LML33. There is
 	  a driver homepage at <http://mjpeg.sf.net/driver-zoran/>. For
-	  more information, check <file:Documentation/media/v4l-drivers/zoran.rst>.
+	  more information, check <file:Documentation/driver-api/media/drivers/zoran.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called zr36067.
-- 
2.26.2

