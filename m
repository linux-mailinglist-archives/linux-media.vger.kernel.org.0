Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C134117E15
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 04:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfLJDPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 22:15:45 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34109 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbfLJDPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 22:15:45 -0500
Received: by mail-pl1-f194.google.com with SMTP id x17so1411053pln.1;
        Mon, 09 Dec 2019 19:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lf7Lv6WHD6eyJBTAis1s6gLEc0xY5Sw43153FEhgxHY=;
        b=UlD66aZIOc19ZMVj8QYV3fX/ai5uFQ8LKhkdKHZXDBcoLNMKGficgmJVcQJ+ltNkkT
         G74hEQFVbnD9CtFpMJ01wDVtH1diWO2KVLfTPZo3KDG/DPoov/AEwX1GlR7XAsUfdMmh
         8C/jq9+2T8P1AYVlWyBsia739jJWAsP3MhJRcvmifa85lN8Ke1RWg1AWyJi/kaBfdPif
         7CXNW0Xii82zXcxeoIxcqI8Z2G66ATSr4nmQNvDWf5Gb2j3dfyvrPmbAtS9g7zApBFRq
         V6dDhc42VgAKAoTPosgBRdbFWzYTKttjOTUjWvg368hg7UVsVj624kKrpGpEFeBhSd38
         /Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lf7Lv6WHD6eyJBTAis1s6gLEc0xY5Sw43153FEhgxHY=;
        b=OiQ2QeD+s80710X8XH7YnjGf42XLRCvqbXs3WpcqwAe0Itbh4AcNFi1WvAJEZlF0ay
         o9+amPYIHmbdzeRuJ8yaLj0kmcLBw5H8o9Qt6lJ2e+3j6MbpXxkyPGooLhZzud8vEkW6
         vXz5gACa5+Edkhk7lVV41CBzwixnVpQzIRno/t7xHbFZmmShVHkOCNAbcRRRv6dcwcum
         SGGBoqBUMgpmFwJcFa2sUzeoV831Bz2efzYtWBCiv2cp5/vFnsNx5QI2tNYfNA5zlBu0
         Md+CUIF3mTjmLY7SHk0TTjzV0+2W6GsHe4M94GssrT3YBCIf2MCHx5zxX8hEKcRLlig5
         hWUA==
X-Gm-Message-State: APjAAAUcmU5Q9W5+YAabpvUg7kPdFGpw4C0qPZtHkM+sohtTbyKfq272
        BMFwCFNwpTN43BYIh3FQscZkzyOeeg4=
X-Google-Smtp-Source: APXvYqw6mz5BYHxyl3UuHtCTak44jFFwX9tNEgwxnu+7tW4HubuglsACfHAh2B9Jbg005M+aViqFzQ==
X-Received: by 2002:a17:902:7c0a:: with SMTP id x10mr33699831pll.168.1575947744695;
        Mon, 09 Dec 2019 19:15:44 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id i127sm942717pfe.54.2019.12.09.19.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 19:15:43 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] media: allegro: add the missed check for v4l2_m2m_ctx_init
Date:   Tue, 10 Dec 2019 11:15:32 +0800
Message-Id: <20191210031532.18603-1-hslester96@gmail.com>
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
Changes in v2:
  - Fix the use-after-free in v1.

 drivers/staging/media/allegro-dvt/allegro-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 6f0cd0784786..66736beb67af 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -2270,6 +2270,7 @@ static int allegro_open(struct file *file)
 	struct allegro_channel *channel = NULL;
 	struct v4l2_ctrl_handler *handler;
 	u64 mask;
+	int ret;
 
 	channel = kzalloc(sizeof(*channel), GFP_KERNEL);
 	if (!channel)
@@ -2341,6 +2342,14 @@ static int allegro_open(struct file *file)
 	channel->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, channel,
 						allegro_queue_init);
 
+	if (IS_ERR(channel->fh.m2m_ctx)) {
+		ret = PTR_ERR(channel->fh.m2m_ctx);
+		v4l2_fh_del(&channel->fh);
+		v4l2_fh_exit(&channel->fh);
+		kfree(channel);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.24.0

