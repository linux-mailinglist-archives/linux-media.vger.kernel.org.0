Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9918B6E8637
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 02:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjDTALx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 20:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjDTALw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 20:11:52 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B745591
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 17:11:49 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id c3so891256ljf.7
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 17:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681949508; x=1684541508;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UaA/GXEsilxt3oqcp2WCVS1XIYlgc1e5DDFfgLogt5A=;
        b=Z7M2BDMtI34gQvLhMYthqzSAZ6C+TacaScMAdkLLklM4Ufo4g6O6+Oo7Bjyezjm6tb
         7U088RlAHQVKR5dCY+HJJFkdoXaSbad6dFtYPObqhFa87gUtn1LWKgVKz0ENTOYCxSVl
         XnNT8v/vtrkER4C4ENYKpUqImc+q8wmzcFE05a+CTcrjTkCOp069oGUzyRtV6Tivp024
         /fLjj2kpdWQo3xeRc2BL1fjbetXZHNVlIjJQLQOX8nBfGm9cQECEPPP4P/sCvLs1o8bM
         jtxw25GDVpoUe46tDQ1Swc1y5bQ5VIKTxHhiYXh7BtMyWrvP9OwM9h2KE3ojqZ/fZBqW
         WLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681949508; x=1684541508;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UaA/GXEsilxt3oqcp2WCVS1XIYlgc1e5DDFfgLogt5A=;
        b=h8Q3wuQLbGmfyR0scNmnJ6w1EuKQiZzKGZ0d+k2xoPysx6vW8O+28gQSM74TJ2zMfC
         9zrSMK9HyJ2uN/tYD2repYSV0BvNLFBffZUfbzV17cnHAwURkua8077Wl2pCPdYd1OJo
         L9q41pEEdCvTGtDyCdtfo2u/KZ/3zplBZRqp28SqqCn+50J/ctO6q+Rr+yteRIYPReKm
         lwa1XM//7ciHwnWInMxqyjUiuuqRMLreSepfhgiTk9QPIU5t6ZNXqkzbNfScCA15dd3x
         i2lZUtf6bfDc8XmQ9ZZ/hPoZq0JnwJq/Sho0JWB07iRR7gWvw49hv+dxkNYZjoam0nSr
         wWxA==
X-Gm-Message-State: AAQBX9cypL3km0mORspise8dHxmWaNowMuODieK/Hk22fmfMjxm3H5o/
        81cOiRkL+PVj30m/dMbNi3fRKQ==
X-Google-Smtp-Source: AKy350blpndS7SwTg/Em2EjhX0F0jbNk07EW4I0IzvLd8TdKhUSBj+AlwwuZ0gB2YX2PsBcnufD3DQ==
X-Received: by 2002:a2e:3018:0:b0:2a8:ad69:286 with SMTP id w24-20020a2e3018000000b002a8ad690286mr2503331ljw.17.1681949507838;
        Wed, 19 Apr 2023 17:11:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id i23-20020a2e9417000000b002a76bb6bce0sm6312ljh.37.2023.04.19.17.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 17:11:47 -0700 (PDT)
Message-ID: <639b264b-08e5-b84e-1933-ed768b6d1512@linaro.org>
Date:   Thu, 20 Apr 2023 03:11:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/4] drm/msm: add some cec register bitfield details
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Arnaud Vrac <avrac@freebox.fr>,
        Rob Clark <robdclark@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-1-176479fb2fce@freebox.fr>
 <9d7f81fc-945e-9704-4eb2-d2e5cb31297e@linaro.org>
 <5797c537-fe70-27be-ef1d-f4c8b19806f5@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5797c537-fe70-27be-ef1d-f4c8b19806f5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2023 03:10, Abhinav Kumar wrote:
> 
> 
> On 4/19/2023 4:53 PM, Dmitry Baryshkov wrote:
>> On 18/04/2023 21:10, Arnaud Vrac wrote:
>>> The register names and bitfields were determined from the downstream
>>> msm-4.4 driver.
>>>
>>> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
>>> ---
>>>   drivers/gpu/drm/msm/hdmi/hdmi.xml.h | 62 
>>> ++++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 61 insertions(+), 1 deletion(-)
>>
>> I have opened MR against Mesa at 
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22588.
>>
>> The patch is:
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Minor nit below
>>
> 
> Also, shouldnt the register updates be done using rnn tool instead of 
> manual edits?

We usually update the rnn and ask Rob to pull it at the beginning of the 
cycle.

