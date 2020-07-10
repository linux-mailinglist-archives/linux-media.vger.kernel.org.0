Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 901D721AFB7
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 08:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgGJGsE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 02:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727932AbgGJGsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 02:48:03 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3970AC08C5DD
        for <linux-media@vger.kernel.org>; Thu,  9 Jul 2020 23:48:03 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e18so2100339pgn.7
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2020 23:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSZJQMAGEnmb2CqHFz1MNS8tMejxPEXsK0YNj8SWBOU=;
        b=iRwK09LZ3BJmibGsyHoCPM9GNX9trLKrPSXtExFzQHWVgWOR89O1D/k+PuICQMvp0k
         8uI373R2c7W9fJJzkJkk6O7AAPxjodaRHJ1NFg3f71hMp4vWwopxlU8XspS9hh2O5GS/
         bBX7mQl430mHjYbVQaIpKkORhNrosYA0kCQXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSZJQMAGEnmb2CqHFz1MNS8tMejxPEXsK0YNj8SWBOU=;
        b=JWVDuqwvb2m9qOCY6LG+Ed1gpge/L3NiD28nK63quKHtsY8HCSRI9EolTVBfUv2w+u
         kYS9sipIeu6BTboJvRFZSKl3oghcbWqoTenGSzEL2o2KJ+HzIjLjEHwfXM+ApfZjNvwW
         DikFWvx2dYdJe+AhYW9An4bLZE+fEfs8486xf6ZmS8Fy1Nin8huh5AL3LZ2Qf0V6c7HO
         rZIgmjQPRclDnG2THhBIXll9GouOrhEqflirt4jIFYcfe8CPXntfwA2XOFEadTLKY2e4
         dAfjYXIyNmAMuYcGI/WGddf22QjIn7al78Lvq6SciqsRClv1nenFKxGZqVAz5KuXGAtJ
         U6gQ==
X-Gm-Message-State: AOAM533bkGL+P1Fa3GO4I4c7BmT5z/I99z2EnhmDNhK3NPgWn5vtgW1S
        0I2y6MnrAe3Lj7U3P0vEavuROA==
X-Google-Smtp-Source: ABdhPJwhX2wS73T6Qup7iqhhvrnjvxKp1seCyklGjzfwCEpwkX280YDw9Yjg2xyo/YXFrjL5wGtLeA==
X-Received: by 2002:a63:4f4d:: with SMTP id p13mr53250980pgl.400.1594363682668;
        Thu, 09 Jul 2020 23:48:02 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:7220:84ff:fe09:41dc])
        by smtp.gmail.com with ESMTPSA id 190sm4639423pfz.41.2020.07.09.23.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 23:48:02 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [RESEND PATCH] media: camss: vfe: Use trace_printk for debugging only
Date:   Fri, 10 Jul 2020 14:47:51 +0800
Message-Id: <20200710144747.RESEND.1.Ifae7abaacb81af1cdc6475986cc788d71de8a13c@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
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
Sent this before as part of a series (whose 4th patch was a
change that allows to detect such trace_printk), but maybe it's
easier to get individual maintainer attention by splitting it.

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
2.27.0.383.g050319c2ae-goog

