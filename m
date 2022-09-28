Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E803F5EDDB9
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 15:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbiI1Ncu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 09:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233721AbiI1Nct (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 09:32:49 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9235A2610;
        Wed, 28 Sep 2022 06:32:47 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E9EEB84B13;
        Wed, 28 Sep 2022 15:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664371965;
        bh=JJLde7X8BKDQyumzE/OIAI/+oFwf58w283WTVtOXriM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=PkGyvz1junWK0FWLEsz0Gf355JZqvDVfgAvfehWuxE10//qQ+KpqruRLaJFp3/Gr0
         SvUacU2c60o4A/QUlFk8GppiaCwO+qQmlttPR5wa5nxEhUj0C0E3aKcCKis0kwYD3t
         MmhoDSOz28FZ7Zb8eljmxgEyt18j+96ajoKRMjbQNAVqUEHtEUFph/saQteknYwJw6
         k8BV90gyv/sc2AEj0vMm1l06E5gTP61Y7hJJ2jzknGtQ04+ubYlOsCMyfo6uiuVsTN
         JnpUBwJkLmFbPfmfotJuvH4hvFqXatOxh5hDiykgclIqO/cB0DMMCVGeHuTEP859TT
         FtC2f0DcHXLfA==
Message-ID: <1fa072ed-1e12-4234-a328-92c38de7b7d5@denx.de>
Date:   Wed, 28 Sep 2022 15:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: media: st,stmipid02: Convert the text
 bindings to YAML
Content-Language: en-US
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20220927005538.690997-1-marex@denx.de>
 <7420b97c-1421-03a5-dd47-044b5e1739f1@foss.st.com>
 <162ea4dd-ded9-2905-0e4b-71809c95fd78@denx.de>
 <04cd498e-608d-e1dd-377a-18e27dee23be@foss.st.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <04cd498e-608d-e1dd-377a-18e27dee23be@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/28/22 10:08, Benjamin MUGNIER wrote:
> Hi Marek,

Hi,

[...]

>>>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>>>> @@ -0,0 +1,175 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/i2c/st,st-mipid02.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge
>>>> +
>>>> +maintainers:
>>>> +  - Mickael Guene <mickael.guene@foss.st.com>
>>>
>>> As Mickael is not the maintainer of the driver anymore, there should be both current maintainers instead, as listed in the MAINTAINER file:
>>>    - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>    - Sylvain Petinot <sylvain.petinot@foss.st.com>
>>> Can you change it while at it ? Thank you.
>>
>> Done and done, I also dropped myself from the list, which I hope is OK.
>>
> 
> No problem for dropping yourself, out of curiosity why so ?

Just because I think you and Sylvain should be enough to maintain this, 
and it is also likely I won't be contributing to this file much beyond 
this conversion (and get_maintainer.pl would add me on CC anyway).

[...]
