Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E387F1DBC
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 19:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbfKFSqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 13:46:05 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:44344 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbfKFSqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 13:46:05 -0500
Received: by mail-qv1-f65.google.com with SMTP id h3so1863929qvu.11;
        Wed, 06 Nov 2019 10:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xqKVR8+28xX8jn1ajKOvJmCoNPe5YW5nnfJvLZP2QFA=;
        b=mm9eG5iWo3edDJ5Q6P3hPOxVep5q2K3KjbsWIEMNuVcWmLT0v51xRqYkA+77cgFTAm
         AkqWkSfXJILEUzBCTxogMOMUYi/kgJOs3UrW/GFbwEZtNN69rp4jt0F3SplaXx2fILs5
         LDWHdNz/sR5YodJ7v1RQWj6VbAd/WwmyUnhwXDwGA5aT96Q/BM79AcAvNXVXyISLL1hc
         2BsMQvg/v7UzH8JlMrqMXxJ4yyUk5QGTK39rZ0el5EIZ9SZIW8Wir1EELgTxZh7jEtpz
         /PwNvxEhdBzRK/jqFOQG4IY6BTDfKQg4raEiDuMzq75L8OLjyImBcbiC8m94Zg/vj9P8
         CKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xqKVR8+28xX8jn1ajKOvJmCoNPe5YW5nnfJvLZP2QFA=;
        b=g3u3edmWaWlRTpcr+JHJY5LPWUfGy0r1vH4xzI5TyfrqcP1PvG+TFm3nMu8rQKDsmx
         u0rLDthm7e1lwdmwe0fFwjTxV7Ta9+TUiD1PPdKn/qLpjPaGEbyNulBSbEoc/KiVbWvF
         cLm9fqyy/ASFUM2m1u7EnA5I6dRvgVHDLl2F+uu+L7L5U4iCs6FfqehsVTOsgid9pM5y
         DjHCIr1fcMLBwNhvlTOjcupD3oVAYgBN1WZwj+5NfeQtASwO7Ns2F1ZP5sBioxUvaP1i
         6dEsevdrvtszB4NVFUOk5G1xNefvn2qHyAWhK9epQNE28GQDkx9CUqnRUBh8izDTEfIZ
         Lmpw==
X-Gm-Message-State: APjAAAW8kuYH7LVNJWLhYH7i0zDVNEi73Vf7B92SkGTQ8imNwSsRXTM/
        C5teGpC+pc3oEL/rkMMRA6ikBnh/SBsWcg==
X-Google-Smtp-Source: APXvYqwcr92g+ImNjq8gjyE9YsbjIoCi8Q5957/WEcZP2A43LYQ7q7Wa7mNdy5c/Qon9X06VYNo/Og==
X-Received: by 2002:ad4:4201:: with SMTP id k1mr3768993qvp.33.1573065964124;
        Wed, 06 Nov 2019 10:46:04 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id o1sm13977350qtb.82.2019.11.06.10.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 10:46:03 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, rfontana@redhat.com,
        gregkh@linuxfoundation.org, allison@lohutok.net,
        kstewart@linuxfoundation.org, tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org
Subject: [PATCH] media: dvb_dummy_fe: place EXPORT_SYMBOL below corresponding function
Date:   Wed,  6 Nov 2019 15:37:16 -0300
Message-Id: <20191106183716.29170-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

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
2.24.0

