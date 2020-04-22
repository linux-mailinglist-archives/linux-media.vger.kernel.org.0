Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECE51B4C4D
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 19:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgDVR5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 13:57:43 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6640 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgDVR5n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 13:57:43 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea085570005>; Wed, 22 Apr 2020 10:56:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 22 Apr 2020 10:57:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 22 Apr 2020 10:57:42 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 17:57:41 +0000
Received: from [10.2.165.49] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 17:57:40 +0000
Subject: Re: [RFC PATCH v9 5/9] dt-binding: tegra: Add VI and CSI bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>, <sakari.ailus@iki.fi>,
        <helen.koike@collabora.com>, <digetx@gmail.com>,
        <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-6-git-send-email-skomatineni@nvidia.com>
 <20200422172047.GA18765@pendragon.ideasonboard.com>
 <1ae63b2e-17f0-ca0e-23fa-9aa63eafe01b@nvidia.com>
 <20200422174750.GH28105@pendragon.ideasonboard.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <938ba9b4-8536-03bb-33cf-17e1e562f4a5@nvidia.com>
Date:   Wed, 22 Apr 2020 10:57:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200422174750.GH28105@pendragon.ideasonboard.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587578199; bh=GOkEq/en4uaWTGWysI7sftRGwOHMVKfshIZD0fCCsP4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=K2j0qYCn62PWQVqdlKpjJLc0SyIdawwjVNaUdwa8m5X8Y7j14QYkLIdkyEJ8pXqyW
         xDrbLswxCdyf8ZOAa9HYQd0SDkS84YcUiD5yaWjtCyDKZkKCF7cIAtykfkH+n5+fIB
         udGbZ0OaajkPFM1UJh1PhUvdJrZ4w1Xqfr7bvSslIA4hSAj+44dkyM9056ekaHhc2X
         Ja2qHu2e9zpKbhULFyTazuVopskyAYjzrDqRsV5nUsVwRCZ6EPEZkmGXZthams39vG
         prUNKeeqj5HVU8XqCJX+Y8LQ3D2jBVVnW4LmgeuQfH8cY4chGxXWBxa+emMrDfrwqf
         9qinoGEXBwzkA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/22/20 10:47 AM, Laurent Pinchart wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sowjanya,
>
> On Wed, Apr 22, 2020 at 10:26:20AM -0700, Sowjanya Komatineni wrote:
>> On 4/22/20 10:20 AM, Laurent Pinchart wrote:
>>> On Tue, Apr 21, 2020 at 11:18:55PM -0700, Sowjanya Komatineni wrote:
>>>> Tegra contains VI controller which can support up to 6 MIPI CSI
>>>> camera sensors.
>>>>
>>>> Each Tegra CSI port from CSI unit can be one-to-one mapper to
>>>> VI channel and can capture from an external camera sensor or
>>>> from built-in test pattern generator.
>>>>
>>>> This patch adds dt-bindings for Tegra VI and CSI.
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>    .../display/tegra/nvidia,tegra20-host1x.txt        | 73 +++++++++++=
+++++++----
>>>>    1 file changed, 60 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-host1x.txt
>>>> index 9999255..4731921 100644
>>>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-h=
ost1x.txt
>>>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-h=
ost1x.txt
>>>> @@ -40,14 +40,30 @@ of the following host1x client modules:
>>>>
>>>>      Required properties:
>>>>      - compatible: "nvidia,tegra<chip>-vi"
>>>> -  - reg: Physical base address and length of the controller's registe=
rs.
>>>> +  - reg: Physical base address and length of the controller registers=
.
>>>>      - interrupts: The interrupt outputs from the controller.
>>>> -  - clocks: Must contain one entry, for the module clock.
>>>> +  - clocks: clocks: Must contain one entry, for the module clock.
>>>>        See ../clocks/clock-bindings.txt for details.
>>>> -  - resets: Must contain an entry for each entry in reset-names.
>>>> -    See ../reset/reset.txt for details.
>>>> -  - reset-names: Must include the following entries:
>>>> -    - vi
>>>> +  - Tegra20/Tegra30/Tegra114/Tegra124:
>>>> +    - resets: Must contain an entry for each entry in reset-names.
>>>> +      See ../reset/reset.txt for details.
>>>> +    - reset-names: Must include the following entries:
>>>> +      - vi
>>>> +  - Tegra210:
>>>> +    - power-domains: Must include venc powergate node as vi is in VE =
partition.
>>>> +  - Tegra210 has CSI part of VI sharing same host interface and regis=
ter space.
>>>> +    So, VI device node should have CSI child node.
>>>> +
>>>> +    - csi: mipi csi interface to vi
>>>> +
>>>> +      Required properties:
>>>> +      - compatible: "nvidia,tegra210-csi"
>>>> +      - reg: Physical base address offset to parent and length of the=
 controller
>>>> +        registers.
>>>> +      - clocks: Must contain entries csi, cilab, cilcd, cile, csi_tpg=
 clocks.
>>>> +        See ../clocks/clock-bindings.txt for details.
>>>> +      - power-domains: Must include sor powergate node as csicil is i=
n
>>>> +        SOR partition.
>>> A bit of a stupid question maybe, but why is this needed ? Can't the
>>> driver that handles the vi DT node ("nvidia,tegra20-vi") handle all the
>>> registers for all the sub-blocks ? Can't we move the clocks and power
>>> domains from the CSI node to the VI node ?
>> CSI is separate device driver and VI is separate device driver.
> That's fine, but that's a software design decision, it should not affect
> the DT bindings. It's possible (even if I don't necessarily recommend
> doing so) to create a platform device manually in the VI driver to get
> it bound to the CSI driver. In any case DT should describe the system
> architecture and shouldn't be influenced by hardware design.

