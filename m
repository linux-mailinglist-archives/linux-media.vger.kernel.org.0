Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BC94384AA
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 20:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbhJWSXI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 14:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbhJWSXH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 14:23:07 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12692C061764
        for <linux-media@vger.kernel.org>; Sat, 23 Oct 2021 11:20:48 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id b4so1733444uaq.9
        for <linux-media@vger.kernel.org>; Sat, 23 Oct 2021 11:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=LnwR1uAWKDgHHpgLi+Zphb6m+amdTcCgICOpeRfFVOA=;
        b=uyBDv6otKN1Ibzsyl86F6F6HrH5fI8ZJRERLa8+a5Z0zqTUTwrm0YOdET776KI8v+6
         HOns4XzLLC7p176sLhSEHgb5p9A0yalA1aPQlADATDPEtLgWMgTQuUPFknxSBBVSnRcj
         kH1Lia8SexULXam2JjNnJUkgkEnARVDMJa0yfmphhyZr716R0lQx1YSfpcYry8eRoc7w
         nvB7dnGbDmscCzxKG/PQEoEG/cNCMHkvvT6YIPmnetoo8xBDkIHtpwo8r2nXbL+Mf040
         PQIQ8J0sNzLw6bKSPHunZmR73dCj+mRj2eJDTaHPfNEjsczugKJyO3m+Km4LtPQpzwPE
         gDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=LnwR1uAWKDgHHpgLi+Zphb6m+amdTcCgICOpeRfFVOA=;
        b=Ak6y426V3q988wc6FYCteT3YmB1Q2ygwu8hDIqSfQ7sWejGhrC+ZVXzjrPc6U/Xhhc
         gK7s5YoqV7B8oHFeUT6//zDHvAtUNOnHeDrAq17fD0yXIfzyF5xKdm/VcfMS3H1wEk0q
         D1S9Gn9QSY1GAAWSOIN4S0wqQ75pSAxDrjJW2h8/oEPjrmnVDI7FhHFkh8U1NJrbJcCl
         mLkD2DvzX9ACW+I6XPMOelmC2D2+1KaU5BJbqqSKKkFtwJJ9278MLxgXgpbpTu45Wnwd
         SGFc+CcMh7JSYaWj7lXBYi2Z2MtiaApHprrH56Wgn+H3VVKFeLOs7ZsRDdoZnmU/DYqu
         VE9w==
X-Gm-Message-State: AOAM531Fo9TgPk5GvNN1bNWSEsapXLVQ7Ijohp3OdQ1/kVtOy6M0ooPQ
        OnxHArk2I2TiESr+x3/y7vKGrw==
X-Google-Smtp-Source: ABdhPJwMiab9PdGiUEvO6PeSSgiBKATBf4wU9zU+aI5Wka5wj+MyhnAkv5TprLrLulcJZ03KN5r/2w==
X-Received: by 2002:a05:6102:3589:: with SMTP id h9mr7096058vsu.47.1635013247056;
        Sat, 23 Oct 2021 11:20:47 -0700 (PDT)
Received: from fedora ([187.64.134.142])
        by smtp.gmail.com with ESMTPSA id t7sm6585389vko.7.2021.10.23.11.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 11:20:46 -0700 (PDT)
Date:   Sat, 23 Oct 2021 15:20:42 -0300
From:   =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To:     sean@mess.org, mchehab@kernel.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org
Subject: [PATCH v2] media: rc: pwm-ir-tx: Switch to atomic PWM API
Message-ID: <YXRSaMb2FV78+1tc@fedora>
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
---
V1 -> V2: Assign variables directly and simplify conditional statement
---
 drivers/media/rc/pwm-ir-tx.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/rc/pwm-ir-tx.c b/drivers/media/rc/pwm-ir-tx.c
index 4bc28d2c9cc9..ca943f168855 100644
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
+	state.duty_cycle = DIV_ROUND_CLOSEST(pwm_ir->duty_cycle * period, 100);
 
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

