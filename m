Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F9A58A4F
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfF0S5R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:17 -0400
Received: from mout.gmx.net ([212.227.15.19]:48029 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbfF0S5P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661811;
        bh=k2UEBdPcXThZbOhK5It7fEganG4Iv+M4JDEYExz4Arc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OGx4Tbw/y43jBB3SXYzKOgCdXi7TgB8QtK4qlHpS0lBu8/cGVzg3feaiLShLOcKxn
         RjdePa1kfltlkFL1KNkQHViViOstm8fZs+l/ITP/lZrCxdODnFPrj3SFDac3/L8Jsy
         W/5gnZYa2kOWPKk/pg/ryO8mqztXqQdI28eiGrA8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LgZdt-1iIxBW14Zp-00nxIE; Thu, 27 Jun 2019 20:56:51 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 07/31] staging: bcm2835-camera: Remove dead email addresses
Date:   Thu, 27 Jun 2019 20:56:04 +0200
Message-Id: <1561661788-22744-8-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G+kKgfFVzVlhR+oT6IRybHEGpRj6R6swZgtBkCia+xNyzsUjV39
 c6pALomWDH7aFBtGuFnr9OIC7Or25hpKL2Qtg+na7RcQCxtw4YUtCD4MnZlWjV3coW1ZSQ6
 S+A9OV/QP6vrZF0XVCIz4jLQlJsoHo8ZtLNgoRFzcV7o3UpBhx4ucdjmIKXf/MMQps5AIwX
 G70qd76F8vIFtfvqw6nFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qQYJ98g6oYc=:d1q1GINSU4Wm++VBLDNd/i
 eorzI/ywX3fbqWU9ak99N+986WjUXalUERehv8eNow5Q0rJyOuLeQDNs28kiLgxu6YaP1hO37
 V/AWnXCTLSC2rQPCUsZssib/Oxu8FXZK3gX1zMxGWl+ttweaHcS2Y5W91LFhWkSLQ29qTjTkV
 pZUbesPWPj098WQfBlfsxB5HowmGx/pJcWiCkZOKvOxW9TsOUY5HEuiTMOphjQthNyC3b1+o6
 6xC6Zvvm32l9nol7ntcyQyehYtXvizMSssD+uiwe3E2kqiYPdLCkpfDrj/W8CBu/1dzzKO7wb
 SporIm+zefFvj652QuvvF3oeLWj7fDDh+F1bQjHrUX2a0PO+sWYyoRH//1pLs/eNbiy+EBSpC
 VppFRRqzZAF97lOhzVor8iTdOOpJ35zOFWrRz1O8PBkjhZ5t2XuzzUrGK9mO3zN6s1k3jNKzT
 V6Vo3UBAJ7tVtR4DQCtT6F/lTaxfwyVzU3dcmBF4JtpR1WQaoaNUTMlx1qVWDVrMCj2BuZx2i
 OuTzvilyZ5P/dfLFeFYWTu2wpSK6ksoM37Pe4cV7QdwKBkZL603Oitk8B7SffFSfwHXw7Mbvd
 7mzMv6GgJyB1uT6DRmsKKZWu5eAH63oXFKCDLsBUprAXSoV3B15Ak9B3GoXvi5fjvE9pIiYfE
 QDj33eaf+o94VJmXPMkZltFSHT9va84zCv9AsW9PCVrUln9F20hf/ohdUqVZcSmoh35tdw0v/
 IQWhhRVv3fFMpk/XDnRhAN91fENosU6/ArIx5y6hEzrBwh7PJGUN0khAjZ8mF6FJf6DrSRTd+
 UK3QU/DNcEZW7+oplCReDT5aH5eVHdxEDdrj3ZnRYviCFYrOQrbpuum+ZFKDoq43qVYyM6EEz
 2Oruy5u3VnMyo9ez+n9Q9oCo9pDScoBBZoXHIGXUD2EaKQPuYitGLD+CskXPVyiBfEHp/WzVN
 OkAjGFPzFIOSzmN9420Gi9NA02c4bKUxzXnOcq79s+o+gFtS7votB7j0VmPrQ8KgYnFBK0PJk
 /IIw8tR1iuGpr6FwLvEOIg5fARHtjVu3krA1+WnOUd0EO84GeRxFFDVIzZgmd9lb1Zp4pKts9
 DzyF+kERUFLGfc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

