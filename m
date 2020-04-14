Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAA81A767B
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437117AbgDNIvT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:52236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437074AbgDNIvM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:12 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A33C2137B;
        Tue, 14 Apr 2020 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=WHC1EpFDxxTFXqV9Jv3iaMZBpBg6/HUx2mejUHyHxVI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KVRrY3Mti/3gLKfNugPXh4ZANDxmI0DuQXrIX1zyR2Zs3+e2Qrt6RyDt+77cnvy9p
         Fg4q/F4+a8amF/dHxgh8AW3mD4aF+PUCZgabDBTjPltfUULHa7b/mj5FrohN5uVVay
         WNHx5JWuZQFrCfMqLd6p3L5sZaK7jMfvYVZ64X0E=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002wza-9f; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 11/19] media: docs: saa7134.rst: update the documentation
Date:   Tue, 14 Apr 2020 10:50:57 +0200
Message-Id: <f2b4774a68e02a363ef94852c085d580642246ab.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several things here that are outdated, because this
document was written a long time ago.

Update them to reflect the current status of the driver and
the media subsystem.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/saa7134.rst | 57 +++++++++++++++------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/Documentation/admin-guide/media/saa7134.rst b/Documentation/admin-guide/media/saa7134.rst
index c84246dd81c0..7ab9c70b9abe 100644
--- a/Documentation/admin-guide/media/saa7134.rst
+++ b/Documentation/admin-guide/media/saa7134.rst
@@ -7,8 +7,7 @@ Author Gerd Hoffmann
 
 
 This is a v4l2/oss device driver for saa7130/33/34/35 based capture / TV
-boards.  See http://www.semiconductors.philips.com/pip/saa7134hl for a
-description.
+boards.
 
 
 Status
@@ -24,26 +23,54 @@ configuration info.
 Build
 -----
 
-Pick up videodev + v4l2 patches from http://bytesex.org/patches/.
-Configure, build, install + boot the new kernel.  You'll need at least
-these config options:
+Once you pick up a Kernel source, you should configure, build,
+install and boot the new kernel.  You'll need at least
+these config options::
 
-.. code-block:: none
+    ./scripts/config -e PCI
+    ./scripts/config -e INPUT
+    ./scripts/config -m I2C
+    ./scripts/config -m MEDIA_SUPPORT
+    ./scripts/config -e MEDIA_PCI_SUPPORT
+    ./scripts/config -e MEDIA_ANALOG_TV_SUPPORT
+    ./scripts/config -e MEDIA_DIGITAL_TV_SUPPORT
+    ./scripts/config -e MEDIA_RADIO_SUPPORT
+    ./scripts/config -e RC_CORE
+    ./scripts/config -e MEDIA_SUBDRV_AUTOSELECT
+    ./scripts/config -m VIDEO_SAA7134
+    ./scripts/config -e SAA7134_ALSA
+    ./scripts/config -e VIDEO_SAA7134_RC
+    ./scripts/config -e VIDEO_SAA7134_DVB
+    ./scripts/config -e VIDEO_SAA7134_GO7007
 
-	CONFIG_I2C=m
-	CONFIG_VIDEO_DEV=m
+To build and install, you should run::
 
-Type "make" to build the driver now.  "make install" installs the
-driver.  "modprobe saa7134" should load it.  Depending on the card you
-might have to pass card=<nr> as insmod option, check CARDLIST for
-valid choices.
+    make && make modules_install && make install
+
+Once the new Kernel is booted, saa7134 driver should be loaded automatically.
+
+Depending on the card you might have to pass ``card=<nr>`` as insmod option.
+If so, please check :doc:`saa7134-cardlist` for valid choices.
+
+Once you have your card type number, you can pass a modules configuration
+via a file (usually, it is either ``/etc/modules.conf`` or some file at
+``/etc/modules-load.d/``, but the actual place depends on your
+distribution), with this content::
+
+    options saa7134 card=13 # Assuming that your card type is #13
 
 
 Changes / Fixes
 ---------------
 
-Please mail me unified diffs ("diff -u") with your changes, and don't
-forget to tell me what it changes / which problem it fixes / whatever
+Please mail to linux-media AT vger.kernel.org unified diffs against
+the linux media git tree:
+
+    https://git.linuxtv.org/media_tree.git/
+
+This is done by committing a patch at a clone of the git tree and
+submitting the patch using ``git send-email``. Don't forget to
+describe at the lots  what it changes / which problem it fixes / whatever
 it is good for ...
 
 
@@ -52,7 +79,7 @@ Known Problems
 
 * The tuner for the flyvideos isn't detected automatically and the
   default might not work for you depending on which version you have.
-  There is a tuner= insmod option to override the driver's default.
+  There is a ``tuner=`` insmod option to override the driver's default.
 
 Credits
 -------
-- 
2.25.2

