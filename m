Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E12D25C72C
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 18:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbgICQlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 12:41:52 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1455 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbgICQlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 12:41:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f511cc00004>; Thu, 03 Sep 2020 09:41:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 03 Sep 2020 09:41:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 03 Sep 2020 09:41:50 -0700
Received: from [10.2.173.243] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Sep
 2020 16:41:48 +0000
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
 <d3a1843c-5d73-cfa6-9611-405b905ddcd1@nvidia.com>
 <20200903163525.p5z2adhp4wq453bs@uno.localdomain>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <f38bb328-b282-783b-3ac5-5441001d10b6@nvidia.com>
Date:   Thu, 3 Sep 2020 09:40:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903163525.p5z2adhp4wq453bs@uno.localdomain>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599151296; bh=CnYJnTb5gUW/km6HHe78zwtqcAzkqtsBbu0if592DP0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=VOJgr0NfpC8kqZGSqQEtRhIfXoxqzQLgwysBhjlDnLkyWeSH5URQRp1ISYIm3Rwv9
         dHL+pdjT6/or/qW9BGE1KDClgl/hEnfPQ9Kv3stxMJXV7vdms1EjwDnDkhnOQAMTss
         zt0SemTvgLdnHvMnfU9ciVxsrbaSCNJQaMX2dkQp31HRzUcvG8cg23SIfZGV18+JGa
         inMVSg7fRYCRiqLaYu87F3nzZSPy7C+e7cUfzh6bADG0T7Yh7NMi4Kd6By16tCST/B
         izSfBj+Ck+xs8G+wb4tipO5UBugFLnVieOtre7JCO+lLacAXbpokSEv6S7qfFwWbrE
         51x4onW0s1dpQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 9/3/20 9:35 AM, Jacopo Mondi wrote:
> Hi Sowjanya,
>
> On Thu, Sep 03, 2020 at 09:05:27AM -0700, Sowjanya Komatineni wrote:
>> On 9/3/20 5:55 AM, Jacopo Mondi wrote:
>>> Hello Sowjanya,
>>>
>>> On Tue, Sep 01, 2020 at 07:04:37PM -0700, Sowjanya Komatineni wrote:
>>>> This patch adds IMX274 optional external clock input and voltage
>>>> supplies to device tree bindings.
>>>>
>>>> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>    .../devicetree/bindings/media/i2c/sony,imx274.yaml  | 21 ++++++++++=
+++++++++++
>>>>    1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.y=
aml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>>>> index 7ae47a6..57e7176 100644
>>>> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>>>> @@ -25,6 +25,27 @@ properties:
>>>>      reset-gpios:
>>>>        maxItems: 1
>>>>
>>> I just sent an update to my json-schema conversion of this bindings
>>> document (not yet on patchwork, sorry) and Sakari pointed me to the
>>> fact in between my v2 and my v4 this patch from you went in:
>>> 4ea3273d24b ("dt-bindings: media: imx274: Add optional input clock and =
supplies")
>>>
>>> I should probably now update my bindings conversion patch, basically
>>> taking in what you've done here, but I would have one question.
>>>
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +    description: Reference to the sensor input clock
>>>> +
>>>> +  clock-names:
>>>> +    maxItems: 1
>>>> +    items:
>>>> +      - const: inck
>>>> +
>>>> +  vana-supply:
>>>> +    description:
>>>> +      Analog voltage supply, 2.8 volts
>>>> +
>>>> +  vdig-supply:
>>>> +    description:
>>>> +      Digital IO voltage supply, 1.8 volts
>>>> +
>>>> +  vddl-supply:
>>>> +    description:
>>>> +      Digital core voltage supply, 1.2 volts
>>> 4ea3273d24b introduced these regulators as VANA-supply, VDIG-supply
>>> and VDDL-supply (please note the upper-case names). This version uses
>>> lower-case ones instead. Is this intentional ? The driver currently
>>> does not parse any of these if I'm not mistaken, but as the bindings
>>> in textual form defines an ABI which should be preserved during the
>>> conversion to json-schema, should these be kept in upper-case ?
>>>
>>> Thanks
>>>      j
>> Yes, based on feedback lower case was recommended. So, changed to use
>> lower-case names.
>>
>> These properties were not used by driver currently and from my prior ser=
ies
>> only dt-binding got merged as=C2=A0 no feedback was received on it for a=
ll prior
>> versions.
>>
>> So, should be ok to change to lower-case as there properties are introdu=
ced
>> now and driver update using these properties is under review
>>
> Well, I see that patch went in v5.9-rc1, so it will be part of v5.9.
>
> If the bindings update goes in in v5.10 (or whatever comes after v5.9)
> then we have a problem, as the DTB created for v5.9 won't work anymore
> on any later version, and that should not happen. Alternatively, a fix
> for the next -rc release could be fast-tracked, but you would
> need to synchronize with the dt maintainers for that and make a patch
> for the existing .txt bindings file.
>
> If the name change happens in the yaml file and one release is made
> with the old names, then we're stuck with those forever and ever, if I
> got the situation right.
>
> Please check with the dt and media maintainers, or they can comment
> here if they glance through these lines.
>
> Thanks
>    j

Hi Leon Luo,

I used upper case for regulator supply names in all prior 4 versions of=20
IMX274 patch series as I see some other media i2c drivers doing it and=20
dt-binding patch from v3 got merged in 5.9-rc1 which was using upper-case.

Later received feedback from Sakari requesting to use lower-case names=20
so updated to use lower case name now in v5.

Not sure if we have timeline to squeeze in patch to change names to=20
lower-case before they get into 5.10.

Can you please comment?

Sakari,

Can you also help understand why can't we keep upper case for regulator=20
supplies?

I see some other media i2c drivers using upper case as well.

Thanks

Sowjanya




>>>> +
>>>>      port:
>>>>        type: object
>>>>        description: |
>>>> --
>>>> 2.7.4
>>>>
