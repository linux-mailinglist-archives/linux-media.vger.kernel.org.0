Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F8847CA58
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239777AbhLVAf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239720AbhLVAf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:35:56 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B9AC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:56 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id v11so1295037wrw.10
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sZhbVTtpbcH4BYK9ooicrZrPZMlg78QMZggSyLqjabQ=;
        b=nrM2P6t04YBZAqMKcL5YGX7fqxIG2yhyYUzHGjIAQSt/bvlTvn24XkxMER7ZLdlOob
         N1WawiXE7fkMLZ/g09JG2ShhATbNHczT0j9sAYkA9UbMwAqNpQzIZ0gfp+48AgWa4fm5
         Ds6eqyjLNUMxJ6dEvr7c5mdUUldaSLIle9Nx5B88L7bJ0aPa19eO2Tbl2O/mpwE4G5dR
         YfuE3TV+V78VUQJ7tzjNg1YxfsY5NELldrsgho8em50c73/wGxcoFXN57OaY02J4cZ0H
         lufwqVyDg4/IkNj+kwGvA4eTQpf0C7T14k/2ThnLBMsjuScwMTZK+tnQAxkgH2apCdUB
         ftyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sZhbVTtpbcH4BYK9ooicrZrPZMlg78QMZggSyLqjabQ=;
        b=aQluQpI4Mg6rVzb+C2QzDITVOhXPjwkELLGxZ7qRMTikihZ2tP8VtjZfcjSqeL4jrK
         8r2zG8ewkjwZd9hsmjeLV0RPinaUsuv/5vvPDSxxFHzRtfLk545emYlfpucwOioCtB7a
         9wpw9F20mk/OkcpVp1FVZBJtOZaVtkmXDxuk7rxwFwWaqnVXknwvoK3iCe+Nx4yiwSP9
         8uU8FYVyK0hN5ob8G+akYY+H+1Pk2POYGh/oxffRf0LcjackYaTyw0cgvmSXEwk7Ir5T
         3B0t1q0jU7q6flq2d9GrnBiW2wfVujU1ZxN+nXG7H9UXxNe4zcjWHCSjaO7JH4jMUMj4
         YImg==
X-Gm-Message-State: AOAM530yPt5/JvYwcg1mAMMSUA/uIOtaVDsu5QH28HYC3nBRXYEMGQs+
        wJRwTjoIG1ZDlA89L752SFY0aw==
X-Google-Smtp-Source: ABdhPJzaQybV8VjT5xn6xtid/zFGv8DALF6t3rjZixiFB7YkVJLEj06LpmGVpFg0T2lmPCvsLgxMhA==
X-Received: by 2002:a5d:4568:: with SMTP id a8mr392925wrc.471.1640133354644;
        Tue, 21 Dec 2021 16:35:54 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:54 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 08/19] media: camss: csid-170: support more than one lite vfe
Date:   Wed, 22 Dec 2021 00:37:40 +0000
Message-Id: <20211222003751.2461466-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Change the IS_LITE condition so that it returns true for the second lite
vfe found on titan 480 hardware (8250), which will have id == 3.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index f0c6a72592f99..2c84d40fe3e04 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -21,7 +21,7 @@
  * interface support. As a result of that it has an
  * alternate register layout.
  */
-#define IS_LITE		(csid->id == 2 ? 1 : 0)
+#define IS_LITE		(csid->id >= 2 ? 1 : 0)
 
 #define CSID_HW_VERSION		0x0
 #define		HW_VERSION_STEPPING	0
-- 
2.33.0

