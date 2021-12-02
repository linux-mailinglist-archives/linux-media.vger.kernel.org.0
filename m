Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31194666C3
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 16:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359096AbhLBPj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 10:39:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359099AbhLBPjZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 10:39:25 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33529C06174A
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 07:36:03 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t9so43477328wrx.7
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 07:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/vVxuU7a+LUiAWFx1LiXN7IDyUv3UsbR6TDuxkNCB/w=;
        b=TiIvKEA250oVYTFdjOdG0AwfIPQMn5jbjDlpBKyO5zkA4a72ZiZrKTxXJDA6MaJFKc
         z6uBOn7kTIT7lhfQW5ElMpwU5mnvQx4lTbqDuCtEKOQ743phik9ufxuRkl2IA+Rh9O11
         J06rhRtF6abL0qqZBBpMr7SbqOiuNAU4YLcQ0nsVmXeGSU3nd6x163aGg9/tS/6GKAWV
         YXQa0SnmrvYw4u6zvmY0WYg7UVl9+2zp5aE0AvKtgPZ+eCMBeeiIhHaHz+hi8IuevcfJ
         nMJHfAGrzlfdTL71kP1IpICWymbbl4elb8LvO0n5CcUKl3kq6UP2a3vhdCoPgZHcF5/J
         /zHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/vVxuU7a+LUiAWFx1LiXN7IDyUv3UsbR6TDuxkNCB/w=;
        b=4Po5CZs8j36H9qVEmMUbmm1bl5z8wTqEf0LmMBgliIZnA7VvZ3DfQr/yzPHnArPHBw
         TeZ6UaQZCt5ZWbviqpe6dFleYoQvK7pF9VUNVXKtMXU2ooOxWGpzL9upXz0lPKRBUJuI
         sx9+Bpq/P5ftJE+9ejtNqtx6Nmpvv9MGxdj1JwsMcyfwJY3QW7QNMGpEc83K5J6NABse
         kUi5YM9/U+eHysDZY/rQLwT9QBfYRvZWSYNO5R8pdxUKkAUPSs20LFd5kzYO4BnEpB/9
         r0jCLXUs6bxEBXd5MLqiqxuDdOT+zzjEppEHRvUpOFXFuL6X920U/x7jJw5XxmHuBHxU
         ApZw==
X-Gm-Message-State: AOAM531K20FinYggfHbmTh9XAyajr7ErdgBxnoVXEdakJtRMuELhKihJ
        No71Og+EYjnv0ffs88Cc97Zt0w==
X-Google-Smtp-Source: ABdhPJxwd9zldiPd6CgKcrcDB2YKK/NKBgLTpScR/QgH7coz6ISpoc842RgrFWlcAHby8715MFiptA==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr14929986wrn.472.1638459361802;
        Thu, 02 Dec 2021 07:36:01 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:36:01 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 19/19] media: camss: Apply vfe_get/vfe_put fix to SDM845
Date:   Thu,  2 Dec 2021 15:37:29 +0000
Message-Id: <20211202153729.3362372-20-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Similar to the SM8250 the CSID relies on the VFE to be clocked prior to
taking the CSID out of reset.

Apply the same fixup to SDM845 as SM8250.

Suggested-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index e6835b92695b..32f82e471bae 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -159,10 +159,11 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	struct camss *camss = csid->camss;
 	struct device *dev = camss->dev;
 	struct vfe_device *vfe = &camss->vfe[csid->id];
+	u32 version = camss->version;
 	int ret;
 
 	if (on) {
-		if (camss->version == CAMSS_8250) {
+		if (version == CAMSS_8250 || version == CAMSS_845) {
 			ret = vfe_get(vfe);
 			if (ret < 0)
 				return ret;
@@ -212,7 +213,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		camss_disable_clocks(csid->nclocks, csid->clock);
 		ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
 		pm_runtime_put_sync(dev);
-		if (camss->version == CAMSS_8250)
+		if (version == CAMSS_8250 || version == CAMSS_845)
 			vfe_put(vfe);
 	}
 
-- 
2.33.0

