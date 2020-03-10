Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96A9E17FF38
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbgCJNpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:45:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:37586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726809AbgCJNnS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:18 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0ED8124686;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=QV/YhrXB507I35crAk+H4cnqKUMeOOIb1T6UoCpsegk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UNsRqN6SPxeYlSV3GphBNFQfsQvIkCe1WSe2BrdolHfuvwBVg6LQajr0YKk6uWD/U
         3KnbBOJlcJyuPUD1Vy7O388SddYK2Vqr4gTuW9kZS/bEK64NktDRm+tIq/T1Fe73Oo
         pyycee3ucdlP1YmnrpJY7n3bv0x6nqFfjhtytonQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005vh-5h; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 07/22] media: docs: split development info from bttv.rst
Date:   Tue, 10 Mar 2020 14:42:58 +0100
Message-Id: <e32e499178b6c1a2d825209de69f40663fca9b6a.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file contains both admin and development stuff. Split on
two, as they're usually read by different audiences.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/v4l-drivers/bttv-devel.rst          | 123 ++++++++++++++++++
 Documentation/media/v4l-drivers/bttv.rst      | 120 -----------------
 Documentation/media/v4l-drivers/index.rst     |   1 +
 3 files changed, 124 insertions(+), 120 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/bttv-devel.rst

