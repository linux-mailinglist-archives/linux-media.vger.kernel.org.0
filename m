Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66012CFDE2
	for <lists+linux-media@lfdr.de>; Sat,  5 Dec 2020 19:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbgLESpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Dec 2020 13:45:34 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:38659 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726844AbgLEQrp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 5 Dec 2020 11:47:45 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 0EAEE764;
        Sat,  5 Dec 2020 11:32:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 05 Dec 2020 11:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        to:cc:references:from:subject:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=x
        NUdODL65lR5S1XXZ1801IZLJZ+2fkKKMPiqtEeplEk=; b=TsbUXV+Ft57FpkUPV
        THSaIOis/gi+FjJeym7xUu14WLJfaxrYJkjABd3mXnx2H9FFFoNxzaLKIF5WwVaC
        OrdvOv7s8EjYK0LZ79lG8b8K4Ai+a0kUtH/yqUXcc5VPI1sl9qmnecNWkevYrFUP
        31cwO74/y3OpO/Wn2Xgp0jcW4Al9m7I871lXXySJPpB1un3+dTwPzOg5bc6l/vet
        tf+hZybsnEI+B3NcULLLEMHIyYhW8lfzi/ibV/wG38UPelDYVh1J1ctqRuFOVqv0
        iY5LFtUVsc3uiYJtYw2u1J/KgU7KgX0SuTOheqGLvKEGXP8L0AOQQZ8QMsKZmujw
        hjJHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=xNUdODL65lR5S1XXZ1801IZLJZ+2fkKKMPiqtEepl
        Ek=; b=BdNh+MC0OOTuzVk5POPma17FWA1t8oZsV/qiP5MDIEIYk4NxQ9EoDRgRN
        HdwV5Ggb3+FHFC6Z4oY9EqVN2gVzc/HIBse+LzLEBAhHx3iqo39Op84h3jy1EyGs
        x3D8Ws+sxBe8hUnsS/bl4cwVxtU+kX36Bzb0hnJA/de3Xrcz067Ei1pvuO/gspAF
        JhNWCMxaJC6ez5ydKi3bwI5LhXQJMUktn16v8HNZjlahoQ0xunAhYbwGochjhMR/
        xk+80Y0JRmZ3o/PP1oYAOtuIvK+UzPZkDy5XYGQfiOSeWm9SZQcL018Z8ByrQpMm
        oDCmijVZrYZz/5WRJPW5uszgXDEIg==
X-ME-Sender: <xms:BrbLXwHMd0Vgdwqe7ayHWqEnk3k2J91CyjJpgyDdr_4CFQgQJS5_0w>
    <xme:BrbLX8nKtFh6-5al4c-mZ-wPukRzQSbJd58GVN4Az67WqZEqLWsvRbuKJnvzHj1wI
    ri2oKt1p16m23Bdmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejtddgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepteelvddugfehtefgueegueeiieevfeehleefjeelhefgffejteej
    tdeltdfgfeetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpihhnfhhrrgguvggrug
    drohhrghenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnug
    drohhrgh
X-ME-Proxy: <xmx:BrbLXzlxQVs5H0vKhCm_UZKoASzHWbk8ilrGwiDJoyX0hxYAZc1fJA>
    <xmx:BrbLX9vmg9-erJuBu0zTsSxXbDkXclPxTnVwpEcZv9eeg1EQ9u0Sng>
    <xmx:BrbLX2mOB3OUNZBsbAIrhaqQc7iGVJDeFCgBa5l4F_38EhIUFZYBLg>
    <xmx:CLbLX-tOYYpy1qwJ3naJfD7b2sk6VldMnUwMev9GThYfsziNzK2uenJlASI>
Received: from [70.135.148.151] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2A0C91080069;
        Sat,  5 Dec 2020 11:32:06 -0500 (EST)
To:     Chen-Yu Tsai <wens@csie.org>,
        Martin Cerveny <M.Cerveny@computer.org>
Cc:     devel@driverdev.osuosl.org,
        devicetree <devicetree@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20201116125617.7597-1-m.cerveny@computer.org>
 <20201116125617.7597-4-m.cerveny@computer.org>
 <CAGb2v66T9aakxRQNBbA+=EC-d5EpmUrZSK5xTW=orK6Z7PyG9Q@mail.gmail.com>
 <alpine.GSO.2.00.2012031617500.7044@dmz.c-home.cz>
 <CAGb2v65Kb1BrdwKjMv9w1CNQpe=ExpN1d-yUSvZ6TA=fvgE5og@mail.gmail.com>
