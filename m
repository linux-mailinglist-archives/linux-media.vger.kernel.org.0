Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10C881168BB
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 09:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfLII6U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 03:58:20 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45772 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfLII6U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 03:58:20 -0500
Received: by mail-pg1-f193.google.com with SMTP id b9so6370910pgk.12;
        Mon, 09 Dec 2019 00:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=quNuOEA5nR90xmqWledAif7nMZZ8pn2xX9YiOvl0uw0=;
        b=fo27XehCDDbswYaVMrVS3nFC5fQNhbJvjBxrxywhppJb1Zx38ogCnq4fjMo8KORfeJ
         h8NFbK7iYONX1EbBDib/Jtt0rg7xRGJ2OaQtXkV9+dJ/SQjYAG02K/Gmv+IYLW2vlkky
         QJbidaEb+oNlc//YsQ6fMZGWdpPvFky7dXVhEpTpIyZLmnDDcOdgHr307GzMq78GiFuT
         e0KhZpanYNHBejQaYYzMp+cULfoE2ii15zS1R3qb/vTQ6U9/3u8TM0cKMjQsqwxILm8E
         FvoWdQPP611RPWjDdcJzy1j4zSx+QD2bAV/tfB1hkx+ebyas5LApdiofRK2vQ7JQ8usg
         TnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=quNuOEA5nR90xmqWledAif7nMZZ8pn2xX9YiOvl0uw0=;
        b=mMvMBBjAaBc+TXOzUZOefmJEE9NsVcXDQQdEmqiyTo5UUi8Nm1YdLF0Lxu05nSKQmP
         tNfJ05KgqSZqUPr9F+Vd+Kzqqr+Q3N9pSWTB2tjt/B91F/EzHbg8eB/nwMdRpdZUaEgc
         66aoGvglqUrAazg7xXc+1/wLEFTaPUz+q8p7EsasJoiLK9lm0aRTe7akLBhxMlYshjq2
         DHAIxCzQ9KbJlRRPx/wrW/iUnFQQBQN0ox0Q1nnoyL4TdstmEIWjrDGjtr9vBlGGPHZL
         lzIadMYR5GNmjmihp4Z19iJbXNgPteA7P7ezmJN8SpT8kBV+AxcayLcxjMr/PrjC7ojC
         oodg==
X-Gm-Message-State: APjAAAXHGJq4JwSd+HneePee5e9sSRU0Ti5EzaCjbxMeERymzGwEXqjK
        NR3OiZ9teI3OxzgMXtnX0gs=
X-Google-Smtp-Source: APXvYqzbq2tEfloswSTy+xvQ5tNqSUT2de/+TYI91+6etQ4PkAsLeGZFrDwv+JrtVlf0dyvHnNxnzg==
X-Received: by 2002:a63:d041:: with SMTP id s1mr17863747pgi.363.1575881899517;
        Mon, 09 Dec 2019 00:58:19 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id m13sm23596045pga.70.2019.12.09.00.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:58:18 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: allegro: add the missed check for v4l2_m2m_ctx_init
Date:   Mon,  9 Dec 2019 16:58:07 +0800
Message-Id: <20191209085807.16126-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

allegro_open() misses a check for v4l2_m2m_ctx_init().
Add a check and error handling code to fix it.

Fixes: f20387dfd065 ("media: allegro: add Allegro DVT video IP core driver")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 6f0cd0784786..5f1d454b41bb 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -2341,6 +2341,13 @@ static int allegro_open(struct file *file)
 	channel->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, channel,
 						allegro_queue_init);
 
+	if (IS_ERR(channel->fh.m2m_ctx)) {
+		v4l2_fh_del(&channel->fh);
+		v4l2_fh_exit(&channel->fh);
+		kfree(channel);
+		return PTR_ERR(channel->fh.m2m_ctx);
+	}
+
 	return 0;
 }
 
-- 
2.24.0

