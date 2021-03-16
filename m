Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA2233DA96
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239178AbhCPRUl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238820AbhCPRUN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:20:13 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D9FC0613D8
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:13 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id si25so17783677ejb.1
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mm86pbCDX19ZA+U6x/Y02/6OFIBGni7DxrIBYj5GsxI=;
        b=yF+V7H1rthM0lVYnnELyZnJDuht+Tlhi6+sl5kJ5fgYafaY8LDDhyRie6yiZxIEgFx
         8Ezslg+3GluQXbO8GsVgB66qTfS5SLvHSkFNGvpvN4ZJYBgNXwYGoopm0i6YQm+Xw/IK
         V5PDoXDUqCYcHd6Aj3GgZ2abxDzPbHQCDx6/xKuTYeElmI4djHL2PcQ64SvID5oiGqul
         Qx/0ea7/1+3Uw4lDOmzBy0OJg0eoq5XM+CL5EE7BYOlQIt5ahRccuoPe5QMhgjBdE1sF
         un6XFT7NFIHcjng5DqwiQ9CXxYfsXresx3bjmMImYYekEycTdG9jRG9Rms2M9nL4V4nc
         j5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mm86pbCDX19ZA+U6x/Y02/6OFIBGni7DxrIBYj5GsxI=;
        b=hgh86TaK5mrjYNY5uBpBsESBbSvxUd4MUjQK4nsB5sY+jNd7l6UD/h258uAzm71nBj
         sezEh46mFCk5WVNxZBNoA+JVKd9BjMCGS8l8gAbsGUYVcO0IMWiAJglIrZa+3sc16bqb
         J6iR53Y5RLEozpq34xEzBdYqN0z8Fwnr/ktBPj3dHrGkP1LMFDP/BRm9IVjzt5bh2qTy
         7PEl606XD8QbR8AlfcaTy2wuFZhdxsPV90qkkJFX02DOa4IpJLSWJ+z7VtdRq1r3uvFl
         eOzWIZh54zuEPQpknDVpPQLl/MC69Lm4oCjQ44MjwZbXW4QaKsf8QONZtStGn/JW0HTZ
         OzNw==
X-Gm-Message-State: AOAM531mfXkYHVq4TT45BWPDekQRZIS6JRymEHlqsJYRveni9SmMk2GF
        oDQfGJhSkLCs+KAP3Vv+u4V/xQ==
X-Google-Smtp-Source: ABdhPJxAcj9l5HxEklZsFvnkh7WHLwHZFKiw3/PuMpPMkiHySb37L3OnZtnIq2JE0pl65/UbA9+Lrw==
X-Received: by 2002:a17:906:7f84:: with SMTP id f4mr29990794ejr.525.1615915211716;
        Tue, 16 Mar 2021 10:20:11 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id u1sm10571584edv.90.2021.03.16.10.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:20:11 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v9 04/22] media: camss: Add CAMSS_845 camss version
Date:   Tue, 16 Mar 2021 18:19:13 +0100
Message-Id: <20210316171931.812748-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210316171931.812748-1-robert.foss@linaro.org>
References: <20210316171931.812748-1-robert.foss@linaro.org>
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

