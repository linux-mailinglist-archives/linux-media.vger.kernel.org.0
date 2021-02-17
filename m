Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3FD31D86C
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 12:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhBQLbD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 06:31:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhBQL2i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 06:28:38 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE83C0698E4
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:33 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id b14so15466116eju.7
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rtnlfnM1gUAXVxSsCOu/wsiGW/5dkOKL2/2b79ivYgU=;
        b=sR0mwEkeeW9RM2x7bi0/WJhkQjo19hRnx7pPr1Daw0TpDkPfverBfbDk3NgH9O6Yxz
         /UzqbAwNx7P6nSf0OAJBh39/hdhdSXcIqRm2g7TbyCkUZaxhOsFLIMH/6exiLpUl/2TX
         Q7buMRG/PXVjeMWjkKo0L/eNAAmv1Iiy1X+8GOJPykfWQG5PchC1/3Dvx887j3tDnZKb
         M/N2Ix8x6EjuAiodROmntjLtrnaEd0m5k0I7NNJo+TuhZRaWJ7+PprTtpDd945dUvRWy
         8SKA//Gb+m/CTZyQTZLQ5Isj0FR41K4iW8GGIJ3eF86V7JIK4VLWJj+QNXx6qX7/+7mu
         FG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rtnlfnM1gUAXVxSsCOu/wsiGW/5dkOKL2/2b79ivYgU=;
        b=FTjGgHvu7/tGDm0DboAGF01ptCTAU7umpPYbclJOH4C5RI+xxXM3xLX9zCnnbrQWPy
         VdERkLVbLgTslp+E7P20vRgo/oYxDvJYpf9FJQjyIZ1Ovgn9Ms0aq/LdGuJ2RarnhIqp
         P1PrWhzc9fMK1F2hv32e0T4JeGXdPmANPOyMSdvnNKdTOYlHKecWbeZIcf/kxDj4lgja
         zp/MyxtwNqMthELgZZr4wM+o1GvUQxizYxIt1G+WRNQsf1XmeJ7r+gnnm90xXzlG9qLq
         EixwpKrSEwpoK46+SvzfmBgS2GgKFeqvC0DbO/GRmU0AHuuFKEA6SdGKQDryRm9dHtRp
         jlxA==
X-Gm-Message-State: AOAM530NoQTEhKtDJ9o9A8QTG39xjzAvNvzcdBpZo1oM57QM2+xGWsA0
        nCn/79U+N0gHvZSDF6Sbv7/qFQ==
X-Google-Smtp-Source: ABdhPJw7r+7vc+q4TPMY5GZ9brVzqbykdJu2IQi2rOA0cUfkDo3q9RCyGNLPrPCk8B5CSQMWz1ELIQ==
X-Received: by 2002:a17:906:c05a:: with SMTP id bm26mr25655385ejb.288.1613560952758;
        Wed, 17 Feb 2021 03:22:32 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:22:32 -0800 (PST)
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
Subject: [PATCH v5 21/22] arm64: dts: sdm845-db845c: Configure regulators for camss node
Date:   Wed, 17 Feb 2021 12:21:21 +0100
Message-Id: <20210217112122.424236-22-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210217112122.424236-1-robert.foss@linaro.org>
References: <20210217112122.424236-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add regulator to camss device tree node.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
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

