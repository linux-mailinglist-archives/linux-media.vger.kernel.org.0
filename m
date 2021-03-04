Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7DC32D28E
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 13:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240118AbhCDMHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 07:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240109AbhCDMHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 07:07:07 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1192C061223
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 04:06:07 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id p8so22567370ejb.10
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 04:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=45F+RVQGNOeOIqHAD42S1RQW90kRIpbUumPYEAuK2qw=;
        b=YbaOEWimUScRLtMtmVudJlYtARyqJDuzL0rzBNhn7Exjbmm5rh0ATdHRSXPgI1AO+o
         d0sPkSaxndAbEJsGrLZ4OmA0yxXh7haRztLEmNv0g9YNdkOvz/6+9MJnJjrdwRVftrIC
         UeQg2pApUq668NeWCEv6TvUHS6rD1EOVAJD8QI5AssEA10/1c5vuTEzIq9LrTnOsoMR1
         YPvZ4NU+laCR30aVOBSwQtV/5a4m6SdazuY9T5fvfpPhDZGxQZXdMfBinraqph5POU4M
         5443qpvAy5/AxcvACAvMNCOTafjxi6lD5uFoTIc1qr2dPjhhaLxHzYDQxfADyvMEyhzY
         oyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=45F+RVQGNOeOIqHAD42S1RQW90kRIpbUumPYEAuK2qw=;
        b=c+akdb42NlDhuHh8eokNzGHhxgb2oqwrzVKT1qe5gO0+RTUZSiXcy/0N/gjc0V5xNr
         XYJc2HViT6qvRkrW93IPn8VD0X8n8a0XbP2XNmnpMyI/jc3IVrpOgH7DEY5dCfHu1JGS
         +wiea4dvChxf09BoBhnsbGbrc0JLhzIr1PTnCeDxTZWWoKCTofXhCMhL0asrGfqVlKdY
         wqmhjpm0/F44yYTdeIN9zttD6zF5nnJNSSnzCx1nwPNoIXUrmtDwizhqXY4KlUNLtwy2
         3mOWf4VNamu1mkt/X7M7Yg5uT1+ofpydS7mtAD0P1LLB15SeCAIMzXIK6BiNvHofnErQ
         EktA==
X-Gm-Message-State: AOAM5331K1pUMY3B1/1iAaat4RvDI+EhT4Dyebf/me7BIXSw6goM0Q3M
        v7QG7/1OfkqfkPvtGlL4qp1hWA==
X-Google-Smtp-Source: ABdhPJzW3QIh+CAEbIAYrDqqYMaGNPCc7KvAEOxiPd+BpOa8ivSgimxSb4CWVwosCOvnKUejs28biQ==
X-Received: by 2002:a17:906:13c4:: with SMTP id g4mr3920304ejc.390.1614859566562;
        Thu, 04 Mar 2021 04:06:06 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:470a:340b:1b:29dd])
        by smtp.gmail.com with ESMTPSA id cf6sm20464447edb.92.2021.03.04.04.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:06:06 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v6 21/22] arm64: dts: sdm845-db845c: Configure regulators for camss node
Date:   Thu,  4 Mar 2021 13:03:27 +0100
Message-Id: <20210304120326.153966-22-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210304120326.153966-1-robert.foss@linaro.org>
References: <20210304120326.153966-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add regulator to camss device tree node.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v5
 - Andrey: Add r-b


 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a943b3f353ce..5842ab65789c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1106,6 +1106,10 @@ &cci {
 	status = "okay";
 };
 
+&camss {
+	vdda-supply = <&vreg_l1a_0p875>;
+};
+
 &cci_i2c0 {
 	camera@10 {
 		compatible = "ovti,ov8856";
-- 
2.27.0

