Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10B43D878A
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 07:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233082AbhG1F4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 01:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhG1F4Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 01:56:24 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB5AC061757
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 22:56:23 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d1so1400150pll.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 22:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O21zihxmpOcIK6NnZmFGw9/SqbXTvLfSebxLWewdefA=;
        b=iKr2fOMnnfWpvJiiHu+3G55aWXIsLnbo68FII2gUrMM3TzkGaaibllmtmoCt5H9Ex0
         N7kUBAjQjRe1IBCjmuON1puPIwkuO0xnX4UO5MrY1SDghLgKs7IsB45c5Jq9t+leGOV/
         EpGPbDzP+x+OQL/TJjZURQjzHQcOR5HHb1US4zYQqY3k7FF3lyzhHaxPWzypoMJn6cK7
         6GfpNeJxKQ7GURtoFJLTm0G4WXohcVVwAIBOEkEtTiyLgsWWpAW3mjM0NqRUHCKor+Dk
         86nvKtRVi59KH99meI8u5CdUBSoAQCowCKWjJ+E11wGFeTRBrcZ4VWHnBlyr3HPMGxbH
         ZKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O21zihxmpOcIK6NnZmFGw9/SqbXTvLfSebxLWewdefA=;
        b=BuzFOq3lgfDJ8DgY52AXGDNWr54mmcV9ZETkGqUfcijcFK5VCW/zJe8o5dRErnWJvS
         wOTeS2/8BL3wuldW5QIJkTiLGGfkRL7E+Bv/VbR/MODBkq3eGusHJPCk/WcldiPkTdZr
         FFcUuznfn66Xf2cY0Wao1N00blhXx9YqoAE3uPqTx55vPfE24ufkc6GWg2SgF3if5aPv
         MaKymP/wFGZc9aJrJ0ARYQbZIyT6FHP4LBY6FD0vuP7ds7Lcl0sIJb9FG7oXmzH+7Qyp
         q8jOjOHsX5kti5SZEm0R6pnDwQc4rld2Kp9jDPGXwYFVTpjQYOW6k0cc4DoXzt4xVPK9
         u7SQ==
X-Gm-Message-State: AOAM530XmrcCm7vHFgG0sArMlcrnLqc3ggIhMKPEb4bmLwu0wFdBPfbI
        yyXZyKkCdkB4AFYIsPm8tamyXI1YvqxgWQ==
X-Google-Smtp-Source: ABdhPJzotfgu83hJkj0rIDZLf3SbCW3Kayxtk8TM/7CD9sNFP1ISdzyDq70FMlfQykK62omMApS8oA==
X-Received: by 2002:a17:90a:86:: with SMTP id a6mr7771394pja.133.1627451783192;
        Tue, 27 Jul 2021 22:56:23 -0700 (PDT)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id s7sm5617237pfk.12.2021.07.27.22.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 22:56:22 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH] media: cec-pin: rename timer overrun variables
Date:   Tue, 27 Jul 2021 22:56:16 -0700
Message-Id: <20210728055616.10613-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cec pin timer overruns are measured in microseconds, but the variable
names include the millisecond symbol "ms". To avoid confusion, replace
"ms" with "us" in the variable names and printed status message.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/media/cec/core/cec-pin-priv.h |  4 ++--
 drivers/media/cec/core/cec-pin.c      | 20 ++++++++++----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/cec/core/cec-pin-priv.h b/drivers/media/cec/core/cec-pin-priv.h
index f423db8855d9..fb101f15865c 100644
--- a/drivers/media/cec/core/cec-pin-priv.h
+++ b/drivers/media/cec/core/cec-pin-priv.h
@@ -209,8 +209,8 @@ struct cec_pin {
 	u32				work_pin_events_dropped_cnt;
 	ktime_t				timer_ts;
 	u32				timer_cnt;
-	u32				timer_100ms_overruns;
-	u32				timer_300ms_overruns;
+	u32				timer_100us_overruns;
+	u32				timer_300us_overruns;
 	u32				timer_max_overrun;
 	u32				timer_sum_overrun;
 
diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index f006bd8eec63..8c613aa649c6 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -854,9 +854,9 @@ static enum hrtimer_restart cec_pin_timer(struct hrtimer *timer)
 		if (delta > 100 && pin->state != CEC_ST_IDLE) {
 			/* Keep track of timer overruns */
 			pin->timer_sum_overrun += delta;
-			pin->timer_100ms_overruns++;
+			pin->timer_100us_overruns++;
 			if (delta > 300)
-				pin->timer_300ms_overruns++;
+				pin->timer_300us_overruns++;
 			if (delta > pin->timer_max_overrun)
 				pin->timer_max_overrun = delta;
 		}
@@ -1207,15 +1207,15 @@ static void cec_pin_adap_status(struct cec_adapter *adap,
 	seq_printf(file, "cec pin events dropped: %u\n",
 		   pin->work_pin_events_dropped_cnt);
 	seq_printf(file, "irq failed: %d\n", pin->enable_irq_failed);
-	if (pin->timer_100ms_overruns) {
-		seq_printf(file, "timer overruns > 100ms: %u of %u\n",
-			   pin->timer_100ms_overruns, pin->timer_cnt);
-		seq_printf(file, "timer overruns > 300ms: %u of %u\n",
-			   pin->timer_300ms_overruns, pin->timer_cnt);
+	if (pin->timer_100us_overruns) {
+		seq_printf(file, "timer overruns > 100us: %u of %u\n",
+			   pin->timer_100us_overruns, pin->timer_cnt);
+		seq_printf(file, "timer overruns > 300us: %u of %u\n",
+			   pin->timer_300us_overruns, pin->timer_cnt);
 		seq_printf(file, "max timer overrun: %u usecs\n",
 			   pin->timer_max_overrun);
 		seq_printf(file, "avg timer overrun: %u usecs\n",
-			   pin->timer_sum_overrun / pin->timer_100ms_overruns);
+			   pin->timer_sum_overrun / pin->timer_100us_overruns);
 	}
 	if (pin->rx_start_bit_low_too_short_cnt)
 		seq_printf(file,
@@ -1245,8 +1245,8 @@ static void cec_pin_adap_status(struct cec_adapter *adap,
 	seq_printf(file, "tx detected low drive: %u\n", pin->tx_low_drive_cnt);
 	pin->work_pin_events_dropped_cnt = 0;
 	pin->timer_cnt = 0;
-	pin->timer_100ms_overruns = 0;
-	pin->timer_300ms_overruns = 0;
+	pin->timer_100us_overruns = 0;
+	pin->timer_300us_overruns = 0;
 	pin->timer_max_overrun = 0;
 	pin->timer_sum_overrun = 0;
 	pin->rx_start_bit_low_too_short_cnt = 0;
-- 
2.20.1

