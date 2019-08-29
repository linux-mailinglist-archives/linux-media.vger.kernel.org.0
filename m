Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71CB7A13F3
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 10:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfH2IjO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 04:39:14 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32833 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbfH2IjN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 04:39:13 -0400
Received: by mail-pf1-f193.google.com with SMTP id g2so1602500pfq.0
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 01:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oWWFjXBXV97k6e+KMOkhuMA9hkqjfziiYnJYOJoXUYc=;
        b=Bx9GH7iFCauvKnxOMKdCmuvU5FK8WVtDdHuYEirMO4asjjSAkqiJ9sZHUZl9KNI8b7
         pSc9DRujs2pdm64MjQlhmPF4iwd+dkXp+dMLz6SRWN+u9k2f3Xke5wXbcBK57vlg69yE
         sQbeFZG3eZaosGhFz4boa7FBnE7JVWb5VOCUmny7MikvQHpMWUY93sjMX8ypkJKFIvq3
         AWStymi86fE43OKPr8i/TrdsOupFikDF0PKVys/jLKlrinah7RGxAuSE+Y2rHycrjGOK
         48q0A7z/3mqMJkD2J76cN1kkXJdOOAG2aO61CDOH3DKfODqxpEZy6QfIi1Cj5ryw18Uy
         562g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oWWFjXBXV97k6e+KMOkhuMA9hkqjfziiYnJYOJoXUYc=;
        b=NUiVQCIOvdBhBxwXqaJ514uIe2nBZ9RQlJE2E51S0h+WTu6LEwzmHhJWB+hVxeESGL
         K87rJNKnowpHR4OQDz0GECNLe2CaaeCKdWtlbAHevO92Uud8++X1efyS0sdWgwp616S/
         qnuqvqT+/RdjzR+XRjTsLs0sUvSv0rd2BZEUMSyjrrpQTJRO96Rwzt6Sc42FiwvdvJ8B
         f97rGFyFpvHhSzIxdUogvi0GJhEo7WiP7ALPiqNt7aE3g7sxkQJw4veBtqXZDd3gOOru
         w+rni9k8jNspFp9udIWPH+zahzX3kTtutFIAqLXxR2R6nqB+sHNu1+eBjHdPTTrkrN8s
         vNmA==
X-Gm-Message-State: APjAAAUx4aKZyKw6sC7wrGryWIdGWM3UOZ2pN3Rtv5RaLmY7HLMAcWCh
        PQ5lGVz5B+l1xCn3F4TljnG7lSYQ
X-Google-Smtp-Source: APXvYqzWDpQ0D7QkYd/0WicIt8Z45VvzzviaPdGSzMbJsZjPdyEr6BQOSYqDWf0CD2Z2WROrz22qsw==
X-Received: by 2002:a65:64c6:: with SMTP id t6mr7383477pgv.323.1567067953000;
        Thu, 29 Aug 2019 01:39:13 -0700 (PDT)
Received: from localhost.localdomain (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.googlemail.com with ESMTPSA id g10sm3498518pfb.95.2019.08.29.01.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 01:39:12 -0700 (PDT)
From:   tskd08@gmail.com
To:     linux-media@vger.kernel.org
Cc:     crope@iki.fi, sean@mess.org, mchehab@kernel.org,
        Akihiro Tsukada <tskd08@gmail.com>
Subject: [PATCH v2 4/4] dvb-usb-gl861: support I2C read from tuner via demod
Date:   Thu, 29 Aug 2019 17:38:22 +0900
Message-Id: <20190829083822.3670-5-tskd08@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190829083822.3670-1-tskd08@gmail.com>
References: <20190829083822.3670-1-tskd08@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Akihiro Tsukada <tskd08@gmail.com>

Support Friio devices to read from tuner via demod tc90522,
by enabling the config option.

Signed-off-by: Akihiro Tsukada <tskd08@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/gl861.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/dvb-usb-v2/gl861.c b/drivers/media/usb/dvb-usb-v2/gl861.c
index e5dc1fc409f..6d378aad1f0 100644
--- a/drivers/media/usb/dvb-usb-v2/gl861.c
+++ b/drivers/media/usb/dvb-usb-v2/gl861.c
@@ -242,6 +242,7 @@ struct friio_config {
 
 static const struct friio_config friio_config = {
 	.demod_info = { I2C_BOARD_INFO(TC90522_I2C_DEV_TER, 0x18), },
+	.demod_cfg = { .split_tuner_read_i2c = true, },
 	.tuner_info = { I2C_BOARD_INFO("tua6034_friio", 0x60), },
 };
 
-- 
2.23.0

