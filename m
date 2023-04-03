Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB8E6D4424
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 14:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbjDCMKI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 08:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbjDCMKH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 08:10:07 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD083CDFF
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 05:10:05 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so14246942wms.5
        for <linux-media@vger.kernel.org>; Mon, 03 Apr 2023 05:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680523804; x=1683115804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3h9tuOr6JWgycivSrwePgMI9fLggU++ogp3JJlwekuM=;
        b=Ldonav90nBh1616YRsdxhPv6dxm3tjI0TyqevM5C71NROE1+f07RUCPi5ycNj+GHGk
         Q6/YJm1PfOFtowSPxj1C/8xiell79PWxOxy3FUPXufexz5YZDqTU3e2bcvEnKo7+bA0O
         uGW0rDVa3+SW4Q1Pav551F6p7nW0S/euLM+vIMzJZnCnwag2bdgbIJzbUkGstPxgBNY2
         fjtPA8v+Utvd3Bj2FsC1EQMtzdlHFFJXX4E+XHQdlfcheGpRcyZIx8H64Ev8plOyo2FN
         9at35+zN3jYdyrbf7fEbDx0zDAYplYMI0CGS4T3UCJetkfpXpSPRUSY6FjnaUO/MUbHa
         No0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680523804; x=1683115804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3h9tuOr6JWgycivSrwePgMI9fLggU++ogp3JJlwekuM=;
        b=Cuu+GBjM5PEjvig2qi1N6sjrcO2XxM8OW1kVhXOCpi6+ifD4NfVu6zG3s7FpuNRI5o
         YhiPN5N/OInIJCDZ8vSHqRvWBfD0YTCXSoxs6vGDnS6dZsC16cX2JHkLTk97rpJogGKO
         XCUC8r0rryvoDOYtQbxe/aV9fegjIymyUlNmqAkyfhkfDL2SqSlURAD6uZYbqRakYkCh
         4XEqtAX+qlPbYnI8fjDVtTjghMU7V3qFw7+s4UEw9/V7g1UGD2jcAwxxN9ZBs/tEEyTy
         V26bfnB/SstkwDZODTxmEpSe7IPBO+d0HRYGg9l3wgs6U01I84+rnfLq2P/e18ryssIA
         TPQA==
X-Gm-Message-State: AO0yUKUEndyt8l64uinNeWSeoBBVFf21TKxB7eJecnA4lqHoUminIS3d
        4lDkLeKqaKsqTcEl+heoCEnPZw==
X-Google-Smtp-Source: AK7set+GLscsJ5anTgCzkBAFnPyzaTJlC4q23AzDCKfbfaDVJgBJueyPu00ruNY3x3mGH0uDYbCfyA==
X-Received: by 2002:a05:600c:ad0:b0:3ed:abb9:7515 with SMTP id c16-20020a05600c0ad000b003edabb97515mr27097645wmr.11.1680523804173;
        Mon, 03 Apr 2023 05:10:04 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id iv19-20020a05600c549300b003ef69873cf1sm19692751wmb.40.2023.04.03.05.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 05:10:03 -0700 (PDT)
Message-ID: <3bcfa144-68a0-736e-1927-df49ea50d9f5@linaro.org>
Date:   Mon, 3 Apr 2023 13:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Jigarkumar Zala <jzala@quicinc.com>,
        "todor.too@gmail.com" <todor.too@gmail.com>,
        "nicolas.dechesne@linaro.org" <nicolas.dechesne@linaro.org>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Chandan Gera <cgera@qti.qualcomm.com>,
        Guru Chinnabhandar <gchinnab@quicinc.com>,
        Alireza Yasan <ayasan@qti.qualcomm.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <662d68f7-6160-263d-6e4d-e3687d5cf8eb@quicinc.com>
 <7565d38c-d8f4-39e0-8547-fbb511f6d649@quicinc.com>
 <894e3ce6-0f2b-608b-ec4e-09083704f429@linaro.org>
 <8243cc42-236c-20e3-74dc-1f130ab1dcf6@quicinc.com>
 <BYAPR02MB557503013F05BF1EA1E1300CC28F9@BYAPR02MB5575.namprd02.prod.outlook.com>
 <f26174aa-a6ca-151c-2602-2f39b40bb7da@linaro.org>
 <7b3cb8a6-8306-f001-5701-af3b482421e9@quicinc.com>
 <d500c5bb-7aca-ae0d-f23e-495cd049e422@linaro.org>
 <d653be97-337f-dc09-786c-b13304c643fe@quicinc.com>
 <d26dfea3-8438-6012-386c-91ec43e1db1d@linaro.org>
 <bd8db6b5-eab6-418f-529f-03a9b81f99c4@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <bd8db6b5-eab6-418f-529f-03a9b81f99c4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/04/2023 12:01, Milen Mitkov (Consultant) wrote:
> Hi Bryan,
> 
> no, the iteration through the mask didn't go away? The print shows up 
> when the csid entity's source pad(s) enables the link to the ife sink 
> pad(s). Maybe the client (libcamera?) decides to disable this link for 
> some reason?
> 
> Regards,
> 
> Milen

So previously we had one CSI device in user-space and after your change 
we have one CSI device per VC, correct ?

---
bod
