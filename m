Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5B5F198664
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 23:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgC3VYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 17:24:40 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:53287 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728393AbgC3VYk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 17:24:40 -0400
Received: by mail-pj1-f68.google.com with SMTP id l36so159361pjb.3
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2020 14:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v5z9J8Mvhxd+OavBUuQDZYy/tbOuDQYWMwNmOJ3hwKs=;
        b=EOcpW0bvXhufAh/QO5H6oyQoe4zNqGePtn3HvAfYrzNLck564t2TJ/fKlYwGKGsBlk
         71LTrseEcduNTgbhGxyJ6z9Q71xlZmuaDNfQbcH34XScSl3zdktohxsD70eyYeTSja+c
         2Ayodhk5W/CzTUtZKPXa34cHxx37/Qs6vIKOg8+5EBZxNl/WLAvVy2covZZ4qUbVMcxt
         2db41+5VZ3HJvw0MB8HI22y9ZFxOKpWaQU9RtXEYL8rCXBBGsoW4LSYVypWVD4ck6PB5
         D5BmkGUtyMj7r9M2uGyIJpQ1VQJ7+UXWWRfu5bgcFs4XYujBSpswZqOv5b98RWvzZPFd
         O3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v5z9J8Mvhxd+OavBUuQDZYy/tbOuDQYWMwNmOJ3hwKs=;
        b=tGYCgUXSLiSzcBzxai0kzWxuH4Usc1vKW9bBoNhP+2NSTu/4dUyZi7XiDpkHMMJNAn
         vGn5re/fYiu6R1+jppIiVtfBpv9y5TVE40jFT+4Z+Zu2QH0Biv1oAp7CG9RMybZ5Eov0
         w1sLdyNt+/XN2bcZfzln+s03e5Np6OT0FPjpUuHUxRC8WVGqLqmroY0RXutgzneQBNho
         CwYegx95eXNFZc3bD+JcRGBWD3hRiAzTuHwqp4K3H6WubGnCJpu8Ih/jisP80PuMbtdw
         D0Dytzh/Ps+F0mawEapFdL22OfXZ0zEGOsdLA1iFrf7x3DLoEtjTvvbxJlwzP+p7xIPt
         Od0A==
X-Gm-Message-State: ANhLgQ1+yr0nAB0Rqkr+l5jMPCOCEj17+4e913jHdvLjYUxDiPM258+0
        mv4vjK4ok0OzMzfx3fv7Kx97tokasz4=
X-Google-Smtp-Source: ADFU+vsqB2LtHvuS8KQJI+MAzqOz+d50zYA+5odcbB1eGyPHiZ3d11cj2083FIxdYCr0y9p1hequeA==
X-Received: by 2002:a17:902:59c1:: with SMTP id d1mr14880715plj.215.1585603476678;
        Mon, 30 Mar 2020 14:24:36 -0700 (PDT)
Received: from mangix-trapnet.lan (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id mm18sm388140pjb.39.2020.03.30.14.24.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 14:24:36 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] keytable: use input_event properly
Date:   Mon, 30 Mar 2020 14:24:34 -0700
Message-Id: <20200330212434.10155-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It does not use time_t under musl when time_t is 64-bit. The struct has
compatibility defines. Instead of using time_t directly, use those
defines.

Fixes compilation under musl 1.2.0 under 32-bit OSes.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/keytable/keytable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index aad993ea..bc890394 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -1551,7 +1551,7 @@ static void test_event(struct rc_device *rc_dev, int fd)
 
 		for (i = 0; i < rd / sizeof(struct input_event); i++) {
 			printf(_("%ld.%06ld: event type %s(0x%02x)"),
-				ev[i].time.tv_sec, ev[i].time.tv_usec,
+				ev[i].input_event_sec, ev[i].input_event_usec,
 				get_event_name(events_type, ev[i].type), ev[i].type);
 
 			switch (ev[i].type) {
-- 
2.25.1

