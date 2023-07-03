Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07207745FE5
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 17:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbjGCPbB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 11:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjGCPbA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 11:31:00 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A46E44
        for <linux-media@vger.kernel.org>; Mon,  3 Jul 2023 08:30:59 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso53445005e9.1
        for <linux-media@vger.kernel.org>; Mon, 03 Jul 2023 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688398257; x=1690990257;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20ISh7YKa+MZ6pI5W28iEYHp3Vg3aQFVV9k/Gjt0jiQ=;
        b=N/9fGQLgOcVoQOQm9kIQrdbaxoq0bo1c/QmUYFch1hvqBhi0zjNU+QF2RepJAvzShC
         pYip+LoFyn2OCqwvMWWMI/vUMMLVXfNuDMZXg2a2Z56QN72znrosVvBYAEaGvg+ppWO7
         QECsO5M+iqKtSogbTfeqMd8SjUXO0QXPXt/dw2e1ws/AO7PomB/iy0BK74Le5cEE9wWS
         XvlZuUWNIDn5x6TeiDndkBJdP/ADl93hG4PH7y6hbbZLG1xad1lHaG4H3xpnF1DAWMVs
         GlcvgWOSVPH75L1gqsBzpGO0Wun3xXie4QFjCVLDEDa52SMk/IAuUCR//PRAXItpAqp8
         41CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688398257; x=1690990257;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20ISh7YKa+MZ6pI5W28iEYHp3Vg3aQFVV9k/Gjt0jiQ=;
        b=fQKG02bKSwRZRWdm3EKlSu+Pn7hDz7wOc1cFNOSezNpFCAF0eNLpv920MhacQwreSd
         pXw8JV3W1Eo6G3cYYJYkadxQu369/xZiWsvZnl8EKc7R/ejlNntS/9YfviTvSv1kl0Dy
         sdOJP1wk9evzWS6Yg4VTJkTawNG8SqudeKRVPtzifqYu68r+3ClnYM5Dy7u1QBIa9S+p
         mvSVogxgriY+FtCqhC+LZudf/yKYz7b2h/j9HhKFOjCrJSZsdFSWQDCXe+coHX41Kixi
         49SwM7S08S3f4od5CBnJfFNqaLHR+U3M00aGZNWnCGMh4SeFdklf7YnPUVhlrZEQMf9K
         z6eg==
X-Gm-Message-State: AC+VfDzpAV1No8to5jby1TF93bjvSwDlfY17UVzE0ggau3dUAeOJNG+i
        DNulGRetgy/1RgmV9W6uZ7NRiw==
X-Google-Smtp-Source: ACHHUZ67EaqrXv0FMq7JQdc962nRwUPBZgX3EtIYEig5myyMiOjJPMOdorrnuOo+K6vpSSFSahPtng==
X-Received: by 2002:a05:600c:b47:b0:3fb:b618:f7b3 with SMTP id k7-20020a05600c0b4700b003fbb618f7b3mr13974657wmr.21.1688398257530;
        Mon, 03 Jul 2023 08:30:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l6-20020adff486000000b00313fd294d6csm17837630wro.7.2023.07.03.08.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 08:30:56 -0700 (PDT)
Date:   Mon, 3 Jul 2023 18:30:52 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tang Bin <tangbin@cmss.chinamobile.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] Revert "venus: pm_helpers: Fix error check in
 vcodec_domains_get()"
Message-ID: <e1e46cfd-8d95-4792-ac8f-1237d2af7171@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit 0f6e8d8c94a82e85e1b9b62a7671990740dc6f70.

The reverted commit was based on static analysis and a misunderstanding
of how PTR_ERR() and NULLs are supposed to work.  When a function
returns both pointer errors and NULL then normally the NULL means
"continue operating without a feature because it was deliberately
turned off".  The NULL should not be treated as a failure.  If a driver
cannot work when that feature is disabled then the KConfig should
enforce that the function cannot return NULL.  We should not need to
test for it.

In this code, the patch breaks the venus driver if CONFIG_PM is
disabled.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This patch is also based on static analysis and review so probably best
to be cautious.  My guess is that very few people disable CONFIG_PM
these days so that's why the bug wasn't caught.

 drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 48c9084bb4db..c93d2906e4c7 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -869,8 +869,8 @@ static int vcodec_domains_get(struct venus_core *core)
 	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
 		pd = dev_pm_domain_attach_by_name(dev,
 						  res->vcodec_pmdomains[i]);
-		if (IS_ERR_OR_NULL(pd))
-			return PTR_ERR(pd) ? : -ENODATA;
+		if (IS_ERR(pd))
+			return PTR_ERR(pd);
 		core->pmdomains[i] = pd;
 	}
 
-- 
2.39.2

