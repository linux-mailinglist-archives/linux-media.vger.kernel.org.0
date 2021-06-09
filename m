Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FA63A0AB8
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 05:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236495AbhFIDkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 23:40:09 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172]:46891 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236493AbhFIDkI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 23:40:08 -0400
Received: by mail-pl1-f172.google.com with SMTP id e1so11807179pld.13;
        Tue, 08 Jun 2021 20:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k+n/pA6p3AzaSZEumNtpsPgnM1a8UgNMxk8Yo9VkS/0=;
        b=ECa21rCsZv0K+oxyaQ0e9LtETPxuIH/smkpkOgMI0YEhKkyRC2nDCwk4ZBkeN4+uI5
         aiiaTD+nh+ec7HkTXSemgnpCI99ff96FvONAAR31orVfeemrxkOAsdn6PackTgEr9Gyj
         QyM/hjeiOp4hUyy8YRcpUhqIBOORnMC3SlN/NCddhSRkp79mKL6Rywa4TCRVqNbrR7sr
         wNgQZgVtZ5gaDzdoV4nlYDH9Bn09Bhd/sAqkmcZdvNEaREK8OGlkNJfgtDYeia8cqBYw
         z0jM3bnMIWhBUeXA0FQzWHtGBI+xPrBBroKqYY81sFWdAH9nO2HaLH9VjaXyRp3YOxI3
         vu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k+n/pA6p3AzaSZEumNtpsPgnM1a8UgNMxk8Yo9VkS/0=;
        b=PYRv2gRaHRs7/V2rIKZZGXt1HvydP/7mLi5nTz9CX3YkLx7FvQQBclnm8q3OonfCXF
         i8PS7ykzVpyTSx3o6PA2wFCxg6R+qjbxGxvKDiPcUVBjSPAoY0/rAV4bGlv4vimJ7UWf
         Hj6K1O68xt6EQsMwHfK3LNiY963iGlIsQYzGbwKc/H0nhxxAjtwgF3fw0clFhR77K+w6
         wNtraOotTQekQ/Vq2w8lngwOSrdtxoAwvUWgXMjem8ZAyfAfrxbRJGwByXq9zGlMZL4j
         pz+5PUOVZCkFKWvnwf6NHkMw2wgwpEE7vXw4wHYY3GUNjw2Hm0kupunjSt4yhMjjkOX6
         rmbg==
X-Gm-Message-State: AOAM532LkQnmCzVPyZ+bmlzlHp+MwM6Cmma/Q+1d7O/WkG1Ouqn7KEuz
        6ivV/t2zvg7iqpwut4E9fmQDLkM75jRofA==
X-Google-Smtp-Source: ABdhPJwmJtdf+n0jjAMpN3ddngR2DsAl6EUB0Atlemu7ajAh0g6Y5YsiByNLJme2T7eZMFwhkq8msA==
X-Received: by 2002:a17:90a:b94c:: with SMTP id f12mr29729708pjw.32.1623209819220;
        Tue, 08 Jun 2021 20:36:59 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id b23sm11731099pfi.34.2021.06.08.20.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 20:36:58 -0700 (PDT)
From:   Herman <herman.yim88@gmail.com>
X-Google-Original-From: Herman <yanshuaijun@yulong.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herman <yanshuaijun@yulong.com>
Subject: [PATCH] drivers/media/usb/gspca: fix typo issues
Date:   Wed,  9 Jun 2021 11:32:45 +0800
Message-Id: <20210609033245.3410-1-yanshuaijun@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

spca501.c : remove redundant 'is'
zc3xx.c   : change 'outdoore' into 'outdoor'

Signed-off-by: Herman <yanshuaijun@yulong.com>
---
 drivers/media/usb/gspca/spca501.c | 2 +-
 drivers/media/usb/gspca/zc3xx.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/spca501.c b/drivers/media/usb/gspca/spca501.c
index ecc97f807cfa..f7c75d7535c4 100644
--- a/drivers/media/usb/gspca/spca501.c
+++ b/drivers/media/usb/gspca/spca501.c
@@ -488,7 +488,7 @@ static const __u16 spca501_init_data[][3] = {
 
 /* Data for video camera init before capture.
  * Capture and decoding by Colin Peart.
- * This is is for the 3com HomeConnect Lite which is spca501a based.
+ * This is for the 3com HomeConnect Lite which is spca501a based.
  */
 static const __u16 spca501_3com_open_data[][3] = {
 	/* bmRequest,value,index */
diff --git a/drivers/media/usb/gspca/zc3xx.c b/drivers/media/usb/gspca/zc3xx.c
index aa285d5d6c0d..1bbf8071dde0 100644
--- a/drivers/media/usb/gspca/zc3xx.c
+++ b/drivers/media/usb/gspca/zc3xx.c
@@ -5806,7 +5806,7 @@ static void setquality(struct gspca_dev *gspca_dev)
  * Valid frequencies are:
  *	50Hz, for European and Asian lighting (default)
  *	60Hz, for American lighting
- *	0 = No Fliker (for outdoore usage)
+ *	0 = No Fliker (for outdoor usage)
  */
 static void setlightfreq(struct gspca_dev *gspca_dev, s32 val)
 {
-- 
2.25.1

