Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A771A7685
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbgDNIvb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:52296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437106AbgDNIvQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:16 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3356021655;
        Tue, 14 Apr 2020 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=Og+Ww+iGrIijHWjVDKiSfJzMgHC890kh0BXntF5xUWE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dl/d5YayXT2sOqBMOGl/GAlt4FXZzByv3yS+qtLo3ONMp05tdF/aZeEBM1Hhi5nSm
         22aZ8KdJ9FAzY71onE3ph2vnEhENsIVvqlbxeWXH11Cy2lyCPqaRKu9CKvwkxELKSy
         g4pZqldrf8/HLGbccWth+G8VM7EWuzkXjoXweg6I=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002wzu-Ft; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 15/19] media: docs: cleanup bttv-devel.rst file
Date:   Tue, 14 Apr 2020 10:51:01 +0200
Message-Id: <90dc665f2ced7b3e19e1da948d7ac44fe1ec0b08.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file was converted from text at the early ReST days.
We learnt a lot about how to produce a nicer result while
keeping the file better readable as plain text.

Change some ReST markups to make it look better, both at
the output formats and as plain text file.

While here, remove references for the old bt848/winutil
tool, as it seems that it doesn't exist anymore.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../driver-api/media/drivers/bttv-devel.rst   | 53 ++++++++-----------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/bttv-devel.rst b/Documentation/driver-api/media/drivers/bttv-devel.rst
index 396fad572c93..c9aa8b95a5e5 100644
--- a/Documentation/driver-api/media/drivers/bttv-devel.rst
+++ b/Documentation/driver-api/media/drivers/bttv-devel.rst
@@ -15,15 +15,15 @@ To handle the grabber boards correctly, there is a array tvcards[] in
 bttv-cards.c, which holds the information required for each board.
 Sound will work only, if the correct entry is used (for video it often
 makes no difference).  The bttv driver prints a line to the kernel
-log, telling which card type is used.  Like this one:
-
-.. code-block:: none
+log, telling which card type is used.  Like this one::
 
 	bttv0: model: BT848(Hauppauge old) [autodetected]
 
 You should verify this is correct.  If it isn't, you have to pass the
-correct board type as insmod argument, "insmod bttv card=2" for
-example.  The file CARDLIST has a list of valid arguments for card.
+correct board type as insmod argument, ``insmod bttv card=2`` for
+example.  The file :doc:`/admin-guide/media/bttv-cardlist` has a list
+of valid arguments for card.
+
 If your card isn't listed there, you might check the source code for
 new entries which are not listed yet.  If there isn't one for your
 card, you can check if one of the existing entries does work for you
@@ -32,7 +32,7 @@ card, you can check if one of the existing entries does work for you
 Some boards have an extra processor for sound to do stereo decoding
 and other nice features.  The msp34xx chips are used by Hauppauge for
 example.  If your board has one, you might have to load a helper
-module like msp3400.o to make sound work.  If there isn't one for the
+module like ``msp3400`` to make sound work.  If there isn't one for the
 chip used on your board:  Bad luck.  Start writing a new one.  Well,
 you might want to check the video4linux mailing list archive first...
 
@@ -49,8 +49,8 @@ Below is a do-it-yourself description for you.
 
 The bt8xx chips have 32 general purpose pins, and registers to control
 these pins.  One register is the output enable register
-(BT848_GPIO_OUT_EN), it says which pins are actively driven by the
-bt848 chip.  Another one is the data register (BT848_GPIO_DATA), where
+(``BT848_GPIO_OUT_EN``), it says which pins are actively driven by the
+bt848 chip.  Another one is the data register (``BT848_GPIO_DATA``), where
 you can get/set the status if these pins.  They can be used for input
 and output.
 
@@ -62,25 +62,23 @@ to connect the mux chip.
 
 As mentioned above, there is a array which holds the required
 information for each known board.  You basically have to create a new
-line for your board.  The important fields are these two:
+line for your board.  The important fields are these two::
 
-.. code-block:: c
-
-	struct tvcard
-	{
-		[ ... ]
-		u32 gpiomask;
-		u32 audiomux[6]; /* Tuner, Radio, external, internal, mute, stereo */
-	};
+  struct tvcard
+  {
+	[ ... ]
+	u32 gpiomask;
+	u32 audiomux[6]; /* Tuner, Radio, external, internal, mute, stereo */
+  };
 
 gpiomask specifies which pins are used to control the audio mux chip.
 The corresponding bits in the output enable register
-(BT848_GPIO_OUT_EN) will be set as these pins must be driven by the
+(``BT848_GPIO_OUT_EN``) will be set as these pins must be driven by the
 bt848 chip.
 
-The audiomux\[\] array holds the data values for the different inputs
+The ``audiomux[]`` array holds the data values for the different inputs
 (i.e. which pins must be high/low for tuner/mute/...).  This will be
-written to the data register (BT848_GPIO_DATA) to switch the audio
+written to the data register (``BT848_GPIO_DATA``) to switch the audio
 mux.
 
 
@@ -88,12 +86,9 @@ What you have to do is figure out the correct values for gpiomask and
 the audiomux array.  If you have Windows and the drivers four your
 card installed, you might to check out if you can read these registers
 values used by the windows driver.  A tool to do this is available
-from ftp://telepresence.dmem.strath.ac.uk/pub/bt848/winutil, but it
-doesn't work with bt878 boards according to some reports I received.
-Another one with bt878 support is available from
-http://btwincap.sourceforge.net/Files/btspy2.00.zip
+from http://btwincap.sourceforge.net/download.html.
 
-You might also dig around in the \*.ini files of the Windows applications.
+You might also dig around in the ``*.ini`` files of the Windows applications.
 You can have a look at the board to see which of the gpio pins are
 connected at all and then start trial-and-error ...
 
@@ -101,18 +96,16 @@ connected at all and then start trial-and-error ...
 Starting with release 0.7.41 bttv has a number of insmod options to
 make the gpio debugging easier:
 
-.. code-block:: none
-
+	=================	==============================================
 	bttv_gpio=0/1		enable/disable gpio debug messages
 	gpiomask=n		set the gpiomask value
 	audiomux=i,j,...	set the values of the audiomux array
 	audioall=a		set the values of the audiomux array (one
 				value for all array elements, useful to check
 				out which effect the particular value has).
+	=================	==============================================
 
-The messages printed with bttv_gpio=1 look like this:
-
-.. code-block:: none
+The messages printed with ``bttv_gpio=1`` look like this::
 
 	bttv0: gpio: en=00000027, out=00000024 in=00ffffd8 [audio: off]
 
-- 
2.25.2

