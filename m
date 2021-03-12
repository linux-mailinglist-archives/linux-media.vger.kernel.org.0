Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CDA3394EC
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbhCLRaC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:30:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbhCLR3g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:36 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D91C061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:36 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id g20so4266436wmk.3
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0KDBFU7uY8GCljkZCvSyuE+T/PmgRMx06G8Uzy+U6qQ=;
        b=NE685g9tWJqRtw3qMt+hguxSYELgsHYxP94ovl68qt+G1FxWWy92CO0CdoU/P3bb32
         wKWApnYEipJ0OeLcHEL4WZTvlWcksoxW6w13aC1zGimi3jZSOt32I+zATQiZxJrA+Rnb
         cCS14LSGd8zUbg2lWqvyRNMAu4yGgEwlmVE5vATv0YJ+LvvY+KxkGb1WMLg3cooeNJn1
         IQBngTTT9wvxQW+BOSApd+iAeWkIkGcsEsSRvpti0muNnLAtrGqAQza4G4tRDphG0oK8
         ST4B/skmAjg8npizEInjo6DKygp/Fbtab2Z7DMeG/uibrOFbPg8EWSwB8pV6X4jkESHz
         1pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0KDBFU7uY8GCljkZCvSyuE+T/PmgRMx06G8Uzy+U6qQ=;
        b=LCF7wgKjqJG27nX/iW8cvUUFrC/U/d5L+YEW6oCU3AqNncZMNmN+pjAlTpbKBftPwS
         b72vUdjqjOkesadPlsBCmOOWvukS1VJ//BQD7U0aGGqcHmdYCkLh3xcsiBRRGgK0x7jq
         cmdfFQDj+UkVYimEpYRsjPtTnAqQVMkeXneulvLT7uwOmDjgpgQwPKelgKpP1RIkcNFz
         8OARUUGp2IM6bIRFeUEAF6NosIWRyUCXm6evn+M3P+D6N4YSxLLUFp+yn8CNd7KhcH+P
         rYdp5UryiLouD7Qw3GrtxRwME/voiLcCWpKi7XigHDiWXazBcAHNwYh8a2UTPuX9YOmO
         dvBg==
X-Gm-Message-State: AOAM530hkwbV4SdVdVbhm/dHBWZWYQ+OzZd6m2ne8s6YIzqedcRzcHWn
        twUOuXyPQvS3bzMeh/nxW4aAyg==
X-Google-Smtp-Source: ABdhPJyeFVNS2lfk92juqBy27yM1AaJSXo8zsvSkjihFqV4BMsWsghk37QXUB8ca1a37hT0DDmsOtA==
X-Received: by 2002:a05:600c:220d:: with SMTP id z13mr14178776wml.1.1615570174838;
        Fri, 12 Mar 2021 09:29:34 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:34 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 23/25] media: venus: hfi: Increase plat_buf_v6 o/p buffer count.
Date:   Fri, 12 Mar 2021 17:30:37 +0000
Message-Id: <20210312173039.1387617-24-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Presently, minimum buffer count for output buffers for h264 &
hevc codec is kept as 8 which might not be sufficient for
few use cases so increasing the value to 18.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
index d43d1a53e72d..075d9546b15e 100644
--- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
@@ -1159,7 +1159,7 @@ static int output_buffer_count(u32 session_type, u32 codec)
 		case V4L2_PIX_FMT_H264:
 		case V4L2_PIX_FMT_HEVC:
 		default:
-			output_min_count = 8;
+			output_min_count = 18;
 			break;
 		}
 	} else {
-- 
2.30.1

