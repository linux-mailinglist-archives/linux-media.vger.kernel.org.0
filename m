Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5F8010E283
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 17:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfLAQXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Dec 2019 11:23:44 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:41932 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfLAQXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Dec 2019 11:23:44 -0500
Received: by mail-qk1-f193.google.com with SMTP id g15so2166689qka.8;
        Sun, 01 Dec 2019 08:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ca3gAkK8mEDKTQoYW4h/G0KW21BXs9QHiaEf8+8zow4=;
        b=PIF9WBFn5QpTNZvIZdnm96+Rc/rPVmbjduaJJIaOQEvqQx8gqnWIxpNjfi8N7Jy7gR
         jzmGom/vTUbULb5hM0K5xAkxUUp7HdnldnWFgytPdntQiR6HpVpiGejYISu1dDY/e6ml
         KoKSnVbp0nrBXmw+WfGtFKmagV26WIEGHAwyOUasDIxoWZUk6kygn+SsmPGEMLoyS1Vu
         8xvv7vQdlONtlWiM5X1vPu3T6G7iJr9o+WWJd1e+oKR/9V0ca1NYJ2EtVZqTQulEbuK2
         HlaJYqnNvOphmjFPai5c65vGJojCo+/o3KdFHyutaBkpujjrZ72yXkxSxVPwg7RqhRGA
         c5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ca3gAkK8mEDKTQoYW4h/G0KW21BXs9QHiaEf8+8zow4=;
        b=OuD2Dz4lyIqCPk5GWzWV/yxCQISBOGxnFDp85CV5flM5mG8t7ENRUNE9LRdCyNw1Ul
         tAvX+d2dOOMWSCzycYKnZGpxA2W2Rg6t/XZPkws+/oY19yvPusYfm1GcMCvTcN6ZNAm2
         e3M5fBVqzFZBxoZB0pmCDYODjaHj2k3tcRRzuE55kFQiRVtQW/ptjDkBzcAUJ7HAtgcF
         HDSOwzDYHgBSrEp52vxpZRpiihuJO5ssSQVb7uqGwqPKTY0tcEAmtsnNeR2JaPpu7Cqh
         LvDjED5gCw/+FrGzN27TKNIzaLeiCPCii2i+daOGGO9ZpLCet4JxqV6G23Q3TvncC+DW
         NjFw==
X-Gm-Message-State: APjAAAVyxkQ+wg4ZtMofvTrb7cfTbbNnm+J4hm3c3FwXU27HisJtU7dA
        abv0SYXkFnNa1J/m8ZeD1oE=
X-Google-Smtp-Source: APXvYqzvJ9aogJH75lPYKrVoRsU0SieRRxsGSToW9xVeMYc+1x7HMJogEMY42vuDh1LFOUiatwVW2A==
X-Received: by 2002:a05:620a:10ac:: with SMTP id h12mr28488552qkk.227.1575217423362;
        Sun, 01 Dec 2019 08:23:43 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 08:23:43 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] media: dvb_dummy_fe: place EXPORT_SYMBOL below corresponding function
Date:   Sun,  1 Dec 2019 13:15:37 -0300
Message-Id: <20191201161542.69535-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201161542.69535-1-dwlsalmeida@gmail.com>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
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
2.24.0

