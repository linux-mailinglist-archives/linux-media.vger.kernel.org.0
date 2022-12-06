Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84D84644B33
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 19:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbiLFSU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 13:20:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbiLFSTv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 13:19:51 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D312513DE3;
        Tue,  6 Dec 2022 10:19:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 1F660CE198B;
        Tue,  6 Dec 2022 18:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F18C43149;
        Tue,  6 Dec 2022 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670350787;
        bh=M0wHeZolpHobaLLOhyylwlObJxvye0zC49cllR32lps=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AstvDeo9PrNKgEK8wRtzezuJp4etUxY2ksi2TDgQfrQtqSthzYUEZifK7pDtu/cU0
         ZlqBi5tukcYxTryLtYUjOpV1wyNsx1FQqF1GyJ+gaNK2cD8QGP6EfILIeEwdhBIvsE
         /NjrBx7P0AwAnGqGJ9aFWSk83a2tm1idCY4M+DBVsUQsjQs27+IxFBfWqD6GrBCYkS
         vzcnyoD8mCzzAlpoFbg97N7BtHoEAimwhBieoULhCI6wO1Qv8qeAGVw6e5JnOG35Z1
         /uex8aoMlKXEkksq0oxiRFzIVkiYp8ix6zeGwQ42umbGFn1x3VFHOfpzkKeU7T1L5r
         7zyEQai1t8aPg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     robert.foss@linaro.org, vladimir.zapolskiy@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@somainline.org,
        bryan.odonoghue@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        todor.too@gmail.com, dmitry.baryshkov@linaro.org,
        agross@kernel.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        linux-arm-msm@vger.kernel.org, quic_mmitkov@quicinc.com,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v7 0/7] CAMSS fixes for rb3, switch on IMX577 for RB5
Date:   Tue,  6 Dec 2022 12:18:51 -0600
Message-Id: <167035076341.3155086.4547946796844422301.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221117003232.589734-1-bryan.odonoghue@linaro.org>
References: <20221117003232.589734-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 17 Nov 2022 00:32:25 +0000, Bryan O'Donoghue wrote:
> V7:
> - Adds further RB from Konrad
> - Moves status="okay" below regulator declarations in qrb5165::camss - Konrad
> 
> Previous
> https://lore.kernel.org/linux-arm-msm/20221116162801.546737-1-bryan.odonoghue@linaro.org/T/#t
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: qcom: sdm845: Define the number of available ports
      commit: 0ddcea2f7692388f8eb1ce0f6804cb649bc76220
[2/7] arm64: dts: qcom: sdm845-db845c: Drop redundant address-cells, size-cells declaration
      commit: dacfbacc882ad3b1ce6ab2974386665db1976a61
[3/7] arm64: dts: qcom: sdm845-db845c: Drop redundant reg = in port
      commit: 693c65e2bdbfecedc126904de663334f0f5031f9
[4/7] arm64: dts: qcom: sdm845-db845c: Use okay not ok, disabled not disable for status
      commit: 5ceaa402f45c8fd19500c69bd9eb4385a14a5173
[5/7] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
      commit: 64cb4a44720143a94a261ce2b3098498d6dc84d6
[6/7] arm64: dts: qcom: sm8250: camss: Define ports and ports address/size cells
      commit: 3c5aa4c758dd4a41119158dff2ab358b9b5cd520
[7/7] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add vision mezzanine
      commit: 16b24fe54f0050843509321094d99f75fba33f59

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
