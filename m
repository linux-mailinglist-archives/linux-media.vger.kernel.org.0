Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3A66117E18
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 04:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfLJDP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 22:15:58 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33349 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbfLJDP6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 22:15:58 -0500
Received: by mail-pf1-f193.google.com with SMTP id y206so8308023pfb.0;
        Mon, 09 Dec 2019 19:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ufec770KvQn7FNhoAx4S5RGx0oFZvH4JpSqgAvbCltA=;
        b=sMzX+KovLhPS0hf0r0R5RkqKKtI9brjkk086xrCFDQHC9lf3UN5XNx9xWXJHCQ24ru
         1dzxbVmCfTrAoMYe1Xl9MRsUfVqw1T9+O+iep6teOdpxhntwCApZXQ5jWsUvvTwDtqzg
         k7Xf3K+lzPuc8DymRmjP6ZDPQUdcN8mZjqg9mLCSOhOzf2NKZ3qjk0n5XWNX/M8CWx1F
         Q6m27oxMSSCsHciiuNmj5cxE9lCNwABXtRjGjjT8cfqNPd65zTQsxEJ7PJ684Xu69GmU
         lWWWZ8lxchpxKld/+lJiEtL0CfnapBPY49cZ6u1N0Si93Lo+6jkP66dJM+FGUJ6hKFZI
         tpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ufec770KvQn7FNhoAx4S5RGx0oFZvH4JpSqgAvbCltA=;
        b=UmKzR9gUCdo+j/W/bYr2kY0qt4DAeUIby8NUgz5v0nTrW3dgK6i5l961URSSEmHY8x
         I5+2f/LlCBnssAO6PCMeC+4BfEkPnZLkViphn8ixWTktkGVmMcvBwin2grBvHDHXFgAx
         lPqbiqvCYAEZ9dyd9YIEPe/3DltEoNyvXoCaX9npnIa1ga5T5uh3wMXNa/owQ2iBZ6mh
         cQho6q59EamVymxmIKTCmBuoBWqR7g5almLV0cPaZirV3DYWNqX0WaeKgV9amcr3mssI
         X5hq6nzU63Dz/BFpNcaADAiXbDjcMAaBSn0LP5nsW9mj2OMtwtWQgS+cnsXSVl1yHgS8
         JJgA==
X-Gm-Message-State: APjAAAXrv2b5tSA0Fgt3gRV0oPm2PZAl+D9Q6XR6VaPl3NaNH3woianP
        XKr5BIpzH9OWYW9ncqoPevM=
X-Google-Smtp-Source: APXvYqzslPZi4KeRjI9eyVqUckkAPNsTDQCzT064iXuYP/B2j+Bg4x0zJzDJdOu0bMPDkd6Rtr5bxg==
X-Received: by 2002:a63:c013:: with SMTP id h19mr22476871pgg.447.1575947757727;
        Mon, 09 Dec 2019 19:15:57 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id e16sm867963pff.181.2019.12.09.19.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 19:15:56 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] media: go7007: fix a miss of snd_card_free
Date:   Tue, 10 Dec 2019 11:15:48 +0800
Message-Id: <20191210031548.18659-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

go7007_snd_init() misses a snd_card_free() in an error path.
Add the missed call to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Use goto to simplify the code.

 drivers/media/usb/go7007/snd-go7007.c | 35 +++++++++++++--------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/go7007/snd-go7007.c b/drivers/media/usb/go7007/snd-go7007.c
index b05fa227ffb2..95756cbb722f 100644
--- a/drivers/media/usb/go7007/snd-go7007.c
+++ b/drivers/media/usb/go7007/snd-go7007.c
@@ -236,22 +236,18 @@ int go7007_snd_init(struct go7007 *go)
 	gosnd->capturing = 0;
 	ret = snd_card_new(go->dev, index[dev], id[dev], THIS_MODULE, 0,
 			   &gosnd->card);
-	if (ret < 0) {
-		kfree(gosnd);
-		return ret;
-	}
+	if (ret < 0)
+		goto free_snd;
+
 	ret = snd_device_new(gosnd->card, SNDRV_DEV_LOWLEVEL, go,
 			&go7007_snd_device_ops);
-	if (ret < 0) {
-		kfree(gosnd);
-		return ret;
-	}
+	if (ret < 0)
+		goto free_card;
+
 	ret = snd_pcm_new(gosnd->card, "go7007", 0, 0, 1, &gosnd->pcm);
-	if (ret < 0) {
-		snd_card_free(gosnd->card);
-		kfree(gosnd);
-		return ret;
-	}
+	if (ret < 0)
+		goto free_card;
+
 	strscpy(gosnd->card->driver, "go7007", sizeof(gosnd->card->driver));
 	strscpy(gosnd->card->shortname, go->name, sizeof(gosnd->card->shortname));
 	strscpy(gosnd->card->longname, gosnd->card->shortname,
@@ -262,11 +258,8 @@ int go7007_snd_init(struct go7007 *go)
 			&go7007_snd_capture_ops);
 
 	ret = snd_card_register(gosnd->card);
-	if (ret < 0) {
-		snd_card_free(gosnd->card);
-		kfree(gosnd);
-		return ret;
-	}
+	if (ret < 0)
+		goto free_card;
 
 	gosnd->substream = NULL;
 	go->snd_context = gosnd;
@@ -274,6 +267,12 @@ int go7007_snd_init(struct go7007 *go)
 	++dev;
 
 	return 0;
+
+free_card:
+	snd_card_free(gosnd->card);
+free_snd:
+	kfree(gosnd);
+	return ret;
 }
 EXPORT_SYMBOL(go7007_snd_init);
 
-- 
2.24.0

