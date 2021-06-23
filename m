Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EDA3B139C
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 08:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhFWGE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 02:04:27 -0400
Received: from mx-lax3-1.ucr.edu ([169.235.156.35]:10506 "EHLO
        mx-lax3-1.ucr.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhFWGE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 02:04:26 -0400
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Jun 2021 02:04:26 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1624428129; x=1655964129;
  h=from:to:cc:subject:date:message-id;
  bh=HeroiO/f70kMSW1+IDvJqEJ6G7TytY2YJRExDN92zzI=;
  b=LEDX/Wy9ElTbxhr3glcRlO59hPlJe70cUwHGZ31SBC3hnFF3JgXpYRO4
   4pGj31Kv+JOfxMBaz0IT2ZgUauAf85IdcRTBY7pFCYw3AsRyDEa8GbHDy
   1J2TCPxUg8ryI6hPBPIicmUxCE+PvNdXq8AIf2FgWYvK/W2O8J+zoDrXe
   lXBdRp1q/crpBYdSE5t2nK/QyUiv7Ve70xOo8uFmsKDWVwVHKjzZl2Cw5
   UrPWbkItYmVFwv38FnH7+p0gPm9O+9x0DEHN5FUIaB2v+0tcPPbMQR6Ye
   HNuNNvrDltvZcPrMCfCu3y+PTeSGlRM21LgcpulDkgUY6Ylf2FvpxghxM
   A==;
IronPort-SDR: AtOH9QRsoQSGhsx1vvbNSM2FkLdoJWyIj+sTrzSQArUxjral+IMmXXHsyYNKikExqE6NGyKgvd
 Zcb1hx2Y9oNAKmZdYwJoXK8H430wnJeWNmrV/c/6zeAehPlmtJ+ImTOkx80zuH1s7bq5/+VT0K
 Dd7yoODuzl/JxklFJcJWZbaie8hKb9MC00z1dSvGhQS9dSY6l/2NTpTk88KCSX3jUWwm/tgdPL
 06N2PscQdGG+A79iA9/wVS/mFZv2ae46LRs+95AgXx1EBCuOUHU/tL3Gks1ijQDNqFpUGgwren
 OJM=
X-IPAS-Result: =?us-ascii?q?A2EGBACHy9JghsjXVdFagmCDeVUWjUyHKwEBBowZGH+Ge?=
 =?us-ascii?q?YhlgXwCCQEBAQ0BAUEEAQGEUIJuAiU0CQ4CBAEBAQEDAgMBAQEBBQEBBgEBA?=
 =?us-ascii?q?QEBAQUEAQECEAEBAQFshS9Ggjgpg2ULFhVSgRUBBQE1IjmCFgGCYSaaGoEEP?=
 =?us-ascii?q?YwxM4EBiBMBCQ2BYgkBCIEoiHqFF4EZgRCEAnSHb4JQBIMdexODdgEBAZAPG?=
 =?us-ascii?q?4MEjDubRQEGAoMFHIJ+mmpEhlKOJZB9AbodAgoHBhAjgTGCFU0lgWwKgUFQG?=
 =?us-ascii?q?Q6NdQFCjjVBMjgCBgoBAQMJjFQB?=
IronPort-PHdr: A9a23:OYZQIRbnL6H3iqIhE66lfD3/LTHX0IqcDmcuAnoPtbtCf+yZ8oj4O
 wSHvLMx1Q6PBtmBoKIUw8Pt8InYEVQa5piAtH1QOLdtbDQizfssogo7HcSeAlf6JvO5JwYzH
 cBFSUM3tyrjaRsdF8nxfUDdrWOv5jAOBBr/KRB1JuPoEYLOksi7ze+/94DXbglSijewbq1+I
 Bq1oAjSq8IbnZZsJqEtxxXTv3BGYf5WxWRmJVKSmxbz+MK994N9/ipTpvws6ddOXb31cKokQ
 7NYCi8mM30u683wqRbDVwqP6WACXWgQjxFFHhLK7BD+Xpf2ryv6qu9w0zSUMMHqUbw5Xymp4
 rx1QxH0ligIKz858HnWisNuiqJbvAmhrAF7z4LNfY2ZKOZycqbbcNMfRGpBRd1RVy1HAoOzc
 oABEfMPNvtWr4n8uVQOqQaxDhSoCO7h1jNEg3n70qom3ukvDQ3KwRUsE84TvH/JqNn5KacfX
 eWzwaLVzzvMculW1C/95obWbx4vr/KCU7VrfMbN1UUiDR/Jg0+MpYD5OT6ey+QDs3Kc7+plT
 e+giW8nqgBxojiywccnl47Eh4IUy1DE7yp5wZo5KcG2RUNgfN6rDIFQuzuEOIRrX8MvWmdls
 zs1xbMao5C0ZjQKyIg5yB7FbfyKa4eF7gzhWeiRPTt1gHJrdKy/ihux/0at1PPwWMm13VtIs
 ydIk9vBu3QM2hHS9MWKVvhw8lu91TuNygze5f9IL0AymKHGKJAh2qY9moQPvUnHBCP7m0X7g
 LWIekk5+uWk8frrbqn6qpOEKoN5iwXzPr4wlsGxAek0KBYCUmqB9eiiyrHu80v0S6hQgPIsi
 KnWqpXaKNwepq6+HgBazJ4u6w26Dze6yNQYmmQHLE5ddBKHkYfpP1bOLej9DfilglSslC5nx
 +jJPrH8G5nNIGbPnKv9cbpn5E5czw0zzd9b551KEL0OPPXzWkrpuNzZCB82LRC0zv75BNlh0
 o4SQ2GCD6+DPK/MrFOF5vgjL/eQaIMJoDr9LuIq5//qjX83g18deqyp0IMXaXG5HvRpOUSZb
 WbwjtoPCmoKoxYxTPbwhFKcTDFTem6+X7gg6TEjFIKmEYDDS5ipgLyA2ie7A5JXanlDCl+SD
 Hjodp+LVuwSaCKdPMBhiCYIVbu/RI870xGhqgv6x6BgLurO9S1L/bz5090g1uzBlQw1vWhlH
 cSU0jnVFElplXlOSjMrivMs6Xdhw0uOhPAry8dTEsZesrYUD28H
IronPort-HdrOrdr: A9a23:jArpYa7XwJmoAF26ngPXwPXXdLJyesId70hD6qkXc202TiX4rb
 HMoB11726StN98YgBEpTn/Atj4fZqsz+8Q3WB5B97LN2nbUQOTTb2KhrGSpQEIdReOjtK1Fp
 0MT0G9MrfN5JRB4voSmDPIaOrICePqnpyVuQ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="50141166"
Received: from mail-pg1-f200.google.com ([209.85.215.200])
  by smtp-lax3-1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Jun 2021 22:55:03 -0700
Received: by mail-pg1-f200.google.com with SMTP id b17-20020a63a1110000b02902231e33459dso678338pgf.17
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 22:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dZ01YeGO36ttJa1EkqeDzGCMLruDwsRboZArrpn5SFM=;
        b=Ha+0AzhWhJiXEunN0mhZZVXjVCCr7lr+WhHZndQ7aZD9VzcMRKcySKWa98j7Rkcej6
         fMyrjy0+1U12gM1lgtw54/3J9yDxTRthfW+4DjY9nmlH0pdcOB7vV0a3iO4T3jS910Xh
         8f3TUtUd0zyqhbDa1vwG4D41JjHJEGj8cp/FIg65/6xalgTaT1LVHX/hTr0gTJ88l1dH
         yndIcXyQbfk+CMlO7K/rjEPni9Wwyq1y7IXA4Xurl8HN2HS13fFdWJV3kkbuVsaSzuCV
         NZa8MBoONfR3XDUEB07G83UegHb5S82mXAFdja8srfNcNx0OyOAHbKZZZr1hCx6QvYVq
         Fgcw==
X-Gm-Message-State: AOAM532g2aEPGu/0f7XNIlRen7kyaBhkqtzNKVBmqDn8QBcBegcV6Vx4
        wkC2ZAZsTMKuxH+8a2BvdmVa8gTrdFnV3CD1RMNyC6mqzOWFm4hNqYMmfles03FFpxxHqCAcEhm
        zI2/c8txr7EZkbtXMXGxdg6Cm
X-Received: by 2002:a05:6a00:2395:b029:304:7a51:6f1d with SMTP id f21-20020a056a002395b02903047a516f1dmr7387057pfc.53.1624427701883;
        Tue, 22 Jun 2021 22:55:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZcMZuv9nHzaTSg9WiNWU0DHaItTgV98zNDYoD4whsou4ZO9Ewniqbv6pxQU3GccP+KRXscw==
X-Received: by 2002:a05:6a00:2395:b029:304:7a51:6f1d with SMTP id f21-20020a056a002395b02903047a516f1dmr7387023pfc.53.1624427701428;
        Tue, 22 Jun 2021 22:55:01 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id ml5sm3980846pjb.3.2021.06.22.22.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 22:55:01 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     yzhai003@ucr.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: fix the uninitialized use and rename "retvalue"
Date:   Wed, 23 Jun 2021 05:56:31 +0000
Message-Id: <20210623055634.12603-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside function mt9m114_detect(), variable "retvalue" could
be uninitialized if mt9m114_read_reg() returns error, however, it
is used in the later if statement, which is potentially unsafe.

The local variable "retvalue" is renamed to "model" to avoid
confusion.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..fbd6c6cd84c8 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1533,16 +1533,19 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
 static int mt9m114_detect(struct mt9m114_device *dev, struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u32 retvalue;
+	u32 model;
+	int ret;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
 		dev_err(&client->dev, "%s: i2c error", __func__);
 		return -ENODEV;
 	}
-	mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
-	dev->real_model_id = retvalue;
+	ret = mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &model);
+	if (ret)
+		return ret;
+	dev->real_model_id = model;
 
-	if (retvalue != MT9M114_MOD_ID) {
+	if (model != MT9M114_MOD_ID) {
 		dev_err(&client->dev, "%s: failed: client->addr = %x\n",
 			__func__, client->addr);
 		return -ENODEV;
-- 
2.17.1

