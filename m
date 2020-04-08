Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7481A2B37
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 23:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730706AbgDHVeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 17:34:02 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33707 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730702AbgDHVeA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 17:34:00 -0400
Received: by mail-lf1-f67.google.com with SMTP id h6so6367066lfc.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 14:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dGu6G6U9laSFYPkNmi6ZzG7WVHHi3cCRqEsXprARE/c=;
        b=eYr8eNy5cDTDVyI+xHQL+AUHFo3gMgU74ThpTvWHIW3Ck+kZLmUFKTThRyC4s2o2WX
         4JMNsmiGxwTTeyjmM8J8C8vC2ZLnhtQg9DNUGrHLpfA0WQI3qVmmD9iTB/AUG+7gTsMM
         ArNLz3rYg/01IMOkcFl+3xLznQCC6EPVlkykqTDhUXcSoQyT/MzNt9z35k4+4xL2t9XW
         nE7pywacVqNzDuxi5l2V9GUXDmOegHvV3CrKM+6Be9sTOQ1Zo7LjTN+96qKUJ/NPa955
         ercDf30Tqxchp0jjbJebHT5t/C5hhX9GoxGBFK5BEoA404g/XwrQTcZOa9HfkMyrRXoa
         AEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dGu6G6U9laSFYPkNmi6ZzG7WVHHi3cCRqEsXprARE/c=;
        b=YtE0naaFZDe9JheUTUQzvbQ7ISBbnukBtKhC4+lpdMyI8TSd7Kg4uzlFCKY0Q2NjQC
         Grs1bH9A1Ds84QETKRABgVgOR9hVsgH4NJpk5wcWe/9B13iqOhIovpxSuF0OGGFbsLsN
         c7bSVUKDo06CXIiKlUhBYey1AqZwBz15bzlXqaBst/SLeIQGKvp05do959Ng76a+YfAc
         67nGCWhmthrKHloL3F9GKOtf5elT2DYPYgqZwQRV5q30Um68FRqC2+eWnR7ixo0SYm2W
         rrl9ukbPpr8U+D9HE9Zs+lwuJyiR9GEbaUYaVC7czeCTe3Q6yKdI/DJoWpjCAW1995v+
         9foQ==
X-Gm-Message-State: AGi0PuZZXEomHwyN9rtP6iJ6f5TCHbQZGNNZoZA+BYqJ7Hz4pzZvdd16
        Fw89dYYxZxnF2mmtmfwv+FlEHWIaO78=
X-Google-Smtp-Source: APiQypJys5JfGvGwfOKAO4N/l/YXrDr/1V9RYF63SNuDS7AhccKshDKvFd9TQV7QnKBo0bgPhrUynQ==
X-Received: by 2002:a05:6512:318a:: with SMTP id i10mr5747051lfe.96.1586381639108;
        Wed, 08 Apr 2020 14:33:59 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-138.ip.btc-net.bg. [212.5.158.138])
        by smtp.gmail.com with ESMTPSA id t6sm15746688lfb.55.2020.04.08.14.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:33:58 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/7] venus: core: Add missing mutex destroy
Date:   Thu,  9 Apr 2020 00:33:24 +0300
Message-Id: <20200408213330.27665-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
References: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds missing mutex_destroy in remove method of venus core driver.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 4395cb96fb04..f8b9a732bc65 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -335,6 +335,7 @@ static int venus_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 	mutex_destroy(&core->pm_lock);
+	mutex_destroy(&core->lock);
 
 	return ret;
 }
-- 
2.17.1

