Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0512A8FF9
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 08:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgKFHFr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 02:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgKFHFk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 02:05:40 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C75C0613CF
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 23:05:40 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id g11so230245pll.13
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 23:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pxVky9l6SjSdLAcTA14Zb0ig0mPHGe9JAZ+xYlz+WWM=;
        b=mhYxA+hfdYdKmPXf+5Uz0ENmGw87DnvuIRtIBfijjW125XoltnFPxPeJAjShhP1zZF
         CzHGGfPvrH1yEQCVgAcTfBZmHN3ABIvSHx1IaK5Trurbt0YMJtiPt0HhqXRbpPJ7pVmw
         Vj9iWoAHCCUyS23qBnzK518EtYvDXqzPRzD0KsDn1kPn9/XpFBg2Fz5UJAuSLVy7lRd7
         d/ecLj2XoE46q4rsnj3OKtDW2ONjIFyjbc8J9B5IHqJvNzST0o4vuKdObU+KurINcgqS
         34l1mY33qyM58jFdL+CPsZjlLQggsMs2cbeoy9a1GJsRw8pcgEnwd54lhRdiCdC1/vfa
         XVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pxVky9l6SjSdLAcTA14Zb0ig0mPHGe9JAZ+xYlz+WWM=;
        b=ruRDoZANOMsC0Sr56E8GcjGDWLR1HETceR9pd4H0IeBdBp9vYvht8O9KepN56Wtfng
         b2zFPLYoP5MmjK2hWOgxq2NXVKmAdIo0C3jAjwhzTFmZFbdzzQN3xDf40FTT81X5x1H6
         w1dOuGSHzx7H+CtkxEgV6rvLn1tz6vZCvdn4q5p4u3/+R3g3eEFV99dTyJI6S7DKrH5s
         mbh0OqsGTyaMi33rm3MQK8z0+ryJlNa43BWV12uWkuAHNMjLFOpgtJlT5jn9wpolJx/3
         3yAx092XVT267TsV3TGj7oNe4hVvenHxRy1JPNcaB7ESXTNNAZsKpXo7Kc1GobHFgT/O
         mW6g==
X-Gm-Message-State: AOAM533i72AdK1CY4P4IDFDnHV6T7ErVaEi0GQOucCCLWMvu+q0lf1aI
        SMnlpErq9JqZo2h3AN0RVQQpQg==
X-Google-Smtp-Source: ABdhPJzB5pJKmoygsJHbeXL3UzkTiA/e90EaTRfyPTER4FtLh1D97O8MORlGdkGm/5rhbsYmfMB2iQ==
X-Received: by 2002:a17:902:6ac1:b029:d6:c43e:a42d with SMTP id i1-20020a1709026ac1b02900d6c43ea42dmr719733plt.21.1604646340242;
        Thu, 05 Nov 2020 23:05:40 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id z17sm551372pga.85.2020.11.05.23.05.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 23:05:39 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        digetx@gmail.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] media: venus: dev_pm_opp_put_*() accepts NULL argument
Date:   Fri,  6 Nov 2020 12:33:27 +0530
Message-Id: <1b1c2086f01a27f7da6e6512dd47d47d153f626d.1604646059.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1604646059.git.viresh.kumar@linaro.org>
References: <cover.1604646059.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dev_pm_opp_put_*() APIs now accepts a NULL opp_table pointer and so
there is no need for us to carry the extra check. Drop them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 57877eacecf0..e1e9130288ad 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -898,8 +898,7 @@ static void core_put_v4(struct device *dev)
 
 	if (core->has_opp_table)
 		dev_pm_opp_of_remove_table(dev);
-	if (core->opp_table)
-		dev_pm_opp_put_clkname(core->opp_table);
+	dev_pm_opp_put_clkname(core->opp_table);
 
 }
 
-- 
2.25.0.rc1.19.g042ed3e048af

