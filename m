Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9193376DD
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbhCKPVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234028AbhCKPUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:20:48 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07DBC061574;
        Thu, 11 Mar 2021 07:20:47 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id n16so40413324lfb.4;
        Thu, 11 Mar 2021 07:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7J7yaJFOnkfC2jtN1RmZbpvdpvHIQ8OR5yg9sAgfaPM=;
        b=rqdZfM3eR9k+ZhKgG1OoSVc0CaH34cPPElYt0iXTLmPyW1GgRql2TEQY01o5ePEA07
         DDxZmYNpzMZwmqINBPStZoEu/VobZXcOuMFoHKg7qbaROOu+zRQH+O71MUF7j8X0FyWW
         o4vs20xCRgkK6TDY8u+IkWo/0jZphQWSxKwuNsMmULL/alrjAf4zO5+kTvNH0ziHggc3
         /cUMFw+wBEVfpMTfF8KQnvl/NWsVJ52xURnL1UKXD+TsVKU/W7BiociBSjN4GD9ZQPeV
         fburWken87QqPgOoBnEcE7sP5uTRjnfPBQUsiSb9eQxYfTliPO2sIX4WFn6Z0n1FQY+z
         ZJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7J7yaJFOnkfC2jtN1RmZbpvdpvHIQ8OR5yg9sAgfaPM=;
        b=BdKOkV/NRH6zHv774LNkzQkBRSnm+Gyr/9Yi8vj8+cnmvp+rlfolNLHSWpzv4Tky+R
         f8pPMTGj8RikOC5RimZFQ8eg5YXNoA7zVRfU/MCmNvEJTYl7T7CC80GEYqvBzG7R3r3L
         UODt1qcsnv6YoQ/kVST0tNqhqpCzVsTPCT9GYCUSX+s4udLnf+f+XIcqzFDTQ13z1H9/
         SIOHEn/OtSg143h1TqJtaKr4ipSz0y+y0CcsG/lb2gSWr+F6qlgtI7lYKHkYT5nUdqPc
         YGzn/5R2ztWcuXTPSIRNGYrauMy4xctvgbUkAVRk5gLxhJL7wyD4+VxsWStdPlxAiC93
         sC2Q==
X-Gm-Message-State: AOAM530b8lSc8Mfs3aEsGAPoGN4VkJ3i+L/uoqAN4JaY/q4y95k8qB5X
        Muh4A8wSdUIr2VTrtJjiREYXx8tdidGkfYQLxHU=
X-Google-Smtp-Source: ABdhPJz/XZuZpry4/DDApPE9DOYEyoFGDwIHTsFz/wGxbwO0C7nY7ES9BtwDRhKfmFZ4WhQWgl8hPA==
X-Received: by 2002:a19:b47:: with SMTP id 68mr2463159lfl.343.1615476046303;
        Thu, 11 Mar 2021 07:20:46 -0800 (PST)
Received: from localhost.localdomain ([94.103.235.87])
        by smtp.gmail.com with ESMTPSA id 30sm929562lfr.200.2021.03.11.07.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:20:45 -0800 (PST)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     hverkuil@xs4all.nl, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
Subject: [PATCH] media: usb: fix uninit-value in sq905_read_data
Date:   Thu, 11 Mar 2021 18:20:16 +0300
Message-Id: <20210311152016.171506-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

sybot reported uninit value in sq905_read_data().
The problem was in the error conditions in usb_bulk_msg()
before act_len initialization.

Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/gspca/sq905.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/sq905.c b/drivers/media/usb/gspca/sq905.c
index 97799cfb832e..949111070971 100644
--- a/drivers/media/usb/gspca/sq905.c
+++ b/drivers/media/usb/gspca/sq905.c
@@ -158,7 +158,7 @@ static int
 sq905_read_data(struct gspca_dev *gspca_dev, u8 *data, int size, int need_lock)
 {
 	int ret;
-	int act_len;
+	int act_len = 0;
 
 	gspca_dev->usb_buf[0] = '\0';
 	if (need_lock)
-- 
2.25.1

