Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07F4214E74E
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2020 03:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgAaC5w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 21:57:52 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5906 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727739AbgAaC5v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 21:57:51 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e33977a0000>; Thu, 30 Jan 2020 18:56:58 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Jan 2020 18:57:50 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 18:57:50 -0800
Received: from [10.110.103.70] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jan
 2020 02:57:50 +0000
Subject: Re: [RFC PATCH v1 5/5] arm64: tegra: Add Tegra VI CSI suppport in
 device tree
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-6-git-send-email-skomatineni@nvidia.com>
 <20200129094624.GD2479935@ulmo>
 <bd18711d-ce23-cbee-7824-37a8c78908e6@nvidia.com>
 <20200130123607.GB2584455@ulmo>
 <c5fd4eb3-0026-95a5-5162-e1cf5302698e@nvidia.com>
 <20200130175820.GA3155155@ulmo>
 <deb6839b-2ddb-be54-a985-a2b7624374af@nvidia.com>
 <ba57fcf2-a7bf-8154-96c9-aba401327af7@nvidia.com>
Message-ID: <c1eef60b-eddd-8030-06b9-8009694f9a6a@nvidia.com>
Date:   Thu, 30 Jan 2020 18:57:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ba57fcf2-a7bf-8154-96c9-aba401327af7@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580439418; bh=nZ1j3mIvtSf9K9okZrK5BmQnPSrbi/HKW3zTWpWZ3ME=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=qDL8vgKEP7RndBoqgckuiqmznvQezcgR8GOZ3WW5J8J4tArlyscmCLRaY3LLsOJnd
         ofpZf7l5A0KOYQVHHsfRs2egUT/qAFnBU0mBj1nCpST5FboAMfHcckCZO4z+g53OUl
         APkWsATdg8R9kBeXm7N/kCPBJhHPKfIkD70LvtCIxqS98eAj7UFgTbjTrFzhE4/SO+
         dh/o60urcgf/U8iqMf/m8p0aoAdXcKoyyQdBqcs92vOXNnHp5ZUsPlCB3leB2WhT09
         pFafv6fjLA2v/LTAvW3QrPOIV0L7PJ+TDbsZT7/OlFFQir4Ac+WuVgaedNzeHSLYGO
         5qe6MhhnuI/Kw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thierry

Currently all channels allocation and creating media links are all in vi=20
init client ops.

So just populating CSI child from VI with moving CSI as child node to VI=20
for Tegra210 should work.

Will have all the fixes in v2 along with link_validate implementations=20
and merging files to have it simpler.

Thanks

Sowjanya



