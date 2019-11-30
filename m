Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFA710DC5E
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2019 06:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbfK3FCt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Nov 2019 00:02:49 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44908 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbfK3FCt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Nov 2019 00:02:49 -0500
Received: by mail-qt1-f194.google.com with SMTP id g24so27918343qtq.11;
        Fri, 29 Nov 2019 21:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v2t4S2oRrDrvLFBOnB6dJGEG8QhYQMSo3sQCvKaKAA8=;
        b=fVJJdPhZjuVFj7BDk5abPsGB2R9H0GROrSTvuGs7eRbP1HI2oyAOMeb7ixPbu94vju
         psCSIJ339kw74n0XMfSWAYM9fRPr7p2BVm8jNr2sClbsdXd8HNp7ludHI+m+iFxQNE0E
         eEEeHxkw9PgHbRtlzm108fGLoB0e+/k56BRDiddNn3Uo8GR25FR5iWTsgtWAjNBHHsHT
         eNWknR8l4y4pL3iwIHLJvcsHlu2i5ozKZRBhVMPv48f7hFPOFb4fW4kFdqkzSJmQgVlS
         +7JO13R5DhHnJ82pRe77SIP2wnlGUcygnUug14AoOrDnN+zzkRo1oAmT/fBoqYDXWpZo
         9Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v2t4S2oRrDrvLFBOnB6dJGEG8QhYQMSo3sQCvKaKAA8=;
        b=SaUMAUGwa1AZN6YwwDRtPgY+mqYWIimCCwkncFt1ENHaZSWWW6yYP2azHJ/Xv2cgll
         7WjNbRGzJ9PZejGxOZ3H8Tdzdcu/ueN88QqprTC8MGRdKwIUgg7YetoS5YcimGVCgz2H
         fbVRkO8mpbQ4tM+yzm0MMZvp9ZGAiSzUNgoqUp2TnDjCVTNTv6AeK3VfUmzCd2aacBAh
         AjcEJ4qYpFqwBzbLkX7nujxtsm+WvU7nTTRhgDhYQWtd7qMYFT0iG2/6FwBvkSzTdDVl
         k3sQ1/a/pDy5nS5R28OyISBtOHY/y1CZDxDb0lUlCLBqdYzeKQSgwsQ1q3/HEzsUlODu
         Lu8Q==
X-Gm-Message-State: APjAAAXpFdOEkAVGdJbeXNpDqw1GZNa4Y/IP7FMbERiSJ3KbpgmL6y7o
        QjHSZPaYNHiN+nAg3aJLjnw=
X-Google-Smtp-Source: APXvYqxr5V+yHjKM8qf9L9Okteakl0KcnAjQPyW+oWlKlsdUJWQZ2sYsqqZ21G0G3kQc+M6KlUAihg==
X-Received: by 2002:ac8:468c:: with SMTP id g12mr2677906qto.92.1575090168076;
        Fri, 29 Nov 2019 21:02:48 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id g64sm2440437qke.43.2019.11.29.21.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 21:02:47 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb_dummy_fe.c: add members to dvb_dummy_fe_state
Date:   Sat, 30 Nov 2019 01:54:20 -0300
Message-Id: <20191130045420.111288-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Add members to dvb_dummy_fe_state in order to match with other frontends.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 26 +++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 1ccb58c67e8e..80e6a3bf76e0 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -15,18 +15,29 @@
 
 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 
+struct dvb_dummy_fe_config {};
+
 struct dvb_dummy_fe_state {
 	struct dvb_frontend frontend;
+	struct mutex lock;
+	struct dvb_adapter adapter;
+	struct dvb_frontend frontend;
+	struct dvb_dummy_fe_config config;
+
+	enum fe_status frontend_status;
+	u32 current_frequency;
+
+	bool sleeping;
 };
 
+
+
 static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 				    enum fe_status *status)
 {
-	*status = FE_HAS_SIGNAL
-		| FE_HAS_CARRIER
-		| FE_HAS_VITERBI
-		| FE_HAS_SYNC
-		| FE_HAS_LOCK;
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	*status = state->frontend_status;
 
 	return 0;
 }
@@ -79,6 +90,11 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
 
 static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
 {
+
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	state->sleeping = true;
+
 	return 0;
 }
 
-- 
2.24.0

