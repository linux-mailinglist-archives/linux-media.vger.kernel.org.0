Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5242F94DB
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 20:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730151AbhAQT0q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 14:26:46 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:40041 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730092AbhAQTZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 14:25:31 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1725F1F523;
        Sun, 17 Jan 2021 20:23:46 +0100 (CET)
Subject: Re: [PATCH 2/2] media: dt-bindings: media: venus: Add sdm660 DT
 schema
To:     Rob Herring <robh@kernel.org>
Cc:     mchehab@kernel.org, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org,
        marijn.suijten@somainline.org, konrad.dybcio@somainline.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org
References: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
 <20210115185252.333562-3-angelogioacchino.delregno@somainline.org>
 <1610898357.209470.1730313.nullmailer@robh.at.kernel.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <890cbed0-0f4c-f8e4-5d91-c0cd40edde1d@somainline.org>
Date:   Sun, 17 Jan 2021 20:23:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1610898357.209470.1730313.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 17/01/21 16:45, Rob Herring ha scritto:
> On Fri, 15 Jan 2021 19:52:52 +0100, AngeloGioacchino Del Regno wrote:
>> Add new qcom,sdm660-venus DT binding schema.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   .../bindings/media/qcom,sdm660-venus.yaml     | 164 ++++++++++++++++++
>>   1 file changed, 164 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
>>
>> base-commit: 012bd807cf654b992cdc4db7eab85c1e95f9d571
>> prerequisite-patch-id: 734bdefdb043a8f91a48916246cc9a36fb5966e5
>> prerequisite-patch-id: 999517c02973237996492a41ed5bfc2990083932
>> prerequisite-patch-id: a48910425fac61948a7a26bec4d40d63e3368569
>> prerequisite-patch-id: b1a1a4216eed0d04dd16e6e8e1053dee185d06d8
>> prerequisite-patch-id: dff12be2631cc21ef1c3c930fba49d979f5055fe
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/media/qcom,sdm660-venus.example.dts:20:18: fatal error: dt-bindings/clock/qcom,mmcc-sdm660.h: No such file or directory
>     20 |         #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/media/qcom,sdm660-venus.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1370: dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1427279
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

Yes, because this depends on the commits that are mentioned in the tags.
Is there any better way to add a dependency on another patch series?

- Angelo
