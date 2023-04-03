Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C472A6D3FFD
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 11:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbjDCJQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 05:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbjDCJQj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 05:16:39 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC26C10A81
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 02:16:12 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id l12so28539442wrm.10
        for <linux-media@vger.kernel.org>; Mon, 03 Apr 2023 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680513369; x=1683105369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CgiUgoMbQalvGxGNUyeqmJVel41Q5UZD43id4O4KUIY=;
        b=LTlww1TaDWlvt+fItUXvrutapoP2NQDnuv5sTlH3l1Z6LKKkWUVtSK82i1HzEnibae
         rrEq6W3DbMT/CrBpbtIQOKzEelBUt5rsULWEpcNleiz8JcPiFvZlcn+0cLXBGXNAKuWb
         lCR43Eb9tMjwTvuv8VUH+p4MtR6ZSAXhns+enhWX/75s1CUh/kou2y22qhOpBRPUT+3m
         LqadmCxQv4jCJc5QMrAye3JFZdf2YJZPlKHND0R7DUs3R/9TLc8CoKkKNT2g24pJYQTG
         8k4voHY8zdz7c6BMRi+X8nRRAAALNlmKdJdr4P0emhMZXYggK1PGjbCZW1nAQVRzpENa
         AHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680513369; x=1683105369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CgiUgoMbQalvGxGNUyeqmJVel41Q5UZD43id4O4KUIY=;
        b=GS0+mY+dKZgqASBkfEBgpdM406sjDq2nhpK+HATIBWYSSoUQjDhp4frBiAEB8kaO0N
         dAFd3XOSB54jXD6T8HmwNquGIQ/JxRnfYzsQokHM2FNuvqmr48d7Rjb05ut/tixTR0eH
         ERZsTEqIqbu+hmItE3LANydruXhUCoI7ZBzfukk2NBjT5PAEJt/+648Ku9CMV8J+k/5N
         F2uMx1szG1Rna18HmFTwQ1p8J7+Trd9IIRxsFXVB4O4xKEA8N0XDEo6JLS0gV8vd7e3r
         itA5CGW23wfkW0tU7zhG50Q8JRpwMnXk/lunUTP3+cBdGr9WUp5VDxvTDsPewEaX7Oqs
         6SrQ==
X-Gm-Message-State: AAQBX9dIGYw6GegoaYhnhMaFZwbkG/EFitbuCSdkHiPjYt/n5dX0JNuW
        hN3495MThcV5u6fvbzkJbl1AXg==
X-Google-Smtp-Source: AKy350Z1ox3GvJMY5UNjXwR984hUj4F7ACc0TaiFWN+DZooA/dwB9mBqLcPN16f8mNEzC2CYdpYY3A==
X-Received: by 2002:a5d:4603:0:b0:2d0:8ed9:5ab4 with SMTP id t3-20020a5d4603000000b002d08ed95ab4mr27601427wrq.60.1680513369587;
        Mon, 03 Apr 2023 02:16:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m17-20020adfe0d1000000b002d1e49cff35sm9227233wri.40.2023.04.03.02.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:16:09 -0700 (PDT)
Message-ID: <d500c5bb-7aca-ae0d-f23e-495cd049e422@linaro.org>
Date:   Mon, 3 Apr 2023 10:16:07 +0100
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
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7b3cb8a6-8306-f001-5701-af3b482421e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/04/2023 09:38, Milen Mitkov (Consultant) wrote:
> On 31/03/2023 11:07, Bryan O'Donoghue wrote:
>> On 31/03/2023 07:20, Azam Sadiq Pasha Kapatrala Syed wrote:
>>> + Nico (Linaro)
>>> Hi Team
>>>
>>> Would like to know if anything is pending form our end as we want to 
>>> get the patches mainlined?
>>>
>>> Thanks,
>>> Azam
>>
>> I'd like to get a clearer picture on this
>>
>> [   90.535909] qcom-camss ac6a000.camss: VFE HW Version = 2.0.1
>> [   90.545756] qcom-camss ac6a000.camss: CSIPHY 3PH HW Version = 
>> 0x40010000
>> [   90.546358] qcom-camss ac6a000.camss: CSID HW Version = 2.0.1
>> [   90.546365] qcom-camss ac6a000.camss: csid_link_setup: Enabled CSID 
>> virtual channels mask 0x1
>> [   90.547675] qcom-camss ac6a000.camss: csid_link_setup: Enabled CSID 
>> virtual channels mask 0x0
>>
>> Using the IMX577 sensor on the RB5 we get his pretty odd virtual 
>> channels mask.
>>
>> If userspace is sending this in, the question I have is why. Surely 
>> with a sensor that doesn't have a VC there should be no impact on 
>> user-space.
>>
>> ---
>> bod
> 
> Hey Bryan,
> 
> what media-ctl commands are you using? I can't recreate this on my side. 
> I am using this set of commands to test (with the default imx577 driver 
> without any multiple virtual channels outputs) and am getting only the 
> first message (virtual channels mask 0x1):
> 
> media-ctl --reset
> media-ctl -v -d /dev/media0 -V '"imx577 
> '22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> 
> Thanks,
> 
> Milen

Its a dev_dbg() so "#define DEBUG 1" in 
drivers/media/platform/qcom/camss/camss-csid.c

---
bod

