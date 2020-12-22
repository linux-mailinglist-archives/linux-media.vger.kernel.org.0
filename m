Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947142E0495
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 04:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgLVDHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 22:07:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgLVDHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 22:07:07 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0F6C0613D3
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 19:06:26 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id v5so8142651qtv.7
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 19:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TVemZJ+8O2vC8Z9A/I8rjaEo1hyIMU7msFs2i+GA7Bk=;
        b=lZm6zvizTb4Q/bPqgWENKS89eBztro/e++3QSt0lmSW5AKxnkqGaHqIz8tBB1h9Bpo
         ZmwouBuXKUz6jZrc1nTSpGIB2v2CzCtw6KWZD+CcyUdG6x31fRhwJyn2iIl36RoMgSBe
         FZnpcoOXELCJgmhjUN8Lnoz3s63QBQyVimrvYNTj/HqGO1eaA8IqgaIwVahL3Dljg93F
         Q6bY4ZHWw5j6DkP623PU1YdgtfT6vFnTob97wvu5ueX9MTrWVpL74dLCJDJzJEzLcFwm
         9VOLqVbw46hZwUz3QjG0jAdVPml1nlKpPbi3CgjzbcqfwDpW1wz/BQWFe7wreMk8Sar+
         sYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TVemZJ+8O2vC8Z9A/I8rjaEo1hyIMU7msFs2i+GA7Bk=;
        b=pLar4RDCWvNXTcIyjnIBvJJuXGjJxxOyXhHUTP4Qo0xrlU1yiTWRwuZu2xGAPuB417
         TIOQuteuybj2M5JV4P5FBloh8I1r+xzyZNwSlvZMF2bHgwIY8CrQPfH+7D4QDb1YdFFp
         Xh/hztKBhEsz9Cv+UJUg1dtD0jZoEFaXQBnrNpNlOp9mfWpFhbSjIlZoFwg/r6KcFSsV
         UVV61bmvUpmP7647Bp68kUiDGZ2nGvWv5cx+o2fJtmlMuCnkzD6Kgr5VyeMA54WudUov
         hio42D4JwpFnkAL/yj69av5xWh49/1iKbCXZHlZ6uh8/or4OZwuil9t7KuO6Prjksf3l
         rj3w==
X-Gm-Message-State: AOAM533JDGZ6BjYjaibScs8HjmNJxN42kQ1We1mPv6cA4dwVD5lsDqSX
        jwBQgI9oG/R+ba4LXxENn4dtI5ZsVCD6IlfWnBs=
X-Google-Smtp-Source: ABdhPJz2VZCX7PaGggohRou/Wcutc/IzkUDUP3+oxmrN9lb+KLfUZ3sdw4fzqcLfVPaduf3wTRBGww==
X-Received: by 2002:ac8:5acb:: with SMTP id d11mr19834912qtd.269.1608606385775;
        Mon, 21 Dec 2020 19:06:25 -0800 (PST)
Received: from nico-laptop.rh1935 ([190.217.197.9])
        by smtp.gmail.com with ESMTPSA id i27sm7365270qkk.15.2020.12.21.19.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 19:06:25 -0800 (PST)
From:   Nicolas Stuardo Diaz <nicolasstuardodiaz@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org,
        Nicolas Stuardo Diaz <nicolasstuardodiaz@gmail.com>
Subject: [PATCH] media/siano: Fix transmission parameters reporting for ISDB-T
Date:   Tue, 22 Dec 2020 00:05:23 -0300
Message-Id: <20201222030522.28774-1-nicolasstuardodiaz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The currently used functions for converting the transmission mode and guard
interval from the internal values to the DVBv5 API values do not return
correct values for ISDB broadcasts:

- The raw (debugfs) transmission mode is an integer whose values can be
1, 2 or 3, that corresponds to 2K, 4K and 8K FFT modes respectively.
However sms_to_mode() expects values 2, 4 or 8.
- Guard interval, as defined by smscoreapi.h returns "1 divided by value"
instead of 0, 1, 2, and 3 as defined in sms_to_guard_interval_table().

This commit implements ISDB-T specific methods for converting the internal
values for the aforementioned parameters to the DVBv5 API values. It also
adds support for reporting FEC and time interleaving values for each one
of the layers.

