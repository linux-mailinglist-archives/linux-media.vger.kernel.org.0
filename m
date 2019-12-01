Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1BE210E285
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 17:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbfLAQXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Dec 2019 11:23:48 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:44321 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfLAQXs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Dec 2019 11:23:48 -0500
Received: by mail-qk1-f194.google.com with SMTP id i18so4946956qkl.11;
        Sun, 01 Dec 2019 08:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=px5mGVSkvshDLcx6vUKr4u5NGx6h5wRvenyALNaHoq8=;
        b=dv3AiXyjBZOfDb5hL0Bs07CIE7as6PtU4Udo4wFLWcTnptGe01yYao2NT+HwO3uT6B
         Gwfxm0rjzE0iu9SEs8wmHU1Kzaqs1lw/m9f+if35dIXCUzIlCG73IKXIrKMwHN3goE5S
         AvvhkPU/QEKjMd4fLfYRKMN4eMUCffEq3Gb6Zr3HegNUla6ZVRM+TwB30n477/g4PFMR
         SwhKPIhhgHk4tzVYmSO1rk9Td1r9E0BL+XvAg+vLMWA0myWvgSDVrA7aBwziT2edRM6o
         TBol1B9u5P4Y1CYZSj7rS0lvwCCLnWJBhe/bcCmvYYWL7m8YQa4T5h8I4MIZubxwJ+Xv
         U1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=px5mGVSkvshDLcx6vUKr4u5NGx6h5wRvenyALNaHoq8=;
        b=Q6P4A0KVx0D9We4lacuwr0a4SD6dOeAmOK9sHFIZfR19/7aMS0kucleP2AiFDh/mxu
         //+lf3bjIwh16TAiNVj1rhy2V/d0e7zBoGSmRPYxy2eUj4z9fCxSBi7Xi/GzDk2qnD33
         yZWt+o7TrHHunnPdemR4sGtwfCauU95/g8NPvpfEeS65pE/abMhGI7g5JZ9YAkUTGIbu
         8sNvUYjgbfarQ2Kjb7u7K95DeXEO72r/ciwj7Y9+83++c03lBz/jUwEoVIUZxDUn3Lr5
         rJYK5XUQG11PouFHLwTrQCCjqVmzEsxYIG78zmgbjWIzcFiX9cVv3gD4uHAtBelT9nwf
         zSFQ==
X-Gm-Message-State: APjAAAVyg8tMqKBjIMl8HvHvN1mQa9JbxvMS6wz9j2GDW5+P9M9s8uM9
        pqseOZIGmcFBhPdT7oY0xMQ=
X-Google-Smtp-Source: APXvYqwB12RAlEqU8XxPNqL2hJc/ukSHUGY4zndLxZ4diNZyUL0abcl4ObAp7mDpeTLRn4j4qOXxFg==
X-Received: by 2002:a37:a58e:: with SMTP id o136mr20538199qke.300.1575217427151;
        Sun, 01 Dec 2019 08:23:47 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 08:23:46 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] media: dvb_dummy_fe: Add error messages in case of attach failure
Date:   Sun,  1 Dec 2019 13:15:38 -0300
Message-Id: <20191201161542.69535-3-dwlsalmeida@gmail.com>
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

Complain if the attach functions fail, for any reason. This is helpful
when debugging.

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 909dac2345c4..987c3488fe6c 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -114,12 +114,16 @@ struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
 	if (!state)
-		return NULL;
+		goto err;
 
 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
+
+err:
+	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
+	return NULL;
 }
 EXPORT_SYMBOL(dvb_dummy_fe_ofdm_attach);
 
@@ -132,12 +136,16 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
 	if (!state)
-		return NULL;
+		goto err;
 
 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
+
+err:
+	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
+	return NULL;
 }
 EXPORT_SYMBOL(dvb_dummy_fe_qpsk_attach);
 
@@ -150,12 +158,16 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
 	if (!state)
-		return NULL;
+		goto err;
 
 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
+
+err:
+	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
+	return NULL;
 }
 EXPORT_SYMBOL(dvb_dummy_fe_qam_attach);
 
-- 
2.24.0

