Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96E8EC9EB7
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729375AbfJCMpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:45:50 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45590 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbfJCMpt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:45:49 -0400
Received: by mail-wr1-f65.google.com with SMTP id r5so2712247wrm.12;
        Thu, 03 Oct 2019 05:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=940db3PTzUda6NGaBwDYe5qsP3ZwZELMQcnjKXaprP4=;
        b=nW0aGAeMTpDogI570OyQ7RcWumU9hli3TunxU9LKP9uY9CKVatmy8tsrDN7jzzYrko
         22aWfwLeoOdzJJtyEBwySSRoZSRiquYjzJ2+vZcSuyavaLtgfDoJrrRpaiDAr0pJfIEv
         JyuJKnkMHDCOoCFOQCUMVvaTrpLG7iZf9K4xI3XI8MLmLvMA0yHdlePOvd/BZ+yJoE83
         KSxM861fItp0LXjymGnBgrmTlEje1QUIg3OlTQP7ezLoSqmmiRpgyiQwQEwxNbRKMlXF
         m8pld1qfyYr38G8VSnWDd98tICSyJ5GKgYPmbVAapsdSjDH0GJlAZLbQK3DRuqAdA6lE
         rd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=940db3PTzUda6NGaBwDYe5qsP3ZwZELMQcnjKXaprP4=;
        b=EM/kmX/cUGWnCx4wUhXdkcra0ekfVwin82HaT1DR9vbKXiPt+aOdCTcBvHRZ2WX9eZ
         9s7xjYTvE+/PXpXntueusMhA2oYINmE5Z+FjDq2xPx+zgPfOHml8cZM98Gea5z06+tjC
         XHQxeamTVoekAsXGgWEw0UViV83R0aC3Zc53PiZY5NimPOjCDnL3JDuqlxgPdrNf9Bjy
         Est+JzEGjI0TUAly6MPz6tzZYvccMdybfaTtdVv7h8UYRIUf9wUtB2a8C/RhkzIlEzZW
         YyQac2t3NnTNVjiibGwrsrLEWRbKUue2eCJJU/WH5306s7RuZ6RqOrYZtI+EwD8WewA+
         iMHQ==
X-Gm-Message-State: APjAAAWAQoxlM8HFam8cSm8KjX6Dp+N6w+rnNG5hyHAQG4RHy72EtZbV
        2wSZsuFJomCuWUSJsn8Rn1s=
X-Google-Smtp-Source: APXvYqzBC/BZSo+iZOU2bw8Al2Lirz6sYYF+jLTttY6uZAvnxvgZ0CU7ilvCpmrpZ1fy0uwH7pbblA==
X-Received: by 2002:a5d:52c2:: with SMTP id r2mr7218402wrv.367.1570106746330;
        Thu, 03 Oct 2019 05:45:46 -0700 (PDT)
Received: from localhost.localdomain ([46.114.33.103])
        by smtp.googlemail.com with ESMTPSA id y3sm12880507wmg.2.2019.10.03.05.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 05:45:45 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     sean@mess.org, crope@iki.fi, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gon Solo <gonsolo@gmail.com>
Subject: [PATCH 2/3] [PATCH] s2157: Handle bogus chip version.
Date:   Thu,  3 Oct 2019 14:45:31 +0200
Message-Id: <20191003124532.10945-3-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191003122027.GA2674@Limone>
References: <20191003122027.GA2674@Limone>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On some hardware bogus chip version numbers are returned.
Try to continue without firmware.

Signed-off-by: Gon Solo <gonsolo@gmail.com>
---
 drivers/media/tuners/si2157.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index e87040d6eca7..615bc8a75c64 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -129,13 +129,14 @@ static int si2157_init(struct dvb_frontend *fe)
 	chip_id = cmd.args[1] << 24 | cmd.args[2] << 16 | cmd.args[3] << 8 |
 			cmd.args[4] << 0;
 
-	#define SI2177_A30 ('A' << 24 | 77 << 16 | '3' << 8 | '0' << 0)
-	#define SI2158_A20 ('A' << 24 | 58 << 16 | '2' << 8 | '0' << 0)
-	#define SI2148_A20 ('A' << 24 | 48 << 16 | '2' << 8 | '0' << 0)
-	#define SI2157_A30 ('A' << 24 | 57 << 16 | '3' << 8 | '0' << 0)
-	#define SI2147_A30 ('A' << 24 | 47 << 16 | '3' << 8 | '0' << 0)
-	#define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
-	#define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
+	#define SI2177_A30 ('A' << 24 |  77 << 16 | '3' << 8 | '0' << 0)
+	#define SI2158_A20 ('A' << 24 |  58 << 16 | '2' << 8 | '0' << 0)
+	#define SI2148_A20 ('A' << 24 |  48 << 16 | '2' << 8 | '0' << 0)
+	#define SI2157_A30 ('A' << 24 |  57 << 16 | '3' << 8 | '0' << 0)
+	#define SI2147_A30 ('A' << 24 |  47 << 16 | '3' << 8 | '0' << 0)
+	#define SI2146_A10 ('A' << 24 |  46 << 16 | '1' << 8 | '0' << 0)
+	#define SI2141_A10 ('A' << 24 |  41 << 16 | '1' << 8 | '0' << 0)
+	#define SI_BOGUS   (255 << 24 | 255 << 16 | 255 << 8 | 255 << 0)
 
 	switch (chip_id) {
 	case SI2158_A20:
@@ -148,6 +149,10 @@ static int si2157_init(struct dvb_frontend *fe)
 	case SI2177_A30:
 		fw_name = SI2157_A30_FIRMWARE;
 		break;
+	case SI_BOGUS:
+		dev_info(&client->dev, "Bogus chip version, trying with no firmware\n");
+		fw_name = NULL;
+		break;
 	case SI2157_A30:
 	case SI2147_A30:
 	case SI2146_A10:
-- 
2.20.1