Signed-off-by: Nicolas Stuardo Diaz <nicolasstuardodiaz@gmail.com>
---
 drivers/media/common/siano/smsdvb-main.c | 44 +++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
index ae17407e4..f7116e200 100644
--- a/drivers/media/common/siano/smsdvb-main.c
+++ b/drivers/media/common/siano/smsdvb-main.c
@@ -167,6 +167,34 @@ static inline int sms_to_mode(u32 mode)
 	return TRANSMISSION_MODE_AUTO;
 }
 
+static inline int sms_to_isdbt_mode(u32 mode)
+{
+	switch (mode) {
+	case 1:
+		return TRANSMISSION_MODE_2K;
+	case 2:
+		return TRANSMISSION_MODE_4K;
+	case 3:
+		return TRANSMISSION_MODE_8K;
+	}
+	return TRANSMISSION_MODE_AUTO;
+}
+
+static inline int sms_to_isdbt_guard_interval(u32 interval)
+{
+	switch (interval) {
+	case 4:
+		return GUARD_INTERVAL_1_4;
+	case 8:
+		return GUARD_INTERVAL_1_8;
+	case 16:
+		return GUARD_INTERVAL_1_16;
+	case 32:
+		return GUARD_INTERVAL_1_32;
+	}
+	return GUARD_INTERVAL_AUTO;
+}
+
 static inline int sms_to_status(u32 is_demod_locked, u32 is_rf_locked)
 {
 	if (is_demod_locked)
@@ -345,8 +373,8 @@ static void smsdvb_update_isdbt_stats(struct smsdvb_client_t *client,
 	/* Update ISDB-T transmission parameters */
 	c->frequency = p->frequency;
 	c->bandwidth_hz = sms_to_bw(p->bandwidth);
-	c->transmission_mode = sms_to_mode(p->transmission_mode);
-	c->guard_interval = sms_to_guard_interval(p->guard_interval);
+	c->transmission_mode = sms_to_isdbt_mode(p->transmission_mode);
+	c->guard_interval = sms_to_isdbt_guard_interval(p->guard_interval);
 	c->isdbt_partial_reception = p->partial_reception ? 1 : 0;
 	n_layers = p->num_of_layers;
 	if (n_layers < 1)
@@ -391,6 +419,10 @@ static void smsdvb_update_isdbt_stats(struct smsdvb_client_t *client,
 			continue;
 		}
 		c->layer[i].modulation = sms_to_modulation(lr->constellation);
+		c->layer[i].fec = sms_to_code_rate(lr->code_rate);
+
+		/* Time interleaving */
+		c->layer[i].interleaving = (u8) lr->ti_ldepth_i;
 
 		/* TS PER */
 		c->block_error.stat[i + 1].scale = FE_SCALE_COUNTER;
@@ -429,8 +461,8 @@ static void smsdvb_update_isdbt_stats_ex(struct smsdvb_client_t *client,
 	c->frequency = p->frequency;
 	client->fe_status = sms_to_status(p->is_demod_locked, 0);
 	c->bandwidth_hz = sms_to_bw(p->bandwidth);
-	c->transmission_mode = sms_to_mode(p->transmission_mode);
-	c->guard_interval = sms_to_guard_interval(p->guard_interval);
+	c->transmission_mode = sms_to_isdbt_mode(p->transmission_mode);
+	c->guard_interval = sms_to_isdbt_guard_interval(p->guard_interval);
 	c->isdbt_partial_reception = p->partial_reception ? 1 : 0;
 	n_layers = p->num_of_layers;
 	if (n_layers < 1)
@@ -479,6 +511,10 @@ static void smsdvb_update_isdbt_stats_ex(struct smsdvb_client_t *client,
 			continue;
 		}
 		c->layer[i].modulation = sms_to_modulation(lr->constellation);
+		c->layer[i].fec = sms_to_code_rate(lr->code_rate);
+
+		/* Time interleaving */
+		c->layer[i].interleaving = (u8) lr->ti_ldepth_i;
 
 		/* TS PER */
 		c->block_error.stat[i + 1].scale = FE_SCALE_COUNTER;
-- 
2.25.1

