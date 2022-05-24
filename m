Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F50532BDF
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 16:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238066AbiEXOCQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 10:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238072AbiEXOCO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 10:02:14 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E4F40A01
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 07:02:12 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id i9-20020a1c3b09000000b003974edd7c56so68033wma.2
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 07:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sqf3aADiltdClrrlBqK9iuPQhOsobmKVutlcvdUuPOw=;
        b=S0MSdkj1h7I6qxUoPqr6SjfQuxm44YfuMUZxpamDCVz4sbAhPsdCBA6h+4f1sPfyWe
         ereYc96/w2uTZ87XB0W7CMo2jbvCJDgBaig2/iqtb0fwjuwt0uoRq2PGZIFdcQFIPxKE
         aSmDsb/4p8vqBBzg3jAfQlUJRviSdd7HXblSzKcPjC6U/1JVCYvXyZ+3O2DQ9mlTcsiw
         grLGxshUn1RZi6Ck4bTP1FoVZQ4ePGIOMVNgNG5AE9DOjHe2dS4Omj8tCRKJcpEaqyld
         s/tJr+VLwcqxsvQUP7zrMEyQFh4j0qMI9cfJ38OlO8qLWMURvd59OjuYsjlz2bxFV+pY
         2V1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sqf3aADiltdClrrlBqK9iuPQhOsobmKVutlcvdUuPOw=;
        b=ehNlnu7n6NEyB3KrCbSQzXR3DlGA8/jrigrCzkAUA1IGQfmEP8sSBxs5XyYU2uOC0g
         v3m3HO2zprBPPgLW6dZKMhKoQB+GcBoOCafdUW6dTvumZ9JRI7quMhEF5GZ647X/apRM
         SznQJLp3YM0aw/YHMLdZroyBt8qXtMwqNGUELjfV89fVmTlHFk4sub928JGiiWO0XJnQ
         vzYnbeEqgPcfFLkqhymRKTsg97x4nR1X4JRpkAVV6ZE3CLO6YlByzY76JwbMwDWZ+IRR
         LPG8n70g/fyijCjP7AzWfK1y+yHSywJDoaZpDZFNNqFhKeONlj3tSNkpIMjvVO3WZJIV
         4COw==
X-Gm-Message-State: AOAM531qXuVVuTBHVV6NIZRE4O9FFfKjNPiGguqgP83zNujPakPfuUjS
        aQ/45b22KNUX49EFL2QQ10n/wg==
X-Google-Smtp-Source: ABdhPJwPcnsIpMdSgU4cMCyaF/GbDGQ7PpPRBQvG3CnmZnZqXdWwM4kHuKq7zxc5TbDhyMivPHo3/w==
X-Received: by 2002:a05:600c:209:b0:397:4a0f:7 with SMTP id 9-20020a05600c020900b003974a0f0007mr3883119wmi.91.1653400930565;
        Tue, 24 May 2022 07:02:10 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f9-20020adfc989000000b0020c5253d8e0sm12829030wrh.44.2022.05.24.07.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 07:02:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/4] Switch on IMX577 on RB5 with a new CCI fix
Date:   Tue, 24 May 2022 15:02:03 +0100
Message-Id: <20220524140207.2758605-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V2:

- Adds fix for bug identified by Vladimir
  The CCI i2c_adapter_add() and pm_runtime_enable() are racy.
  This is a generic problem not related to the rb5/imx577 but, for the sake
  of our conversation/review's context I'll add it into this series.
- Include Vladimir's camcc patch
  I've also opted to include Vladimir's disable of camcc to make the enable
  of it in my patchset logical.
- Move address/size cells Konrad
- Remove newline in pin definitions - Konrad
- Remove sensor 'status = "okay"' - Konrad
- Add comment to qrb5165-rb5.dts re: imx412 and imx577 difference - Konrad
- Move pin definitions to 8250 dtsi - Vladimir
- Drop power domain from sensor definition - Vladimir
- Correct to "add to cam2" not "cam1" in commit log - bod

To make verification of the CCI race eaiser I've provided a defconfig both
with and without modules enabled.

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-24-05-22%2bimx577-rb5
Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-24-05-22%2bimx577-rb5-compiled-in

git diff linaro/linux-next-22-05-22+imx577-rb5 linaro/linux-next-24-05-22+imx577-rb5

V1:
Linux-next now has everything we need to switch on this sensor both in the
qcom DTS and in the imx412 driver.

After this, no further dts or driver work is required to capture images on
the RB5.

Here's a bootable linux-next with a kernel config. I added Vladimir's
power-domain changes on-top to verify nothing breaks for me.

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-18-05-22%2bimx577-rb5

Bryan O'Donoghue (3):
  i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapter
  arm64: dts: qcom: sm8250: camss: Define ports address/size cells
  arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on cam2

Vladimir Zapolskiy (1):
  arm64: dts: qcom: sm8250: Disable camcc by default

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 60 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 39 +++++++++++++++
 drivers/i2c/busses/i2c-qcom-cci.c        | 14 ++++--
 3 files changed, 108 insertions(+), 5 deletions(-)

-- 
2.36.1