diff --git a/Documentation/media/v4l-drivers/bttv-devel.rst b/Documentation/media/v4l-drivers/bttv-devel.rst
new file mode 100644
index 000000000000..396fad572c93
--- /dev/null
+++ b/Documentation/media/v4l-drivers/bttv-devel.rst
@@ -0,0 +1,123 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The bttv driver
+===============
+
+bttv and sound mini howto
+-------------------------
+
+There are a lot of different bt848/849/878/879 based boards available.
+Making video work often is not a big deal, because this is handled
+completely by the bt8xx chip, which is common on all boards.  But
+sound is handled in slightly different ways on each board.
+
+To handle the grabber boards correctly, there is a array tvcards[] in
+bttv-cards.c, which holds the information required for each board.
+Sound will work only, if the correct entry is used (for video it often
+makes no difference).  The bttv driver prints a line to the kernel
+log, telling which card type is used.  Like this one:
+
+.. code-block:: none
+
+	bttv0: model: BT848(Hauppauge old) [autodetected]
+
+You should verify this is correct.  If it isn't, you have to pass the
+correct board type as insmod argument, "insmod bttv card=2" for
+example.  The file CARDLIST has a list of valid arguments for card.
+If your card isn't listed there, you might check the source code for
+new entries which are not listed yet.  If there isn't one for your
+card, you can check if one of the existing entries does work for you
+(just trial and error...).
+
+Some boards have an extra processor for sound to do stereo decoding
+and other nice features.  The msp34xx chips are used by Hauppauge for
+example.  If your board has one, you might have to load a helper
+module like msp3400.o to make sound work.  If there isn't one for the
+chip used on your board:  Bad luck.  Start writing a new one.  Well,
+you might want to check the video4linux mailing list archive first...
+
+Of course you need a correctly installed soundcard unless you have the
+speakers connected directly to the grabber board.  Hint: check the
+mixer settings too.  ALSA for example has everything muted by default.
+
+
+How sound works in detail
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Still doesn't work?  Looks like some driver hacking is required.
+Below is a do-it-yourself description for you.
+
+The bt8xx chips have 32 general purpose pins, and registers to control
+these pins.  One register is the output enable register
+(BT848_GPIO_OUT_EN), it says which pins are actively driven by the
+bt848 chip.  Another one is the data register (BT848_GPIO_DATA), where
+you can get/set the status if these pins.  They can be used for input
+and output.
+
+Most grabber board vendors use these pins to control an external chip
+which does the sound routing.  But every board is a little different.
+These pins are also used by some companies to drive remote control
+receiver chips.  Some boards use the i2c bus instead of the gpio pins
+to connect the mux chip.
+
+As mentioned above, there is a array which holds the required
+information for each known board.  You basically have to create a new
+line for your board.  The important fields are these two:
+
+.. code-block:: c
+
+	struct tvcard
+	{
+		[ ... ]
+		u32 gpiomask;
+		u32 audiomux[6]; /* Tuner, Radio, external, internal, mute, stereo */
+	};
+
+gpiomask specifies which pins are used to control the audio mux chip.
+The corresponding bits in the output enable register
+(BT848_GPIO_OUT_EN) will be set as these pins must be driven by the
+bt848 chip.
+
+The audiomux\[\] array holds the data values for the different inputs
+(i.e. which pins must be high/low for tuner/mute/...).  This will be
+written to the data register (BT848_GPIO_DATA) to switch the audio
+mux.
+
+
+What you have to do is figure out the correct values for gpiomask and
+the audiomux array.  If you have Windows and the drivers four your
+card installed, you might to check out if you can read these registers
+values used by the windows driver.  A tool to do this is available
+from ftp://telepresence.dmem.strath.ac.uk/pub/bt848/winutil, but it
+doesn't work with bt878 boards according to some reports I received.
+Another one with bt878 support is available from
+http://btwincap.sourceforge.net/Files/btspy2.00.zip
+
+You might also dig around in the \*.ini files of the Windows applications.
+You can have a look at the board to see which of the gpio pins are
+connected at all and then start trial-and-error ...
+
+
+Starting with release 0.7.41 bttv has a number of insmod options to
+make the gpio debugging easier:
+
+.. code-block:: none
+
+	bttv_gpio=0/1		enable/disable gpio debug messages
+	gpiomask=n		set the gpiomask value
+	audiomux=i,j,...	set the values of the audiomux array
+	audioall=a		set the values of the audiomux array (one
+				value for all array elements, useful to check
+				out which effect the particular value has).
+
+The messages printed with bttv_gpio=1 look like this:
+
+.. code-block:: none
+
+	bttv0: gpio: en=00000027, out=00000024 in=00ffffd8 [audio: off]
+
+	en  =	output _en_able register (BT848_GPIO_OUT_EN)
+	out =	_out_put bits of the data register (BT848_GPIO_DATA),
+		i.e. BT848_GPIO_DATA & BT848_GPIO_OUT_EN
+	in  = 	_in_put bits of the data register,
+		i.e. BT848_GPIO_DATA & ~BT848_GPIO_OUT_EN
diff --git a/Documentation/media/v4l-drivers/bttv.rst b/Documentation/media/v4l-drivers/bttv.rst
index f956ee264099..9b15a0cba283 100644
--- a/Documentation/media/v4l-drivers/bttv.rst
+++ b/Documentation/media/v4l-drivers/bttv.rst
@@ -438,126 +438,6 @@ parking, thus lowering arbitration performance. The Bt879 drivers must
 query for these non-compliant devices, and set the EN_VSFX bit only if
 required.
 