CSI is a separate device for Tegra186 onwards and VI/CSI is common driver.

DT bindings reflects the chip design. Also clocks and power domain for=20
CSI and VI are different and CSI is separate device.

>
>> For T210, CSI shares register space under VI but for later Tegras its
>> separate register space.
> This is useful information. How about interrupts though ? You don't
> specify any interrupt line here, how are the CSI interrutps handled ?

All frame events are through syncpoint HW like mentioned in earlier=20
feedbacks.

This driver synchronizes capture events through host1x syncpt

>
>> So CSI and VI drivers are separate with their corresponding clocks and
>> power domains in their nodes.
>>
>>> Regardless of the answer to this question, I think this is missing port
>>> nodes for the physical CSI-2 inputs, to connect them to sensors. I
>>> haven't seen anywhere in this series how a CSI-2 sensor is linked to th=
e
>>> VI.
>> This patch series is only for Tegra internal TPG and tegra video driver
>> creates hard media links between CSI and VI,
> Could you share the output of media-ctl --print-dot to show how this
> looks like ?


digraph board {
rankdir=3DTB
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000001 [label=3D"{{} | tpg-0=
\n | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000001:port0 -> n00000003
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000003 [label=3D"54080000.vi=
-output-0\n/dev/video0",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000009 [label=3D"{{} | tpg-1=
\n | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000009:port0 -> n0000000b
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000000b [label=3D"54080000.vi=
-output-1\n/dev/video1",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000011 [label=3D"{{} | tpg-2=
\n | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000011:port0 -> n00000013
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000013 [label=3D"54080000.vi=
-output-2\n/dev/video2",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000019 [label=3D"{{} | tpg-3=
\n | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000019:port0 -> n0000001b
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000001b [label=3D"54080000.vi=
-output-3\n/dev/video3",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000021 [label=3D"{{} | tpg-4=
\n | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000021:port0 -> n00000023
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000023 [label=3D"54080000.vi=
-output-4\n/dev/video4",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000029 [label=3D"{{} | tpg-5=
\n | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000029:port0 -> n0000002b
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000002b [label=3D"54080000.vi=
-output-5\n/dev/video5",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
}


>
>> Sensor support will be in Series-2 where port nodes will be used for
>> real sensor <-> csi <-> vi endpoints
>>
>>>>    - epp: encoder pre-processor
>>>>
>>>> @@ -309,13 +325,44 @@ Example:
>>>>                         reset-names =3D "mpe";
>>>>                 };
>>>>
>>>> -             vi {
>>>> -                     compatible =3D "nvidia,tegra20-vi";
>>>> -                     reg =3D <0x54080000 0x00040000>;
>>>> -                     interrupts =3D <0 69 0x04>;
>>>> -                     clocks =3D <&tegra_car TEGRA20_CLK_VI>;
>>>> -                     resets =3D <&tegra_car 100>;
>>>> -                     reset-names =3D "vi";
>>>> +             vi@54080000 {
>>>> +                     compatible =3D "nvidia,tegra210-vi";
>>>> +                     reg =3D <0x0 0x54080000 0x0 0x700>;
>>>> +                     interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>>>> +                     assigned-clocks =3D <&tegra_car TEGRA210_CLK_VI>=
;
>>>> +                     assigned-clock-parents =3D <&tegra_car TEGRA210_=
CLK_PLL_C4_OUT0>;
>>>> +
>>>> +                     clocks =3D <&tegra_car TEGRA210_CLK_VI>;
>>>> +                     power-domains =3D <&pd_venc>;
>>>> +
>>>> +                     #address-cells =3D <1>;
>>>> +                     #size-cells =3D <1>;
>>>> +
>>>> +                     ranges =3D <0x0 0x0 0x54080000 0x2000>;
>>>> +
>>>> +                     csi@838 {
>>>> +                             compatible =3D "nvidia,tegra210-csi";
>>>> +                             reg =3D <0x838 0x1300>;
>>>> +                             assigned-clocks =3D <&tegra_car TEGRA210=
_CLK_CILAB>,
>>>> +                                               <&tegra_car TEGRA210_C=
LK_CILCD>,
>>>> +                                               <&tegra_car TEGRA210_C=
LK_CILE>,
>>>> +                                               <&tegra_car TEGRA210_C=
LK_CSI_TPG>;
>>>> +                             assigned-clock-parents =3D <&tegra_car T=
EGRA210_CLK_PLL_P>,
>>>> +                                                      <&tegra_car TEG=
RA210_CLK_PLL_P>,
>>>> +                                                      <&tegra_car TEG=
RA210_CLK_PLL_P>;
>>>> +                             assigned-clock-rates =3D <102000000>,
>>>> +                                                    <102000000>,
>>>> +                                                    <102000000>,
>>>> +                                                    <972000000>;
>>>> +
>>>> +                             clocks =3D <&tegra_car TEGRA210_CLK_CSI>=
,
>>>> +                                      <&tegra_car TEGRA210_CLK_CILAB>=
,
>>>> +                                      <&tegra_car TEGRA210_CLK_CILCD>=
,
>>>> +                                      <&tegra_car TEGRA210_CLK_CILE>,
>>>> +                                      <&tegra_car TEGRA210_CLK_CSI_TP=
G>;
>>>> +                             clock-names =3D "csi", "cilab", "cilcd",=
 "cile", "csi_tpg";
>>>> +                             power-domains =3D <&pd_sor>;
>>>> +                     };
>>>>                 };
>>>>
>>>>                 epp {
> --
> Regards,
>
> Laurent Pinchart
