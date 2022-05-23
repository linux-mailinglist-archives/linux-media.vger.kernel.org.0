Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1AC9530FC9
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 15:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbiEWMkB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 08:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235592AbiEWMkA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 08:40:00 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1A25044A
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 05:39:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id j10so1879985lfe.12
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 05:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EOL04jP+eE7dVuOg6hEIwWWUW4POczWVTnduH9YcGb0=;
        b=dscp7lxuXzvAvazXh3XQfmCEddLWn7+ErSWIbZNaa9GV1Dqom5OGQotT1L1vQ40DAr
         tV+QngMbMinXVaEpFNFUwkuuQcHqPmOWlLg935FyQ/pv365F2DT7ldFDo1cIQOxQIB5k
         jckxpnwO24VrNYVA7QT9OXE57kv4eu9UXkgvrGE6GMG/k5lxqdMm8sI8hSZO41JxGR4y
         RDJ4BjpOB5ZZjxx4tISidy3rFFT8CWdujpKaOe/4HyFBGpSNOAxpJSlHIEy4wMrU/Ete
         /af8YceSz7WRPilhyxLJ5wX0AMt/U++FV4rz6xF4S/2CWIxSJFJ87TE4pDyhah0hbz6l
         J+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EOL04jP+eE7dVuOg6hEIwWWUW4POczWVTnduH9YcGb0=;
        b=MxGQF5eMNs8eWtDDMrzEb745nKSAAGHRigwuLvqpS4twRgAcjpx6eDGygJgGOYxzrd
         6UpZZLW/WiEUz60YrRTtPadv5SCDHf49fImQb0vJ0e3BZTIron3TfuPTL10o7g0jIt3x
         owGgeY9KruO0k2ZruCJImUL47QRBKz2+VBouZ3yqpinT6sQ4YU4vTt5h7VHTv/17VYaa
         ygjradU0TB+oIgJPRkKbc3j1s6wcBPc4sBDKrvwHTtgbBIm4WcCy2cxCMKd3G4PXae7S
         HpbgxHa4oUaWX8iOGGVMxKyhAosgiVUa4k9RF/iEsM+EvQ1XDX2xqmdt8F62Tu+OGg0o
         uxXQ==
X-Gm-Message-State: AOAM532I7DxJCDYUoC5FVrijiOB94szpuq7iXwpcJYCrlWeSIYyTDeo8
        VPBaStEvghLpfZ7CQp9OuQj+dw==
X-Google-Smtp-Source: ABdhPJwo0PC3SioId0jNkNXBGwmBVrE8rg9qaxlN6Ax4/CUHq/r3fHvRNB3t0H78ZX4YRjchIypaWA==
X-Received: by 2002:a05:6512:3b93:b0:474:188b:1c99 with SMTP id g19-20020a0565123b9300b00474188b1c99mr16289628lfv.549.1653309594979;
        Mon, 23 May 2022 05:39:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b23-20020ac25637000000b00477b11144e9sm1959703lff.66.2022.05.23.05.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 05:39:54 -0700 (PDT)
Message-ID: <638d6986-616f-4a1c-f1d0-82835b000b2a@linaro.org>
Date:   Mon, 23 May 2022 15:39:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH 00/14] CAMSS support for MSM8974
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
References: <20220522162802.208275-1-luca@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220522162802.208275-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/05/2022 19:27, Luca Weiss wrote:
> This RFC series adds support for CAMSS and CCI that are found on
> msm8974, including the OV8865 found on the FP2.
> 
> The only reason it's marked RFC is that CAMSS doesn't behave properly on
> this SoC without the last commit which is obviously not upstreamable.
> Not sure if this should be a blocker for including most of the other
> patches because other than that it seems to work fine and I can get a
> picture from the camera sensor. When/if msm8974 gets IOMMU support I
> hope this should be resolved and it works without this hack.
> 
> I think at least the CCI patches could get applied as they're not
> dependent on the CAMSS hack?

I'd also vote for the camcc patches to be applied.

As for the camss, I'd suggest to get them verified to work properly with 
a hacked/non-upstreamable/etc. IOMMU driver if one exists. Otherwise we 
can easily get into a situation where we merge up code that contains 
bugs itself.

Another option might be to actually check whether the device has an 
IOMMU attached (see device_iommu_mapped()) and to select whether the 
driver should use SG or CONTIG depending on that.

As an additional note regarding the offset issue you've mentioned. It 
looks like there is an issue with the swiotlb. On the IFC6410 (apq8064, 
no IOMMU) I got an issue with the PCI-attached networking card. Received 
packets are offset by 4 (IIRC) bytes. The same type of adapter works on 
db820c (apq8096, working IOMMU). What kind of issues did you observe 
with the camss? If it looks like the issue I had, it might be a symptom 
of a more generic issue.

> 
> Luca Weiss (5):
>    dt-bindings: i2c: qcom-cci: add QCOM MSM8974 compatible
>    ARM: dts: qcom: msm8974: add CCI bus
>    ARM: dts: qcom: msm8974: add CAMSS node
>    ARM: dts: qcom: msm8974-FP2: Add OV8865 rear camera
>    [DNM] media: camss: hacks for MSM8974
> 
> Matti Lehtimäki (9):
>    media: dt-bindings: media: camss: Add qcom,msm8974-camss binding
>    media: camss: Add CAMSS_8x74 camss version
>    media: camss: vfe: Add support for 8x74
>    media: camss: video: Add support for 8x74
>    media: camss: csid: Add support for 8x74
>    media: camss: ispif: Add support for 8x74
>    media: camss: csiphy: Add support for 8x74
>    media: camss: Add 8x74 resources
>    i2c: qcom-cci: add msm8974 compatible
> 
>   .../devicetree/bindings/i2c/i2c-qcom-cci.txt  |   7 +-
>   .../bindings/media/qcom,msm8974-camss.yaml    | 321 ++++++++++++++++++
>   arch/arm/boot/dts/qcom-msm8974.dtsi           | 184 ++++++++++
>   .../dts/qcom-msm8974pro-fairphone-fp2.dts     |  70 ++++
>   drivers/i2c/busses/i2c-qcom-cci.c             |  35 ++
>   drivers/media/platform/qcom/camss/Kconfig     |   4 +-
>   .../media/platform/qcom/camss/camss-csid.c    |   3 +-
>   .../media/platform/qcom/camss/camss-csiphy.c  |   4 +-
>   .../media/platform/qcom/camss/camss-ispif.c   |   5 +-
>   drivers/media/platform/qcom/camss/camss-vfe.c |   7 +-
>   .../media/platform/qcom/camss/camss-video.c   |  17 +-
>   drivers/media/platform/qcom/camss/camss.c     | 161 +++++++++
>   drivers/media/platform/qcom/camss/camss.h     |   1 +
>   13 files changed, 801 insertions(+), 18 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml
> 


-- 
With best wishes
Dmitry
