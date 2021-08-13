Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB2D3EB6C9
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 16:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240805AbhHMOez (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 10:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240746AbhHMOey (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 10:34:54 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D4DC061756;
        Fri, 13 Aug 2021 07:34:27 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t9so20234597lfc.6;
        Fri, 13 Aug 2021 07:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4iReoXHFEApkp8RV8F2KI8fkXLo3b3K6dKxcu94AXI=;
        b=vNi6ZDT6w2n6KVbw5/2rVRHBAEn7r1QQh8J0W1D4bU87XLDIJOsuFvzhY3t5Yq+q1S
         G1yyA6gP//wN2DVgs7lk3/V6Y98ANjoXC5wdhz5nxxAl7L5uneuR4Z+E7WA4ti9D5ixA
         dtUAd/w5A9uItSP/RkP1909baC8vzCbPN2apdcICWllIAQXvuDfA+wUI40ngwtb4lruX
         Shuc7fj0XrEeq39t8uYqSDdW0v/ewUfWXCjHUZKHKMLAR0OeR2NO2Fpy6fc/76Q2YpXk
         bdKtfGE31NHGXd/5Eat7RvFHgRsi3f1EgBPSwCtwtwIOGgeMzC4RWWp1A5iGo/+h+K59
         poRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4iReoXHFEApkp8RV8F2KI8fkXLo3b3K6dKxcu94AXI=;
        b=bNveU09lA1pimlmYbGaftZceEd/938RMum+teb3eONsZtVB6MqDFg7Ykr2VXLMpUcr
         gkFmkuIA5Qee5j4zCjt5woSnYvoiVvBmmUCaUvV2/ixnFC3Vxn86Wvnz4dUBMU2H1uVZ
         wQhrJNrM1IBG4p7pgRxOB3OFxneHiyGTSnN1GXlO6dm+ui2/9NqFXEUDcdp0zOtm00/y
         6C+xMq5R+gUJhds06K+q4ZJWppFedkRO9WAyi2rJ41vTYET6rsMaGsnLqyR2Tye/QC3q
         AWcHMsrNZprFOEOkmheEKbAlJ1EcwMHMCYGTGMuXnoG2YYSwzpz8YNeWxnuH49rAhSIB
         MD9w==
X-Gm-Message-State: AOAM530ZcjeRiWAA9ct3Nb7XHrOjO3YtKFo+ai/ZhKehEOaj2tner7bb
        yHAsrf4RASUVhi5McqHnAJs=
X-Google-Smtp-Source: ABdhPJx7MYJ2JkcqKeEc+izjDcUd0n30XDocfuuuSdeS/PZAHxBYwQkGM6lsV2cnTqgmQlA40dlC9Q==
X-Received: by 2002:a05:6512:234a:: with SMTP id p10mr335917lfu.482.1628865266035;
        Fri, 13 Aug 2021 07:34:26 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.232])
        by smtp.gmail.com with ESMTPSA id s4sm186041ljp.115.2021.08.13.07.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:34:25 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, manu@linuxtv.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+2cd8c5db4a85f0a04142@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-usb: fix ununit-value in az6027_rc_query
Date:   Fri, 13 Aug 2021 17:34:20 +0300
Message-Id: <20210813143420.20724-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot reported ununit-value bug in az6027_rc_query(). The problem was
in missing state pointer initialization. Since this funtion does nothing
we can simply initialize state to REMOTE_NO_KEY_PRESSED.

Fixes: 76f9a820c867 ("V4L/DVB: AZ6027: Initial import of the driver")
Reported-and-tested-by: syzbot+2cd8c5db4a85f0a04142@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/dvb-usb/az6027.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/dvb-usb/az6027.c b/drivers/media/usb/dvb-usb/az6027.c
index 1c39b61cde29..86788771175b 100644
--- a/drivers/media/usb/dvb-usb/az6027.c
+++ b/drivers/media/usb/dvb-usb/az6027.c
@@ -391,6 +391,7 @@ static struct rc_map_table rc_map_az6027_table[] = {
 /* remote control stuff (does not work with my box) */
 static int az6027_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
 {
+	*state = REMOTE_NO_KEY_PRESSED;
 	return 0;
 }
 
-- 
2.32.0

