Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A9517FF3E
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727411AbgCJNpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:45:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:37456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbgCJNnS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:18 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0B5D124655;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=v1ibHBg6DTRtUp+SedmMmXeNHtn4raAyh+0/LYsY63M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rYQS006drAvezb72he/BiufCMnUJADj2ImXeUJN96UYuenKKY1t3OPlWM3OdVqDoM
         85fy99N64USF3pqlsEVNlm7zACoWqT6h7uTYx8W06xkv32UyGLD3nLp0XqFzkNIbUP
         X/ithqDDUHKbomYBYXmtJ4MH+gh1hnv7QydlL/0s=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005vU-27; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 04/22] media: docs: split ci.rst into uAPI and user guide docs
Date:   Tue, 10 Mar 2020 14:42:55 +0100
Message-Id: <72365309c5e6c3ae13654d171ef4bdedc400fc6e.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ci.rst file contains two parts: the first one describing
how to use the CA high level interface; the second one with
uAPI internals.

Split this on two separate files, adding the uAPI bits
to the DVB ca.rst configuration.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/media/dvb-drivers/ci.rst        | 160 +-----------------
 Documentation/media/uapi/dvb/ca.rst           |   1 +
 .../media/uapi/dvb/ca_high_level.rst          | 157 +++++++++++++++++
 3 files changed, 161 insertions(+), 157 deletions(-)
 create mode 100644 Documentation/media/uapi/dvb/ca_high_level.rst

diff --git a/Documentation/media/dvb-drivers/ci.rst b/Documentation/media/dvb-drivers/ci.rst
index 35f33f1f9e2a..ded4d8fbbf92 100644
--- a/Documentation/media/dvb-drivers/ci.rst
+++ b/Documentation/media/dvb-drivers/ci.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-Digital TV Conditional Access Interface (CI API)
-================================================
+Digital TV Conditional Access Interface
+=======================================
 
 
 .. note::
@@ -15,7 +15,7 @@ existing low level CI API.
 .. note::
 
    For the Twinhan/Twinhan clones, the dst_ca module handles the CI
