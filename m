Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BADFD18BE5E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 18:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgCSRmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 13:42:06 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:59047 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgCSRmG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 13:42:06 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MORN0-1ivo7k0Cbu-00Pz7Q; Thu, 19 Mar 2020 18:41:50 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id B7A7B65021B;
        Thu, 19 Mar 2020 17:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zJ0c4ug5kAPk; Thu, 19 Mar 2020 18:41:49 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 517E264F8ED;
        Thu, 19 Mar 2020 18:41:49 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.52) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Mar 2020 18:41:49 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 9E04D8050C; Thu, 19 Mar 2020 18:41:48 +0100 (CET)
Date:   Thu, 19 Mar 2020 18:41:48 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 02/10] media: adv748x: include everything adv748x.h needs
 into the file
Message-ID: <fe109d58eaa34d68cad0f34bb048f827b336e024.1584639664.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584639664.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.52]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7762
X-Provags-ID: V03:K1:FHxeNjGlIL7NzarJSPnLpbfeHB9uBfXDTSMuryQpyLu9Ee7QL4W
 cyHLH9BjLgtvX3Up1fHkJk1x3oQvGZZu2nsQEBQftJgEHGxFJiKo8RClAoRE3uyZ526t/wv
 YwGDdYlSP40KxGOUYds9L9lhGtR3M1CXWPpVSd5GTIGdpojWw32pqnHGTmf/I1ONnFwipMk
 9NB5bfT6vPJquo5wetmtw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Uu9yQPd1gcU=:hz1qzK2t6UBTEhWh44qlRL
 UnT0ILN1Dg+H3Q3Xuht2QR7b+NRmfiztGZCJBTtVm+MjiZDsj8r/+tEEW/Xco2BhskekfoyFS
 q0LoQAmkJKx+aBgR7RA+rN0fcecqrhWaz6LxvMk7Sr6NF0wuPOpOShVcmgPTbzRH8bj7So+be
 XYX/Y5DQFV6ULNpfZdCExmVn4fqs0KeQEo5RzS/5xR/BJ/A+ZfnRHCyeODvPrWsyTSS0YkacF
 vtXuICJ0Noe9kyZsM/XyRBLACmMfUe0SIUHmWEXx+zMYlJGD9Kz/9AwHlQExCgapSgRHIterd
 j074Jm6e+c35XR2Z2eLx/jKAqa7Y0bI8gJpKhga0cWI9Txl7KRxRHp/Br6/KwEfVr90HZr7Sl
 69vrscCga3pUHCUQkZ9RxQqKTkAo/gggM/6EWtWDvkVdR+QmcSLqQHWzvjuvzY4LIAzMzeaRE
 vmbO1msBdF9NBSu/JeKs7GnC/2BHY+JhRim/SBiWEO0r8Ge+kueoy12ryd76mWAPsxfR25AaO
 qrAJRZzcE4qPUINg1d9JZYN9cNWcYccS+Z7iiOKax6eekzfxgRhEsthJUxj/L5Zeiz15HXB/S
 NfjtKMoP2b3qfwBOuXy07q8omWmmlk8E8raNXZEEQMU57cZohSAhB4p6yOBEkUV8vz3I50caw
 nKjSB+qXX73TDT522MWiCm7vORds1sYYppU6gO6VxS7bOuAE9dxTomrRxiUhGlvPyyXDdtTQ2
 XIKzPTz51S+jf4gSnjrZya1JdkDhGJjcXtf7alNB4ym7FxaCI//mTDrYC4ovUPwKrEi67YCMc
 N4L+RoQ4mX7MtMRM/fHVer9bHB9XmuZH4X2KJajmW6Gyo9trm8oAfFwnpDuneFLyRBx+LO2
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To follow the established practice of not depending on others to
pull everything in.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-afe.c  | 2 --
 drivers/media/i2c/adv748x/adv748x-core.c | 2 --
 drivers/media/i2c/adv748x/adv748x-csi2.c | 2 --
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 2 --
 drivers/media/i2c/adv748x/adv748x.h      | 2 ++
 5 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index dbbb1e4d6363..ab0479641c10 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -11,8 +11,6 @@
 #include <linux/mutex.h>
 #include <linux/v4l2-dv-timings.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-dv-timings.h>
 #include <media/v4l2-ioctl.h>
 
diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index c3fb113cef62..345f009de121 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -20,8 +20,6 @@
 #include <linux/slab.h>
 #include <linux/v4l2-dv-timings.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-dv-timings.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-ioctl.h>
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index c43ce5d78723..78d391009b5a 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -8,8 +8,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 
 #include "adv748x.h"
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index c557f8fdf11a..0dffcdf79ff2 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -8,8 +8,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-dv-timings.h>
 #include <media/v4l2-ioctl.h>
 
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index fccb388ce179..09aab4138c3f 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -19,6 +19,8 @@
  */
 
 #include <linux/i2c.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
 
 #ifndef _ADV748X_H_
 #define _ADV748X_H_
-- 
2.25.1.25.g9ecbe7eb18


