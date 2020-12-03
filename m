Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933D02CDB2D
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 17:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbgLCQ1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 11:27:02 -0500
Received: from gw.c-home.cz ([89.24.150.100]:34736 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726811AbgLCQ1C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 11:27:02 -0500
Received: from dmz.c-home.cz (localhost [127.0.0.1])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 0B3GPO9u008783;
        Thu, 3 Dec 2020 17:25:29 +0100 (CET)
Received: from localhost (martin@localhost)
        by dmz.c-home.cz (8.14.4+Sun/8.14.4/Submit) with ESMTP id 0B3GPLrf008777;
        Thu, 3 Dec 2020 17:25:22 +0100 (CET)
X-Authentication-Warning: dmz.c-home.cz: martin owned process doing -bs
Date:   Thu, 3 Dec 2020 17:25:21 +0100 (CET)
From:   Martin Cerveny <martin@c-home.cz>
Reply-To: Martin Cerveny <M.Cerveny@computer.org>
To:     Chen-Yu Tsai <wens@csie.org>
cc:     Martin Cerveny <m.cerveny@computer.org>,
        Maxime Ripard <mripard@kernel.org>, devel@driverdev.osuosl.org,
        devicetree <devicetree@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v3 3/6] ARM: dts: sun8i: v3s: Add node for system
 control
In-Reply-To: <CAGb2v66T9aakxRQNBbA+=EC-d5EpmUrZSK5xTW=orK6Z7PyG9Q@mail.gmail.com>
Message-ID: <alpine.GSO.2.00.2012031617500.7044@dmz.c-home.cz>
References: <20201116125617.7597-1-m.cerveny@computer.org> <20201116125617.7597-4-m.cerveny@computer.org> <CAGb2v66T9aakxRQNBbA+=EC-d5EpmUrZSK5xTW=orK6Z7PyG9Q@mail.gmail.com>
User-Agent: Alpine 2.00 (GSO 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello.

On Thu, 3 Dec 2020, Chen-Yu Tsai wrote:

> Hi,
>
> On Mon, Nov 16, 2020 at 8:57 PM Martin Cerveny <m.cerveny@computer.org> wrote:
>>
>> Allwinner V3s has system control and SRAM C1 region similar to H3.
>>
>> Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
>> ---
>>  arch/arm/boot/dts/sun8i-v3s.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
>> index 0c7341676921..70193512c222 100644
>> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
>> @@ -161,6 +161,20 @@ syscon: system-control@1c00000 {
>>                         #address-cells = <1>;
>>                         #size-cells = <1>;
>>                         ranges;
>> +
>> +                       sram_c: sram@1d00000 {
>> +                               compatible = "mmio-sram";
>> +                               reg = <0x01d00000 0x80000>;
>
> How was this address derived? Did you check that there is actually SRAM here?

Yes, I did some checking (mmap). But I repeated measurement and found 
mirrored regions:

- SRAM_C is mirrored from 0x0000_4000 (primary location) to 0x01d0_4000 (size 0xb000)
   (probably exact size is 0xb0c0)
- rest of 0x01d0_0000 are discontinuously filled with R/W register sets
   (probably some internals registers from VE) that I thought to be SRAM too
- register SRAM_CTRL_REG0==0x01c00_0000 (value 0x7fff_ffff) switch whole
   region 0x01d0_0000-0x01df_ffff __AND__ 0x0000_4000-0x0000_ffff
- VE/cedrus code use this regions indirectly
   (VE_AVC_SRAM_PORT_OFFSET/VE_AVC_SRAM_PORT_DATA...)
   and it is not influenced by "true" SRAM mapping or size

-> so I suppose to better use only SRAM_C lower definition:

---
diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index e8f304125e2d..90d703e5b73b 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -162,17 +162,17 @@ syscon: system-control@1c00000 {
  			#size-cells = <1>;
  			ranges;

-			sram_c: sram@1d00000 {
+			sram_c: sram@4000 {
  				compatible = "mmio-sram";
-				reg = <0x01d00000 0x80000>;
+				reg = <0x4000 0xb000>;
  				#address-cells = <1>;
  				#size-cells = <1>;
-				ranges = <0 0x01d00000 0x80000>;
+				ranges = <0 0 0x4000 0xb000>;

  				ve_sram: sram-section@0 {
  					compatible = "allwinner,sun8i-v3s-sram-c1",
  						     "allwinner,sun4i-a10-sram-c1";
-					reg = <0x000000 0x80000>;
+					reg = <0x0 0xb000>;
  				};
  			};
  		};
---

Does someone have accessible specific documentation of VE/cedrus for V3s ?

Regards, Martin

> ChenYu
>
>> +                               #address-cells = <1>;
>> +                               #size-cells = <1>;
>> +                               ranges = <0 0x01d00000 0x80000>;
>> +
>> +                               ve_sram: sram-section@0 {
>> +                                       compatible = "allwinner,sun8i-v3s-sram-c1",
>> +                                                    "allwinner,sun4i-a10-sram-c1";
>> +                                       reg = <0x000000 0x80000>;
>> +                               };
>> +                       };
>>                 };
>>
>>                 tcon0: lcd-controller@1c0c000 {
>> --
>> 2.25.1
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
