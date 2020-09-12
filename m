Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51CC2678BC
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 09:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgILH7n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 03:59:43 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:45463 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725809AbgILH7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 03:59:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id H0RTklyOYPTBMH0RUkWIQe; Sat, 12 Sep 2020 09:59:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599897568; bh=dq+79pjQ9EUdlP2GahccYqTC8iKPRUeVk+pkjMKLy9E=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QDb1dbT0Cg6OEDDeHH4ocEy0aQ0/TFchv67HM3n5gVc3q1a7M/+MDKCOQT7DfiLeO
         sId9rfPWxLU3ZX5cuzZKbdGp5CEAVGxho6iSFv5ahxXgLM/qL6wthG7SpXwa21d6g6
         Pr3A37PbtiDAnhnb2nwKZjENNMTyR7OS8YjqjollmrNCN1KEvicbtcHihaMIcVx4cf
         JZj9C/bkgL453Kc/fB0fq8GA30YoVM26MBMetmr97IYJVEkvw+ujqx4BM9CnR+MnVo
         /VWCqt0KsVg8Ei46wxnFABOOl5e/XTpZBRksKzDEkKhB4FM6DQsoNEYjkAjp1sbbJq
         f/98g1NpTKbuQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media/test-drivers/Kconfig: fix broken Kconfig
Message-ID: <7a17b41b-f7e2-268e-36fa-deae431454a4@xs4all.nl>
Date:   Sat, 12 Sep 2020 09:59:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJBX1BvRmtNELYpFscrbLz+Am3dSNK0Ul76ju5mylbXcGd16/jXNFLmpJC12BUrwXTEP4nb6iNBQyvWfdpOK0bCfZJpLuUg6S1O7ZreqbbCsCIu7Lv33
 EhLQcT35G2bOKRDCVAe27lv5urPCI/4qPjpDjKzV18hWx32A/59SsVA8Ri+rhz1HBKAD7FCsNypOZcZTIZpvO3/pQeWxHqUHwSLlZlWBLxpS4exSNfGXLNPt
 bIIfM0/Yo/6vSkKhCLXoNRcEG5HCj9ON43F0sbco4jIWBsJ0epFKOvOjHkxNKdqWesiz/HUvgdD/eTRwL5G5GQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

menuconfig DVB_TEST_DRIVERS should be added after the V4L_TEST_DRIVERS,
otherwise there are no drivers listed in these two menus.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 24fb190e92e0 ("media: vidtv: implement a tuner driver")
---
diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
index 874fcc72c48c..e27d6602545d 100644
--- a/drivers/media/test-drivers/Kconfig
+++ b/drivers/media/test-drivers/Kconfig
@@ -4,16 +4,6 @@ menuconfig V4L_TEST_DRIVERS
 	bool "V4L test drivers"
 	depends on VIDEO_DEV

-menuconfig DVB_TEST_DRIVERS
-	bool "DVB test drivers"
-	depends on DVB_CORE && MEDIA_SUPPORT && I2C
-	help
-	  Enables DVB test drivers.
-
-	  This enables the DVB test drivers. They are meant as an aid for
-	  DVB device driver writers and developers working on userspace
-	  media applications.
-
 if V4L_TEST_DRIVERS

 source "drivers/media/test-drivers/vimc/Kconfig"
@@ -35,6 +25,16 @@ source "drivers/media/test-drivers/vicodec/Kconfig"

 endif #V4L_TEST_DRIVERS

+menuconfig DVB_TEST_DRIVERS
+	bool "DVB test drivers"
+	depends on DVB_CORE && MEDIA_SUPPORT && I2C
+	help
+	  Enables DVB test drivers.
+
+	  This enables the DVB test drivers. They are meant as an aid for
+	  DVB device driver writers and developers working on userspace
+	  media applications.
+
 if DVB_TEST_DRIVERS

 source "drivers/media/test-drivers/vidtv/Kconfig"
