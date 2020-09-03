Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A6125C624
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 18:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbgICQGV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 12:06:21 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14666 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbgICQGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 12:06:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f51146d0000>; Thu, 03 Sep 2020 09:06:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 03 Sep 2020 09:06:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 03 Sep 2020 09:06:19 -0700
Received: from [10.2.173.243] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Sep
 2020 16:06:18 +0000
Subject: Re: [PATCH v5 2/3] dt-bindings: media: imx274: Add optional input
 clock and supplies
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <sakari.ailus@iki.fi>, <hverkuil@xs4all.nl>,
        <jacopo+renesas@jmondi.org>, <luca@lucaceresoli.net>,
        <leonl@leopardimaging.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1599012278-10203-1-git-send-email-skomatineni@nvidia.com>
 <1599012278-10203-3-git-send-email-skomatineni@nvidia.com>
 <20200903125542.nxiafnysatoexken@uno.localdomain>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <d3a1843c-5d73-cfa6-9611-405b905ddcd1@nvidia.com>
Date:   Thu, 3 Sep 2020 09:05:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903125542.nxiafnysatoexken@uno.localdomain>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599149165; bh=bxXTsuZ7FZDcM2mjf0tGRKm9GbyC5hRsiKLW8EcqMBs=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=CDq+fjcmsDn7/zTxc+bjGS/Qqr7CyvtVyyCgcPbD9gc46SJBcuGH0I+sK2LrB5wzT
         3wV/j4FQrKlNv9tmXyfaJ/Hrg2ExW+bZGMwSdn2TpumCiHtvh9eu49jAqVEsCF2Wtk
         6KRzVdDHUYc4axK1Ew6zszGtItYp/aOrktlIJAAQxfFhtiHMMCOBpcM2l916M3CVJN
         S/TMceh950Dd5hrJ+omQe8/i6tVaRxbOpI70dOvOQXsHQkFcL3eC99El20xsaVsllJ
         owz+a7Vw7NdD9NUZAsl1K8xiEc+p++5nfUGzG0vXR/tzCiwr6doElHia8Z95JRxvIA
         4K5rrGDOcgTsw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 9/3/20 5:55 AM, Jacopo Mondi wrote:
> Hello Sowjanya,
>
> On Tue, Sep 01, 2020 at 07:04:37PM -0700, Sowjanya Komatineni wrote:
>> This patch adds IMX274 optional external clock input and voltage
>> supplies to device tree bindings.
>>
>> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   .../devicetree/bindings/media/i2c/sony,imx274.yaml  | 21 +++++++++++++=
++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yam=
l b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>> index 7ae47a6..57e7176 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>> @@ -25,6 +25,27 @@ properties:
>>     reset-gpios:
>>       maxItems: 1
>>
> I just sent an update to my json-schema conversion of this bindings
> document (not yet on patchwork, sorry) and Sakari pointed me to the
> fact in between my v2 and my v4 this patch from you went in:
> 4ea3273d24b ("dt-bindings: media: imx274: Add optional input clock and su=
pplies")
>
> I should probably now update my bindings conversion patch, basically
> taking in what you've done here, but I would have one question.
>
>> +  clocks:
>> +    maxItems: 1
>> +    description: Reference to the sensor input clock
>> +
>> +  clock-names:
>> +    maxItems: 1
>> +    items:
>> +      - const: inck
>> +
>> +  vana-supply:
>> +    description:
>> +      Analog voltage supply, 2.8 volts
>> +
>> +  vdig-supply:
>> +    description:
>> +      Digital IO voltage supply, 1.8 volts
>> +
>> +  vddl-supply:
>> +    description:
>> +      Digital core voltage supply, 1.2 volts
> 4ea3273d24b introduced these regulators as VANA-supply, VDIG-supply
> and VDDL-supply (please note the upper-case names). This version uses
> lower-case ones instead. Is this intentional ? The driver currently
> does not parse any of these if I'm not mistaken, but as the bindings
> in textual form defines an ABI which should be preserved during the
> conversion to json-schema, should these be kept in upper-case ?
>
> Thanks
>     j

Yes, based on feedback lower case was recommended. So, changed to use=20
lower-case names.

These properties were not used by driver currently and from my prior=20
series only dt-binding got merged as=C2=A0 no feedback was received on it f=
or=20
all prior versions.

So, should be ok to change to lower-case as there properties are=20
introduced now and driver update using these properties is under review

>> +
>>     port:
>>       type: object
>>       description: |
>> --
>> 2.7.4
>>
