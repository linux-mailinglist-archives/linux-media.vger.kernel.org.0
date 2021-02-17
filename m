Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E62231D830
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 12:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbhBQLZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 06:25:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbhBQLYV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 06:24:21 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34AF9C06121F
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:03 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id lu16so6606672ejb.9
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PC2sXSUCVtuCTR4UN7c8iTkNydyknx8hb/BTqhYKVYU=;
        b=fA2o/EGvzGEv1haSdBLug/QROXSJaSrsvxNNtvQBM11DM0HRPoc0FWOAnAIU2NFaYs
         JNXGZay9NTTk7xxwhIDOdBrxsXKlromxzlEcV/T9kNDidxqOUf/GXjQVuDfEOlY9nJFW
         1tLF0j1Rs8PgfzIxW5t7kGSl/yrOCKBGpp7T+OqZ91gsTaXMTmZy4uSWWvg268vttzBR
         4F/cxsYx/h8s3kZN+OZeR5l1kYvuOfzO4B9J6PT2ICkheHICRTNNhImTwxS2pqV8nFOF
         9aNiyU+Df32OOQc4smGlqxKtac+3mWpf3TWMoxVd3VbvZ3nOUd+Mt3GnFV3IzSoNBkk6
         b73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PC2sXSUCVtuCTR4UN7c8iTkNydyknx8hb/BTqhYKVYU=;
        b=aov+wcNm4j7Eo20So2/8jFPp221H5xCc2ZXqbCrbVb3tkIPq1pQ8WmmThhTHk8FA9d
         yinRTgRHGIuBC0bTJ6FLXLhWs7djAh+1vW5H9clZMBhzA4SqKixDVkjjeIbYj/bZtkUg
         YXE7Baj71MrD2IZ5VF1gvXrEKDav1xrWHNV23mugBBThKCtNlRvCDaKrkR+eNvd2egpc
         eXQMAn5RsSZFP2h5gdOYbnJDJ6QA/RxRwYDK+NFeyGINPkP3HwL2TXmMrX7q7QX59/dc
         t/cyFHsISBZPBrkOGBp5vfVXBMbLr2JavXOwYqdTdkLVlTTgh16h9p5WFc2ea7O7DGCZ
         i7oQ==
X-Gm-Message-State: AOAM5301OApg4mpsZSX0cfmI+Z8TKjnjQ4YGibR/kd7dR8gI3gnPRTKO
        BbzEqbsJb5UqmDELLK42PDQdnA==
X-Google-Smtp-Source: ABdhPJzCpAG+pfsL0jU+csUD84apNmwleNPkPZr9jH34OCoQ15BY/eJseJ/2/x+yJqgiipg7FFVzRg==
X-Received: by 2002:a17:906:d10c:: with SMTP id b12mr15898979ejz.477.1613560921948;
        Wed, 17 Feb 2021 03:22:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:22:01 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v5 04/22] media: camss: Add CAMSS_845 camss version
Date:   Wed, 17 Feb 2021 12:21:04 +0100
Message-Id: <20210217112122.424236-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210217112122.424236-1-robert.foss@linaro.org>
References: <20210217112122.424236-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add enum representing the SDM845 SOC, which incorporates version
170 of the Titan architecture ISP.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 3a0484683cd6..46e986452824 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -66,6 +66,7 @@ enum camss_version {
 	CAMSS_8x16,
 	CAMSS_8x96,
 	CAMSS_660,
+	CAMSS_845,
 };
 
 struct camss {
-- 
2.27.0

