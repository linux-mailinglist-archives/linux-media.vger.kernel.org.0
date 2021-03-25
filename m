Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0576349B86
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 22:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhCYVWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 17:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhCYVW2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 17:22:28 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255EEC06174A;
        Thu, 25 Mar 2021 14:22:28 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id a132-20020a1c668a0000b029010f141fe7c2so3894215wmc.0;
        Thu, 25 Mar 2021 14:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ex72Tejmqm01CO5iitHcidNTG+JjZOkOQfAFBeL7xZ8=;
        b=JgqUyMQjIkLWBarjz1QCr0+MxwMia7z1QSh/V8uLC7tB7bZ2mYsOX8YUhVNJCmr6w8
         hE9C/TafduTNF1e/li1+0dGDj7oBgo0H2w7istXW7k22USjhrrlj6IbjSNwhZMF3BkLM
         56dQQLjXWwsmetQMZJn6DuRT7tBgVo6CftvMlaW8yzX42EOwBDxObWypBB+uLVuXlsJv
         f/0ukom1pxou+3LqBm5jv66NRiFyysyAKKSetlMf9/xUlTjIWol1N20Prt8Cga94aU76
         zzZ5q+wYqGbKmQ/oclXaeWcxXptW2F0Q4+F1ixE3V1E8+c8zgQhYWKSo7IiizOCyQSug
         ez2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ex72Tejmqm01CO5iitHcidNTG+JjZOkOQfAFBeL7xZ8=;
        b=VwuQ6Z/gDcapnohmh6kSpXd+31OAL7avIYuxZMdlbaBX/SBo1RA0flwP9qHYw3UrIz
         XdtyK80o5LOu325QJ4QikTHNkeqSr5qZv1lBYrl4yYmtuO9nJnXiyHkM1WRHJd+kArdK
         OED+lvXbRc/CBOw4o1VgdkJ9ml5D9arWEC68u3UYbNm02udTY1E40B98KgWyQvuJcPnP
         H4u8XUbEUMipjxss6E6I/cbxiOcBXXXj7F/LWoL4g6+qjN/K7m3WAxR+50H+2jSkAsyH
         YgwNY6bkMPSm9/yC96aWHm8ah4bSsAscTehiEGsrb6413qqQOCdG/mEq/7b6bRC40nP6
         McGQ==
X-Gm-Message-State: AOAM533BpTf0XpNlovzrUZDAqOH5vYII78KUtbdkGr6aMWIDf38F0GfU
        ORe6cZeAdTd1U7WDkXI/o0c=
X-Google-Smtp-Source: ABdhPJwniVByflGcxt0GEEmvQQ9ODeYvibky8TQSY3fkZtNe57KyFV0tpEqbRyeHD5uGjKzy0WN6TA==
X-Received: by 2002:a1c:68c5:: with SMTP id d188mr9577322wmc.119.1616707346754;
        Thu, 25 Mar 2021 14:22:26 -0700 (PDT)
Received: from alaa ([197.57.239.61])
        by smtp.gmail.com with ESMTPSA id s83sm8049753wmf.26.2021.03.25.14.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 14:22:26 -0700 (PDT)
From:   Alaa Emad <alaaemadhossney.ae@gmail.com>
To:     hverkuil@xs4all.nl
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller@googlegroups.com,
        Alaa Emad <alaaemadhossney.ae@gmail.com>,
        syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
Subject: [PATCH] media: sq905.c: fix uninitialized variable
Date:   Thu, 25 Mar 2021 23:22:02 +0200
Message-Id: <20210325212202.142945-1-alaaemadhossney.ae@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
Signed-off-by: Alaa Emad <alaaemadhossney.ae@gmail.com>
---
 drivers/media/usb/gspca/sq905.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/sq905.c b/drivers/media/usb/gspca/sq905.c
index 97799cfb832e..54b733002f5c 100644
--- a/drivers/media/usb/gspca/sq905.c
+++ b/drivers/media/usb/gspca/sq905.c
@@ -157,8 +157,8 @@ static int sq905_ack_frame(struct gspca_dev *gspca_dev)
 static int
 sq905_read_data(struct gspca_dev *gspca_dev, u8 *data, int size, int need_lock)
 {
-	int ret;
-	int act_len;
+	int ret = 0;
+	int act_len = 0;
 
 	gspca_dev->usb_buf[0] = '\0';
 	if (need_lock)
-- 
2.25.1

