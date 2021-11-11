Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945FE44DA0F
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234164AbhKKQQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:16:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233987AbhKKQQn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:43 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B3DC061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:54 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id n29so10639252wra.11
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xCycK9uV917chBR/xSByZwvYKvkUK2a7JyPzYtTNNNk=;
        b=ttCstQmOQtCzstf7gtldQf7HpN70YTbBHb/o3tQqr14/D++jJNL3+XuJT9MR+q6n4r
         7AZeGOYeHSwZCEGjnmGCsFlVMc3R1AnLDoVtIJBtfY0LpKxGaHLbCeVRVEvZOzfAdmjO
         zpoaKUGDB+Rg7Z+r2IhgA+oZJtK5czY2+6kbF2ynKtfxCPhMmAlKLor+e/iMsGmxKdH9
         z//RyoCDv1E09NfXPhpy7oS265amMCrPHqYAITWLdlCTXhE4MzLC/ofxdyTgwRlk/2qV
         UBQwzFI76/bTyZziQU9FlxKtJu0c7xw/9h4BMIxzffeRcLUXrQyJIxdAtuoYr2cynUrv
         fCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xCycK9uV917chBR/xSByZwvYKvkUK2a7JyPzYtTNNNk=;
        b=YZ04TjsCGrmjs2YLd1HXjK8puInz16shAs+BQhJLQ7WjlJ2H8pB70Ax3MLgsoNXutj
         6aQNYrdTLZ4IERykiOKKVUH2TAZKaFUdbHxlMUvjTp6rK/W1MoJOES8ZBzk8AQBJ/Rll
         +Ncn+jkERNKENyXw8NHnlPuzhPAUdJMG/8+moZ26DMBmWXS0pAfDdIvL1Z+a2vMlgf4c
         zjvVdABw1I6bmOhD0lLUezyBsfCDGN9GxqeCOmNweM7yFxHplhN2nK+iECIrBVryn/3S
         3qeEP4cWwKDjaqBd6M1S2/SS7+j1/zl9Y5Glfv7em7RXjKl+8C+F8dGcRhQQsfbad1YA
         pvSg==
X-Gm-Message-State: AOAM533oVtvW0XdR0rbbQVa7hgCJ5O7EOVFDMPRAVzu6Zqt86md0M855
        WH4MkWCIvPXkIsvlcZUPSNEMkw==
X-Google-Smtp-Source: ABdhPJw4eaby9IouQ0jExkQZ0ViwhLwHlG4HJhf3jFYjdV/tSwf8rm1NpOVmsclu/6ze95KuDZurmA==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr9750327wrr.314.1636647233106;
        Thu, 11 Nov 2021 08:13:53 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:13:52 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 08/18] media: camss: csid-170: support more than one lite vfe
Date:   Thu, 11 Nov 2021 16:15:32 +0000
Message-Id: <20211111161542.3936425-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
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

