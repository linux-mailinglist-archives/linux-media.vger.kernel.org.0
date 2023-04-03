Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFC76D40C5
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 11:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbjDCJiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 05:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbjDCJhd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 05:37:33 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17FEA10AAA
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 02:36:46 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l37so16686112wms.2
        for <linux-media@vger.kernel.org>; Mon, 03 Apr 2023 02:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680514570; x=1683106570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NiK96Bry+c2Jm2Eb8M9h8qg9G560Gmy2VnETNtoLtls=;
        b=A4l2Y34BwcuIyM9i7D9eGANAA1LR7rAACOXiugyXWswLl/jDkefLNlPD7kbYiERhT+
         UxNmubqWx5Gdf88suvUq2dSLkLD/pB3Iyi+jpICdli5D3bmRnkePqnbM3SAnUAcNdQJj
         BqheTJHCF1KFL1OVgW4vQKVhOAQiyVPMHo40DQ+jtzrVc0bLKuGbH/LQKHJci2MIYzWV
         JJi1ysG1zxR0ALjf2ARHWpl6cYA6QmAwcRXI/JQpXlueJi+AOC036KaRPh3HHPoN2uAT
         EKnGXwT3ftJA0S6w+1wjrGc0a4MSYnlXrY3PELK9k5ol41WWzfizs5Q25fpWKVdAcE9y
         iJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680514570; x=1683106570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NiK96Bry+c2Jm2Eb8M9h8qg9G560Gmy2VnETNtoLtls=;
        b=j++k3UiwtPRZs6vuI1igAKOamETQW9zsESpT29kMumyA1g9wG2r/ZwG7na0o+IJ/kk
         kBqb/9PkMtoUt3tZA3AP5vYDUE1XNHInSm1qiGlovaF0WRyR5rNoFwzBEUNmb9fmDkxQ
         UdciOXu/uBnUWXmb+vpI9K+ApLf21PA1aPTlOxCrOTE5x62iaxd48Cy+cQyQJN2eCQQ0
         yU1TJKgScOw1WddpxByvp9CcMbM/n+HoM31+1NwIJ+deIeQofUx9YvCtUdxcAK/BHo4V
         dUEhZvKkesNSYwNvnPvBpG11CIFpaomjr2ETkMZ+bH1/fFQQhL7OvQ8cWlmdw+BakLmR
         wuEg==
X-Gm-Message-State: AO0yUKUZHHFrJxeQuqAq+DKKLzGr4Mumf31OUYMHEuoqn3ZXLSvJD65/
        /kgrAGVD7F7ZQeJ8x8e7vc24XWBYOHy4/5+UhUo=
X-Google-Smtp-Source: AK7set8kfVcFXNAg4rzguXqadQYgXcebtx8mWLPA3y3bRUw2FuZkTqp7LDtYMQ45ksvjO+u++W+0rA==
X-Received: by 2002:a7b:c850:0:b0:3ed:29db:cb80 with SMTP id c16-20020a7bc850000000b003ed29dbcb80mr26030199wml.18.1680514570393;
        Mon, 03 Apr 2023 02:36:10 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y22-20020a7bcd96000000b003ee42696acesm11486529wmj.16.2023.04.03.02.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:36:09 -0700 (PDT)
Message-ID: <d26dfea3-8438-6012-386c-91ec43e1db1d@linaro.org>
Date:   Mon, 3 Apr 2023 10:36:08 +0100
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
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d653be97-337f-dc09-786c-b13304c643fe@quicinc.com>
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

On 03/04/2023 10:20, Milen Mitkov (Consultant) wrote:
> 
> On 03/04/2023 12:16, Bryan O'Donoghue wrote:
>> On 03/04/2023 09:38, Milen Mitkov (Consultant) wrote:
>>> On 31/03/2023 11:07, Bryan O'Donoghue wrote:
>>>> On 31/03/2023 07:20, Azam Sadiq Pasha Kapatrala Syed wrote:
>>>>> + Nico (Linaro)
>>>>> Hi Team
>>>>>
>>>>> Would like to know if anything is pending form our end as we want 
>>>>> to get the patches mainlined?
>>>>>
>>>>> Thanks,
>>>>> Azam
>>>>
>>>> I'd like to get a clearer picture on this
>>>>
>>>> [   90.535909] qcom-camss ac6a000.camss: VFE HW Version = 2.0.1
>>>> [   90.545756] qcom-camss ac6a000.camss: CSIPHY 3PH HW Version = 
>>>> 0x40010000
>>>> [   90.546358] qcom-camss ac6a000.camss: CSID HW Version = 2.0.1
>>>> [   90.546365] qcom-camss ac6a000.camss: csid_link_setup: Enabled 
>>>> CSID virtual channels mask 0x1
>>>> [   90.547675] qcom-camss ac6a000.camss: csid_link_setup: Enabled 
>>>> CSID virtual channels mask 0x0
>>>>
>>>> Using the IMX577 sensor on the RB5 we get his pretty odd virtual 
>>>> channels mask.
>>>>
>>>> If userspace is sending this in, the question I have is why. Surely 
>>>> with a sensor that doesn't have a VC there should be no impact on 
>>>> user-space.
>>>>
>>>> ---
>>>> bod
>>>
>>> Hey Bryan,
>>>
>>> what media-ctl commands are you using? I can't recreate this on my 
>>> side. I am using this set of commands to test (with the default 
>>> imx577 driver without any multiple virtual channels outputs) and am 
>>> getting only the first message (virtual channels mask 0x1):
>>>
>>> media-ctl --reset
>>> media-ctl -v -d /dev/media0 -V '"imx577 
>>> '22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>>> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>>
>>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F 
>>> /dev/video0
>>>
>>>
>>> Thanks,
>>>
>>> Milen
>>
>> Its a dev_dbg() so "#define DEBUG 1" in 
>> drivers/media/platform/qcom/camss/camss-csid.c
>>
>> ---
>> bod
>>
> Yes, I enabled the dev_dbg(). I just see only one message with regards 
> to the channels mask. Just this one:
> 
> [   90.546365] qcom-camss ac6a000.camss: csid_link_setup: Enabled CSID 
> virtual channels mask 0x1
> 
> so I wonder if you're testing with a different set of media-ctl/yavta 
> commands.

No. I'm asking about how this _used_ to be.

If the iteration through the masks went away - then why did it go away ? 
libcamera version, a change you have made since - V5 I think it was when 
we discussed this last ?

---
bod

