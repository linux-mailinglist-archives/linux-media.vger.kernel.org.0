Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723DD39C86E
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 15:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhFENU3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 09:20:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:35080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230035AbhFENU0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 5 Jun 2021 09:20:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 992C06141E;
        Sat,  5 Jun 2021 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622899117;
        bh=janX6lGWpNvG0PUkf3rzM6SEjOBtmIx/px5pdUZ6VA0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O58oyru+MIUDZzSrVWVjISx+l3QpbCr8+ul9AuEzs8f5ojYrYwI3Iu9LC8cos0/TE
         UoGIBc7AQGmmNWV/JwYsRNI9UMUUBZAsi0VT7sqp8A8DEmn9Fu+qCe4TztxpxAnHNw
         bWHymrNh8p2XBUQ9Z4Pit6Cbaer9D7V9IqYg548WZWFE30TKkSn9tHamlgp3f4uS37
         BJDr8LsMnsGwRVZv5qngOy7NZ3PAkM15j8FX77Sqk8ELHP31Hv8SjmB++l2hKeWBV+
         dtbzakbHG1A/8UIO9/is8zdmaY/cm1sjki0Eb08Bpbgbn+0OdOrJPJKNwjfXo6nFYz
         9W+DDm3W+VPNg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lpWCB-008GEr-Gf; Sat, 05 Jun 2021 15:18:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 06/34] media: admin-guide: avoid using ReST :doc:`foo` markup
Date:   Sat,  5 Jun 2021 15:18:05 +0200
Message-Id: <02010aebf09b64f32c33f8d8ad2d02a9f1ff59d1.1622898327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622898327.git.mchehab+huawei@kernel.org>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/bt8xx.rst   | 15 ++++++++-------
 Documentation/admin-guide/media/bttv.rst    | 21 +++++++++++----------
 Documentation/admin-guide/media/saa7134.rst |  3 ++-
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/media/bt8xx.rst b/Documentation/admin-guide/media/bt8xx.rst
index 1382ada1e38e..3589f6ab7e46 100644
--- a/Documentation/admin-guide/media/bt8xx.rst
+++ b/Documentation/admin-guide/media/bt8xx.rst
@@ -15,11 +15,12 @@ Authors:
 General information
 -------------------
 
-This class of cards has a bt878a as the PCI interface, and require the bttv driver
-for accessing the i2c bus and the gpio pins of the bt8xx chipset.
+This class of cards has a bt878a as the PCI interface, and require the bttv
+driver for accessing the i2c bus and the gpio pins of the bt8xx chipset.
 
-Please see :doc:`bttv-cardlist` for a complete list of Cards based on the
-Conexant Bt8xx PCI bridge supported by the Linux Kernel.
+Please see Documentation/admin-guide/media/bttv-cardlist.rst for a complete
+list of Cards based on the Conexant Bt8xx PCI bridge supported by the
+Linux Kernel.
 
 In order to be able to compile the kernel, some config options should be
 enabled::
@@ -80,7 +81,7 @@ for dvb-bt8xx drivers by passing modprobe parameters may be necessary.
 Running TwinHan and Clones
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-As shown at :doc:`bttv-cardlist`, TwinHan and
+As shown at Documentation/admin-guide/media/bttv-cardlist.rst, TwinHan and
 clones use ``card=113`` modprobe parameter. So, in order to properly
 detect it for devices without EEPROM, you should use::
 
@@ -105,12 +106,12 @@ The autodetected values are determined by the cards' "response string".
 In your logs see f. ex.: dst_get_device_id: Recognize [DSTMCI].
 
 For bug reports please send in a complete log with verbose=4 activated.
-Please also see :doc:`ci`.
+Please also see Documentation/admin-guide/media/ci.rst.
 
 Running multiple cards
 ~~~~~~~~~~~~~~~~~~~~~~
 
-See :doc:`bttv-cardlist` for a complete list of
+See Documentation/admin-guide/media/bttv-cardlist.rst for a complete list of
 Card ID. Some examples:
 
 	===========================	===
