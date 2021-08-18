Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9473F0CCB
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 22:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbhHRUcG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 16:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbhHRUcF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 16:32:05 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E7FC061764;
        Wed, 18 Aug 2021 13:31:30 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id l11so2572936plk.6;
        Wed, 18 Aug 2021 13:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wu5OncFR6sVeBe5wgUIg9pGEry37BglDTOtmR8HFTQ0=;
        b=ToinCfZNXVy1jxvzWhEUa1xt98vHJI3LsF9JgtMSTp+HTqv7pr7er4YikHRFZAHMwm
         BlQYVnMWe62pkXVkqN/mI4j1u6WmG+YL/1xureGaj2qYgLKYE9r84nfIZJwCW2doCOfr
         wyFGbBPNaEfswcoR/03bdXiFF1Q+nMseNyDKlAaf7Qaayqf2t6rX2MGFGl+YaSZVmCJm
         OyxR40nX7zNeLW7R0U8xqDTtME+Umb1M4zXaq8GmRAa78t1zgP5OehqPSLJ91F7ipIVl
         NAn0p+0Bxu5+jrRnw7S+dQAjB7aYcOmKJL2HhGJaNs/+kmpbVY0VgO4UIg6ax4NIYZmF
         uUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wu5OncFR6sVeBe5wgUIg9pGEry37BglDTOtmR8HFTQ0=;
        b=rwMcF5J+4bw9w8eC1x3Q+CgJXPyg4M4Pjcv9Xt3agyiVVqQmace57m4z9INTqwlGd+
         k8vvgHlKPNnm8WiIg5xm2E0ApmSGpQtvVAU4J0bgbch7vgp6WT9Uhksn1TtA9wS1Yovt
         LQVoesfHHaqIZxEgUfGgy0DU0x5qmqA5MptzO7dK6M/0QDkvY1VfR3++F+KIO9vOUq1O
         CrvBVHxSHfGa1N9k/H7Ys1MjlicBDuNKPD9jV7himNd1T1fbyaqcFjVzQdPGh7PhlZow
         pxHYJvj7U+M6yl/d7M0pdQFCqd2y/u0z7zVsr1S+t/L8UwEKv86Xg3Y61iyAtuWjtkmi
         z76w==
X-Gm-Message-State: AOAM531cUV520xOtclw0xWuB9+BsLbbUSkwrJ8Xdar/qO0QbB7qV5Q/S
        dJpjqya+cGRHvMDGCE0FTqE=
X-Google-Smtp-Source: ABdhPJyTcDQOyB2ngchL6s4ZggGqQ5y5kbVIqdU6obMawpqtxPN8yz8xP4ZFvSWo7jYO8cDCiSVInQ==
X-Received: by 2002:a17:90a:341:: with SMTP id 1mr11024053pjf.31.1629318690141;
        Wed, 18 Aug 2021 13:31:30 -0700 (PDT)
Received: from novachrono.. ([2401:4900:1f3c:3c5:4999:8dfd:3d41:d881])
        by smtp.gmail.com with ESMTPSA id u10sm729460pgj.48.2021.08.18.13.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 13:31:29 -0700 (PDT)
From:   Rajat Asthana <rajatasthana4@gmail.com>
To:     sean@mess.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rajat Asthana <rajatasthana4@gmail.com>,
        syzbot+4d3749e9612c2cfab956@syzkaller.appspotmail.com
Subject: [PATCH] mceusb: Return without resubmitting URB in case of -EPROTO error.
Date:   Thu, 19 Aug 2021 02:01:10 +0530
Message-Id: <20210818203110.1430449-1-rajatasthana4@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzkaller reported a warning called "rcu detected stall in dummy_timer".

The error seems to be an error in mceusb_dev_recv(). In the case of
-EPROTO error, the routine immediately resubmits the URB. Instead it
should return without resubmitting URB.

Reported-by: syzbot+4d3749e9612c2cfab956@syzkaller.appspotmail.com
Signed-off-by: Rajat Asthana <rajatasthana4@gmail.com>
---
 drivers/media/rc/mceusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 5642595a057e..8870c4e6c5f4 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1386,6 +1386,7 @@ static void mceusb_dev_recv(struct urb *urb)
 	case -ECONNRESET:
 	case -ENOENT:
 	case -EILSEQ:
+	case -EPROTO:
 	case -ESHUTDOWN:
 		usb_unlink_urb(urb);
 		return;
-- 
2.32.0