On 1/30/20 12:18 PM, Sowjanya Komatineni wrote:
>
> On 1/30/20 10:58 AM, Sowjanya Komatineni wrote:
>>
>> On 1/30/20 9:58 AM, Thierry Reding wrote:
>>> On Thu, Jan 30, 2020 at 09:18:50AM -0800, Sowjanya Komatineni wrote:
>>>> On 1/30/20 4:36 AM, Thierry Reding wrote:
>>>>> On Wed, Jan 29, 2020 at 08:22:48AM -0800, Sowjanya Komatineni wrote:
>>>>>> On 1/29/20 1:46 AM, Thierry Reding wrote:
>>>>>>> On Tue, Jan 28, 2020 at 10:23:21AM -0800, Sowjanya Komatineni=20
>>>>>>> wrote:
>>>>>>>> Tegra210 contains VI controller for video input capture from MIPI
>>>>>>>> CSI camera sensors and also supports built-in test pattern=20
>>>>>>>> generator.
>>>>>>>>
>>>>>>>> CSI ports can be one-to-one mapped to VI channels for capturing=20
>>>>>>>> from
>>>>>>>> an external sensor or from built-in test pattern generator.
>>>>>>>>
>>>>>>>> This patch adds support for VI and CSI and enables them in=20
>>>>>>>> Tegra210
>>>>>>>> device tree.
>>>>>>>>
>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>> ---
>>>>>>>> =A0=A0=A0 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 8 +++++=
++
>>>>>>>> =A0=A0=A0 arch/arm64/boot/dts/nvidia/tegra210.dtsi=A0=A0=A0=A0=A0=
=A0 | 31=20
>>>>>>>> +++++++++++++++++++++++++-
>>>>>>>> =A0=A0=A0 2 files changed, 38 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi=20
>>>>>>>> b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>>>>>>>> index b0095072bc28..ec1b3033fa03 100644
>>>>>>>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>>>>>>>> @@ -10,6 +10,14 @@
>>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D "okay";
>>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 };
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 vi@54080000 {
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D "okay";
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 };
>>>>>>>> +
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 csi@0x54080838 {
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D "okay";
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 };
>>>>>>>> +
>>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sor@54580000 {
>>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D "okay";
>>>>>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi=20
>>>>>>>> b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>>>>> index 48c63256ba7f..c6107ec03ad1 100644
>>>>>>>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>>>>> @@ -136,9 +136,38 @@
>>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vi@54080000 {
>>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "nvid=
ia,tegra210-vi";
>>>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x0 0x54080000 0x0 0x0=
0040000>;
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x0 0x54080000 0x0 0x8=
08>;
>>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupts =3D <GIC_=
SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D "disabled=
";
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 assigned-clocks =3D <&tegra_car=
 TEGRA210_CLK_VI>;
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 assigned-clock-parents =3D <&te=
gra_car=20
>>>>>>>> TEGRA210_CLK_PLL_C4_OUT0>;
>>>>>>>> +
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clocks =3D <&tegra_car TEGRA210=
_CLK_VI>;
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clock-names =3D "vi";
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 resets =3D <&tegra_car 20>;
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reset-names =3D "vi";
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 };
>>>>>>>> +
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 csi@0x54080838 {
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "nvidia,tegra210=
-csi";
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x0 0x54080838 0x0 0x2=
000>;
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D "disabled";
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 assigned-clocks =3D <&tegra_car=
 TEGRA210_CLK_CILAB>,
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 <=
&tegra_car TEGRA210_CLK_CILCD>,
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 <=
&tegra_car TEGRA210_CLK_CILE>;
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 assigned-clock-parents =3D <&te=
gra_car=20
>>>>>>>> TEGRA210_CLK_PLL_P>,
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 <&tegra_car TEGRA210_CLK_PLL_P>,
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 <&tegra_car TEGRA210_CLK_PLL_P>;
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 assigned-clock-rates =3D <10200=
0000>,
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 <102000000>,
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 <102000000>;
>>>>>>>> +
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clocks =3D <&tegra_car TEGRA210=
_CLK_CSI>,
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 <&tegra_car TEGR=
A210_CLK_CILAB>,
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 <&tegra_car TEGR=
A210_CLK_CILCD>,
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 <&tegra_car TEGR=
A210_CLK_CILE>;
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clock-names =3D "csi", "cilab",=
 "cilcd", "cile";
>>>>>>>> +
>>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 };
>>>>>>> Can this be a child of the vi node? Looking at the register=20
>>>>>>> ranges it
>>>>>>> seems like these are actually a single IP block. If they have=20
>>>>>>> separate
>>>>>>> blocks with clearly separate functionality, then it makes sense=20
>>>>>>> to have
>>>>>>> CSI be a child node of VI, though it may also be okay to merge=20
>>>>>>> both and
>>>>>>> have a single node with the driver doing all of the differentiation
>>>>>>> between what's VI and what's CSI.
>>>>>>>
>>>>>>> Looking at later chips, the split between VI and CSI is more=20
>>>>>>> explicit,
>>>>>>> so having the split in DT for Tegra210 may make sense for=20
>>>>>>> consistency.
>>>>>>>
>>>>>>> I know we've discussed this before, but for some reason I keep=20
>>>>>>> coming
>>>>>>> back to this. I'll go through the other patches to see if I can=20
>>>>>>> get a
>>>>>>> clearer picture of how this could all work together.
>>>>>>>
>>>>>>> Thierry
>>>>>> We can keep it separate as we discussed.
>>>>>>
>>>>>> But as Tegra186 onwards, CSI is separate device to be all=20
>>>>>> cosistent I kept
>>>>>> CSI as separate node for Tegra210 as well.
>>>>> =A0 From our discussion, my understanding was that CSI would be a=20
>>>>> separate
>>>>> device, but it would still be a subdevice of VI. The address=20
>>>>> offset of
>>>>> the CSI registers not being aligned to a power of two is a strong
>>>>> indication that this is really all part of the same block.
>>>> Yes our earlier discussion is to have CSI as subdevice.
>>>>
>>>> Later looking into T186 and later NVCSI is totally separate so it=20
>>>> will be
>>>> separate device and to have driver common moved Tegra210 CSI also as
>>>> separate device instead of having it as subdevice of VI.
>>>>
>>>> Earlier when we discussed at that time I am using TPG also from device
>>>> graphs but not moved to hard media links inside driver for TPG.
>>>>
>>>> For this we need CSI to be available prior to VI.
>>> Why is that? Does creating the hard media links need access to a struct
>>> device? What if we created that device in the VI driver without any
>>> reliance on DT? Shouldn't that also work? I have a hard time imagining
>>> that there aren't other devices like this where we don't necessarily
>>> have separate devices for these links.
>> Yes we need CSI structure for hard link TPG also as all csi channel=20
>> list is part of CSI device.
>>
>> We can create CSI channel subdevices within VI without using CSI=20
>> device from a separate CSI driver probe for Tegra210 and make all=20
>> subdev related ops implementations as global so they can be used from=20
>> VI driver for Tegra210 and can also be used for Tegra186 and later in=20
>> separate CSI driver.
>>
>> During creating media links in VI driver for TPG, for T210 we can use=20
>> local CSI device structure and for T186+ we can use CSI device=20
>> structure created during CSI probe.
>>
>> Sorry, I didn't understood what you meant by separate devices for=20
>> these link.
>>
>> We only have Tegra CSI linked to Tegra VI for TPG/Real sensor.
>>
>>>> If we add CSI as subdevice to VI, CSI will not be available by the=20
>>>> time
>>>> VI init happens.
>>> The CSI subdevice should be registered as part of the VI driver's=20
>>> probe,
>>> right? That's typically where you'd call of_platform_populate(). Could
>>> we not set up the hard media links in the ->init() callbacks for the
>>> host1x clients? Those are called after all of the devices have been
>>> probed, so the CSI device should be available at that time.
>>>
> yes, will update to have CSI as child node to VI
>>>> Currently host1x subdevices listed has CSI before VI and CSI init=20
>>>> happens
>>>> earlier so by the time VI init happens CSI is available to do media=20
>>>> links
>>>> b/w VI video entity and CSI subdevice entity.
>>> Okay, I understand how this would be a convenient solution. However,=20
>>> the
>>> device tree is a hardware description, so we need to ignore what we=20
>>> know
>>> about the operating system infrastructure that we want to use when
>>> writing the device tree bindings (and the device tree content) in order
>>> to make sure the same binding will work on a different operating system
>>> which may have a completely different infrastructure (or none at all).
>>>
>>>> Also having CSI as separate subdevice (not as subdevice to VI) for=20
>>>> T210 will
>>>> be consistent with T186 and later.
>>> Again, I see how that's convenient. But the main difference between
>>> Tegra210 and Tegra186 is that on the former, the CSI is merged with VI,
>>> whereas on the latter the CSI is a completely separate hardware block.
>>>
>>> Since device tree describes the hardware, that difference should be
>>> apparent in the device tree. I initially thought as well that it would
>>> be advantageous if both had the same representation, but I do realize
>>> now that this has a significant impact on the device tree, and it
>>> violates the basic principles we base device tree binding design on.
>>>
>>> Thierry
>>
>> I just thought of driver implementation being common b/w T210 and=20
>> T186+ by having CSI as separate device node rather than as child node=20
>> to VI to avoid CSI structure handling within VI for T210 only.
>>
>> Will update DT and driver to have CSI as child node of VI for T210.
>>
>>
