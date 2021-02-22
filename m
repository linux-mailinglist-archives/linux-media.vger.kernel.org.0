Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C9D321C39
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbhBVQEh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:04:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbhBVQDh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:37 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3BEC061A2E
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:55 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id m1so14868790wml.2
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PezLYwUJemK5YD1XfzJtDVf4NCDS101gBrfpO/EAkMg=;
        b=isCjhUtg+Q2fze4zFP2qOO6AzXCSyk2KIa2d/NzB9Kc2oR76hjz8PuCHoviDMu/i0Q
         7gMnJHRSGhiuSn7nxKqDKWic7ArX4JLnWm3ZkksNuUXbPGbPvDlW7KYd+c9+ku9FS1wf
         z/XlJ2Dec2hPS9SaoMDcMfnWVf7MTG0k/5wYMT0uT7jCR2gtmwg0qzLo0cVRoupHVPXX
         SO/W++vcHbJ6Lx2RkKVghFqNiP7S1ADDP50eTM2wYD4LBGEEYeO1/U5d67bCGabe7V5s
         ra9qKTztlALtvs9cXNNDaFG8E8PBLtk12e9yvDLDldQ9G2EQzH6WnNZQ+vwrB3zoBs0s
         ijYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PezLYwUJemK5YD1XfzJtDVf4NCDS101gBrfpO/EAkMg=;
        b=pOD0DmY/KCnRDroYmK6PuSoNvW1AKhMkoWTEjTCygDZ5D1MS49p3m7zLDmvPDfAHTi
         GglDKP7VEC09Phm1iF6FcXOl6BD3fbTUpUvBkLeyoijh1CzW5XMnoQfT5JHTIPMsZZXF
         8NT1VkUXhiA6IehjrReI9CG8nroh50Pb0b4L//lS7a/atf1j2jFK3zhsSVK+V31+TeVy
         0MFP+bA79EaQmNfSuq9paRIRELCEMBk1GfvyOOGKB1oADdGOUtxgKCioME2ivWB5XnMX
         olW4qI704KQUqXO2Lydx9olhnMFDHndBkXvQSAQ0gT2PNgRE3vnRammfQj5ia6YPuhSX
         wePQ==
X-Gm-Message-State: AOAM530j6W0VRLEOUi7TONGjKaNSdbNkPo5qyd8oeIbSqNLmATHP27GV
        q6JQn/UrgT6fbGun8nvo33iQ8w==
X-Google-Smtp-Source: ABdhPJwKmciyk3kiAt7sJzDvtnTKH/P6jyjDmSvai0cn8GbtvFnJZShYaYJVkkFWj2OZ/3DoTgYMcQ==
X-Received: by 2002:a1c:2311:: with SMTP id j17mr20701210wmj.38.1614009714303;
        Mon, 22 Feb 2021 08:01:54 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:53 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 17/25] media: venus: pm: Hook 6xx pm ops into 4xx pm ops
Date:   Mon, 22 Feb 2021 16:02:52 +0000
Message-Id: <20210222160300.1811121-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
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
index ea08b4d71e39..f163526c3f83 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -1119,6 +1119,7 @@ const struct venus_pm_ops *venus_pm_get(enum hfi_version version)
 	case HFI_VERSION_3XX:
 		return &pm_ops_v3;
 	case HFI_VERSION_4XX:
+	case HFI_VERSION_6XX:
 		return &pm_ops_v4;
 	}
 
-- 
2.29.2

