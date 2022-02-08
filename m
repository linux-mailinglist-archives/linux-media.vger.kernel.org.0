Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 330704ADD7B
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 16:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236561AbiBHPuO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 10:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351918AbiBHPuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 10:50:12 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926E1C06157B
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 07:50:11 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id w11so31578292wra.4
        for <linux-media@vger.kernel.org>; Tue, 08 Feb 2022 07:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdCv/e4Lout+hSyC3wopJXpraLZXoqzrPsSBbu5nCgE=;
        b=k8MjIvKrepUHPzOaub+Mhfb8DEajKGDJ/KanDQokW8TtzeUlgriV1KUiSrICmn/NdT
         A54lEz78IAphFK/sNe0G5T0XEYo6Un0B4fN7g5TLvFS9k78KlUVjl28ode3e07uoswJj
         Nb3RgaFDl+b3kV7vWai0upxvqtm37GczB3xpFW+magR1HcPfGUgvEKR5uS2hMXfnBYJV
         c2VO7Mxq3vDpSHSjBszHvrPFPZf+w4WAGeUczlNS4ZULmt/jEhzHRm6EO2T6FrzEoxWl
         5GI1ZLDWyeWL5yGkBSoNY1Vi1tRtgXIkcIk7nh6xNcpsv36vYgmUoltzQOCq+hsgBXBw
         +Fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdCv/e4Lout+hSyC3wopJXpraLZXoqzrPsSBbu5nCgE=;
        b=qAMqlpM4ZDx1tWNJ5v+XjAirfMmw7xO3IynGSkW8Wn0xZ2+LlDlaZgAXpULVMOfz2o
         HqMiM6i8BPyr/K6HslUucXM87VzC5i3v9z+kDlTb0rmrGQ80HObKXPe5NI2aM6eEUmfN
         cadNFZvL+tBusNlrSuHnMash4A5A+FqfWG/69dXRoo6+4XkX+tR3HTtyoQPDGOYiGi2+
         gVJ0b98wCFNjsb1w+Ym+eb04+3vlqcB++4ykLaXFLe+u2kHbaPRiB881xbmvz6bh4Z7E
         tin4Y3AMBpS02XUHYCxhx2Z49tfbsKch/9jgz9cLlLpsmLMlsxhYt/gR48PXKBUm/CAJ
         S0xw==
X-Gm-Message-State: AOAM533ZYconz83XNd1hRST2k8vA5ysdTNPKOVq9aA6rHl4bTZu+7qd2
        LmSg31ShIuVfhOvNXYIteYbrot9rUoVddg==
X-Google-Smtp-Source: ABdhPJz4/1yJUf+OiyO/9YQQMmLN9cBM5av45NCmbvWIJYkMWk5x9XlBbBqtdzRYBiqDC37XrxwcIQ==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr4253787wrz.500.1644335409911;
        Tue, 08 Feb 2022 07:50:09 -0800 (PST)
Received: from localhost.localdomain (hst-221-62.medicom.bg. [84.238.221.62])
        by smtp.gmail.com with ESMTPSA id n13sm2700503wms.8.2022.02.08.07.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 07:50:09 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: hfi_cmds: List HDR10 property as unsupported for v1 and v3
Date:   Tue,  8 Feb 2022 17:49:57 +0200
Message-Id: <20220208154957.630720-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI HFI property is not supported
on Venus v1 and v3.

Fixes: 9172652d72f8 ("media: venus: venc: Add support for CLL and Mastering display controls")
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 5aea07307e02..4ecd444050bb 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1054,6 +1054,8 @@ static int pkt_session_set_property_1x(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*info);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI:
+		return -ENOTSUPP;
 
 	/* FOLLOWING PROPERTIES ARE NOT IMPLEMENTED IN CORE YET */
 	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
-- 
2.25.1