> 
>>>
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h 
>>> b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>>> index 973b460486a5a..b4dd6e8cba6b7 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>>> @@ -76,6 +76,13 @@ enum hdmi_acr_cts {
>>>       ACR_48 = 3,
>>>   };
>>> +enum hdmi_cec_tx_status {
>>> +    CEC_TX_OK = 0,
>>> +    CEC_TX_NACK = 1,
>>> +    CEC_TX_ARB_LOSS = 2,
>>> +    CEC_TX_MAX_RETRIES = 3,
>>> +};
>>> +
>>>   #define REG_HDMI_CTRL                        0x00000000
>>>   #define HDMI_CTRL_ENABLE                    0x00000001
>>>   #define HDMI_CTRL_HDMI                        0x00000002
>>> @@ -476,20 +483,73 @@ static inline uint32_t 
>>> HDMI_DDC_REF_REFTIMER(uint32_t val)
>>>   #define REG_HDMI_HDCP_SW_LOWER_AKSV                0x00000288
>>>   #define REG_HDMI_CEC_CTRL                    0x0000028c
>>> +#define HDMI_CEC_CTRL_ENABLE                    0x00000001
>>> +#define HDMI_CEC_CTRL_SEND_TRIGGER                0x00000002
>>> +#define HDMI_CEC_CTRL_FRAME_SIZE__MASK                0x000001f0
>>> +#define HDMI_CEC_CTRL_FRAME_SIZE__SHIFT                4
>>> +static inline uint32_t HDMI_CEC_CTRL_FRAME_SIZE(uint32_t val)
>>> +{
>>> +    return ((val) << HDMI_CEC_CTRL_FRAME_SIZE__SHIFT) & 
>>> HDMI_CEC_CTRL_FRAME_SIZE__MASK;
>>> +}
>>> +#define HDMI_CEC_CTRL_LINE_OE                    0x00000200
>>>   #define REG_HDMI_CEC_WR_DATA                    0x00000290
>>> +#define HDMI_CEC_WR_DATA_BROADCAST                0x00000001
>>> +#define HDMI_CEC_WR_DATA_DATA__MASK                0x0000ff00
>>> +#define HDMI_CEC_WR_DATA_DATA__SHIFT                8
>>> +static inline uint32_t HDMI_CEC_WR_DATA_DATA(uint32_t val)
>>> +{
>>> +    return ((val) << HDMI_CEC_WR_DATA_DATA__SHIFT) & 
>>> HDMI_CEC_WR_DATA_DATA__MASK;
>>> +}
>>> -#define REG_HDMI_CEC_CEC_RETRANSMIT                0x00000294
>>> +#define REG_HDMI_CEC_RETRANSMIT                    0x00000294
>>> +#define HDMI_CEC_RETRANSMIT_ENABLE                0x00000001
>>> +#define HDMI_CEC_RETRANSMIT_COUNT__MASK                0x000000fe
>>> +#define HDMI_CEC_RETRANSMIT_COUNT__SHIFT            1
>>> +static inline uint32_t HDMI_CEC_RETRANSMIT_COUNT(uint32_t val)
>>> +{
>>> +    return ((val) << HDMI_CEC_RETRANSMIT_COUNT__SHIFT) & 
>>> HDMI_CEC_RETRANSMIT_COUNT__MASK;
>>> +}
>>>   #define REG_HDMI_CEC_STATUS                    0x00000298
>>> +#define HDMI_CEC_STATUS_BUSY                    0x00000001
>>> +#define HDMI_CEC_STATUS_TX_FRAME_DONE                0x00000008
>>> +#define HDMI_CEC_STATUS_TX_STATUS__MASK                0x000000f0
>>> +#define HDMI_CEC_STATUS_TX_STATUS__SHIFT            4
>>> +static inline uint32_t HDMI_CEC_STATUS_TX_STATUS(enum 
>>> hdmi_cec_tx_status val)
>>> +{
>>> +    return ((val) << HDMI_CEC_STATUS_TX_STATUS__SHIFT) & 
>>> HDMI_CEC_STATUS_TX_STATUS__MASK;
>>> +}
>>>   #define REG_HDMI_CEC_INT                    0x0000029c
>>> +#define HDMI_CEC_INT_TX_DONE                    0x00000001
>>> +#define HDMI_CEC_INT_TX_DONE_MASK                0x00000002
>>> +#define HDMI_CEC_INT_TX_ERROR                    0x00000004
>>> +#define HDMI_CEC_INT_TX_ERROR_MASK                0x00000008
>>> +#define HDMI_CEC_INT_MONITOR                    0x00000010
>>> +#define HDMI_CEC_INT_MONITOR_MASK                0x00000020
>>> +#define HDMI_CEC_INT_RX_DONE                    0x00000040
>>> +#define HDMI_CEC_INT_RX_DONE_MASK                0x00000080
>>>   #define REG_HDMI_CEC_ADDR                    0x000002a0
>>>   #define REG_HDMI_CEC_TIME                    0x000002a4
>>> +#define HDMI_CEC_TIME_ENABLE                    0x00000001
>>> +#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK            0x0000ff80
>>> +#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT            7
>>> +static inline uint32_t HDMI_CEC_TIME_SIGNAL_FREE_TIME(uint32_t val)
>>> +{
>>> +    return ((val) << HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT) & 
>>> HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK;
>>> +}
>>>   #define REG_HDMI_CEC_REFTIMER                    0x000002a8
>>> +#define HDMI_CEC_REFTIMER_ENABLE                0x00010000
>>
>> I think this should come after the REFTIMER field.
>>
>>> +#define HDMI_CEC_REFTIMER_REFTIMER__MASK            0x0000ffff
>>> +#define HDMI_CEC_REFTIMER_REFTIMER__SHIFT            0
>>> +static inline uint32_t HDMI_CEC_REFTIMER_REFTIMER(uint32_t val)
>>> +{
>>> +    return ((val) << HDMI_CEC_REFTIMER_REFTIMER__SHIFT) & 
>>> HDMI_CEC_REFTIMER_REFTIMER__MASK;
>>> +}
>>>   #define REG_HDMI_CEC_RD_DATA                    0x000002ac
>>>
>>

-- 
With best wishes
Dmitry

