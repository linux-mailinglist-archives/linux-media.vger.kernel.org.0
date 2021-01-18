Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7E42FA7E7
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 18:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436530AbhARRuM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 12:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407154AbhARRty (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 12:49:54 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A23C061574;
        Mon, 18 Jan 2021 09:48:57 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D34383E859;
        Mon, 18 Jan 2021 18:48:55 +0100 (CET)
Subject: Re: [PATCH 2/2] media: dt-bindings: media: venus: Add sdm660 DT
 schema
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     mchehab@kernel.org, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        konrad.dybcio@somainline.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
 <20210115185252.333562-3-angelogioacchino.delregno@somainline.org>
 <1610898357.209470.1730313.nullmailer@robh.at.kernel.org>
 <890cbed0-0f4c-f8e4-5d91-c0cd40edde1d@somainline.org>
 <3f28fa3f-b86b-0c63-a8b7-1c5e18ab9a49@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <b4ffc21f-eec3-2a25-1383-4c43bdb8fa8c@somainline.org>
Date:   Mon, 18 Jan 2021 18:48:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <3f28fa3f-b86b-0c63-a8b7-1c5e18ab9a49@linaro.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 18/01/21 18:21, Stanimir Varbanov ha scritto:
> 
> 
> On 1/17/21 9:23 PM, AngeloGioacchino Del Regno wrote:
>> Il 17/01/21 16:45, Rob Herring ha scritto:
>>> On Fri, 15 Jan 2021 19:52:52 +0100, AngeloGioacchino Del Regno wrote:
>>>> Add new qcom,sdm660-venus DT binding schema.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno
>>>> <angelogioacchino.delregno@somainline.org>
>>>> ---
>>>>    .../bindings/media/qcom,sdm660-venus.yaml     | 164 ++++++++++++++++++
>>>>    1 file changed, 164 insertions(+)
>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
>>>>
>>>> base-commit: 012bd807cf654b992cdc4db7eab85c1e95f9d571
>>>> prerequisite-patch-id: 734bdefdb043a8f91a48916246cc9a36fb5966e5
>>>> prerequisite-patch-id: 999517c02973237996492a41ed5bfc2990083932
>>>> prerequisite-patch-id: a48910425fac61948a7a26bec4d40d63e3368569
>>>> prerequisite-patch-id: b1a1a4216eed0d04dd16e6e8e1053dee185d06d8
>>>> prerequisite-patch-id: dff12be2631cc21ef1c3c930fba49d979f5055fe
>>>>
>>>
>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Documentation/devicetree/bindings/media/qcom,sdm660-venus.example.dts:20:18:
>>> fatal error: dt-bindings/clock/qcom,mmcc-sdm660.h: No such file or
>>> directory
>>>      20 |         #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
>>>         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> compilation terminated.
>>> make[1]: *** [scripts/Makefile.lib:344:
>>> Documentation/devicetree/bindings/media/qcom,sdm660-venus.example.dt.yaml]
>>> Error 1
>>> make[1]: *** Waiting for unfinished jobs....
>>> make: *** [Makefile:1370: dt_binding_check] Error 2
>>>
>>> See https://patchwork.ozlabs.org/patch/1427279
>>>
>>> This check can fail if there are any dependencies. The base for a patch
>>> series is generally the most recent rc1.
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>> date:
>>>
>>> pip3 install dtschema --upgrade
>>>
>>> Please check and re-submit.
>>>
>>
>> Yes, because this depends on the commits that are mentioned in the tags.
>> Is there any better way to add a dependency on another patch series?
>>
> 
> What is the status of mmcc-sdm660 clk driver? I guess we have to
> postpone this until clock driver is ready for merge?
> 

I have sent it already, the driver is waiting for review...

By the way, this is not the only driver that I've sent that is getting
postponed because of that and I knew that this one would've had the same
destiny, but I thought to send everything "before I forget" pieces here
and there.

Of course I understand that everyone's time is limited, this is not a
rant at all!

Thanks for your review!

>> - Angelo
> 
