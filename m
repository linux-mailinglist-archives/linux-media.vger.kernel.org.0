Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1680C10F3F5
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 01:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbfLCAlu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 19:41:50 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36552 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbfLCAlt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Dec 2019 19:41:49 -0500
Received: by mail-pl1-f193.google.com with SMTP id k20so854130pls.3;
        Mon, 02 Dec 2019 16:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5F3LmlLJ3DLUlNEK9V6ggwNn0/WBf54z3A3fMxHOMC0=;
        b=qtA92IPcnLG8L/fIoNQ7renoQI235C29BpF+GTBOhKseLGiUYRw7Y8Jb9SvIJklV/c
         BI/ishToIJ/57CniabwqzeLc32C0/Anc7yWa85UGB+sybPbEp0eul2XJxG4axDzice+U
         BYJBA34aiDqHU6FTXNM03itIr5CCaW2BHMzpNuw0mpOz3utGO9el+KKP/BXZZMyD/W52
         TyHRDJ+grfB1aaIVFHSZIjvoho2JBlEQubRthLR7c4MvTP3LdLIgGq3EZZB/jka2pO/3
         KLDNj60VOR+SZkeb8wKLS/wGNF6WoLfleh7MQMN8iK2ths7wB5yFa17MFYEDqLH1tYIb
         eKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5F3LmlLJ3DLUlNEK9V6ggwNn0/WBf54z3A3fMxHOMC0=;
        b=Rv9RFHJCV53gYC7O7Ucwe8jF2ZRcgVtrQhWvqpyc3EX81Ldf8f+uflAaeyMC8Hde6b
         YB6vGoWMmO7VqMDjWCQ44BBQU5BAFmeME+v+29LTnS1N096kcVJnCjUtQsrEzSuWvh+C
         hC2Z7+3MKBfJc7WQwdmk6vhEoECWFq2VG50L9QhghlwGBOJcfFIhGcPqy9rV+hZIbjzn
         w1vPB4j9s4KbAQIp6NdJGmqmjxIvLIPvhiiBGOtAECWC3YPMN8LRmV/2UUTpKPql2OWt
         WQb2c7K1vb8QspBeNt9HSXCTSC/9QMwp18YEmE6S9C/Hd8YG71UsZGWecHefOQWLKqRO
         kG3Q==
X-Gm-Message-State: APjAAAUxKkGRngJq5VKzNUKZs5gK359N4wxp0QNF8NjHM8O4X/P3taSH
        8wbAKvSX+qXGmyEN3Xd0sAM=
X-Google-Smtp-Source: APXvYqyLRZcpTsfPKjdg4qt6LU+Ifi6fGkc9DXr47Aaci1PiH2RfLpmCvEa3U2aM3JKz+3kKz/jYqA==
X-Received: by 2002:a17:90a:1aa3:: with SMTP id p32mr2418600pjp.8.1575333709070;
        Mon, 02 Dec 2019 16:41:49 -0800 (PST)
Received: from debian.net.fpt ([2405:4800:58f7:32f8:99ed:5ecf:a28d:555e])
        by smtp.gmail.com with ESMTPSA id x4sm688788pff.143.2019.12.02.16.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 16:41:48 -0800 (PST)
From:   Phong Tran <tranmanphong@gmail.com>
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        allison@lohutok.net, tglx@linutronix.de,
        syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        glider@google.com, syzkaller-bugs@googlegroups.com,
        Phong Tran <tranmanphong@gmail.com>
Subject: [PATCH] media: dvb: check return value digitv_ctrl_msg
Date:   Tue,  3 Dec 2019 07:41:38 +0700
Message-Id: <20191203004138.21223-1-tranmanphong@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0000000000004f3d820596d8c51c@google.com>
References: <0000000000004f3d820596d8c51c@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For fixing syzbot "KMSAN: uninit-value in digitv_rc_query"

In scenario testing for syzbot, failure reading from
digitv_ctrl_msg() [1].

Eg:
[   91.846657][ T3844] dvb-usb: bulk message failed: -22 (7/0)

digitv_rc_query() always return 0. But in this case a wrong thing happens.

Reported-by: syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com
Tested-by: syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com

[1]: https://syzkaller.appspot.com/text?tag=CrashLog&x=16860a63600000
[2]: https://groups.google.com/d/msg/syzkaller-bugs/-TXIJAZ0J9Q/T4PEUQoeAQAJ

Signed-off-by: Phong Tran <tranmanphong@gmail.com>
---
 drivers/media/usb/dvb-usb/digitv.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/digitv.c b/drivers/media/usb/dvb-usb/digitv.c
index dd5bb230cec1..61bc8945e6b9 100644
--- a/drivers/media/usb/dvb-usb/digitv.c
+++ b/drivers/media/usb/dvb-usb/digitv.c
@@ -231,17 +231,21 @@ static struct rc_map_table rc_map_digitv_table[] = {
 static int digitv_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
 {
 	int i;
-	u8 key[5];
+	u8 key[5] = { 0 };
 	u8 b[4] = { 0 };
+	int ret;
 
 	*event = 0;
 	*state = REMOTE_NO_KEY_PRESSED;
 
-	digitv_ctrl_msg(d,USB_READ_REMOTE,0,NULL,0,&key[1],4);
-
+	ret = digitv_ctrl_msg(d, USB_READ_REMOTE, 0, NULL, 0, &key[1], 4);
+	if (ret < 0)
+		return ret;
 	/* Tell the device we've read the remote. Not sure how necessary
 	   this is, but the Nebula SDK does it. */
-	digitv_ctrl_msg(d,USB_WRITE_REMOTE,0,b,4,NULL,0);
+	ret = digitv_ctrl_msg(d, USB_WRITE_REMOTE, 0, b, 4, NULL, 0);
+	if (ret < 0)
+		return ret;
 
 	/* if something is inside the buffer, simulate key press */
 	if (key[1] != 0)
-- 
2.20.1

