Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB8A3547D6
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 22:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237277AbhDEUwf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 16:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237144AbhDEUwe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 16:52:34 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C88C061756;
        Mon,  5 Apr 2021 13:52:26 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id a6so5973581wrw.8;
        Mon, 05 Apr 2021 13:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7C13XlUdOgzQF9sLGdJgUoIrOgcp/sITEfTitDZiIdc=;
        b=Rb0mNRmGnTqpOkvNQ3ypJ//C+oH+JTE77MmLtNerx1gz8lpqfS3w/FpotN9eMElTK1
         5s1YM9rg69RanWIoObVijLEX2ZXvtS3xh3s7gXl/0Wpwi/ka9gaDgbIw968Nupzdg+s8
         0meS+b2N5AmzOuGK8e9Aj3uzxD5WsGnebHbLuMmqEV/dTEZEizGNRmcaPXCK2J3YMYf/
         5QdnalUNF+IEHJpKvhNpTD3fVkrwgfnfBV/mknETE13sjBXBo/hmdiOLY4iWnj7mZyM+
         sujyhmJx/sqhwn9VxTPFlITbOnGrRscCoTEAwJYMez8ePvgt1IYCMUjaZcYCZyj3RTkV
         HWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7C13XlUdOgzQF9sLGdJgUoIrOgcp/sITEfTitDZiIdc=;
        b=sbD3XifXb3B+xz1Rhlx0iuA5CdMF3aOKT1T+f1f1dCJgeLYN30bRmSA8BHGDsX1LCD
         OMAHEUnM8QIw/T5DnEDK8t57NdDeVaEDMMEdYZ6dbiTK27yAPuoZXtQEvdqLM4tAg05g
         1hN5TbSb+Sbxwtom94g0T0/yt99YBw8h3EW5Igc4P4lmk6P4m+NAl/0s0ftVikurNtmH
         oim+pHNG00iulq9iYpIunCcfX951/Pzw7VRNLWDHIP+MtUNULccB+Hc8xRUYGPniKrTL
         r7AsIpNyAKYfEp5Aq2XUCjXifoXc/PWoF1qvYjTKYgc951RI0tavBn1oFZkSZucOKP1D
         8hbA==
X-Gm-Message-State: AOAM532hGr5PVK6K2EA9mLGRF2q1ulQ+dOH0GXBuKt6HCUxgSc6Cjm8h
        0Nq1YE0yOZ95P1jKc/dWUYZ8FDK1i2q5Hg==
X-Google-Smtp-Source: ABdhPJxSaXmM69ki950ZgNjz250o54xGZUeAdsgGMVuD5hSefBTuPhvsiW+81TLLy1bZ+hHNZYQrUw==
X-Received: by 2002:a05:6000:181:: with SMTP id p1mr30779028wrx.73.1617655945220;
        Mon, 05 Apr 2021 13:52:25 -0700 (PDT)
Received: from LEGION ([39.46.7.73])
        by smtp.gmail.com with ESMTPSA id x11sm674939wmi.3.2021.04.05.13.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 13:52:24 -0700 (PDT)
Date:   Tue, 6 Apr 2021 01:52:19 +0500
From:   Muhammad Usama Anjum <musamaanjum@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:SIANO DVB DRIVER" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        zhengyongjun3@huawei.com, kernel-janitors@vger.kernel.org,
        colin.king@canonical.com, dan.carpenter@oracle.com
Cc:     musamaanjum@gmail.com
Subject: [PATCH] media: siano: use DEFINE_MUTEX() for mutex lock
Message-ID: <20210405205219.GA687366@LEGION>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mutex lock can be initialized with DEFINE_MUTEX() rather than
explicitly calling mutex_init().

Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
---
 drivers/media/common/siano/smscoreapi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index 410cc3ac6f94..7f5b638d2458 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -414,10 +414,10 @@ struct smscore_registry_entry_t {
 
 static struct list_head g_smscore_notifyees;
 static struct list_head g_smscore_devices;
-static struct mutex g_smscore_deviceslock;
+static DEFINE_MUTEX(g_smscore_deviceslock);
 
 static struct list_head g_smscore_registry;
-static struct mutex g_smscore_registrylock;
+static DEFINE_MUTEX(g_smscore_registrylock);
 
 static int default_mode = DEVICE_MODE_NONE;
 
@@ -2123,10 +2123,7 @@ static int __init smscore_module_init(void)
 {
 	INIT_LIST_HEAD(&g_smscore_notifyees);
 	INIT_LIST_HEAD(&g_smscore_devices);
-	mutex_init(&g_smscore_deviceslock);
-
 	INIT_LIST_HEAD(&g_smscore_registry);
-	mutex_init(&g_smscore_registrylock);
 
 	return 0;
 }
-- 
2.25.1

