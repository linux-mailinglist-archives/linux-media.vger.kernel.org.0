Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 149A67B2E4D
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 10:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbjI2Iok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 04:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbjI2IoN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 04:44:13 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5AB910F7
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 01:44:06 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-405361bb9cdso141367865e9.0
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695977045; x=1696581845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b6Qp6y9nYtGfWeIZZkb4YL1o7pvTbfFEpaXOlB4gSy4=;
        b=Fji4YadnkHqXTKx9dVJVTK2taQY5IfSMYPmyG7Eazl8meAleJBsSLRWkJ5e50ew56w
         MB74PJtqSb4ZrUp90yJPsoQGHhTzmSYL41zQk+UiRiybHFRcTUv0w8YLNaqq2VXYzCBi
         m9ZkYGf1eq/+eUcbiU80gyz7If0OnPlS/8aP0oZsH3RzVFEqCDfZO+Bg2iIrj8LF3ufd
         Dw6BTn3v3GtaM1KBPRzDaI+8Oab4CGZvbe4kYKrnsIDvdYNYyNRbWWIObeYnGRuEzfho
         /GkF1tE7y+P99ha8n7cuWSya3feMwgllVxiCYoUHPxVGdwhZU5PIWU1GrNhMORbsAOkn
         UsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695977045; x=1696581845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6Qp6y9nYtGfWeIZZkb4YL1o7pvTbfFEpaXOlB4gSy4=;
        b=agRTb60sfbx+hijyPD4vfyEH0xYeqHFBWanMGlVoLtvR3viJMGklQJ+iiRDpEolB3I
         Bk5V2rC01AQrjiHlA+SDOeyGwYjM93y7LXFwwebNYUKeri+Szh98C2oZVF/09Iar/IQL
         MXBfhuyb/jVPbCZalo293y7fZTJgRlI13S9jVSXrKA+V1DBrROvEW/tX/3PfR4FI4rAv
         64QOs4JxCis3RGJPd9JDTZWn256Ve1FWN4u832yaCy+CQ4YL8r9QYSZZ7fIEt8GfS7ee
         tEln/4qkt1q9VUrpga60O4PUhbQUrux71yFQ0HkS0QN/Zp7zCH45V1JtcWMhFQYhPXNx
         zorg==
X-Gm-Message-State: AOJu0Yy9ah1gqLN+Qm1aozXk+CUoaqsamBCngCdDS9Aqdx8oPzbD9YpS
        mXKHO7sh1EVNY2IH+RBpJ+t9ag==
X-Google-Smtp-Source: AGHT+IHUEB1LQYQGWJ4qw3MkH7TU+QOAa6gnK1NDNZI1/qGzE2+ETeE+sqUe+xgafIdK1bdFgFk5cQ==
X-Received: by 2002:adf:fe42:0:b0:317:5747:b955 with SMTP id m2-20020adffe42000000b003175747b955mr3131037wrs.17.1695977045118;
        Fri, 29 Sep 2023 01:44:05 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d4a8b000000b0031ffb51f6f9sm21113634wrq.30.2023.09.29.01.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 01:44:04 -0700 (PDT)
Message-ID: <686dc4d4-778b-4fd6-93e9-e25fd71fc75a@linaro.org>
Date:   Fri, 29 Sep 2023 09:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable venus
 node
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com>
 <20230929-sc7280-venus-pas-v1-3-9c6738cf157a@fairphone.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230929-sc7280-venus-pas-v1-3-9c6738cf157a@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/09/2023 09:38, Luca Weiss wrote:
> Enable the venus node so that the video encoder/decoder will start
> working.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 2de0b8c26c35..d29f10f822c9 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -665,3 +665,8 @@ &usb_1_qmpphy {
>   
>   	status = "okay";
>   };
> +
> +&venus {
> +	firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
> +	status = "okay";
> +};
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
