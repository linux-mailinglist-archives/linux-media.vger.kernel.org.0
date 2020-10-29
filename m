Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C3B29F020
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 16:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbgJ2PfZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 11:35:25 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11900 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbgJ2PeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 11:34:13 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9ae0f80000>; Thu, 29 Oct 2020 08:34:16 -0700
Received: from [10.2.62.160] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 15:34:12 +0000
Subject: Re: Suggestion regarding x8 gang mode device tree changes
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Thierry Reding <treding@nvidia.com>,
        <linux-media@vger.kernel.org>
References: <e253fee3-5358-aaf1-d317-162dc8e98afc@nvidia.com>
 <1867eba2-3741-3111-140a-0ea2f018408b@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <1cfa2911-c399-0a63-dba0-f72b26c473cf@nvidia.com>
Date:   Thu, 29 Oct 2020 08:34:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1867eba2-3741-3111-140a-0ea2f018408b@xs4all.nl>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603985656; bh=NujnUePxffEg3VjthyckMNrffQSSKOt5g0DRtNeYLgY=;
        h=Subject:To:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=FQQrSV/rfdVFp93c6MfNJNjv/6iZ/XdrVvObX5N7b+xLNcvCj0DFu252I5peeyIAZ
         QiHTJq2P8EV5/WCx1onjJHn1nigRuqWi41Z08Rd6D4OmYzEwcPZCCBko/l1icb9zh3
         /cCC+CdqlT112Ao3ocqhigzl+TrbujptrQC5HkdLpliIgEh7r6afVZui60hd4XYi3g
         QaOp6uR7Y1a6mDsWoue5D6RbGoRHJqZoRYt7rJSTYO2H16wJ81cSNLCShCKX29HDfk
         HrrLrZJsPwlvjZTXAfXBRNaRGvQBfg7/33LlM1lQPY9C8Vdi/HQQ1mK4fTmAfJhqdx
         ZzslQ2+LWPgdQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 10/29/20 2:33 AM, Hans Verkuil wrote:
> On 29/10/2020 02:48, Sowjanya Komatineni wrote:
>> Hi Sakari,
>>
>> Missed to add you to below patch series for HDMI2CSI bridge support
>>
>> https://patchwork.kernel.org/project/linux-media/cover/1603768763-25590-=
1-git-send-email-skomatineni@nvidia.com/
>>
>> Patch-10 of this series is for x8 capture from HDMI2CSI bridge.
>>
>> Would like to get your suggestion on x8 gang/combined ports capture impl=
ementation.
>>
>>
>> Tegra VI/CSI don't have native x8. HDMI2CSI bridges uses dual ports with=
 split image on to each port.
>> So on Tegra side at SW level we can use dual ports as gang where both po=
rts are simultaneously programmed for combined image capture.
>>
>> Currently v2 patches use bus-width with V4L2 parallel bus type for this =
x8 gang mode implementation.
>> So, driver parses endpoint and if bus type is parallel (for x8), it uses=
 v4l2_ep.bus.parallel.bus_width other wise (x4 and below) it uses
>> v4l2_ep.bus.mipi_csi2.num_data_lanes for getting lanes from DT.
>>
>> x8 is not from native HW and current v2 version does not explicitly add =
2nd port in device tree and driver uses consecutive ports as
>> combined capture for same video device node.
>>
>>  From offline discussion with Hans, looks like its better to explicitly =
specify both ports used as gang/combined capture in device tree on
>> Tegra side and bridge side also will expose both TX ports.
>>
>> Current CSI driver implementation uses max 2 media pads port@0 as Sink a=
nd port@1 as Source. So can add 2nd endpoint in sink node and source
>> nodes.
>>
>> Below is tc358840 and csi device node change to explicitly add second so=
urce.
>>
>> With this, VI/CSI driver can be updated to use second port only for iden=
tifying total combined ports for capture.
>>
>> My understanding is there is no need for creating media links for 2nd po=
rt as both ports together are used as combined ports by the Tegra
>> driver during streaming for the same csi subdev and video device nodes.
> In my opinion both links should be shown in the media controller topology=
.
> Basically these are just independent CSI ports (two independent TX ports =
on
> the tc358840 and two independent RX ports on the Tegra SoC side), that ar=
e
> combined afterwards into a single video stream.
>
> While this is an HDMI receiver, it is conceivable to have two sensors ins=
tead
> that combine to a single 3D side-by-side image. In that case each CSI por=
t on
> the Tegra goes to a separate sensor. You want to model this.
>
> Regards,
>
> 	Hans

With 2 ports (used as combined ports on Tegra side), as they all are for=20
the same subdev and video device, exposing 2nd port and creating media=20
links will create 2 source pads and 2 sink pads.

Subdev will be same for both 2 source pads. I am trying to understand=20
the usage of creating media links for 2nd port which is used as combined=20
port with side-by-side capture thru VI for same video device node.

>> Please provide your suggestions/comments on this so I can take care of e=
xposing both combined ports in v3.
>>
>> tc358840@1f {
>>  =C2=A0=C2=A0=C2=A0 ...
>>  =C2=A0=C2=A0=C2=A0 ...
>>  =C2=A0=C2=A0=C2=A0 ports {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port@0 {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <0>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tc35=
8840_out0: endpoint {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 link-frequencies =3D /bits/ 64 <297000000>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 clock-lanes =3D <0>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 data-lanes =3D <1 2 3 4>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&tc358840_csi_in0>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port@1 {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <1>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tc35=
8840_out1: endpoint {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 link-frequencies =3D /bits/ 64 <297000000>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 clock-lanes =3D <0>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 data-lanes =3D <1 2 3 4>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&tc358840_csi_in1>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>  =C2=A0=C2=A0=C2=A0 };
>> };
>>
>> csi_chan: channel@2 {
>>  =C2=A0=C2=A0=C2=A0 reg =3D <2>=C2=A0=C2=A0=C2=A0=C2=A0 /* CSI Port No *=
/
>>  =C2=A0=C2=A0=C2=A0 ..
>>  =C2=A0=C2=A0=C2=A0 ..
>>  =C2=A0=C2=A0=C2=A0 ports {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* port@0 always for Sink pa=
ds */
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port@0 {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <0>;=C2=A0 /* Media Pad-0 (Sink) */
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tc35=
8840_csi_in0: endpoint@0 {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 reg =3D <0>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 data-lanes =3D <1 2 3 4>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&tc358840_tx0>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tc35=
8840_csi_in1: endpoint@1 {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 reg =3D <1>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 data-lanes =3D <1 2 3 4>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&tc358840_tx1>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* port@1 always Source pads=
 */
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port@1 {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <1>;=C2=A0 /* Media Pad-1 (Source) */
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tc35=
8840_csi_in0: endpoint@0 {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 reg =3D <0>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&tc358840_vi_in0>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tc35=
8840_csi_in0: endpoint@1 {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 reg =3D <1>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&tc358840_vi_in1>;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>  =C2=A0=C2=A0=C2=A0 }
>> }
>>
>>
>> Thanks
>>
>> Sowjanya
>>
