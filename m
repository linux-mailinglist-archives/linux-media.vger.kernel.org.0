Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FEB3394DE
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbhCLR35 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbhCLR33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:29 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F451C061761
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:29 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id e9so2204880wrw.10
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dfKzSN7+Nwky50p4GObh/puW54LZxKNtaiAf8zHXxqY=;
        b=UTILWxAojBI4i7OA9bANtCbOjR0Ok8XmQrTreL4Va8DignTMtqNoQhRh859mIyLJ5V
         Jct2uMyx9JTZLmaQhozGkq8ScYu96b5G8SLCmVwrjOaXanazrKIbYgY7HN+0nUSUT8Np
         0EPNG1D7nB9TSRh4G3d93rVrdmtPuaRAldc0NYtu98PKZ5bSGoR1QdZDKYPBL8KFCD5c
         NgHjN4e/vqiEDhyFMbFDvATIZJT9q3BY5Rbxd3uovdHJhAXrciwHJHdQNCKFeP1mpfkt
         rgUv1XN2kuA6o6Gc4pW2kvDAw92HBiXhBj4rojWp/DvzeU8A9wovOq8ja2hJilHu3Xrs
         a6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dfKzSN7+Nwky50p4GObh/puW54LZxKNtaiAf8zHXxqY=;
        b=oJ2roiGBZiXHvqlsSoalmRS/E5Yw+zjnc2QQBBomzgn92nD2jCyiTwIX0I21JRqS1N
         asXtfSyTGWjRwGh3/DIhzZQ9zHR310WA/MT5mEZKcznmwKix6nHLZ4L5FpsT6lX77RvJ
         5jpsHo0ISW0s+0d4oYbmdHYOKgGvTZtaCllHfO1BRfZ2VGLoLbCkzJWOUdSWMuAy1NjU
         duXg5hFUccaWeeNbIdHOZ0+59t4YWMLbZ3Uy+WX1nEV8XX36todeeF/bebeHWbC//qsb
         oLZPI9EXb2m9TxBeIK8+czTt9g/rVgJF3UNnMjqzVl/2nQrAPge1F6wbJFrPh7gk5D2v
         XgIw==
X-Gm-Message-State: AOAM533dWnwGkU+SDI9XuXt/MgLSF9WXicLACTRMhY0cpCNE6TMh1FOu
        oe+gfeowFCpoFCD0W6KLW7sWTurZDxhxgwG3
X-Google-Smtp-Source: ABdhPJyC5BlVWRFSwDteAZc40VH6Y+s/28q3LNk7ERP9T72MaOS3W4FJZLVamiFpkBxoLEXK79B7Pg==
X-Received: by 2002:adf:e391:: with SMTP id e17mr15028152wrm.285.1615570167825;
        Fri, 12 Mar 2021 09:29:27 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:27 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 16/25] media: venus: pm: Hook 6xx pm ops into 4xx pm ops
Date:   Fri, 12 Mar 2021 17:30:30 +0000
Message-Id: <20210312173039.1387617-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At this time there is no need to differentiate between the two, we can
reuse the 4xx pm ops callback structure for 6xx.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index ccbbac2036d2..a23e490b6139 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -1122,6 +1122,7 @@ const struct venus_pm_ops *venus_pm_get(enum hfi_version version)
 	case HFI_VERSION_3XX:
 		return &pm_ops_v3;
 	case HFI_VERSION_4XX:
+	case HFI_VERSION_6XX:
 		return &pm_ops_v4;
 	}
 
-- 
2.30.1

