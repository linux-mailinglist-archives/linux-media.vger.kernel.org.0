Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE19488773
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 03:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbiAICrK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jan 2022 21:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235110AbiAICrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jan 2022 21:47:07 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AE1C06173F
        for <linux-media@vger.kernel.org>; Sat,  8 Jan 2022 18:47:07 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id t28so12756010wrb.4
        for <linux-media@vger.kernel.org>; Sat, 08 Jan 2022 18:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cmFENN6DpfU2w2rL3CjvPLwaJNNz4VsyBwG74nM5M44=;
        b=uSL+uHtV4HrQKbov7nDQeCQNJfAIcN9NNwKyOkiCTOleMkaEr+UWWqVYobFifaBd6z
         ItS3s3caMI7fzEjXrapmY079qBxZw8OfDpaVPVu7uenXLQ3MggwbtbXgDYWIhEkll72P
         9yvX8C04eZUdlp5GHL7jdMHMcQf7hiwn/N0p5snX2IEctAXmoq0phGMA6YzSbTMlE1eN
         VfZumPChipNpzQPUxArhca3L+R5XpsYNWUMU1YVYWMnEFxBtmup5D5JBEgki1/iYfDb1
         c2B+hE9apOTZkFPtMe2/PqE6ACpCg5vVZ0hcCzhiglXGmXPxIGHxS5ogC+8EC7IEC1il
         cAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cmFENN6DpfU2w2rL3CjvPLwaJNNz4VsyBwG74nM5M44=;
        b=dSuMN97wvUzHb0blZAYsbTVBVcJpCR1MD2/WJ2aTA6tH+pAG1x3tBn6X57oX0j85oD
         EqGBqYPhzBb0WVyC2Zv3Woa6XFNaE7oyPcA4f25dPDsUmDtyem+nIt/YZUlbwN8V8T9I
         uBmukwYfrg+8VDu/L9hdwC69vndcvI+728GqHJTjYEgRPjXpuJiOwatkVgGw6bZl5ijC
         ISo/76mfMEViJNeZDtBmeRDUiV0j9czrhj6+lyFIssWzOVxHWLbWAHOSyz4O3LHLed75
         QijxIhHmPIBRz86VInTtpgTfdgIRSZBq9EecYbz5q74eyBOPn1+lR6/7pRqYFydDn+ll
         I4+A==
X-Gm-Message-State: AOAM532KZt6xU0EmizRhCNVnilDhdgJtTl6VBgJN99W9oJ36VRLnPiFb
        SHQ4te1mX9cVtBL/OVISIT4aFg==
X-Google-Smtp-Source: ABdhPJxm/PR6LZIeOJUJRa9GjNBcjPCHu5f/VeAWX3HFlTCsp8s6Jh/XDE6PRbEx2pGG+PqPeHBkZA==
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr38146609wri.609.1641696425698;
        Sat, 08 Jan 2022 18:47:05 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l13sm3341748wrs.73.2022.01.08.18.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 18:47:05 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 4/8] arm64: dts: qcom: sdm845: Add camss vdda-pll-supply
Date:   Sun,  9 Jan 2022 02:49:06 +0000
Message-Id: <20220109024910.2041763-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add in the missing vdda-pll-supply rail description.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c4db88dbf8766..f7bfd69b13620 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1116,6 +1116,7 @@ &cci {
 
 &camss {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
 
 	status = "ok";
 
-- 
2.33.0

