Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F931B65F2
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 23:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgDWVKq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 17:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgDWVKq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 17:10:46 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11ABBC09B044
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 14:10:46 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a31so1135664pje.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 14:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WYxKCRpYcYJulfhpMhiVVDeFXV8YlPiKJygpdbe/abE=;
        b=lnyVafeXM3v8E0R4lop6SK7FRVEIdJZpMwyFF8Q61z+vbTzaxIlYbaZuAa9kD76aSC
         34rwgTN+09JaQOBKH5U6YwfghXjclKA+1Xs37rG+HY3GA9uS4CJnNHgb9+Nb9kb6ijvQ
         mm/iIFvS87x+f9e+QtCGMl0nakWumLdLhW8SZ6jk5GeXxyczPit5unDlnunQNKuXA63v
         CQSHTJ6Do+QNyozaCzV3nGXH87NWmxIlTE6lQJ3Y0pmUjnioSoLP5bVihIbVCCn0jKin
         xdfg71faYWyXAz6RE7pp2rHTBLzNJZpSFQo09/slAcUjGBSQUinG+MwBXituwHQssHkS
         WYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WYxKCRpYcYJulfhpMhiVVDeFXV8YlPiKJygpdbe/abE=;
        b=G5oq7lp8BAK1JRDOgy2pPRd2p3B45Av//iuEvfl2kekQAIAF3O5ikKwU6VAebk+w7E
         14qSJuMgpdyErwjSFUHMs66eJskkedv48V+PActZ73O7XUm9HteV8hKoJffitcITm9WW
         YV3e36zDEtvw5JBvlIb+2EXXxWhoI/VsMUpwMRaWfrtxNVn3kPtEw8gXVEPpT6x8KJta
         qsIgHeKoHnIX2gdLim2PMILq19xnfSjZ3lcKrUqeeHnungR20yTN1UIf2cDfHdaOznxE
         1ybXha+GM7KrDjviBrYNA4vI3BPdW5HQZjcRGXF9CP2/WK9bpUr9pOpBMMW7jAP8ZO1B
         PSqw==
X-Gm-Message-State: AGi0PuaNFaxA8Hzr1t3dLXPghfUSxa2vIpwP/pwv4Ni0e6huCktUvPwG
        woMitgVTHUJssjSFH1GWxVusYatA
X-Google-Smtp-Source: APiQypLmuPT9/DCxj+uVPKOS3oWsfAJC82LjJaSQAsXykwwJKBlxMPRmqgqvspf65uD/lD8kYnj7ZA==
X-Received: by 2002:a17:90a:589:: with SMTP id i9mr2656907pji.156.1587676245174;
        Thu, 23 Apr 2020 14:10:45 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id f21sm3563630pfn.71.2020.04.23.14.10.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 14:10:44 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/5] utils: fix compilation with C++98
Date:   Thu, 23 Apr 2020 14:10:36 -0700
Message-Id: <20200423211040.14275-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 4 ++--
 utils/rds-ctl/rds-ctl.cpp         | 2 +-
 utils/v4l2-ctl/v4l2-ctl-tuner.cpp | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 032ff5ad..cc07998a 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -908,7 +908,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
 		fail_on_test(!transmit_timeout(node, &msg));
 		fail_on_test(timed_out_or_abort(&msg));
-		info = {};
+		memset(&info, 0, sizeof(info));
 		cec_ops_tuner_device_status(&msg, &info);
 		if (!memcmp(&info, &info_vec[0], sizeof(info)))
 			break;
@@ -935,7 +935,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
 		fail_on_test(!transmit_timeout(node, &msg));
 		fail_on_test(timed_out_or_abort(&msg));
-		info = {};
+		memset(&info, 0, sizeof(info));
 		cec_ops_tuner_device_status(&msg, &info);
 		if (memcmp(&info, &(*iter), sizeof(info))) {
 			log_tuner_service(info);
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 0511fe5d..0e497b2a 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -918,7 +918,7 @@ static void get_options(const int fd, const int capabilities, struct v4l2_freque
 				printf("\tFrequency range      : %.1f MHz - %.1f MHz\n",
 					 vt.rangelow / 16.0, vt.rangehigh / 16.0);
 			printf("\tSignal strength/AFC  : %ld%%/%d\n",
-				std::lround(vt.signal / 655.35), vt.afc);
+				lround(vt.signal / 655.25), vt.afc);
 			printf("\tCurrent audio mode   : %s\n", audmode2s(vt.audmode));
 			printf("\tAvailable subchannels: %s\n",
 					rxsubchans2s(vt.rxsubchans).c_str());
diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
index bc397ec2..73dc323c 100644
--- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
@@ -423,7 +423,7 @@ void tuner_get(cv4l_fd &_fd)
 
 			if (vt.type != V4L2_TUNER_SDR && vt.type != V4L2_TUNER_RF) {
 				printf("\tSignal strength/AFC  : %ld%%/%d\n",
-				       std::lround(vt.signal / 655.35), vt.afc);
+				       lround(vt.signal / 655.35), vt.afc);
 				printf("\tCurrent audio mode   : %s\n", audmode2s(vt.audmode));
 				printf("\tAvailable subchannels: %s\n", rxsubchans2s(vt.rxsubchans).c_str());
 			}
-- 
2.25.3

