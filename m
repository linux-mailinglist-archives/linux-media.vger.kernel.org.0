Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34EC533C0C0
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 17:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbhCOQAj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 12:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbhCOQAY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 12:00:24 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 191FDC06175F
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:24 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id j3so17976003edp.11
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8G+ZMr9j2FN56LuTLUOEMncw3y0hwCnmAUfBw5wAtUk=;
        b=ZrcwjVJi1vggBgAijXS7fWzogqwPZmhxk++3O5LC6YHfIQC5fmWlzXsItY8kIN8+Ou
         7ZcXySy3ZDXD8xZKyeblcsI6hCfRleS1AnuyC9aAijXHAUZgPYFBzlIkdp/PvW6a/QHD
         fPJRGm86o5mwbt+302ZF84Y/KbXI3A4IbmebPuZb3elFr06feJ2FrWdnLHCUegQ1CWZF
         IZ/HZU4Ov1X1w8ezhnmJRHhmom4g3jOFON6waUncjoO1MQQbxQiX+Fw5J/r0W+w80fvt
         QMyKxLuQYgGz3P4l5udx7c2oYPVUEgAJNTFRarxg/GbOYROMOZqkBqtoCYk6irURAMDF
         s2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8G+ZMr9j2FN56LuTLUOEMncw3y0hwCnmAUfBw5wAtUk=;
        b=dom0keLJBxxCPm/Xu0wcMRKIUazkqa68VBSZC4DjLfqH7T/T3q6b6mZBY2xTZqXdR7
         JVips1d1cbB/O19E6hz+xb7t4qiFKwjj5ui7ISFiPQTkk05sI4aDPkSSOe9QbmbzZKPo
         h262tM7IdUiGO0ERP8rqns2YE9JgsmsS1PeSarnvRwXM5lk3q0qAkwnEL1SSGIn7CrHw
         GT7RyU13OZfjTnqa0c+VoJQAkPhctgY5ngvUy3yKuxHAXfzYIqO3PQlF9FRH9Qhd15/E
         aBDvUieOoc+pB5Tsn+Crnb/S8hWbYPQ9rKWnETTrPfwxlb5nS0KeAWU3UA8Z0Z8MPcsS
         KATg==
X-Gm-Message-State: AOAM532nNXDCFdhJme0D7aB1kIktTjG0WYJ1jgjl5nfauRy7HAQkx8LE
        MLeNrDcF/sAKbM1M47QdnLWrKg==
X-Google-Smtp-Source: ABdhPJz42+lxI2nJbwkATPMxbWO08P0hBO6V4zUWE+szxyjhjLd5DyEDE+xH7b2TDQZF9vMnOJ7Onw==
X-Received: by 2002:a05:6402:270e:: with SMTP id y14mr30808206edd.283.1615824017570;
        Mon, 15 Mar 2021 09:00:17 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:00:17 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v8 04/22] media: camss: Add CAMSS_845 camss version
Date:   Mon, 15 Mar 2021 16:59:25 +0100
Message-Id: <20210315155942.640889-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add enum representing the SDM845 SOC, which incorporates version
170 of the Titan architecture ISP.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v5:
 - Andrey: Add r-b


 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index e29466d07ad2..63b35ea2ca36 100644
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

