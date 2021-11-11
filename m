Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661F244D9E6
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbhKKQLm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234151AbhKKQLk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:40 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD65AC061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:50 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d3so10635715wrh.8
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xCycK9uV917chBR/xSByZwvYKvkUK2a7JyPzYtTNNNk=;
        b=S0xnIwoQjBOXMH1FiM86FAQx3UPRVls4fzhuVk66C3sygmVXTWgZn45CRLD5QviOQL
         ukDZc8k5+F00aIzLOR0r4uScmvMSmznDv1rwxmpGRjG8PM/lgz6okvnoxcbwEKKjgQqK
         fiAV5Fa8J9fpriQpW4Z9KvEfpeVlk5wElLjidf4Yn5P8aNP64YE7PaOyZM2uIZbX9O/9
         faL3Ss+Dd3bIYXaIiRX8flzhL+6gtF4+ipkrUVr2LU1VzkVq+fbwbF1UoAfWOzsAF5hl
         U9kbqMgyrpGxBJkOBuYAVWDT8eoLV+kOroLNizGkE3TBhfb3Cn5MlxIavg4tHBAJY4Er
         gcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xCycK9uV917chBR/xSByZwvYKvkUK2a7JyPzYtTNNNk=;
        b=EMYYmzuWfSfrsXMZ7kwimZB5VjysF2zLmj18qtcud+pkPIDFbvDLfQDvf6Hjo1bXj+
         nGfW8Yn15oeC4U/gGgqWZepZ0q/FFkPMqSAFk3B1xUpBK6YbLWks/nnNj7iHVU+8gLmx
         VqLoOCEk1otSEnjaPNlwppV3JWaxujFb4Zow1ajZa8iO3ummAxC9z0LPq3q/lX072mI8
         lVSCzHnZ//zfj9qSQ5qzLYDEcOz72UmPmcF6hltThznWv55VYMW76mNkvJ5zDpa4YUpp
         b8Wh0ZxnrEg5NO0YTQnY96fN5e5JIKmqJ2xy9JxSDKbMLv2RaJo9g+wLjQcaeSiv39a4
         /NoA==
X-Gm-Message-State: AOAM532rnCYPJVpzJHK9Hx1ky8MfSVxpgrTRh+AksyediuOjEswLyOda
        VfitmezkZwIbEnVIswNRwPUMsw==
X-Google-Smtp-Source: ABdhPJwv+Wve63kXDDZP+qFfVQHuTxQ7mlAHDbLbDBTILjVtwGnc370E3LOV21wFZxjq9Sxlz/+7RQ==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr10263185wrh.293.1636646929456;
        Thu, 11 Nov 2021 08:08:49 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:49 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 08/18] media: camss: csid-170: support more than one lite vfe
Date:   Thu, 11 Nov 2021 16:10:28 +0000
Message-Id: <20211111161038.3936217-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
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
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index f0c6a72592f9..2c84d40fe3e0 100644
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