From:   Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 3/6] ARM: dts: sun8i: v3s: Add node for system control
Message-ID: <f09e7beb-bcf6-83b2-4148-b6d5218ff5ee@sholland.org>
Date:   Sat, 5 Dec 2020 10:32:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAGb2v65Kb1BrdwKjMv9w1CNQpe=ExpN1d-yUSvZ6TA=fvgE5og@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/3/20 10:44 AM, Chen-Yu Tsai wrote:
> On Fri, Dec 4, 2020 at 12:25 AM Martin Cerveny <martin@c-home.cz> wrote:
>>
>> Hello.
>>
>> On Thu, 3 Dec 2020, Chen-Yu Tsai wrote:
>>
>>> Hi,
>>>
>>> On Mon, Nov 16, 2020 at 8:57 PM Martin Cerveny <m.cerveny@computer.org> wrote:
>>>>
>>>> Allwinner V3s has system control and SRAM C1 region similar to H3.
>>>>
>>>> Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
>>>> ---
>>>>  arch/arm/boot/dts/sun8i-v3s.dtsi | 14 ++++++++++++++
>>>>  1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
>>>> index 0c7341676921..70193512c222 100644
>>>> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
>>>> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
>>>> @@ -161,6 +161,20 @@ syscon: system-control@1c00000 {
>>>>                         #address-cells = <1>;
>>>>                         #size-cells = <1>;
>>>>                         ranges;
>>>> +
>>>> +                       sram_c: sram@1d00000 {
>>>> +                               compatible = "mmio-sram";
>>>> +                               reg = <0x01d00000 0x80000>;
>>>
>>> How was this address derived? Did you check that there is actually SRAM here?
>>
>> Yes, I did some checking (mmap). But I repeated measurement and found
>> mirrored regions:
>>
>> - SRAM_C is mirrored from 0x0000_4000 (primary location) to 0x01d0_4000 (size 0xb000)
>>    (probably exact size is 0xb0c0)
>> - rest of 0x01d0_0000 are discontinuously filled with R/W register sets
>>    (probably some internals registers from VE) that I thought to be SRAM too
>> - register SRAM_CTRL_REG0==0x01c00_0000 (value 0x7fff_ffff) switch whole
>>    region 0x01d0_0000-0x01df_ffff __AND__ 0x0000_4000-0x0000_ffff
>> - VE/cedrus code use this regions indirectly
>>    (VE_AVC_SRAM_PORT_OFFSET/VE_AVC_SRAM_PORT_DATA...)
>>    and it is not influenced by "true" SRAM mapping or size
> 
> Could you add this to your commit log? That would make the information
> available to others, and you could mention that you only added the
> location that is contiguous SRAM without the interspersed registers.
> 
> So based on this, and what we've seen with the H616, I'm guessing
> 0x01d0_0000 - 0x01df_ffff exposes all the internal guts of the VE,
> while SRAM C @ 0x4000 just maps a small portion out.
> 
>> -> so I suppose to better use only SRAM_C lower definition:
> 
> Yes that would be more appropriate, as it matches the manual, and as you
> mentioned, is *real* SRAM.

My reading of the manual and comments in the BSP U-Boot is that the high
address near the VE registers is the "real" address. The alternate SRAM
mapping just past the end of SRAM A1 exists specifically so the boot ROM
can load boot0/TOC0 images larger than would fit in SRAM A1.

I don't have a copy of the V3s BROM, but here's the logic from the
beginning of the H6 SBROM, which first enables the VE bus clock and
reset before mapping the SRAM:

; VE_BGR_REG |= BIT(16)
     2dc:  e59f113c  ldr r1, [pc, #316] ; 420
     2e0:  e5912000  ldr r2, [r1]
     2e4:  e3a03801  mov r3, #65536 ; 0x10000
     2e8:  e1822003  orr r2, r2, r3
     2ec:  e5812000  str r2, [r1]
; VE_BGR_REG |= BIT(0)
     2f0:  e59f1128  ldr r1, [pc, #296] ; 420
     2f4:  e5912000  ldr r2, [r1]
     2f8:  e3a03001  mov r3, #1
     2fc:  e1822003  orr r2, r2, r3
     300:  e5812000  str r2, [r1]
; SRAM_CTRL_REG0 &= BIT(31)
     304:  e3a01403  mov r1, #50331648 ; 0x3000000
     308:  e5912000  ldr r2, [r1]
     30c:  e3c220ff  bic r2, r2, #255 ; 0xff
     310:  e3c22cff  bic r2, r2, #65280 ; 0xff00
     314:  e3c228ff  bic r2, r2, #16711680 ; 0xff0000
     318:  e3c2247f  bic r2, r2, #2130706432 ; 0x7f000000
     31c:  e5812000  str r2, [r1]
; SRAM_CTRL_REG1 = BIT(24) | BIT(0)
     320:  e59f10fc  ldr r1, [pc, #252] ; 424
     324:  e3a02401  mov r2, #16777216 ; 0x1000000
     328:  e1822003  orr r2, r2, r3
     32c:  e5812000  str r2, [r1]
...
     420:  .word 0300169c
     424:  .word 03000004

Then U-Boot SPL[1] sets the SRAM back to "normal mode" before turning
off the VE gating and reset:

	//VE SRAM:set sram to normal mode, default boot mode
	reg_val = readl(SUNXI_SYSCRL_BASE+0X0004);
	reg_val &= ~(0x1<<24);
	writel(reg_val, SUNXI_SYSCRL_BASE+0X0004);

	//VE gating&VE Bus Reset :brom set them, but not require now
	reg_val = readl(CCMU_VE_BGR_REG);
	reg_val &= ~(0x1<<0);
	reg_val &= ~(0x1<<16);
	writel(reg_val, CCMU_VE_BGR_REG);

Other SoCs have a similar code to unmap SRAM C[2]. The AHB1 bus clock
frequency limitation makes sense given that it has to go through the VE
hardware block to get to the SRAM.

In fact, the AHB1 clock limitation when using the low mapping should be
reason enough to prefer the high mapping.

Cheers,
Samuel

[1]:
https://github.com/Allwinner-Homlet/H6-BSP4.9-brandy/blob/master/u-boot-2014.07/board/sunxi/sun50iw6p1/sun50iw6p1.c#L60
[2]:
https://github.com/Allwinner-Homlet/H6-BSP4.9-brandy/blob/master/u-boot-2014.07/board/sunxi/sun8iw10p1/sun8iw10p1.c#L75

>> ---
>> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
>> index e8f304125e2d..90d703e5b73b 100644
>> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
>> @@ -162,17 +162,17 @@ syscon: system-control@1c00000 {
>>                         #size-cells = <1>;
>>                         ranges;
>>
>> -                       sram_c: sram@1d00000 {
>> +                       sram_c: sram@4000 {
>>                                 compatible = "mmio-sram";
>> -                               reg = <0x01d00000 0x80000>;
>> +                               reg = <0x4000 0xb000>;
>>                                 #address-cells = <1>;
>>                                 #size-cells = <1>;
>> -                               ranges = <0 0x01d00000 0x80000>;
>> +                               ranges = <0 0 0x4000 0xb000>;
>>
>>                                 ve_sram: sram-section@0 {
>>                                         compatible = "allwinner,sun8i-v3s-sram-c1",
>>                                                      "allwinner,sun4i-a10-sram-c1";
>> -                                       reg = <0x000000 0x80000>;
>> +                                       reg = <0x0 0xb000>;
>>                                 };
>>                         };
>>                 };
>> ---
>>
>> Does someone have accessible specific documentation of VE/cedrus for V3s ?
> 
> I doubt such information exists.
> 
> 
> Regards
> ChenYu
> 
>> Regards, Martin
>>
>>> ChenYu
>>>
>>>> +                               #address-cells = <1>;
>>>> +                               #size-cells = <1>;
>>>> +                               ranges = <0 0x01d00000 0x80000>;
>>>> +
>>>> +                               ve_sram: sram-section@0 {
>>>> +                                       compatible = "allwinner,sun8i-v3s-sram-c1",
>>>> +                                                    "allwinner,sun4i-a10-sram-c1";
>>>> +                                       reg = <0x000000 0x80000>;
>>>> +                               };
>>>> +                       };
>>>>                 };
>>>>
>>>>                 tcon0: lcd-controller@1c0c000 {
>>>> --
>>>> 2.25.1
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-arm-kernel mailing list
>>>> linux-arm-kernel@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>>
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

