Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36CDB47CA6F
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240081AbhLVAgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:36:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240040AbhLVAgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:36:08 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1C5C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:36:08 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id i22so1261880wrb.13
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+vogyF2UScbBECoFaJzBFj/WlT8gMBbKDtNi13q1rsU=;
        b=iGDar4Jp2+OVfw9Ek+kZLs81nxurgqwHoDpd5aVoZ1Mk6WbGF18xBcyLqOaF2BVTAC
         oMMiHCTfkt2BcXKkl7kgeyfBySHMFJTM0eLj4SKlNJgYDCAI8WPcvx5JGIbO6qlLk7Yw
         0DXXKLF77KmatZyAu/xWL8kmjGSXh87scBWacNpy1c2z08aqzOEGpCvgjdkyB+LaoFUs
         GHpYeATnmVMmz+4W5wbm0mg2hRC//dkYA2T+2XGe+QheWlJgOsIRm0QWnG7OL6rjru6j
         dwn/UQmcngoQ5KiScPE+X2yZpnYKzZ528ce/WkAq5wjXYIuL0FJWDfM95MR93NjOIudW
         MUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+vogyF2UScbBECoFaJzBFj/WlT8gMBbKDtNi13q1rsU=;
        b=amlqMZENV6fWR6utyvGOcDVvg91HWa/SxdyCpHBpmgfjmn4cuV/GMWve7MiCTQvxhx
         V1xfhxNPPRbNDvn+nuwgz4ExxRtwDJRJcClz987yxcxS4tYX0CMyI5ynMARsVsM9JeTV
         nW3dBcCHpiaVBnO+uTH+pwIhhst6eht1MegQbAq8GkGWPNBUodoXPEMjkc0EG5VIhLIr
         QPI8SdkKBLhACtwlw6P49+FbSheG7mVrZWEvUXgAxOvtmgv/TDuCx/AqFekdegT/AEGh
         oL6QvWJGB7Tl7XlYr79fDyv/Trm3PjD045TutEcKi/w63ChXkHJY4RdwnLyJCgWp8zcS
         xbCA==
X-Gm-Message-State: AOAM530Gozx5yDY37Zvf3V9AvpZ1BypHAfFBFFdTFIjdQw12ZCOE2c7T
        prCX+/ZNW4hME9hxfw2STe9Dnw==
X-Google-Smtp-Source: ABdhPJzROdEb/D+NIOiW0s/fmrJtw2dV1OQIcsSuEvwWh5axVoK3MbGEx2s0XsRtKhf/tmlQBwrDlQ==
X-Received: by 2002:a05:6000:12d0:: with SMTP id l16mr385035wrx.466.1640133366920;
        Tue, 21 Dec 2021 16:36:06 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:36:06 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 19/19] media: camss: Apply vfe_get/vfe_put fix to SDM845
Date:   Wed, 22 Dec 2021 00:37:51 +0000
Message-Id: <20211222003751.2461466-20-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
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
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index e6835b92695b6..32f82e471bae1 100644
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

