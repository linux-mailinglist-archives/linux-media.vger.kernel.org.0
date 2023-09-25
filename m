Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B71567ADBF2
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 17:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233082AbjIYPmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 11:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233093AbjIYPlw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 11:41:52 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C367CD7
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 08:41:24 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40594697600so15417995e9.1
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695656482; x=1696261282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DxLhsFGQa0BTkz7p4gD6/w8EaSRpwpvd+XFr08IQZw=;
        b=I4RxAQnZPPgiCX1olxeCWjymyrFRXXQqXNzM8B73Xk7a3Gxdl0y0yFH+EZ6VIhWfUS
         ajd6jviob716LxjNJ2rHLDBLLK0R3oflKYso6i7lZgl4GkI3uMpm2Cw/TywTwzWMB0cu
         zR29In8X8bWk3OOvWGzXqT3p/9/AC5elP8kHMhJk/2Cs2S25m8UCTw32E7XbFLRyhbWN
         xi0jyCt2gjrF1z0otHqCuWHvvci1cWEzZhAyTACVn8qa1FVZwpfQ7a44P3ORFGPOhheP
         BksMlmpSB0KlJh6TxnckCFmlBr2CcENxE/QfUY5G7og8J7zUp82SMgVgmatsr2nZbvIc
         q77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656482; x=1696261282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DxLhsFGQa0BTkz7p4gD6/w8EaSRpwpvd+XFr08IQZw=;
        b=ugXNXnXQJElYZgjjEKM4jah3rCTw/wZd3cpkQZJjdZq/UK3FG04oIn+3tyXstJvq2R
         AKqzdr8HK7q0NMC4Uy7kRdmdVCkOck1Vdjf+/ZEJF6UKm7UR+VJsJhHeNI2OjZ1CaTvZ
         t0NrNkg89dSnAzGnYukUPGCVIWcHAoApbf5S7fV4H0hHCeWxwN/vHk89rs1J0OPYVeY1
         EZ2R3mDDHfsBszIKFkMUeGTJkePMtyAoCLGQJ/WHXzIMRpvUDiQFgWx5WkhRQ81y9+yU
         MZAX+e3R1V0BiaycafgKf8dxiyA4Kys6pUNuz/XCkr8gU5C15BdK6+ln3xeBDRRDLnso
         ctMg==
X-Gm-Message-State: AOJu0YyHMJL7nhATmzPi7+aWWF+KL5hZiL2113UMeDxy4YRO1/Z8ExPL
        Mvp56CAWiD0mfn1C/Uu64iUBUA==
X-Google-Smtp-Source: AGHT+IHt1ZkWrEXe0HIB7lOF0ornhJHLDvn5FtFuukmPR0tn0SDfK/hF8+aXungcDLGK63lcBFHWPA==
X-Received: by 2002:a7b:cb97:0:b0:401:b204:3b98 with SMTP id m23-20020a7bcb97000000b00401b2043b98mr6717942wmi.19.1695656482556;
        Mon, 25 Sep 2023 08:41:22 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m15-20020a7bca4f000000b003fe4548188bsm15206155wml.48.2023.09.25.08.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:41:22 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 16/17] media: qcom: camss: Propagate vfe_reset error up the callstack
Date:   Mon, 25 Sep 2023 16:40:58 +0100
Message-ID: <20230925154059.837152-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925154059.837152-1-bryan.odonoghue@linaro.org>
References: <20230925154059.837152-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A previous patch I had removed the returns from vfe_disable() since we
didn't trap any meaningful errors. Konrad pointed out vfe_reset() could
return an error, which is true.

Trap the vfe_reset() error code and throw it up the callstack.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index b3d5af7f09690..4839e2cedfe58 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -435,8 +435,11 @@ static int vfe_disable_output(struct vfe_line *line)
 int vfe_disable(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
+	int ret;
 
-	vfe_disable_output(line);
+	ret = vfe_disable_output(line);
+	if (ret)
+		goto error;
 
 	vfe_put_output(line);
 
@@ -446,7 +449,8 @@ int vfe_disable(struct vfe_line *line)
 
 	mutex_unlock(&vfe->stream_lock);
 
-	return 0;
+error:
+	return ret;
 }
 
 /**
-- 
2.42.0

