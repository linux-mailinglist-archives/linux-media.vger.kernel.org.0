Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2495C166898
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 21:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbgBTUjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 15:39:31 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2750 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbgBTUjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 15:39:31 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4eee740000>; Thu, 20 Feb 2020 12:39:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 20 Feb 2020 12:39:30 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 12:39:30 -0800
Received: from [10.2.163.58] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 20:39:28 +0000
Subject: Re: [RFC PATCH v3 3/6] dt-binding: tegra: Add VI and CSI bindings
To:     Rob Herring <robh@kernel.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Frank Chen <frankc@nvidia.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-4-git-send-email-skomatineni@nvidia.com>
 <20200218231503.GA19099@bogus>
 <5948bf42-9be2-8cf0-1c28-80f69b708c65@nvidia.com>
 <CAL_JsqKAVBS-KvP60Bv2JBQjUzTUgicx33nShn4enFpvysS9YA@mail.gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <a41f3a6c-c6ed-4148-7af8-faf0cf36d67d@nvidia.com>
Date:   Thu, 20 Feb 2020 12:39:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKAVBS-KvP60Bv2JBQjUzTUgicx33nShn4enFpvysS9YA@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582231156; bh=x3FSVTVnhy0xB8qhuAdvyWzG3JHJZQd1kGDJjAzQz10=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=JGkUCdurxr3SkgI7EvyQXUJOStOj4UBsFhEsTLa+UzobiHEdc3aeqclPmBz/gvmw4
         Po68btgzdIaJcFU+TLyh5wSyJMb1p9ZJz7uX6trq82O0ZZty0cxWxslWrkCLzn6NI5
         xGh+cykLu5ZrNO5KykmA7iWfhcyYF70HswLrckY1mTkcprmMYK0096OdOyhDqfdVaj
         32LFT1p4VyTEMIy6G5sF1cS2eGRISg9XhIw6nxx9uyUz/kA1xM7gHMlaCd1SHDTzt4
         th8HnIaKVzDwjsGxuPILSGf34/lzeVrajG/+IHKkqXJCdrWvzbKq4xWmjAL//nJwgy
         XBoH+5OqJ7wNA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/20/20 11:45 AM, Rob Herring wrote:
> External email: Use caution opening links or attachments
>
>
> On Tue, Feb 18, 2020 at 9:28 PM Sowjanya Komatineni
> <skomatineni@nvidia.com> wrote:
>>
>> On 2/18/20 3:15 PM, Rob Herring wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Fri, Feb 14, 2020 at 10:23:25AM -0800, Sowjanya Komatineni wrote:
>>>> Tegra contains VI controller which can support up to 6 MIPI CSI
>>>> camera sensors.
>>>>
>>>> Each Tegra CSI port from CSI unit can be one-to-one mapper to
>>>> VI channel and can capture from an external camera sensor or
>>>> from built-in test pattern generator.
>>>>
>>>> This patch adds dt-bindings for Tegra VI and CSI.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>    .../display/tegra/nvidia,tegra20-host1x.txt        | 55 ++++++++++++++++++----
>>>>    1 file changed, 47 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>>>> index 9999255ac5b6..3d0ed540a646 100644
>>>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>>>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>>>> @@ -40,14 +40,24 @@ of the following host1x client modules:
>>>>
>>>>      Required properties:
>>>>      - compatible: "nvidia,tegra<chip>-vi"
>>>> -  - reg: Physical base address and length of the controller's registers.
>>>> +  - reg: Physical base address and length of the controller registers.
>>>>      - interrupts: The interrupt outputs from the controller.
>>>> -  - clocks: Must contain one entry, for the module clock.
>>>> +  - clocks: Must contain an entry for the module clock "vi"
>>>>        See ../clocks/clock-bindings.txt for details.
>>>>      - resets: Must contain an entry for each entry in reset-names.
>>>>        See ../reset/reset.txt for details.
>>>> -  - reset-names: Must include the following entries:
>>>> -    - vi
>>>> +  - reset-names: Must include the entry "vi"
>>>> +
>>>> +  Tegra210 has CSI part of VI sharing same host interface and register
>>>> +  space. So, VI device node should have CSI child node.
>>>> +
>>>> +  - csi: mipi csi interface to vi
>>>> +
>>>> +    Required properties:
>>>> +    - compatible: "nvidia,tegra<chip>-csi"
>>>> +    - reg: Physical base address and length of the controller registers.
>>>> +    - clocks: Must contain entries csi, cilab, cilcd, cile clocks.
>>>> +      See ../clocks/clock-bindings.txt for details.
>>>>
>>>>    - epp: encoder pre-processor
>>>>
>>>> @@ -310,12 +320,41 @@ Example:
>>>>                 };
>>>>
>>>>                 vi {
>>>> -                     compatible = "nvidia,tegra20-vi";
>>>> -                     reg = <0x54080000 0x00040000>;
>>>> +                     compatible = "nvidia,tegra210-vi";
>>>> +                     reg = <0x0 0x54080000 0x0 0x700>;
>>>>                         interrupts = <0 69 0x04>;
>>>> -                     clocks = <&tegra_car TEGRA20_CLK_VI>;
>>>> -                     resets = <&tegra_car 100>;
>>>> +                     assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
>>>> +                     assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
>>>> +                     clocks = <&tegra_car TEGRA210_CLK_VI>;
>>>> +                     clock-names = "vi";
>>>> +                     resets = <&tegra_car 20>;
>>>>                         reset-names = "vi";
>>>> +
>>>> +                     #address-cells = <2>;
>>>> +                     #size-cells = <2>;
>>>> +
>>>> +                     ranges = <0x0 0x54080808 0x0 0x54080808 0x0 0x2000>;
>>>> +
>>>> +                     csi@0x54080838 {
>>> Drop '0x'
>> Will fix in v4
>>>> +                             compatible = "nvidia,tegra210-csi";
>>>> +                             reg = <0x0 0x54080838 0x0 0x2000>;
>>> Kind of odd that this address and ranges address are not the same. And
>>> also wrong that the size here exceeds the bounds of ranges.
>>>
>>> Also, best practice is to make the child address 0 or relative to the
>>> parent.
>> Actual CSI starts at offset 0x808 but we don't use couple of registers
>> at offset 0x808.
>>
>> Will update ranges in v4 to start from 0x838 offset and will make child
>> address relative to parent.
> Seems odd, but okay. And you will never, ever need to use those
> registers no matter what, and we can reject any DT change trying to
> change it later?
>
> Rob

Yes not required to access them by driver.

On T210, CSI registers under VI starts from location 0x54080808

SW don't need to access initial 3 registers at 0x54080808, 0x54080818, 
0x54080828

Actual CSI registers that are needed for SW starts from 0x54080838.

