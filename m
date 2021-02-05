Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA943109AA
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 11:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbhBEK6N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 05:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbhBEKzI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 05:55:08 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354B5C03E933
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 02:45:30 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l12so5631300wmq.2
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 02:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rtnlfnM1gUAXVxSsCOu/wsiGW/5dkOKL2/2b79ivYgU=;
        b=AMjieip+i8IyHf+fHPKCAqXPvt2zmy6t8q3fKSH337KjeyhgBkoERmTqMjRhO7jR2Y
         7NQ+gwbxnrLSOCbAGfyQhMdy5gIl32oxauYqb2b3tJYUOTy8FnqPgJ6/+Z85+L2sNoV2
         +djNzR/IETaH5kGTzVjgFMInmKUC23fdVCzqwjEELq4ZupZFDBqS35gak0FWbNFQV0H1
         9m2OFmOyhpjF5sRXvE42uXmKz7asU/xNGQzjFleTaOE9YW35S6d7yBMRZkdy28lt3gUC
         ZdwIiExQaqBgKlJ4Mrg+R3sG40lBKX2d+yQsAFtshEdpQKyVPXQZHp/nSS+qKUL3wWpc
         /ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rtnlfnM1gUAXVxSsCOu/wsiGW/5dkOKL2/2b79ivYgU=;
        b=Gddci7/NsteKRVxUpD6DQkUD2rLVQVcZSDfMnXsgP/7qBgkgkuT3yz7/X0gFnk7TY4
         ZomPP6VXlnfYGKHlkGeU5Ny+vHUu7ep0tIiKL452fcV/wq3yAQLIbgPndkwhA64/7xTq
         q7jGPgMDODXxY1scpgzhXT40Yk+SAFOdJOG82ihZBOZuJND0kZz8QEUg7nd383XsKHyW
         hHrt+NpGEESDx4S9Cx2s2tUO5k2b3u/eYNXztmJdVebZjdXDQfpvcpCB/e9n9YUAffHv
         nU521Fw3WWMgIxdXwUVAxyJT2+SO4CWp9U3ZtdrgrzDobsUR+kXrRj1Nzn6ltF5NUKMy
         OFSg==
X-Gm-Message-State: AOAM533J49587HPeJ9fiBOSoCjMolJqFz56bH/g5HA5WWqWhl1NIZG67
        SZvvK/Jok/0txoMQv1dQzqk6DQ==
X-Google-Smtp-Source: ABdhPJyPmX9Sl9XA4LzpOD16JxKn1WN7DDMPq7VRg5MRcd9VexeiXGL4nCIJqznXMqqPJ9kcyoHrXw==
X-Received: by 2002:a7b:c305:: with SMTP id k5mr2989205wmj.57.1612521928986;
        Fri, 05 Feb 2021 02:45:28 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:38fd:e0db:ea01:afc8])
        by smtp.gmail.com with ESMTPSA id u4sm11300233wrr.37.2021.02.05.02.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:45:28 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v4 21/22] arm64: dts: sdm845-db845c: Configure regulators for camss node
Date:   Fri,  5 Feb 2021 11:44:13 +0100
Message-Id: <20210205104414.299732-22-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210205104414.299732-1-robert.foss@linaro.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
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

