Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EF533DAC8
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239130AbhCPRVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239163AbhCPRUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:20:37 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488D9C0613EF
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:35 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id ox4so57841128ejb.11
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tpy6xUUL9qRQqZuAbviQLSx2FJwSSDBmrEW1amUuagg=;
        b=II1CIP9t3QmjwNLekEO6Yuv8ojt6Xeyrh4yanM43zha/lgdv/xkw5IAEPWMz1Zd5eR
         Jh7EF2ZZHBXBHKt6jfC+FkkElMup9uRoYIy3N7IxyxZe9YZWT+azfP0sa6aCfTJHRzpw
         5m9llTm1ey3zs88tsx1m0G9/NiUwrFO4B/Jnv9VDMacOgigBUfUpoNMso0rh07bYcYIV
         1Jm+iXAkZUVksbp6xRl9uVaiuzsBlbUY13hz5k7auxQ0OhiMGPX7wn8LEAnNookDzpJK
         TeJhsoFMZQxYQ9mWhA5SvCnzn41SV7JeVs7QH0YDzRMNB+SJ9lGj4xFp8sGYwzezLTEM
         y0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tpy6xUUL9qRQqZuAbviQLSx2FJwSSDBmrEW1amUuagg=;
        b=QC/943Vp1ZF0cEm4R6J9KzoRwtj5cJw+/v7wdXUO8Hrc60vG1JymucR41tFBeWwfv+
         MoF+3V99ybmx3nC7HCblTztA9UbYSeNWvs3++RrMJwDz3auDepJzVyqJDQ/BGDGYDISw
         vm9b5SRlUA4kuRKWarFWp4GfIw+bNcSP0NkEAAdOWcqFUsXgqd5fjfZ20CoNNsl22W6S
         Fpp7F92rXnpLrApnOt5TOcYFHAz7MQLk3QEuibfxnMsY4Fhj0+1PLy+L/FuNUkDz5QB7
         PJhzUhQQe6QLkDarICWuEtAy60YuJk7d+gy408OzjsImiQQUFBzqkkZDv0n0QJNdGlW1
         698w==
X-Gm-Message-State: AOAM5311FZE+//r2wADgJrDtko0Pb5sWem8oRjSaO8S7NWRAT49dIrSg
        3a0rWUGMc0oDXs7L614mBqiQkg==
X-Google-Smtp-Source: ABdhPJySbmfefwysOWNDzNJZTpAnxYzRfYDw3DEU4gdB+11DlDRdkjQGcuFRWr8AqWaNfo0/qYZrTw==
X-Received: by 2002:a17:906:b159:: with SMTP id bt25mr30543340ejb.364.1615915234017;
        Tue, 16 Mar 2021 10:20:34 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id u1sm10571584edv.90.2021.03.16.10.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:20:33 -0700 (PDT)
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
Subject: [PATCH v9 18/22] MAINTAINERS: Change CAMSS documentation to use dtschema bindings
Date:   Tue, 16 Mar 2021 18:19:27 +0100
Message-Id: <20210316171931.812748-19-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210316171931.812748-1-robert.foss@linaro.org>
References: <20210316171931.812748-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Due to the complexity of describing multiple hardware generations
in one document, switch to using separate dt-bindings.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---


Changes since v4
 - Rob: Added r-b



 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d..7da3e0c74fab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14787,7 +14787,7 @@ M:	Todor Tomov <todor.too@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-F:	Documentation/devicetree/bindings/media/qcom,camss.txt
+F:	Documentation/devicetree/bindings/media/*camss*
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
-- 
2.27.0