None of the listed author email addresses were valid.
Keep list of authors and the companies they represented.
Update my email address.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c  | 9 +++++-=
---
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h  | 9 +++++-=
---
 drivers/staging/vc04_services/bcm2835-camera/controls.c        | 9 +++++-=
---
 drivers/staging/vc04_services/bcm2835-camera/mmal-common.h     | 9 +++++-=
---
 drivers/staging/vc04_services/bcm2835-camera/mmal-encodings.h  | 9 +++++-=
---
 drivers/staging/vc04_services/bcm2835-camera/mmal-msg-common.h | 9 +++++-=
---
 drivers/staging/vc04_services/bcm2835-camera/mmal-msg-format.h | 9 +++++-=
---
 drivers/staging/vc04_services/bcm2835-camera/mmal-msg-port.h   | 9 +++++-=
---
 drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h        | 9 +++++-=
---
 drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h | 9 +++++-=
---
 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c      | 9 +++++-=
---
 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.h      | 9 +++++-=
---
 12 files changed, 60 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index b597475..814deee 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  */

 #include <linux/errno.h>
diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
index 09273b0..9833828 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  *
  * core driver device
  */
diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/dri=
vers/staging/vc04_services/bcm2835-camera/controls.c
index 133aa6e..b142130 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  */

 #include <linux/errno.h>
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-common.h b/=
drivers/staging/vc04_services/bcm2835-camera/mmal-common.h
index a20bf27..858bdcd 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-common.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-common.h
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  *
  * MMAL structures
  *
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-encodings.h=
 b/drivers/staging/vc04_services/bcm2835-camera/mmal-encodings.h
index 1292035..2be9941 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-encodings.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-encodings.h
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  */
 #ifndef MMAL_ENCODINGS_H
 #define MMAL_ENCODINGS_H
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-common.=
h b/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-common.h
index ec84556..342c9b6 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-common.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-common.h
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  */

 #ifndef MMAL_MSG_COMMON_H
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-format.=
h b/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-format.h
index c9d6fbe..5ea1a1b 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-format.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-format.h
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  */

 #ifndef MMAL_MSG_FORMAT_H
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-port.h =
b/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-port.h
index 3b3ed79..fe5768d 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-port.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-port.h
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  */

 /* MMAL_PORT_TYPE_T */
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h b/dri=
vers/staging/vc04_services/bcm2835-camera/mmal-msg.h
index 90793c9..332de57 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  */

 /* all the data structures which serialise the MMAL protocol. note
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.=
h b/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
index 184024d..96e987d 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  */

 /* common parameters */
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c b/d=
rivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
index 1a343d8..5175e2c 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  *
  * V4L2 driver MMAL vchiq interface code
  */
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.h b/d=
rivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.h
index 22b839e..0e5a81b 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.h
@@ -4,10 +4,11 @@
  *
  * Copyright =C2=A9 2013 Raspberry Pi (Trading) Ltd.
  *
- * Authors: Vincent Sanders <vincent.sanders@collabora.co.uk>
- *          Dave Stevenson <dsteve@broadcom.com>
- *          Simon Mellor <simellor@broadcom.com>
- *          Luke Diamand <luked@broadcom.com>
+ * Authors: Vincent Sanders @ Collabora
+ *          Dave Stevenson @ Broadcom
+ *		(now dave.stevenson@raspberrypi.org)
+ *          Simon Mellor @ Broadcom
+ *          Luke Diamand @ Broadcom
  *
  * MMAL interface to VCHIQ message passing
  */
=2D-
2.7.4

