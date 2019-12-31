Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9CA12DB14
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2019 20:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbfLaTLh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Dec 2019 14:11:37 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38067 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfLaTLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Dec 2019 14:11:37 -0500
Received: by mail-pl1-f196.google.com with SMTP id f20so16165454plj.5;
        Tue, 31 Dec 2019 11:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lQdJvCTpaeep71PkxgVm04JNX1seJqxMx0Ss3EM+vAI=;
        b=FNZOGVaojf4cMrj0OHRNBpwvRuuJT95koi0GS9h+9nqodymkEsKwVGwGQBItouFalB
         qThnULG4Oki7IYjXXqvbwqNicjhXKtIMOQxdagH0vyjfWdt9zgu0odnrRAjpBY08Dow+
         bIh2JKtatPOnP97u9MbLbAmQx3PuR3jRsPWjjkMVowQ2vCVb5vvmVgZCqUB2t3O0y5qb
         c2imLoAeHwntI3v0B0uPx3Fz3coObVFC8InunSxTPnpfLteEeOhgLWZgrrTWXIOjAKRZ
         sTgct4cuX8J9PgQcX+SxnD5r6WBzA6J5Df2lWrellm7W3MFkyl8IwmC5YRhyCTBjA6IF
         V2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lQdJvCTpaeep71PkxgVm04JNX1seJqxMx0Ss3EM+vAI=;
        b=pd7NPA/gsN03+RSzNZXd25rF34MQNhP6EfGRZ/AkYvzN7pi+beg4oOXhtSSHekDvOs
         kzx2KdcpBGU4a2AdNthnTNb/rsmynjjr00Mthn6hjdhy0jEmphMo65dnwW7tg4eXiVkt
         3A6JV3/Mwi3tE3qHkQH4/35HEQNqo14j3OT1wk2TGrv0dRuZOFXwhKtCoQmmvyYuPzmb
         LVkNRqJb+4ezuJojLg21h+lQOmf55bJrZi5g7SADq4DvhoHJh7IyxYFoTrmPJD+QNlyl
         q5xP8l9Y9mwSdQlJmt3Khad4zlYOcnL8wtUNvmVuXW0mzkuds6S68WWLfGo0cZdS0R4J
         K/ow==
X-Gm-Message-State: APjAAAVw5O83cMT8qtwg5+joB4MXvKfTFsDbbQzRJzoRgWMFN/NFPkHN
        e8UfrnqWLYpHaKEtvKFwdrc=
X-Google-Smtp-Source: APXvYqzpsN0b1PKJ0QC6kB7iewh9kWewA5K03iHnkT+RRCyZeXpHow7Q1iPCNiQPSfmx9uGAk+6Kdg==
X-Received: by 2002:a17:90a:3586:: with SMTP id r6mr8127193pjb.36.1577819496495;
        Tue, 31 Dec 2019 11:11:36 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id s24sm4366134pjp.17.2019.12.31.11.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 11:11:36 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] media: dvb_dummy_fe: place EXPORT_SYMBOL below corresponding function
Date:   Tue, 31 Dec 2019 16:11:20 -0300
Message-Id: <b08fea3c01b465a16962b6c65a9b24dd43f2b536.1577819245.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577819245.git.dwlsalmeida@gmail.com>
References: <cover.1577819245.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

dvb_dummy_fe.c had all its EXPORT_SYMBOL macros located at the end of the
file. Now these are located directly below the symbol they are exporting
for increased readability.

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 4db679cb70ad..909dac2345c4 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -121,6 +121,7 @@ struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
+EXPORT_SYMBOL(dvb_dummy_fe_ofdm_attach);
 
 static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
 
@@ -138,6 +139,7 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
+EXPORT_SYMBOL(dvb_dummy_fe_qpsk_attach);
 
 static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
 
@@ -155,6 +157,7 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
+EXPORT_SYMBOL(dvb_dummy_fe_qam_attach);
 
 static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
 	.delsys = { SYS_DVBT },
@@ -253,7 +256,3 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops = {
 MODULE_DESCRIPTION("DVB DUMMY Frontend");
 MODULE_AUTHOR("Emard");
 MODULE_LICENSE("GPL");
-
-EXPORT_SYMBOL(dvb_dummy_fe_ofdm_attach);
-EXPORT_SYMBOL(dvb_dummy_fe_qam_attach);
-EXPORT_SYMBOL(dvb_dummy_fe_qpsk_attach);
-- 
2.24.1

