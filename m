Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2D235296F
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235093AbhDBKFo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234911AbhDBKFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:37 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCE7C0617AA
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:34 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id v4so4284597wrp.13
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=71AYT/dhjnU5ojKUj2fRrnlRuQ44LYMjxMdvoAXboUM=;
        b=c8tek5g8hUMygOAsHDoLz672nfpqYIcMeZBUeO7slAlFUTedUuy4OD5QlkbYfTdBDA
         6o4a7Ybaf/OLmNG/TswYmqIEe85/DTNJLcctI6QHhOb7K+b2poo+5b5u4v3+gUylhq61
         x/kAH7YPLhYzswz+tHlKiHa11vRBoFlpoL1UD/ao496KIX1U+VsCGxRxYdajVSSsrU5p
         aLz0G/9fRwNlsD5HjOlJBfjOV/YzTcMt04BZ/QnDmvDNqttJO0UVztdmUmOI++N3/kTZ
         OV+AgI+jfLeUdYRG/yoJTA+u5Rxsaq9k9TxThKHBSz9ti4qGzCyUDIWW87fdCwCrlviS
         vnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=71AYT/dhjnU5ojKUj2fRrnlRuQ44LYMjxMdvoAXboUM=;
        b=mSsAGkO5NKw80zt57+c6Bd/AjNCM3vXoH0kv+phI7y1D1Aa2d71zCZXTC/JDO9Ree4
         bMS6lXn+UPZNq9pZx3obxitq3gmyZvm1SWSkxuvViXowtsAtCVydobv62Sz2Yc6vgnJp
         uKZ2xWXW/TU50WjnpoVQkODI1pEwcbmWiZAjhyYbIJVocH+EVYoc2FGwKe4DCtwH6vMS
         bmxYHEGghacEekv41AgMaivjPCRVYj2b2A1i5KQc7RFaNWy9NyWIxp6YY1wBOl4ZmXYU
         YuNQh0/Po6f+rPYah76ZlCqsoUFrzDCrcWGyYhcAggQ7jl2mw2RiJiGL5MgIItzvONlP
         cV+A==
X-Gm-Message-State: AOAM531ZSSFHfRFr7G8ZInFLnf5RD5xikbWA6J9qcAn8OZOjwWRGUmTk
        ZZpOQ9BdLiSUbi2CI5l0nNddpg==
X-Google-Smtp-Source: ABdhPJwG2/NVaXrpTWLuqjPPS40D4FXyj5cFZmjApNy0veyXDDQk5linTg4TxwGmZOoRdAga7ikAgQ==
X-Received: by 2002:adf:9261:: with SMTP id 88mr14135510wrj.270.1617357933148;
        Fri, 02 Apr 2021 03:05:33 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:32 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 16/25] media: venus: pm: Hook 6xx pm ops into 4xx pm ops
Date:   Fri,  2 Apr 2021 11:06:39 +0100
Message-Id: <20210402100648.1815854-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At this time there is no need to differentiate between the two, we can
reuse the 4xx pm ops callback structure for 6xx.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
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

