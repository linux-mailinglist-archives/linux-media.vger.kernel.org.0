Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37D757CAA1
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 14:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232164AbiGUM3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 08:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbiGUM3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 08:29:16 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C66331221
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 05:29:13 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id c22so956085wmr.2
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 05:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aEBXeOqzEfCGJOy0QN7fqFcmVzIuK7L6CPfXl8vaOWY=;
        b=kCfusNrP9wy2rFtaAHi9JEhVpBHay0oK4pfNjMxGTaYiB0TfZhDRq+fyk5tEddKs/L
         /oMfWRIuOiNEsWEAk/S1gj0IV4eAMCWG6CBJiCDz6HsTyNZvCHm1o3PiPRcLBuaf1Isg
         sMgSrg/8V2r3uv6IopWW16+56y8Wx/LkpyE3oNYpWd86WM5ufEbUtGQi1yTsX2/yuzIZ
         I8zypHFBPwii3eejrL8oXcWAA3eBLN7VlQTwPVFGXHwIVtFlleN+d3Bu/yWh9CzQBnrF
         Tj0sLeqieIbYXl0mCLzrexz3OQBJ6RlXnM3e0arK2AlgjcvkMMSQqBjm9OzQXmxHff90
         LfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aEBXeOqzEfCGJOy0QN7fqFcmVzIuK7L6CPfXl8vaOWY=;
        b=uFxMvivzwnFTw+pCeltx+hNM55yyVhmpPgZ6tGrZ2jNIxuT1fk1RmEAch0nEHdK/fm
         vWPOp2EiyDXOjyFnTChIWe3iwi0TOKPQ+/HeuJ16HpI+m11JOubQY7KJgMatk2CRDrsT
         p0cIA66XfWzhn9Ae4Ir2l/EzKpgjVxykWrDpf+vEh1ROPRLGv8fny9yjpI3m3ieocnGN
         FhdvCoKbMe7j/ST3ZINwv4QKGmz+fJ5YLgVYDUHTNog7e3qXQCbeKGrPGoeiM6QIrXco
         Cx+1bFS+OAkH25LtO0haOR+juEFaYSMqP7Fik0oPg8TJuNU8gEKRMxN0LZH6uxF+smSd
         FJQQ==
X-Gm-Message-State: AJIora/RyG/E6e2x2z6YsbUvWHU651Vrw5oQVmFGegzZtHMOYa8kDrsA
        obs0HwelVPj0VCjfEICAVod4eQ==
X-Google-Smtp-Source: AGRyM1velcrh/86jqbLl0mh9+0XSu3+oOjqbdPXHW0eId6FGMw9jNMuZ9fKcQBQYswVx4Cmi7ojFug==
X-Received: by 2002:a05:600c:17c7:b0:3a3:f1:148c with SMTP id y7-20020a05600c17c700b003a300f1148cmr8378112wmo.32.1658406551551;
        Thu, 21 Jul 2022 05:29:11 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l37-20020a05600c1d2500b003a33227e49bsm1501272wms.4.2022.07.21.05.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 05:29:11 -0700 (PDT)
Message-ID: <f60a90fc-4780-de95-34a2-771fb68a342a@linaro.org>
Date:   Thu, 21 Jul 2022 13:29:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/4] Switch on IMX577 on RB5 with a new CCI fix
Content-Language: en-US
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com
References: <20220524140207.2758605-1-bryan.odonoghue@linaro.org>
 <1c596650-177c-e3be-feb0-4c5f00196589@foss.st.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1c596650-177c-e3be-feb0-4c5f00196589@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/07/2022 12:38, Benjamin Mugnier wrote:
> Hi Bryan,
> 
> On 24/05/2022 16:02, Bryan O'Donoghue wrote:
>> V2:
>>
>> - Adds fix for bug identified by Vladimir
>>    The CCI i2c_adapter_add() and pm_runtime_enable() are racy.
>>    This is a generic problem not related to the rb5/imx577 but, for the sake
>>    of our conversation/review's context I'll add it into this series.
>> - Include Vladimir's camcc patch
>>    I've also opted to include Vladimir's disable of camcc to make the enable
>>    of it in my patchset logical.
>> - Move address/size cells Konrad
>> - Remove newline in pin definitions - Konrad
>> - Remove sensor 'status = "okay"' - Konrad
>> - Add comment to qrb5165-rb5.dts re: imx412 and imx577 difference - Konrad
>> - Move pin definitions to 8250 dtsi - Vladimir
>> - Drop power domain from sensor definition - Vladimir
>> - Correct to "add to cam2" not "cam1" in commit log - bod
>>
>> To make verification of the CCI race eaiser I've provided a defconfig both
>> with and without modules enabled.
>>
>> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-24-05-22%2bimx577-rb5
>> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-24-05-22%2bimx577-rb5-compiled-in
>>
>> git diff linaro/linux-next-22-05-22+imx577-rb5 linaro/linux-next-24-05-22+imx577-rb5
>>
>> V1:
>> Linux-next now has everything we need to switch on this sensor both in the
>> qcom DTS and in the imx412 driver.
>>
>> After this, no further dts or driver work is required to capture images on
>> the RB5.
>>
>> Here's a bootable linux-next with a kernel config. I added Vladimir's
>> power-domain changes on-top to verify nothing breaks for me.
>>
>> https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-18-05-22%2bimx577-rb5
>>
>> Bryan O'Donoghue (3):
>>    i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapter
>>    arm64: dts: qcom: sm8250: camss: Define ports address/size cells
>>    arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on cam2
>>
>> Vladimir Zapolskiy (1):
>>    arm64: dts: qcom: sm8250: Disable camcc by default
>>
>>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 60 ++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi     | 39 +++++++++++++++
>>   drivers/i2c/busses/i2c-qcom-cci.c        | 14 ++++--
>>   3 files changed, 108 insertions(+), 5 deletions(-)
>>
> 
> I successfully tested this series with the st-vgxy61 sensor instead of the imx577. I can't provide comments on the device tree patch for the imx577 in 4/4.
> For patches 1/4, 2/4, and 3/4:
> 
> Tested-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> 
> 
> Thanks again for your work.

Appreciated.

I'll V3 this series once we sort out the naming of the imx sensor.

https://patchwork.kernel.org/project/linux-media/list/?series=660483
