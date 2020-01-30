Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42D8414DFBE
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 18:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgA3RSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 12:18:53 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15288 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbgA3RSx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 12:18:53 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e330fe70001>; Thu, 30 Jan 2020 09:18:31 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Jan 2020 09:18:52 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 09:18:52 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 17:18:51 +0000
Subject: Re: Re: Re: [RFC PATCH v1 5/5] arm64: tegra: Add Tegra VI CSI
 suppport in device tree
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <c5fd4eb3-0026-95a5-5162-e1cf5302698e@nvidia.com>
Date:   Thu, 30 Jan 2020 09:18:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200130123607.GB2584455@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580404711; bh=6rRuO6fn19Wg171ytToc8hx1/78GmE1wrV4byzIPlWo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=d61WzRYme0iwbNnIaCphvHZ5qp8IqgyfR7PNp6tA21z27kRTsS8DO3lPiTr4blXNt
         0RtPOHuhF+cURbAza7M14t9HCsWtrVN2nUkJj82ddv5e7JRHgAktB6OKVIWBi0Ls60
         4T5cFCj1X2po5flfzkgDGNUxaDrfyBTtdnggZNObibiA5ELVl/iqmX3hlnfot0CjSI
         6tQ0k4NrBsJHHk+Bedn1wrA/cjzdnmNqC5qW+mA90N9RU145AUmKfnneNg7HV0h88+
         sBqWe8MUqAohfzbDGiO1v6m1XmMc81xpewSR2MkueWB+KYGGLrW0eJY9i24ZClHYst
         W0GwsZyVOJIEQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/30/20 4:36 AM, Thierry Reding wrote:
