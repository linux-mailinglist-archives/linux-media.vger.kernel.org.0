Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A684943CDAB
	for <lists+linux-media@lfdr.de>; Wed, 27 Oct 2021 17:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbhJ0PhE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 11:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238479AbhJ0PhD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 11:37:03 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BFAC061745
        for <linux-media@vger.kernel.org>; Wed, 27 Oct 2021 08:34:38 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id r6so3973413oiw.2
        for <linux-media@vger.kernel.org>; Wed, 27 Oct 2021 08:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=2kqOpDFNZWPONI45Sby6qnOsMGbi3VIWS2JFQhhdImo=;
        b=GixmIbMGs686zqmSCHXywp2xoX2owfUVe6pBf4ojmha6g6G720NHuL8RcuXoLi/A8k
         E+d5CRy0MRcasKm2Z1LjHWkASDn+oID3sWQ2O9Si08N68bsmuK3kkNrnPtwCd8r7gMFy
         3EjEmieCs2+FvkzfJ/tHHGdjCXZUDLqSNqfo/bWXDx0z9jRM8R0R89WR0eBxg+y3ntdc
         MJwtPpB8VdXOxAofBYTmplPxr2Lf3ihJDBTeRbb9QVpalkzUubklokKpHlBbVhV2ME39
         chZhGb0tLL5u4dsxUmWUWfq0V4THBjzfiW+wNdUs/r8lyhv1TvACRkfmncKSqMOa/NTd
         fp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=2kqOpDFNZWPONI45Sby6qnOsMGbi3VIWS2JFQhhdImo=;
        b=0KFg6YwRBP3m7mgttSdDYLwDlWnoHN7XP8MF0rQtQvzhnUOeYqjFTccMiZ/t1yXuqL
         NPAQtGg2Jhvo3wIX7Kbndfa0Y4Yeu0zVU3JU9lhz60oiOUOEkbxNjbRHohpWWLoM/FCS
         KbHZ1MeuanV+zU+XLqB9O6/wJUHtWXviukxA0/4qbszURHtrcyP5BFEhGQC5YykCORmU
         CVAKC054K9qy2/KJ1MdT8fGCCrSaJLXPRZ38oM65Qg1JmlZMBAlmJUPO/LDixNzSlGG4
         vdIRCIYnwoVorkRDKxebsIX/V+/uPxIaFgXABU04n6cvn0PjHMgTZkQOWDUcRGIAPgGD
         Krtw==
X-Gm-Message-State: AOAM530KeBr7250hLKZUzFHC4xslaajWyLTSZ+1S8jnVHSt7YhG+J/82
        8PGLYgIpL3yghFWp+r4MwJFEwg==
X-Google-Smtp-Source: ABdhPJxHlUKQcq9gL8E1EMCWFzJ2GXhdqxww7BgyGokiGEaVW5k98shF8mFUbg4PxxKNkz+q+PsYvg==
X-Received: by 2002:a05:6808:1287:: with SMTP id a7mr4104275oiw.45.1635348877700;
        Wed, 27 Oct 2021 08:34:37 -0700 (PDT)
Received: from fedora ([187.64.134.142])
        by smtp.gmail.com with ESMTPSA id j7sm106300oon.13.2021.10.27.08.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 08:34:36 -0700 (PDT)
Date:   Wed, 27 Oct 2021 12:34:30 -0300
From:   =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To:     sean@mess.org, u.kleine-koenig@pengutronix.de, lkp@intel.com,
        mchehab@kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org
Subject: [PATCH v4] media: rc: pwm-ir-tx: Switch to atomic PWM API
Message-ID: <YXlxhpZWf2mxJaMi@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
replace it for the atomic PWM API.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
Reported-by: kernel test robot <lkp@intel.com>
---
V1 -> V2: Assign variables directly and simplify conditional statement
V2 -> V3: Fix declaration of undeclared variables
V3 -> V4: Fix DIV_ROUND_CLOSEST error with u64 variables
---
 drivers/media/rc/pwm-ir-tx.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/rc/pwm-ir-tx.c b/drivers/media/rc/pwm-ir-tx.c
index 4bc28d2c9cc9..105a9c24f1e3 100644
--- a/drivers/media/rc/pwm-ir-tx.c
+++ b/drivers/media/rc/pwm-ir-tx.c
@@ -53,22 +53,21 @@ static int pwm_ir_tx(struct rc_dev *dev, unsigned int *txbuf,
 {
 	struct pwm_ir *pwm_ir = dev->priv;
 	struct pwm_device *pwm = pwm_ir->pwm;
-	int i, duty, period;
+	struct pwm_state state;
+	int i;
 	ktime_t edge;
 	long delta;
 
-	period = DIV_ROUND_CLOSEST(NSEC_PER_SEC, pwm_ir->carrier);
-	duty = DIV_ROUND_CLOSEST(pwm_ir->duty_cycle * period, 100);
+	pwm_init_state(pwm, &state);
 
-	pwm_config(pwm, duty, period);
+	state.period = DIV_ROUND_CLOSEST(NSEC_PER_SEC, pwm_ir->carrier);
+	pwm_set_relative_duty_cycle(&state, pwm_ir->duty_cycle, 100);
 
 	edge = ktime_get();
 
 	for (i = 0; i < count; i++) {
-		if (i % 2) // space
-			pwm_disable(pwm);
-		else
-			pwm_enable(pwm);
+		state.enabled = !(i % 2);
+		pwm_apply_state(pwm, &state);
 
 		edge = ktime_add_us(edge, txbuf[i]);
 		delta = ktime_us_delta(edge, ktime_get());
@@ -76,7 +75,8 @@ static int pwm_ir_tx(struct rc_dev *dev, unsigned int *txbuf,
 			usleep_range(delta, delta + 10);
 	}
 
-	pwm_disable(pwm);
+	state.enabled = false;
+	pwm_apply_state(pwm, &state);
 
 	return count;
 }
-- 
2.31.1

