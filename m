Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04C7E7ADC39
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 17:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbjIYPr7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 11:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233110AbjIYPri (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 11:47:38 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F95111B
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 08:47:30 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3231d67aff2so3151265f8f.0
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 08:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695656848; x=1696261648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DxLhsFGQa0BTkz7p4gD6/w8EaSRpwpvd+XFr08IQZw=;
        b=LZlnh0xUnVJ5e6ELnJk4teq+a0xyXb9CtxIjXENsIDXStmEHIVNNWK2sP+9iGIbkP8
         VXeWqQdAO7TISU4WvEG8vHRjmYtN8u9dqVvGwVTnG1qouaZuBKMguT+QP0UfAR9958Bg
         20ysUECGyEV0di8JW/2EG/wXcdGbftZ+AjHlphhnuIsn3RoUEZNZ48XNrXUPebHgHDrc
         8Zy3jxg8mkMD9r/44tZVZO4wrFheb6I7F8xEOcYxARLp3EiDwk0eYMabVlR8P5XH1O5d
         2zz7YjGpTD/IS5yCVWAbnNNRE40cwPr5JsP2oyVcmApBMsUf3YCrl1nvJnR9pw0cz1os
         objA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656848; x=1696261648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DxLhsFGQa0BTkz7p4gD6/w8EaSRpwpvd+XFr08IQZw=;
        b=eaB5SLX35S/2vesiwreNB5DMCs6cjQi74v9yzpZ207BqEIjgR+L5Qc8Rw/MNgjLeAi
         orG/yMovg25osdhd6ozc53HgGLJMtvQnk71V9imgzLDGJcUKtGYjxulYLlRV7DNil2kS
         siTJNoS43GPmNGNLnlVm0waYDXojLN+wlhg1y+K4MHMX66QgUz44n1ba1SENx/EyZisW
         d4y9Fot3zBYYtyXy7cBR3M2uy8qIagPP2gHIo7/IVfCNnq/hB1BCMtmoIhs7bmy0mKTn
         +bYHKoXcfWKsLGU7Pnc0MqCGGmUrkPV1arYNKQeXqYPKOwyX+v15WWaAWHl7IPFcLZob
         k3qw==
X-Gm-Message-State: AOJu0YyfG+2WRGp4687hIyQEILeqWVHkg6BosrucAVY/3wtvEJrY8fR5
        02TDxvXA6pXTbubs7TNxUuG19g==
X-Google-Smtp-Source: AGHT+IH+9c2e0yXhNRnuueGYs+KCwAvyqn08ir8+5lwMbxXYdPD4eJuMwQeJXJEHlMDrbQ2hom055Q==
X-Received: by 2002:a5d:6a0c:0:b0:314:ca7:f30b with SMTP id m12-20020a5d6a0c000000b003140ca7f30bmr6183611wru.54.1695656848598;
        Mon, 25 Sep 2023 08:47:28 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d4-20020adffd84000000b0031f34a395e7sm12077536wrr.45.2023.09.25.08.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:47:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [RESEND PATCH v6 16/17] media: qcom: camss: Propagate vfe_reset error up the callstack
Date:   Mon, 25 Sep 2023 16:47:06 +0100
Message-ID: <20230925154707.837542-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925154707.837542-1-bryan.odonoghue@linaro.org>
References: <20230925154707.837542-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