-bttv and sound mini howto
--------------------------
-
-There are a lot of different bt848/849/878/879 based boards available.
-Making video work often is not a big deal, because this is handled
-completely by the bt8xx chip, which is common on all boards.  But
-sound is handled in slightly different ways on each board.
-
-To handle the grabber boards correctly, there is a array tvcards[] in
-bttv-cards.c, which holds the information required for each board.
-Sound will work only, if the correct entry is used (for video it often
-makes no difference).  The bttv driver prints a line to the kernel
-log, telling which card type is used.  Like this one:
-
-.. code-block:: none
-
-	bttv0: model: BT848(Hauppauge old) [autodetected]
-
-You should verify this is correct.  If it isn't, you have to pass the
-correct board type as insmod argument, "insmod bttv card=2" for
-example.  The file CARDLIST has a list of valid arguments for card.
-If your card isn't listed there, you might check the source code for
-new entries which are not listed yet.  If there isn't one for your
-card, you can check if one of the existing entries does work for you
-(just trial and error...).
-
-Some boards have an extra processor for sound to do stereo decoding
-and other nice features.  The msp34xx chips are used by Hauppauge for
-example.  If your board has one, you might have to load a helper
-module like msp3400.o to make sound work.  If there isn't one for the
-chip used on your board:  Bad luck.  Start writing a new one.  Well,
-you might want to check the video4linux mailing list archive first...
-
-Of course you need a correctly installed soundcard unless you have the
-speakers connected directly to the grabber board.  Hint: check the
-mixer settings too.  ALSA for example has everything muted by default.
-
-
-How sound works in detail
-~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Still doesn't work?  Looks like some driver hacking is required.
-Below is a do-it-yourself description for you.
-
-The bt8xx chips have 32 general purpose pins, and registers to control
-these pins.  One register is the output enable register
-(BT848_GPIO_OUT_EN), it says which pins are actively driven by the
-bt848 chip.  Another one is the data register (BT848_GPIO_DATA), where
-you can get/set the status if these pins.  They can be used for input
-and output.
-
-Most grabber board vendors use these pins to control an external chip
-which does the sound routing.  But every board is a little different.
-These pins are also used by some companies to drive remote control
-receiver chips.  Some boards use the i2c bus instead of the gpio pins
-to connect the mux chip.
-
-As mentioned above, there is a array which holds the required
-information for each known board.  You basically have to create a new
-line for your board.  The important fields are these two:
-
-.. code-block:: c
-
-	struct tvcard
-	{
-		[ ... ]
-		u32 gpiomask;
-		u32 audiomux[6]; /* Tuner, Radio, external, internal, mute, stereo */
-	};
-
-gpiomask specifies which pins are used to control the audio mux chip.
-The corresponding bits in the output enable register
-(BT848_GPIO_OUT_EN) will be set as these pins must be driven by the
-bt848 chip.
-
-The audiomux\[\] array holds the data values for the different inputs
-(i.e. which pins must be high/low for tuner/mute/...).  This will be
-written to the data register (BT848_GPIO_DATA) to switch the audio
-mux.
-
-
-What you have to do is figure out the correct values for gpiomask and
-the audiomux array.  If you have Windows and the drivers four your
-card installed, you might to check out if you can read these registers
-values used by the windows driver.  A tool to do this is available
-from ftp://telepresence.dmem.strath.ac.uk/pub/bt848/winutil, but it
-doesn't work with bt878 boards according to some reports I received.
-Another one with bt878 support is available from
-http://btwincap.sourceforge.net/Files/btspy2.00.zip
-
-You might also dig around in the \*.ini files of the Windows applications.
-You can have a look at the board to see which of the gpio pins are
-connected at all and then start trial-and-error ...
-
-
-Starting with release 0.7.41 bttv has a number of insmod options to
-make the gpio debugging easier:
-
-.. code-block:: none
-
-	bttv_gpio=0/1		enable/disable gpio debug messages
-	gpiomask=n		set the gpiomask value
-	audiomux=i,j,...	set the values of the audiomux array
-	audioall=a		set the values of the audiomux array (one
-				value for all array elements, useful to check
-				out which effect the particular value has).
-
-The messages printed with bttv_gpio=1 look like this:
-
-.. code-block:: none
-
-	bttv0: gpio: en=00000027, out=00000024 in=00ffffd8 [audio: off]
-
-	en  =	output _en_able register (BT848_GPIO_OUT_EN)
-	out =	_out_put bits of the data register (BT848_GPIO_DATA),
-		i.e. BT848_GPIO_DATA & BT848_GPIO_OUT_EN
-	in  = 	_in_put bits of the data register,
-		i.e. BT848_GPIO_DATA & ~BT848_GPIO_OUT_EN
-
-
 
 Other elements of the tvcards array
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index 2b8e2cbfff23..52d7c8d14ee7 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -66,6 +66,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	vivid
 	zr364xx
 
+	bttv-devel
 	cpia2_devel
 	vimc-devel
 
-- 
2.24.1