diff --git a/Documentation/admin-guide/media/bttv.rst b/Documentation/admin-guide/media/bttv.rst
index 0ef1f203104d..125f6f47123d 100644
--- a/Documentation/admin-guide/media/bttv.rst
+++ b/Documentation/admin-guide/media/bttv.rst
@@ -24,7 +24,8 @@ If your board has digital TV, you'll also need::
 
     ./scripts/config -m DVB_BT8XX
 
-In this case, please see :doc:`bt8xx` for additional notes.
+In this case, please see Documentation/admin-guide/media/bt8xx.rst
+for additional notes.
 
 Make bttv work with your card
 -----------------------------
@@ -39,7 +40,7 @@ If it doesn't bttv likely could not autodetect your card and needs some
 insmod options.  The most important insmod option for bttv is "card=n"
 to select the correct card type.  If you get video but no sound you've
 very likely specified the wrong (or no) card type.  A list of supported
-cards is in :doc:`bttv-cardlist`.
+cards is in Documentation/admin-guide/media/bttv-cardlist.rst.
 
 If bttv takes very long to load (happens sometimes with the cheap
 cards which have no tuner), try adding this to your modules configuration
@@ -57,8 +58,8 @@ directory should be enough for it to be autoload during the driver's
 probing mode (e. g. when the Kernel boots or when the driver is
 manually loaded via ``modprobe`` command).
 
-If your card isn't listed in :doc:`bttv-cardlist` or if you have
-trouble making audio work, please read :ref:`still_doesnt_work`.
+If your card isn't listed in Documentation/admin-guide/media/bttv-cardlist.rst
+or if you have trouble making audio work, please read :ref:`still_doesnt_work`.
 
 
 Autodetecting cards
@@ -77,8 +78,8 @@ the Subsystem ID in the second line, looks like this:
 only bt878-based cards can have a subsystem ID (which does not mean
 that every card really has one).  bt848 cards can't have a Subsystem
 ID and therefore can't be autodetected.  There is a list with the ID's
-at :doc:`bttv-cardlist` (in case you are interested or want to mail
-patches with updates).
+at Documentation/admin-guide/media/bttv-cardlist.rst
+(in case you are interested or want to mail patches with updates).
 
 
 .. _still_doesnt_work:
@@ -259,15 +260,15 @@ bug.  It is very helpful if you can tell where exactly it broke
 With a hard freeze you probably doesn't find anything in the logfiles.
 The only way to capture any kernel messages is to hook up a serial
 console and let some terminal application log the messages.  /me uses
-screen.  See :doc:`/admin-guide/serial-console` for details on setting
-up a serial console.
+screen.  See Documentation/admin-guide/serial-console.rst for details on
+setting up a serial console.
 
-Read :doc:`/admin-guide/bug-hunting` to learn how to get any useful
+Read Documentation/admin-guide/bug-hunting.rst to learn how to get any useful
 information out of a register+stack dump printed by the kernel on
 protection faults (so-called "kernel oops").
 
 If you run into some kind of deadlock, you can try to dump a call trace
-for each process using sysrq-t (see :doc:`/admin-guide/sysrq`).
+for each process using sysrq-t (see Documentation/admin-guide/sysrq.rst).
 This way it is possible to figure where *exactly* some process in "D"
 state is stuck.
 
diff --git a/Documentation/admin-guide/media/saa7134.rst b/Documentation/admin-guide/media/saa7134.rst
index 7ab9c70b9abe..51eae7eb5ab7 100644
--- a/Documentation/admin-guide/media/saa7134.rst
+++ b/Documentation/admin-guide/media/saa7134.rst
@@ -50,7 +50,8 @@ To build and install, you should run::
 Once the new Kernel is booted, saa7134 driver should be loaded automatically.
 
 Depending on the card you might have to pass ``card=<nr>`` as insmod option.
-If so, please check :doc:`saa7134-cardlist` for valid choices.
+If so, please check Documentation/admin-guide/media/saa7134-cardlist.rst
+for valid choices.
 
 Once you have your card type number, you can pass a modules configuration
 via a file (usually, it is either ``/etc/modules.conf`` or some file at
-- 
2.31.1