> On Wed, Jan 29, 2020 at 08:22:48AM -0800, Sowjanya Komatineni wrote:
>> On 1/29/20 1:46 AM, Thierry Reding wrote:
>>> On Tue, Jan 28, 2020 at 10:23:21AM -0800, Sowjanya Komatineni wrote:
>>>> Tegra210 contains VI controller for video input capture from MIPI
>>>> CSI camera sensors and also supports built-in test pattern generator.
>>>>
>>>> CSI ports can be one-to-one mapped to VI channels for capturing from
>>>> an external sensor or from built-in test pattern generator.
>>>>
>>>> This patch adds support for VI and CSI and enables them in Tegra210
>>>> device tree.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>    arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  8 +++++++
>>>>    arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 31 +++++++++++++++=
++++++++++-
>>>>    2 files changed, 38 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm=
64/boot/dts/nvidia/tegra210-p2597.dtsi
>>>> index b0095072bc28..ec1b3033fa03 100644
>>>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>>>> @@ -10,6 +10,14 @@
>>>>    			status =3D "okay";
>>>>    		};
>>>> +		vi@54080000 {
>>>> +			status =3D "okay";
>>>> +		};
>>>> +
>>>> +		csi@0x54080838 {
>>>> +			status =3D "okay";
>>>> +		};
>>>> +
>>>>    		sor@54580000 {
>>>>    			status =3D "okay";
>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boo=
t/dts/nvidia/tegra210.dtsi
>>>> index 48c63256ba7f..c6107ec03ad1 100644
>>>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>> @@ -136,9 +136,38 @@
>>>>    		vi@54080000 {
>>>>    			compatible =3D "nvidia,tegra210-vi";
>>>> -			reg =3D <0x0 0x54080000 0x0 0x00040000>;
>>>> +			reg =3D <0x0 0x54080000 0x0 0x808>;
>>>>    			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>>>>    			status =3D "disabled";
>>>> +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_VI>;
>>>> +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
>>>> +
>>>> +			clocks =3D <&tegra_car TEGRA210_CLK_VI>;
>>>> +			clock-names =3D "vi";
>>>> +			resets =3D <&tegra_car 20>;
>>>> +			reset-names =3D "vi";
>>>> +		};
>>>> +
>>>> +		csi@0x54080838 {
>>>> +			compatible =3D "nvidia,tegra210-csi";
>>>> +			reg =3D <0x0 0x54080838 0x0 0x2000>;
>>>> +			status =3D "disabled";
>>>> +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_CILAB>,
>>>> +					  <&tegra_car TEGRA210_CLK_CILCD>,
>>>> +					  <&tegra_car TEGRA210_CLK_CILE>;
>>>> +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_P>,
>>>> +						 <&tegra_car TEGRA210_CLK_PLL_P>,
>>>> +						 <&tegra_car TEGRA210_CLK_PLL_P>;
>>>> +			assigned-clock-rates =3D <102000000>,
>>>> +					       <102000000>,
>>>> +					       <102000000>;
>>>> +
>>>> +			clocks =3D <&tegra_car TEGRA210_CLK_CSI>,
>>>> +				 <&tegra_car TEGRA210_CLK_CILAB>,
>>>> +				 <&tegra_car TEGRA210_CLK_CILCD>,
>>>> +				 <&tegra_car TEGRA210_CLK_CILE>;
>>>> +			clock-names =3D "csi", "cilab", "cilcd", "cile";
>>>> +
>>>>    		};
>>> Can this be a child of the vi node? Looking at the register ranges it
>>> seems like these are actually a single IP block. If they have separate
>>> blocks with clearly separate functionality, then it makes sense to have
>>> CSI be a child node of VI, though it may also be okay to merge both and
>>> have a single node with the driver doing all of the differentiation
>>> between what's VI and what's CSI.
>>>
>>> Looking at later chips, the split between VI and CSI is more explicit,
>>> so having the split in DT for Tegra210 may make sense for consistency.
>>>
>>> I know we've discussed this before, but for some reason I keep coming
>>> back to this. I'll go through the other patches to see if I can get a
>>> clearer picture of how this could all work together.
>>>
>>> Thierry
>> We can keep it separate as we discussed.
>>
>> But as Tegra186 onwards, CSI is separate device to be all cosistent I ke=
pt
>> CSI as separate node for Tegra210 as well.
>  From our discussion, my understanding was that CSI would be a separate
> device, but it would still be a subdevice of VI. The address offset of
> the CSI registers not being aligned to a power of two is a strong
> indication that this is really all part of the same block.

Yes our earlier discussion is to have CSI as subdevice.

Later looking into T186 and later NVCSI is totally separate so it will=20
be separate device and to have driver common moved Tegra210 CSI also as=20
separate device instead of having it as subdevice of VI.

Earlier when we discussed at that time I am using TPG also from device=20
graphs but not moved to hard media links inside driver for TPG.

For this we need CSI to be available prior to VI. If we add CSI as=20
subdevice to VI, CSI will not be available by the time VI init happens.

Currently host1x subdevices listed has CSI before VI and CSI init=20
happens earlier so by the time VI init happens CSI is available to do=20
media links b/w VI video entity and CSI subdevice entity.

Also having CSI as separate subdevice (not as subdevice to VI) for T210=20
will be consistent with T186 and later.

Having CSI as subdevice in DT will be good even when we add sensor support.


>
> Looking at this again, I'm having second thoughts about even that
> suggestion. It wouldn't be technically wrong to have an additional
> subdevice for CSI, but I don't think it's really necessary.
>
> Now, given that the DT part is going to be somewhat crucial because it
> will be ABI once merged, I'd like to make sure we're not painting
> ourselves into a corner. Could you post a few examples of how this
> currently looks? In addition to this TPG-only example, do you have a
> variant of what it looks with the current proposal? I can only find an
> example of the CSI-as-subdevice-of-VI that we had discussed earlier.
>
> Thierry

Here's sample of DT how it looks when we add sensor support

vi@54080000 {
 =A0=A0=A0=A0 status =3D "okay";
 =A0=A0=A0=A0 ports {
 =A0=A0=A0 =A0=A0=A0 =A0=A0 #address-cells =3D <1>;
 =A0=A0=A0 =A0=A0=A0 =A0=A0 #size-cells =3D <0>;
 =A0=A0=A0 =A0=A0=A0 =A0=A0 imx274_vi_port0: port@0 {
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 reg =3D <0>;
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 imx274_vi_in0: endpoint {
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 remote-endpoin=
t =3D <&imx274_csi_out0>;
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 };
 =A0=A0=A0 =A0=A0=A0 =A0=A0 };
 =A0=A0=A0 };
};

csi@0x54080838 {
 =A0=A0=A0=A0 status =3D "okay";
 =A0=A0=A0=A0 #address-cells =3D <1>;
 =A0=A0=A0=A0 #size-cells =3D <0>;
 =A0=A0=A0=A0 csi_chan0: channel@0 {
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0 reg =3D <0>;
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0 nvidia,mipi-calibrate =3D <&mipi 0x003>; =
/* CSI-AB */
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0 ports {
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 #address-cells =3D <1>;
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 #size-cells =3D <0>;
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 csi_chan0_port0: port@0 =
{
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 re=
g =3D <0>;
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 im=
x274_csi_in0: endpoint@0 {
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 remote-endpoint =3D <&imx274_out0>;
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 };
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 };
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 csi_chan0_port1: port@1 =
{
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 re=
g =3D <1>;
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 im=
x274_csi_out0: endpoint@1 {
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 remote-endpoint =3D <&imx274_vi_in0>;
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0=A0 };
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 };
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 };
 =A0=A0=A0 };
};
