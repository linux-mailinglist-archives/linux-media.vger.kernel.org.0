Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B71C24B1E3
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 11:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgHTJPG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 05:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgHTJOT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 05:14:19 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C56AC061757
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 02:14:19 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id s14so759616plp.4
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fteDDvG0lAwDUKEWhtTwY7pAZbLV3gpQe5mpBnV9oBQ=;
        b=etECKGb7kbalwLBAoTrpPMX3ZW67xpLBEkM9fyGckTzOZQc9DC0gGPbOm/C35mHFUm
         0SUiqk7LBNR7opllyTOPxqomZuk4ireVz+J8Ga3shwzH4euw0XT3cv65tWQwR+27OhjE
         LtA3zSxIdezdqeHB0ICydm6cDZ3QF3utr7BKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fteDDvG0lAwDUKEWhtTwY7pAZbLV3gpQe5mpBnV9oBQ=;
        b=qjgaRB2j4q3UkTUfN49y69lkuk11Idsf8fRX7QuT7cYD1682dGdNJlaKr1r72F69Ob
         otgOhg5YBXSgEzBwn7OOMOmnjt9U2Xw/a+49qGErhi5Kz4YmLzJuqvZuHPqOdQ6aiKmZ
         yqEkmU46spvcYZ9WkxsnC20OI7xHw9S+/LD/Ai0Wn8lmlc8o6dZPZhtcKkJKRChr5Mv0
         577JApJCF/4nAKHXBrfec1tr4K8QqIGR3Pltvahf1gFB+dKvpMiMzOPdEfTf3gGOrD47
         k7oQAvY/aDs1IVHN4yfn61yJvG99XxfztK8ZgotM33/iprIdqFdXy1UrU2CVfrHXZ09L
         mqtA==
X-Gm-Message-State: AOAM530lneZbZHdLxguhT+nKsAzk108ZBksnSNf7VdBfqZR+KRar0mEP
        LbC0Y0Xt2eoy1+HY7JMKLIoouA==
X-Google-Smtp-Source: ABdhPJwipjFEnEYG5Qh0oqH5IY0sSRTeSp67cThk/5qNE520m8larxCy1jbleF0kZrX6bBQPlpO9VQ==
X-Received: by 2002:a17:90a:7488:: with SMTP id p8mr1884427pjk.158.1597914858908;
        Thu, 20 Aug 2020 02:14:18 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:7220:84ff:fe09:41dc])
        by smtp.gmail.com with ESMTPSA id o15sm1954448pfu.167.2020.08.20.02.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 02:14:17 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 1/3, RESEND] media: camss: vfe: Use trace_printk for debugging only
Date:   Thu, 20 Aug 2020 17:14:10 +0800
Message-Id: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

trace_printk should not be used in production code. Since
tracing interrupts is presumably latency sensitive, pr_dbg is
not appropriate, so guard the call with a preprocessor symbol
that can be defined for debugging purpose.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

(resending this patch as part of the whole series, since we need a new
patch 3/3 now).

 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 2 ++
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 174a36be6f5d866..0c57171fae4f9e9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -936,8 +936,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 	vfe->ops->isr_read(vfe, &value0, &value1);
 
+#ifdef CAMSS_VFE_TRACE_IRQ
 	trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
 		     value0, value1);
+#endif
 
 	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
 		vfe->isr_ops.reset_ack(vfe);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 0dca8bf9281e774..307675925e5c779 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1058,8 +1058,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 	vfe->ops->isr_read(vfe, &value0, &value1);
 
+#ifdef CAMSS_VFE_TRACE_IRQ
 	trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
 		     value0, value1);
+#endif
 
 	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
 		vfe->isr_ops.reset_ack(vfe);
-- 
2.28.0.220.ged08abb693-goog

