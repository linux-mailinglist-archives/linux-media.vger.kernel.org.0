Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67E42F246C
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 02:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732947AbfKGBoF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 20:44:05 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36074 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbfKGBoF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 20:44:05 -0500
Received: by mail-qt1-f195.google.com with SMTP id y10so633050qto.3;
        Wed, 06 Nov 2019 17:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tPal4Tiqr59qTE4j9taLMEZPyrRNOc3SEDhq39Ai+vg=;
        b=kic0KlCfgbyQSycleGSUGHg4bZcIuK3yiYuF99JI4LmP+9yGNWmh7TBUXvukOm0JVd
         nVJVCnB8tq/YCsPxguRsnntFs7IuCYTrd4/7stszwGUmFf3vRa2UX1+HQ6UC1TdpRRCD
         VS9G8/HP64zEU99KnjBUQz1h/o286W4d0lKqe8ceAdQBauATsFQMp5sUOLrjabMdHXc+
         y0svqQXEXfZIDswBnvrWB8pb0j5FdfIhqlYDVNxlL9q4XloYWAzSuwP7051wmYXjbWCe
         DJvSrI+bhrnVh+aphEb9xAPBwUmi9Mv7s/z8vTPVzm7AAVSbhPIgbwgLElwvlr5uTdrh
         2fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tPal4Tiqr59qTE4j9taLMEZPyrRNOc3SEDhq39Ai+vg=;
        b=q72BOucDefGAS6qe3OOkXKev5HD6Jzl/qhrqJIzQncDC/8NyJi1NqbzZsgE6Y+dfDU
         pUgtjA7h9Gz3riFVpUcmiFcvakS3z1wbbNdrBt1CMMuMtl2ajGn1OWc49bqZMKqp/nJQ
         DDS7D5024HGtV5gC33pDfurDr0Tb7aw6rDTv50pVujIQ+N99oaP+jE94GjLDxE1RnxUP
         gFRbyAYhEizW/cjJoucGoDCxE/7PWiFN9nygbQNT81zwYLyNq7uclFf83+pmEVkSavSl
         3yFKgbkJUkitT8ZU9H9JKmWI0Gg0tXoX8dKMu/rUA6eY9C5vQnWJNea5Ten/j4vBXzJq
         sg1w==
X-Gm-Message-State: APjAAAWs3fRHhPjVgwgBOMUcs6Xr+2YAjwaE9xP3ithGLAHJNiLXtpqP
        6w/owZIjmX1fBu0ASDg4E3g=
X-Google-Smtp-Source: APXvYqz1z+OOXVnwnekzSO564Z0h38RCFhoI+TOMiMkZG4/Vq6sygDhROacXTZXFBFiDWUtG/TUIRw==
X-Received: by 2002:ac8:7188:: with SMTP id w8mr1173603qto.211.1573091044281;
        Wed, 06 Nov 2019 17:44:04 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id g45sm377343qtb.48.2019.11.06.17.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 17:44:03 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, rfontana@redhat.com,
        gregkh@linuxfoundation.org, allison@lohutok.net,
        kstewart@linuxfoundation.org, tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] media: dvb_dummy_fe: place EXPORT_SYMBOL below corresponding function
Date:   Wed,  6 Nov 2019 22:36:33 -0300
Message-Id: <20191107013633.21894-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
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
Changes in V2:
*Add git commit log

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

