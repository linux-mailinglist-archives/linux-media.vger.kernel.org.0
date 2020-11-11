Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA202AF3C5
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 15:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgKKOin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 09:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgKKOik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 09:38:40 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05479C0613D6
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:33 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p19so4221348wmg.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r5xw7T/uN4wozQh78haRdLJ4I1daUv56Z3dNKSCf2g8=;
        b=VLMQN0tIDckLVw+6qF38MEDotF6daCXyJ7OKxjfAfPo8EUhgsvM/0TuRhMQYk/B4QP
         HwhUQ0BiTaEkyia3CHO73KIboPDuUNJZ36aYWV9SOaJ1XE82K+VzpR3LLo7CJjFIP3my
         HSeeMNrytUAJIkZDaawi18M2NKeminEA2e1oxKkoCW3ZSrrRi0KAe4EWoBdAIx5kQThK
         5ap2Gota1ktTvgR5MLG2WQOKIi8pH05QZNhy8A2CrqREkcMGeALyUjywgg0uCt4klfa6
         xDiSuoEnv4jTiHWhVcjKtrZHLSzX6Ej6TtQ55rBPasHv+VkdyLBDv8aBySvTXcCRZQU8
         SEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r5xw7T/uN4wozQh78haRdLJ4I1daUv56Z3dNKSCf2g8=;
        b=LkjykVjM/jSfBxVehHLk8yQQEimEKki9f6XfvMvfajys6ljxWayYcM70hFEsYAbqyh
         jN4KyiQI1Zc6ePh3Jidm0Um7iKeyJEE2UDDg4eUBqLi+XXhgxCFxfYeFbc8jN71J8j2E
         +PbZ1peCjoZiqqX3Pd+6/0uFMcqWtbgW4mDALGOU0mGZGfmHUROCaWrLSIqz39HCoDJG
         utyrCQJlsN9j5McgH/pIwiaJ0bsCRqxZbeOLmJvuoX0W6X1+aE8M1hXV1+dT4p2KBIBn
         WfZR6I4tltLF0lKMGzHFmixzKPW0WD9V54YUUwjc9aa/7nHtSP6tV6ZlAd3eTLT6azMj
         APjg==
X-Gm-Message-State: AOAM531pXgDFPb00qnvpmme1rcu4WIq03wF5s0bUEwEPTUpp78jIlixz
        /px6xpEYCfW28Gx9rsetAtwrfiEQd0aOdrHZ
X-Google-Smtp-Source: ABdhPJzxKaWj8b6sqgf5Vs79P5cB7jKpRfK/0sIhOL5lxOS8Yc8dWEfG7A+PioenuQlXvGeHwFWQ+g==
X-Received: by 2002:a1c:4646:: with SMTP id t67mr4695545wma.40.1605105511450;
        Wed, 11 Nov 2020 06:38:31 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id b8sm2991405wrv.57.2020.11.11.06.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 06:38:31 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 5/8] venus: pm_helpers: Check instance state when calculate instance frequency
Date:   Wed, 11 Nov 2020 16:37:52 +0200
Message-Id: <20201111143755.24541-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Skip calculating instance frequency if it is not in running state.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index ca99908ca3d3..cc84dc5e371b 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -940,6 +940,9 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
 
 	mbs_per_sec = load_per_instance(inst);
 
+	if (inst->state != INST_START)
+		return 0;
+
 	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
 	/* 21 / 20 is overhead factor */
 	vpp_freq += vpp_freq / 20;
-- 
2.17.1

