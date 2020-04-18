Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95381AEB1B
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 11:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgDRJLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 05:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726009AbgDRJLY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 05:11:24 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70E9C061A10
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2020 02:11:23 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y4so4485333ljn.7
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2020 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=1+0lxBk92Z4FV+tuRf6x7090CWSvwjw8uGCZ8vNaets=;
        b=XFsyyjgUyNwmjpheTqxW9aYsSQYJ0lDOzuKTUzlVAn2MmCPhJDf4AYtrnJ5n8dLHEQ
         9SSh8T7G+R8Z7OIjaIVm3hDS/o1/b+2tE6Ae3uSkU4ARcNccdDvnK2YsELvKFu/CtRIE
         Z0EPEbA1ZLdARCMDttcWceZMjCTreljTP02DMeUfoy3TFq55oSiT+5KkUGvuN17FmajN
         Z5PI/PH6HrURbRxJ5u7UNS54wM+fIbG9r4lmRekbviiN0m5O+LyIyWsUmmGev+6rf8g7
         9GYKz6YDH1wFHcVEimSZ7fyXizRVTMwaq2OqsiNK91LBcYzizguXPsKmwhM/XemtYWgM
         vTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1+0lxBk92Z4FV+tuRf6x7090CWSvwjw8uGCZ8vNaets=;
        b=NuNTNUg5RS+gfJ//ZydVU4MvIdhS6Ao4ngUTNQO0BW84wKd+W+zSKYQpA6vmViTA6m
         oAuFPsqlDsSlJq7uRxFOg31zBlJQDsqArOlbAKr8naTmzwdhKYLhRu3EZlwsBbeLn+eU
         FiFBK1ySrYC3vBfUuJyeWQX1+MeqqcvqGFC9VWX3EGSnLu/+KAQZ1ca9HECidkoASSCp
         0qJlKyZP6ip8MQ4lPeKF1ifDgfkk4BC0Lf+g0/6gILRMW/lo+cSid/XKyBpcirGyg9Ip
         zgh/m9F/efjPT2WLoPB+16T+ssR7nQgqu4ouJCa2W6bYTgXwNtUIn6FUkcpx3qaCezCG
         AKFw==
X-Gm-Message-State: AGi0PubRUYJRHtHUTG40JqL1NBLbI0FqAqyX7eOVcA2/rlXL3yesDFZ0
        W2zvPI/naghUiPikonfO4pzxLkcdaleOfQ==
X-Google-Smtp-Source: APiQypK1l4oogJYB1BPqNzQ+g7PTmKPPdbmtyfUaVP+asaNbzm1SJrR5TaagxWdlGFz7rLKSu9ndtQ==
X-Received: by 2002:a2e:6a0e:: with SMTP id f14mr4577280ljc.102.1587201081939;
        Sat, 18 Apr 2020 02:11:21 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-142.ip.btc-net.bg. [212.5.158.142])
        by smtp.gmail.com with ESMTPSA id 25sm20114469lft.68.2020.04.18.02.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 02:11:21 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: venc,vdec: Return EBUSY on S_FMT while streaming
Date:   Sat, 18 Apr 2020 12:11:06 +0300
Message-Id: <20200418091106.28370-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the v4l spec s_fmt must return EBUSY while the
particular queue is streaming. Add such check in encoder and
decoder s_fmt methods.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 8 ++++++++
 drivers/media/platform/qcom/venus/venc.c | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 527944c822b5..7c4c483d5438 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -276,6 +276,14 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	const struct venus_format *fmt;
 	struct v4l2_format format;
 	u32 pixfmt_out = 0, pixfmt_cap = 0;
+	struct vb2_queue *q;
+
+	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
+	if (!q)
+		return -EINVAL;
+
+	if (vb2_is_busy(q))
+		return -EBUSY;
 
 	orig_pixmp = *pixmp;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3d8431dc14c4..feed648550d1 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -357,6 +357,14 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	const struct venus_format *fmt;
 	struct v4l2_format format;
 	u32 pixfmt_out = 0, pixfmt_cap = 0;
+	struct vb2_queue *q;
+
+	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
+	if (!q)
+		return -EINVAL;
+
+	if (vb2_is_busy(q))
+		return -EBUSY;
 
 	orig_pixmp = *pixmp;
 
-- 
2.17.1

