Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5715EA746B
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 22:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfICUNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 16:13:39 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46780 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfICUND (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 16:13:03 -0400
Received: by mail-lf1-f68.google.com with SMTP id t8so1485101lfc.13;
        Tue, 03 Sep 2019 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DVgj8XCKgz3RPtqDOp3TFgbusGBaGE3UZiXYJQE5YAA=;
        b=m7jca7Fl/b8d6z/zX+kZ2AuRa6Nwt92MF8QyW6Ku5LA/OTZmZpd4zrMukkUmLsmRRQ
         AXmb4Zw06TQfoYbUAcqKbgjisEqqKG51N0VkaW4srhbRW8WQxHbHK0DDIclplczcYzKx
         qVjaEYEtY7z/bFYoQ7tYwIsA3vBtwotrMnFCmJgHeJY4xWDVVxhGvvYi4qVD1rjhR+T5
         mluXvO69RN1NHr47r1YjK0+27ee/uPxtAgsFSYHkc6KptTGhC9qyNiUCp93nBDhaQCmD
         6cy3aVqltP8y/+lXzFOhiqZnieJDzBK10tdxRw5T6EZJzTuMpXZyeaueoz0/KMQXUNI2
         5tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DVgj8XCKgz3RPtqDOp3TFgbusGBaGE3UZiXYJQE5YAA=;
        b=ucQKtPF1jBoKtyaLfltx4MmZfna5MDzrnnO60f5OK/M1Et5GgwhreN1lEjxz9SwhzG
         DQG/WvpDfh6w927Ixyn1/alvEWYBMtHIlT2xLaZOPkr4HjCIrQ2abT0gLHiuhGa0BFuZ
         EhiHeBv+rymRNI8Gl50VfYvxZ9Di8/14TUbTMz3Rd+bea01WQsXyQ9/MxAzQEOJ+XNB7
         bwDUSj8RrEsm1gD4ZPuy7EtydBFWXI2hl6NuptgbsP3cRFvbmAFhRkgqz72+GTbgn6Zj
         WRNWvaUTqPs0B0iLDUnQukNyAhUHRCNSWvNhAzLm/8ekjrKBpgp+HEPoOLXc1yw4U5DW
         FDZw==
X-Gm-Message-State: APjAAAWdtiIr9qlxMD1IMi4T2zrYZhXVAXATOthiBjXB+D14GYGtosJS
        S7psrIGTjklrRlyO1RsRbtbSfcgw5/OkYg==
X-Google-Smtp-Source: APXvYqx4zk1y64c29k/34P0hqbCBcB68Fkz1iNXi6yjO4vno3fSms0xb4uXiBmILvmAI1sG5ZHGkJw==
X-Received: by 2002:a19:644c:: with SMTP id b12mr4613090lfj.104.1567541580950;
        Tue, 03 Sep 2019 13:13:00 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id u14sm2960884ljd.14.2019.09.03.13.12.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 13:13:00 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 2/9] media: ov6650: Fix control handler not freed on init error
Date:   Tue,  3 Sep 2019 22:11:37 +0200
Message-Id: <20190903201144.13219-3-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903201144.13219-1-jmkrzyszt@gmail.com>
References: <20190903201144.13219-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit afd9690c72c3 ("[media] ov6650: convert to the control
framework"), if an error occurs during initialization of a control
handler, resources possibly allocated to the handler are not freed
before device initialiaton is aborted.  Fix it.

Fixes: afd9690c72c3 ("[media] ov6650: convert to the control framework")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 53550cae2353..cb2aa76cd6cc 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -989,8 +989,10 @@ static int ov6650_probe(struct i2c_client *client,
 			V4L2_CID_GAMMA, 0, 0xff, 1, 0x12);
 
 	priv->subdev.ctrl_handler = &priv->hdl;
-	if (priv->hdl.error)
-		return priv->hdl.error;
+	if (priv->hdl.error) {
+		ret = priv->hdl.error;
+		goto ectlhdlfree;
+	}
 
 	v4l2_ctrl_auto_cluster(2, &priv->autogain, 0, true);
 	v4l2_ctrl_auto_cluster(3, &priv->autowb, 0, true);
@@ -1008,8 +1010,10 @@ static int ov6650_probe(struct i2c_client *client,
 	priv->subdev.internal_ops = &ov6650_internal_ops;
 
 	ret = v4l2_async_register_subdev(&priv->subdev);
-	if (ret)
-		v4l2_ctrl_handler_free(&priv->hdl);
+	if (!ret)
+		return 0;
+ectlhdlfree:
+	v4l2_ctrl_handler_free(&priv->hdl);
 
 	return ret;
 }
-- 
2.21.0

