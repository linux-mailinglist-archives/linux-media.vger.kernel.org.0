Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2E6E62C4A1
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238879AbiKPQgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:36:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbiKPQfi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:35:38 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E475B5B594
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:10 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso1852723wmo.1
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2yrtDb+E17YJ14nztoAekcY9mfRuwg5HacrFZ02FDk=;
        b=jA4Ylm6B/fsZ0yagjS+EpEJam9Jqty62n37wWr2ZLhA4LBp55sBVUTU9toRdeNaI2X
         yW6UZR0tP+0eHhyQvgEwVoC53cAKGy0GOc09P+s3sT0SKaREHNQiLv/ib3bChue0B86s
         G6a1eEwrUipac0ZVlUPEO72ewXHHWi+eswDCnaWd7Tf2oJ0kUgna/6z0pk7CkzXntObu
         s0ACcbuqr1CTe/8a99baXoQzPxUGyVPSAcc4wQz6fEUNvrFnX0JZTMlz0bZhpGVl4WMZ
         bUCF6PUrxoNnFufsVHjfbax52Y5bDgUohumuGVOd9jfz3cwcg+WOnuCbDsT4OQKIb9lD
         kx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2yrtDb+E17YJ14nztoAekcY9mfRuwg5HacrFZ02FDk=;
        b=XFaBk+RzYRuNs7/jWlTRq3MFk5m39S+V3uufrYHqU+fWZSTQ6evMwS/2kcHtQtZ4es
         x+7/oocMb1NXDKBlZDyZDnAlIf1M6VZc+QbBve2CMZlwLathxywpINfqIIhHrG0CbZVI
         JJgnHNqU2hugNw6TeeU1P2nPReQy7aoqMwU962Jc+IZF7X8JmCOh+lRKv69iBuwD8Rux
         HkCcOhWsWwPBVwCEGiR9h59Uqem+DW4IZgluXjMxYvKmRKcOZMtPBVVDjt08+T+Lt9V/
         JxdOG+yqUWDDg8wwtAPJnl141NiFtjHjK4gJmUHiNngIavFaXkk1gXZvpdFaMKiRM/q9
         rWsw==
X-Gm-Message-State: ANoB5pmZT+gevmCzUJsmr1Z1Dj4sBFwJhb2+pt2lV0SI3E4fmMp+rCvA
        g4pOm1MEWSBn37PPRoop7F90zw==
X-Google-Smtp-Source: AA0mqf7FLQ7pGi8n1zk4Lo6Yj0DBywiEf3DnPj/vIyssyMQY+nvUaMwGePb0HuzYWVGIKN4x/RBEHA==
X-Received: by 2002:a05:600c:3ac4:b0:3cf:77b7:61e6 with SMTP id d4-20020a05600c3ac400b003cf77b761e6mr2633072wms.162.1668616089540;
        Wed, 16 Nov 2022 08:28:09 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s3-20020adfecc3000000b0022e653f5abbsm15459168wro.69.2022.11.16.08.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:28:09 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 3/7] arm64: dts: qcom: sdm845-db845c: Drop redundant reg = in port
Date:   Wed, 16 Nov 2022 16:27:57 +0000
Message-Id: <20221116162801.546737-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The reg for the port is specified in the dtsi. Remove from the db845c dts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 7c88312333c22..8a98f3e86b41d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1186,7 +1186,6 @@ &camss {
 
 	ports {
 		port@0 {
-			reg = <0>;
 			csiphy0_ep: endpoint {
 				data-lanes = <0 1 2 3>;
 				remote-endpoint = <&ov8856_ep>;
-- 
2.34.1