-   hardware handling.This module is loaded automatically if a CI
+   hardware handling. This module is loaded automatically if a CI
    (Common Interface, that holds the CAM (Conditional Access Module)
    is detected.
 
@@ -75,157 +75,3 @@ Modules that have been tested by this driver at present are
 (1) Irdeto 1 and 2 from SCM
 (2) Viaccess from SCM
 (3) Dragoncam
-
-The High level CI API
-~~~~~~~~~~~~~~~~~~~~~
-
-For the programmer
-^^^^^^^^^^^^^^^^^^
-
-With the High Level CI approach any new card with almost any random
-architecture can be implemented with this style, the definitions
-inside the switch statement can be easily adapted for any card, thereby
-eliminating the need for any additional ioctls.
-
-The disadvantage is that the driver/hardware has to manage the rest. For
-the application programmer it would be as simple as sending/receiving an
-array to/from the CI ioctls as defined in the Linux DVB API. No changes
-have been made in the API to accommodate this feature.
-
-
-Why the need for another CI interface?
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-This is one of the most commonly asked question. Well a nice question.
-Strictly speaking this is not a new interface.
-
-The CI interface is defined in the DVB API in ca.h as:
-
-.. code-block:: c
-
-	typedef struct ca_slot_info {
-		int num;               /* slot number */
-
-		int type;              /* CA interface this slot supports */
-	#define CA_CI            1     /* CI high level interface */
-	#define CA_CI_LINK       2     /* CI link layer level interface */
-	#define CA_CI_PHYS       4     /* CI physical layer level interface */
-	#define CA_DESCR         8     /* built-in descrambler */
-	#define CA_SC          128     /* simple smart card interface */
-
-		unsigned int flags;
-	#define CA_CI_MODULE_PRESENT 1 /* module (or card) inserted */
-	#define CA_CI_MODULE_READY   2
-	} ca_slot_info_t;
-
-This CI interface follows the CI high level interface, which is not
-implemented by most applications. Hence this area is revisited.
-
-This CI interface is quite different in the case that it tries to
-accommodate all other CI based devices, that fall into the other categories.
-
-This means that this CI interface handles the EN50221 style tags in the
-Application layer only and no session management is taken care of by the
-application. The driver/hardware will take care of all that.
-
-This interface is purely an EN50221 interface exchanging APDU's. This
-means that no session management, link layer or a transport layer do
-exist in this case in the application to driver communication. It is
-as simple as that. The driver/hardware has to take care of that.
-
-With this High Level CI interface, the interface can be defined with the
-regular ioctls.
-
-All these ioctls are also valid for the High level CI interface
-
-#define CA_RESET          _IO('o', 128)
-#define CA_GET_CAP        _IOR('o', 129, ca_caps_t)
-#define CA_GET_SLOT_INFO  _IOR('o', 130, ca_slot_info_t)
-#define CA_GET_DESCR_INFO _IOR('o', 131, ca_descr_info_t)
-#define CA_GET_MSG        _IOR('o', 132, ca_msg_t)
-#define CA_SEND_MSG       _IOW('o', 133, ca_msg_t)
-#define CA_SET_DESCR      _IOW('o', 134, ca_descr_t)
-
-
-On querying the device, the device yields information thus:
-
-.. code-block:: none
-
-	CA_GET_SLOT_INFO
-	----------------------------
-	Command = [info]
-	APP: Number=[1]
-	APP: Type=[1]
-	APP: flags=[1]
-	APP: CI High level interface
-	APP: CA/CI Module Present
-
-	CA_GET_CAP
-	----------------------------
-	Command = [caps]
-	APP: Slots=[1]
-	APP: Type=[1]
-	APP: Descrambler keys=[16]
-	APP: Type=[1]
-
-	CA_SEND_MSG
-	----------------------------
-	Descriptors(Program Level)=[ 09 06 06 04 05 50 ff f1]
-	Found CA descriptor @ program level
-
-	(20) ES type=[2] ES pid=[201]  ES length =[0 (0x0)]
-	(25) ES type=[4] ES pid=[301]  ES length =[0 (0x0)]
-	ca_message length is 25 (0x19) bytes
-	EN50221 CA MSG=[ 9f 80 32 19 03 01 2d d1 f0 08 01 09 06 06 04 05 50 ff f1 02 e0 c9 00 00 04 e1 2d 00 00]
-
-
-Not all ioctl's are implemented in the driver from the API, the other
-features of the hardware that cannot be implemented by the API are achieved
-using the CA_GET_MSG and CA_SEND_MSG ioctls. An EN50221 style wrapper is
-used to exchange the data to maintain compatibility with other hardware.
-
-.. code-block:: c
-
-	/* a message to/from a CI-CAM */
-	typedef struct ca_msg {
-		unsigned int index;
-		unsigned int type;
-		unsigned int length;
-		unsigned char msg[256];
-	} ca_msg_t;
-
-
-The flow of data can be described thus,
-
-.. code-block:: none
-
-	App (User)
-	-----
-	parse
-	  |
-	  |
-	  v
-	en50221 APDU (package)
-   --------------------------------------
-   |	  |				| High Level CI driver
-   |	  |				|
-   |	  v				|
-   |	en50221 APDU (unpackage)	|
-   |	  |				|
-   |	  |				|
-   |	  v				|
-   |	sanity checks			|
-   |	  |				|
-   |	  |				|
-   |	  v				|
-   |	do (H/W dep)			|
-   --------------------------------------
-	  |    Hardware
-	  |
-	  v
-
-
-
-
-The High Level CI interface uses the EN50221 DVB standard, following a
-standard ensures futureproofness.
diff --git a/Documentation/media/uapi/dvb/ca.rst b/Documentation/media/uapi/dvb/ca.rst
index 8796512c1378..c6ee624b1234 100644
--- a/Documentation/media/uapi/dvb/ca.rst
+++ b/Documentation/media/uapi/dvb/ca.rst
@@ -29,3 +29,4 @@ application.
 
     ca_data_types
     ca_function_calls
+    ca_high_level
diff --git a/Documentation/media/uapi/dvb/ca_high_level.rst b/Documentation/media/uapi/dvb/ca_high_level.rst
new file mode 100644
index 000000000000..a73f3691c31f
--- /dev/null
+++ b/Documentation/media/uapi/dvb/ca_high_level.rst
@@ -0,0 +1,157 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The High level CI API
+=====================
+
+.. note::
+
+   This documentation is outdated.
+
+This document describes the high level CI API as in accordance to the
+Linux DVB API.
+
+
+With the High Level CI approach any new card with almost any random
+architecture can be implemented with this style, the definitions
+inside the switch statement can be easily adapted for any card, thereby
+eliminating the need for any additional ioctls.
+
+The disadvantage is that the driver/hardware has to manage the rest. For
+the application programmer it would be as simple as sending/receiving an
+array to/from the CI ioctls as defined in the Linux DVB API. No changes
+have been made in the API to accommodate this feature.
+
+
+Why the need for another CI interface?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This is one of the most commonly asked question. Well a nice question.
+Strictly speaking this is not a new interface.
+
+The CI interface is defined in the DVB API in ca.h as:
+
+.. code-block:: c
+
+	typedef struct ca_slot_info {
+		int num;               /* slot number */
+
+		int type;              /* CA interface this slot supports */
+	#define CA_CI            1     /* CI high level interface */
+	#define CA_CI_LINK       2     /* CI link layer level interface */
+	#define CA_CI_PHYS       4     /* CI physical layer level interface */
+	#define CA_DESCR         8     /* built-in descrambler */
+	#define CA_SC          128     /* simple smart card interface */
+
+		unsigned int flags;
+	#define CA_CI_MODULE_PRESENT 1 /* module (or card) inserted */
+	#define CA_CI_MODULE_READY   2
+	} ca_slot_info_t;
+
+This CI interface follows the CI high level interface, which is not
+implemented by most applications. Hence this area is revisited.
+
+This CI interface is quite different in the case that it tries to
+accommodate all other CI based devices, that fall into the other categories.
+
+This means that this CI interface handles the EN50221 style tags in the
+Application layer only and no session management is taken care of by the
+application. The driver/hardware will take care of all that.
+
+This interface is purely an EN50221 interface exchanging APDU's. This
+means that no session management, link layer or a transport layer do
+exist in this case in the application to driver communication. It is
+as simple as that. The driver/hardware has to take care of that.
+
+With this High Level CI interface, the interface can be defined with the
+regular ioctls.
+
+All these ioctls are also valid for the High level CI interface
+
+#define CA_RESET          _IO('o', 128)
+#define CA_GET_CAP        _IOR('o', 129, ca_caps_t)
+#define CA_GET_SLOT_INFO  _IOR('o', 130, ca_slot_info_t)
+#define CA_GET_DESCR_INFO _IOR('o', 131, ca_descr_info_t)
+#define CA_GET_MSG        _IOR('o', 132, ca_msg_t)
+#define CA_SEND_MSG       _IOW('o', 133, ca_msg_t)
+#define CA_SET_DESCR      _IOW('o', 134, ca_descr_t)
+
+
+On querying the device, the device yields information thus:
+
+.. code-block:: none
+
+	CA_GET_SLOT_INFO
+	----------------------------
+	Command = [info]
+	APP: Number=[1]
+	APP: Type=[1]
+	APP: flags=[1]
+	APP: CI High level interface
+	APP: CA/CI Module Present
+
+	CA_GET_CAP
+	----------------------------
+	Command = [caps]
+	APP: Slots=[1]
+	APP: Type=[1]
+	APP: Descrambler keys=[16]
+	APP: Type=[1]
+
+	CA_SEND_MSG
+	----------------------------
+	Descriptors(Program Level)=[ 09 06 06 04 05 50 ff f1]
+	Found CA descriptor @ program level
+
+	(20) ES type=[2] ES pid=[201]  ES length =[0 (0x0)]
+	(25) ES type=[4] ES pid=[301]  ES length =[0 (0x0)]
+	ca_message length is 25 (0x19) bytes
+	EN50221 CA MSG=[ 9f 80 32 19 03 01 2d d1 f0 08 01 09 06 06 04 05 50 ff f1 02 e0 c9 00 00 04 e1 2d 00 00]
+
+
+Not all ioctl's are implemented in the driver from the API, the other
+features of the hardware that cannot be implemented by the API are achieved
+using the CA_GET_MSG and CA_SEND_MSG ioctls. An EN50221 style wrapper is
+used to exchange the data to maintain compatibility with other hardware.
+
+.. code-block:: c
+
+	/* a message to/from a CI-CAM */
+	typedef struct ca_msg {
+		unsigned int index;
+		unsigned int type;
+		unsigned int length;
+		unsigned char msg[256];
+	} ca_msg_t;
+
+
+The flow of data can be described thus,
+
+.. code-block:: none
+
+	App (User)
+	-----
+	parse
+	  |
+	  |
+	  v
+	en50221 APDU (package)
+   --------------------------------------
+   |	  |				| High Level CI driver
+   |	  |				|
+   |	  v				|
+   |	en50221 APDU (unpackage)	|
+   |	  |				|
+   |	  |				|
+   |	  v				|
+   |	sanity checks			|
+   |	  |				|
+   |	  |				|
+   |	  v				|
+   |	do (H/W dep)			|
+   --------------------------------------
+	  |    Hardware
+	  |
+	  v
+
+The High Level CI interface uses the EN50221 DVB standard, following a
+standard ensures futureproofness.
-- 
2.24.1

