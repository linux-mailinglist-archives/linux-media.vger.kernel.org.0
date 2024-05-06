Return-Path: <linux-media+bounces-10929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B038BD6A6
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 23:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F328BB22CA0
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 21:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9EF15D5AD;
	Mon,  6 May 2024 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XwKYLAWH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051BB15B96C
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 21:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715029833; cv=none; b=eWfLqBaSglONHqRnCohHHzQcz3lB+IKRIANhpJK/tJzh1i+xEQnLiV9L24y9yhiV29WRI/QsxqOCmngdY+8+3rWo8LH0nAX89G+sE2SBczwns+f1g95NI5oeIB8iyDLRWPHRwyDiSapYv8gBa4sR+OKKYj+MRzGYgqBNDdqikuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715029833; c=relaxed/simple;
	bh=13OxCCXFD0dQ5I30NApvqTwlwhaZmASYM9bf5Kr18JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zm7wcSShJYGG7/QfMGDiBlV30vxAiu5FBZwmHU1wdes9H7wsstYVuL37If4jnVohtIyjqZSA1yJXKBnBtHUtGYZH/O6P95tE0leaq3sCf5gMns1ghRVdkKIdz46sYyl/zch7E/fjYjtgTaLooAX9Mvsw83+Sl7lMH/jGlGIdmdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XwKYLAWH; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78ecd752a7cso194504385a.0
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715029831; x=1715634631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkJF7t/M3Ojeyh5RuyGpe29BYnbPsSXvxhXAxpUcSgA=;
        b=XwKYLAWHKeesNbtDBek7g9IS4gFMiv9eI9W2VBr5egHx5PloHV7HSKt4OlzddnYsH+
         QBZeHbgd3jXjI7ickZ4evj85OGAlPcfdzHoNL7sBJoAjJ4SBBGUpEK7BMIMjZrP1A7Gd
         x8GnPM9FZaD0w/uVfEWgbMbcgZvuNDCI25M8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715029831; x=1715634631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkJF7t/M3Ojeyh5RuyGpe29BYnbPsSXvxhXAxpUcSgA=;
        b=HFFOCFRglgAEL3J16hj6t4jh1e9qomHpY6TGhtwQu1UuuZT5yGAPu5XhYtadt2nfXe
         0CznIwgTbv5sFrKtzOnowplBgNS7mbVU6//FInxv9KJsz+neZzdfancgQCS7UxI/cVmC
         xIRDPw1wNEAh2m8v12SWRVbY6LuTHwm6Qjue3R79j4LiG8kF9yRxYH/jhU3yCltuTIYs
         qeOmzLGIeMSSLUhkt5Rkdqsocp1ndKP+htm0oQ472rPFRZC1ljDiV8mTdK0a7SP0FVRC
         kOBoHpzVFtI9vm7yv3w0y82h2xhw7rl3yOlTwi5JozMZHqKrY6v9AvXSks56F70he/tB
         WvfA==
X-Forwarded-Encrypted: i=1; AJvYcCWUm9Nsn3bqKOeDwIKv+BFsW9RbIvVLNoLfBsgBAiQU7Ufa1RzGQ3LkagPWU8mMPTurnbEfTAB3u8QiP+UpmKRmAYThNZLM7SoNK38=
X-Gm-Message-State: AOJu0YwwJr1GvZhk/EANmKqKh+smCXYPeYPDbDmfnL6FtYENTm/rT2a+
	Jw5xmfvXAE9A/o8cfO1X76ddQaqNRhNgLm2z7GegTmsfO3T2EpEfFdWDQRGJ7w==
X-Google-Smtp-Source: AGHT+IEHqq8p4xvadiUkZkjltTHuOSmpKAULLj6lKhTtpITVnQwDNjpo5F7If+QRhvKAuXMvz0wKiQ==
X-Received: by 2002:a05:620a:2481:b0:792:8c4c:375c with SMTP id i1-20020a05620a248100b007928c4c375cmr9980404qkn.11.1715029830998;
        Mon, 06 May 2024 14:10:30 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id pa20-20020a05620a831400b0078f13e59dc9sm4224921qkn.102.2024.05.06.14.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 14:10:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 May 2024 21:10:28 +0000
Subject: [PATCH 3/5] media: dvb-frontends/stv090x: Refactor tuner_i2c_lock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-cocci-locks-v1-3-a67952fe5d19@chromium.org>
References: <20240506-cocci-locks-v1-0-a67952fe5d19@chromium.org>
In-Reply-To: <20240506-cocci-locks-v1-0-a67952fe5d19@chromium.org>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, 
 Jarod Wilson <jarod@redhat.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Move the lock logic to it's own function. There is less code duplication
and cocci is much happier.

Fix the following cocci warning:
drivers/media/dvb-frontends/stv090x.c:799:1-7: preceding lock on line 768

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/stv090x.c | 37 ++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-frontends/stv090x.c
index cc45139057ba..3b02d504941f 100644
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -748,6 +748,22 @@ static int stv090x_write_reg(struct stv090x_state *state, unsigned int reg, u8 d
 	return stv090x_write_regs(state, reg, &tmp, 1);
 }
 
+static inline void stv090x_tuner_i2c_lock(struct stv090x_state *state)
+{
+	if (state->config->tuner_i2c_lock)
+		state->config->tuner_i2c_lock(&state->frontend, 1);
+	else
+		mutex_lock(&state->internal->tuner_lock);
+}
+
+static inline void stv090x_tuner_i2c_unlock(struct stv090x_state *state)
+{
+	if (state->config->tuner_i2c_lock)
+		state->config->tuner_i2c_lock(&state->frontend, 0);
+	else
+		mutex_unlock(&state->internal->tuner_lock);
+}
+
 static int stv090x_i2c_gate_ctrl(struct stv090x_state *state, int enable)
 {
 	u32 reg;
@@ -761,12 +777,8 @@ static int stv090x_i2c_gate_ctrl(struct stv090x_state *state, int enable)
 	 * In case of any error, the lock is unlocked and exit within the
 	 * relevant operations themselves.
 	 */
-	if (enable) {
-		if (state->config->tuner_i2c_lock)
-			state->config->tuner_i2c_lock(&state->frontend, 1);
-		else
-			mutex_lock(&state->internal->tuner_lock);
-	}
+	if (enable)
+		stv090x_tuner_i2c_lock(state);
 
 	reg = STV090x_READ_DEMOD(state, I2CRPT);
 	if (enable) {
@@ -782,20 +794,13 @@ static int stv090x_i2c_gate_ctrl(struct stv090x_state *state, int enable)
 			goto err;
 	}
 
-	if (!enable) {
-		if (state->config->tuner_i2c_lock)
-			state->config->tuner_i2c_lock(&state->frontend, 0);
-		else
-			mutex_unlock(&state->internal->tuner_lock);
-	}
+	if (!enable)
+		stv090x_tuner_i2c_unlock(state);
 
 	return 0;
 err:
 	dprintk(FE_ERROR, 1, "I/O error");
-	if (state->config->tuner_i2c_lock)
-		state->config->tuner_i2c_lock(&state->frontend, 0);
-	else
-		mutex_unlock(&state->internal->tuner_lock);
+	stv090x_tuner_i2c_unlock(state);
 	return -1;
 }
 

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


