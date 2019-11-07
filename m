Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFA4EF2475
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 02:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbfKGBpR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 20:45:17 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43033 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbfKGBpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 20:45:17 -0500
Received: by mail-qt1-f196.google.com with SMTP id l24so592502qtp.10;
        Wed, 06 Nov 2019 17:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sT9JhCsm7ji7ANGvO8aOX9ZWgfUj6JLCR9TWfO6QprI=;
        b=XtTKLwu4bHiLHqcm4xyDss30UijRbtv8JirrGKJsiZ0bsGk2pvsaYtKCXSLBThlpA1
         NwwxGXNUzfBsGkU45VjO1qj7DEhh/0FjRE/PdjdZEBYBAelAyBosPAtv9K7dG9aubMdi
         YqKQixTNl3OIU1VdUS3wKEuSKM3QWXnh1PMOdPkoQXbsdFQbpVZ+ZvZmyelRttDweQIV
         Pfh3vth7QDS5Z1xgPvvrAikxhVOqkhThI0wF4WAugEmY794C+MxknPKc5uKSEMsgyjQW
         zWH66Gse0C23wp+aOrVwr2vuyahnEehEtZcwnHwWWSn/9SHOs85WV9/sa/qY+sV37iup
         Tsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sT9JhCsm7ji7ANGvO8aOX9ZWgfUj6JLCR9TWfO6QprI=;
        b=ePqRpdDRZceiUdrimU2T43y3RyPcRPA5aiO42xHFKP0ozbp4lW8AY2cpxTSSDgJYNY
         MMmK2PO1lk5K+elODSOj6mKaSzA8wsGzaZ5oH9XjdaCLNGFppnydTcQ+dPmOvXYT8W05
         0vBC3mzhyCk2brPLbX4kYdZ/BXqac+9I9SgvFE+5uWaJf0eaEmBuNMIiRtj1PicLrXkG
         gUNdywK26Cr9d1Rs7fPJaojNIZC5cvsTmX8hQ334oAaUDWTrqPnCZEre+MeqN3HUf5bg
         7lXAxvbrvVzdlyOJVP0pjqoJGwkbHUntMkEQtTzf6byqZf4e2LWuUi9VpYYfStGWMXNf
         mZ1w==
X-Gm-Message-State: APjAAAUpbJhUBO8nA0He22R4Zds1wKyVUqZOGBwu2bnEXj1MPUphkYYR
        mSxueOoMDg2uFa0d+vxJF1Y=
X-Google-Smtp-Source: APXvYqyUk/PO1CBION0aoWcHxLD0lwe3UjcGIiPjoWQdyHpIYi35jCEX+J4uoUa92p3JqbLbqyZoVQ==
X-Received: by 2002:ac8:344a:: with SMTP id v10mr1198317qtb.323.1573091116010;
        Wed, 06 Nov 2019 17:45:16 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id w24sm579224qta.44.2019.11.06.17.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 17:45:15 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb_dummy_fe: Add error messages in case of attach failure
Date:   Wed,  6 Nov 2019 22:37:45 -0300
Message-Id: <20191107013745.22147-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
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
index 4db679cb70ad..ca86857c3667 100644
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
 
 static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
@@ -131,12 +135,16 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
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
 
 static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
@@ -148,12 +156,16 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
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
 
 static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
-- 
2.24.0

