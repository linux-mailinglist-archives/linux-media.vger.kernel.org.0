Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFDB1B5A23
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 13:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgDWLM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 07:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726805AbgDWLMZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 07:12:25 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D0AC035494;
        Thu, 23 Apr 2020 04:12:25 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g12so6097530wmh.3;
        Thu, 23 Apr 2020 04:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bxYSxdYwcXc6p7kPweonk+RqgS5u92HacX+d8Hknp8w=;
        b=m8uwcZY2w3V/NUn1S7/3puo8tm4KGsYlcltRYEaBJfs5yo/KAhIrQ8a0RbLQ4H2HkC
         69cRz/4+7tgAUnFTt3WaNdvjiN265ZpkME/0IsvhR0wJ1/mCVQYdvZ8IBph7tOeK68uh
         0nZI+/d/ww+t/fNY4amVEeRB9kOHXTs8gaoVvw+68Bc5S34QH1xmibH+fX4YPjkpcfy8
         PJex+Ze9DsIid7poXiLvw6JjS34hKqi0H0SzVeCwhqWPBuj1+3+uja/B+xm3i9l2pyh0
         lXbqVD6zZgH5dEDM4e4kp1DwWbup01cX/myaS8C3e2JY6JqqPV3PqWy4WLwIiI5zKeVu
         i8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bxYSxdYwcXc6p7kPweonk+RqgS5u92HacX+d8Hknp8w=;
        b=fYIC0+JiP06mJ5Zr0AJRHuwpMcFHGbW8zZ01szl+E/LYHiTg7RahvxisTW7zBbVrqd
         mn1f02q9v2R0ShWpN4BHr6r6etlsmjhY57XC6Cxl6l9xOjrLUb/0vC4vD1cu9kMlqrXa
         vB1o2m4NqYk16WGf4EYNugPR1BEzHj6qPjXcbM4WzlKV1LIHhMd6dKqFwm6RPek2MDWl
         qEXdI8Jg3ddSDv5c/nCilAVlG9HP5j3OENosieHbo16Vd049JTKb6qek7X/KZpPfLQjk
         lEn48zi9P1oxSIg7hkCuhVKVHs6urscW60DG0ZKr4/klyQRaj6FOvBDZF0G7lXnvkm4+
         qQhQ==
X-Gm-Message-State: AGi0PuZilMdtKEWPrXEvMm0SnXSx3AC9nTbiRiY2qBBEt0LVRv2qTWns
        5HwI4W8o4ckuok6AlkoOqFY2WdTX
X-Google-Smtp-Source: APiQypIYhN6tMBpUfx0YFUtGTxS8oFi+CP08Gt2smdXlLPjkiye0Xa8KXYom/+lhppWn0l0NiA9l0g==
X-Received: by 2002:a7b:c927:: with SMTP id h7mr3574245wml.122.1587640343491;
        Thu, 23 Apr 2020 04:12:23 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id n9sm3240829wrx.61.2020.04.23.04.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 04:12:22 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: add rk3288 ISP and DPHY
To:     karthik poduval <karthik.poduval@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        heiko@sntech.de, linux-rockchip@lists.infradead.org,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <karthik.poduval@gmail.com>
 <20200406073017.19462-1-karthik.poduval@gmail.com>
 <20200406073017.19462-4-karthik.poduval@gmail.com>
 <2fc95890-f938-30a5-a163-bf3fa2e223df@gmail.com>
 <CAFP0Ok-NxDDF8TMP4pN=xn6w3H=TYqN3DMfGW-vuiC5qB-Oj5g@mail.gmail.com>
 <CAFP0Ok9XGzVbghbnOOyfXiOOc5-a94uFRu7sD5wXz9sr-+AYEA@mail.gmail.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <9407b6c3-b932-5904-18ff-7c6cbf6bcc8b@gmail.com>
Date:   Thu, 23 Apr 2020 13:12:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFP0Ok9XGzVbghbnOOyfXiOOc5-a94uFRu7sD5wXz9sr-+AYEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi robh, Heiko, Karthik, Helen and others,

See comments below.
Should we change Helen's patch serie a little bit to accommodate other
isp1 compatibles as well? Could you give advise here? Thanks!

Johan


On 4/23/20 7:10 AM, karthik poduval wrote:
> Hi Johan/Helen,
> 
> I was attempting to fix the yaml to work for both platforms rk3288 and
> rk3399. I couldn't find any specific example in the existing yaml files
> that deal with this exact scenario common driver but different clocks for
> different chipsets. Could you point me to an appropriate example ?
> 
> Meanwhile here is the patch I was trying out.
> diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> index af246b71eac6..4ca76a1bbb63 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> @@ -15,7 +15,11 @@ description: |
> 
>  properties:
>    compatible:
> -    const: rockchip,rk3399-cif-isp
> +    items:
> +      - enum:
> +        - rockchip,rk3288-cif-isp
> +        - rockchip,rk3399-cif-isp
> +      - const: rockchip,rk3399-cif-isp
> 
>    reg:
>      maxItems: 1
> @@ -37,20 +41,38 @@ properties:
>      const: dphy
> 

>    clocks:
> -    items:
> -      - description: ISP clock
> -      - description: ISP AXI clock clock
> -      - description: ISP AXI clock  wrapper clock
> -      - description: ISP AHB clock clock
> -      - description: ISP AHB wrapper clock
> +    oneOf:
> +      # rk3399 clocks
> +      - items:
> +        - description: ISP clock
> +        - description: ISP AXI clock clock
> +        - description: ISP AXI clock  wrapper clock
> +        - description: ISP AHB clock clock
> +        - description: ISP AHB wrapper clock
> +      # rk3288 clocks
> +      - items:
> +        - description: ISP clock
> +        - description: ISP AXI clock clock
> +        - description: ISP AHB clock clock
> +        - description: ISP Pixel clock
> +        - description: ISP JPEG source clock
> 

We can expect a few more clocks here, so just use:

  clocks:
    minItems: 4
    maxItems: 5

or

See question for Helen about 'pclk_isp_wrap':

  clocks:
    minItems: 4
    maxItems: 6


From Rockchip tree:

static const char * const rk1808_isp_clks[] = {
	"clk_isp",
	"aclk_isp",
	"hclk_isp",
	"pclk_isp",
};

static const char * const rk3288_isp_clks[] = {
	"clk_isp",
	"aclk_isp",
	"hclk_isp",
	"pclk_isp_in",
	"sclk_isp_jpe",
};

static const char * const rk3326_isp_clks[] = {
	"clk_isp",
	"aclk_isp",
	"hclk_isp",
	"pclk_isp",
};

static const char * const rk3368_isp_clks[] = {
	"clk_isp",
	"aclk_isp",
	"hclk_isp",
	"pclk_isp",
};

static const char * const rk3399_isp_clks[] = {
	"clk_isp",
	"aclk_isp",
	"hclk_isp",
	"aclk_isp_wrap",
	"hclk_isp_wrap",
	"pclk_isp_wrap"
};

Question for Helen:

Where did 'pclk_isp_wrap' go in your patch serie?

>    clock-names:
> -    items:
> -      - const: clk_isp
> -      - const: aclk_isp
> -      - const: aclk_isp_wrap
> -      - const: hclk_isp
> -      - const: hclk_isp_wrap
> +    oneOf:
> +      # rk3399 clocks

sort on SoC

> +      - items:
> +        - const: clk_isp
> +        - const: aclk_isp
> +        - const: aclk_isp_wrap
> +        - const: hclk_isp
> +        - const: hclk_isp_wrap
> +      # rk3288 clocks

sort on SoC

> +      - items:
> +        - const: clk_isp
> +        - const: aclk_isp
> +        - const: hclk_isp
> +        - const: pclk_isp_in
> +        - const: sclk_isp_jpe

  clock-names:
    oneOf:
      # rk3288 clocks
      - items:
        - const: clk_isp
          description: ISP clock
        - const: aclk_isp
          description: ISP AXI clock clock
        - const: hclk_isp
          description: ISP AHB clock clock
        - const: pclk_isp_in
          description: ISP Pixel clock
        - const: sclk_isp_jpe
          description: ISP JPEG source clock
      # rk3399 clocks
      - items:
        - const: clk_isp
          description: ISP clock
        - const: aclk_isp
          description: ISP AXI clock clock
        - const: aclk_isp_wrap
          description: ISP AXI clock  wrapper clock
        - const: hclk_isp
          description: ISP AHB clock clock
        - const: hclk_isp_wrap
          description: ISP AHB wrapper clock

Question for robh:
Is this a proper way to add description or is there a beter way?

> 
> on running command.
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> 
> I see following messages for dts nodes.
>  DTC     arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
>   CHECK   arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml
> /home/kpoduval/workspace/tinkerboard-yocto/build/tmp/work/tinker_board-poky-linux-gnueabi/linux-stable/5.5.7+gitAUTOINC+ceab3ac1e6-r0/linux-tinker_board-standard-build/arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml:
> isp@ff910000: clocks: [[7, 107], [7, 205], [7, 469], [7, 371], [7, 108]] is
> valid under each of {'additionalItems': False, 'items': [{}, {}, {}, {},
> {}], 'maxItems': 5, 'minItems': 5, 'type': 'array'}, {'additionalItems':
> False, 'items': [{}, {}, {}, {}, {}], 'maxItems': 5, 'minItems': 5, 'type':
> 'array'}
> /home/kpoduval/workspace/tinkerboard-yocto/build/tmp/work/tinker_board-poky-linux-gnueabi/linux-stable/5.5.7+gitAUTOINC+ceab3ac1e6-r0/linux-tinker_board-standard-build/arch/arm/boot/dts/rk3288-firefly-beta.dt.yaml:
> isp@ff910000: compatible: ['rockchip,rk3288-cif-isp'] is too short
> 
> Are these cosidered as error messages ? The "too short" is being alerted
> for the orgianl yaml for rk3399 without any of my chnages.
> Kindly advise.
> 
> --
> Regards,
> Karthik Poduval
> 
> On Sat, Apr 11, 2020 at 10:13 PM karthik poduval <karthik.poduval@gmail.com>
> wrote:
> 
>> Thanks Johan for your valuable comments.
>>
>> On Wed, Apr 8, 2020 at 6:19 PM Johan Jonker <jbx6244@gmail.com> wrote:
>>>
>>> Hi Karthik and others,
>>>
>>> Include all mail lists found with:
>>> ./scripts/get_maintainer.pl --nogit-fallback --nogit
>>>
>>> Helen is moving isp1 bindings out of staging.
>>> Clocks and other things don't fit with her patch serie.
>>> Maybe fix this while still in staging?
>>>
>>> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
>>> 'phys' is a required property
>>> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
>>> 'phy-names' is a required property
>>> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
>>> 'ports' is a required property
>>>
>>> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
>>> 'assigned-clock-rates', 'assigned-clocks'
>>> do not match any of the regexes: 'pinctrl-[0-9]+'
>>> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
>>> clock-names:2: 'aclk_isp_wrap' was expected
>>> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
>>> clock-names:3: 'hclk_isp' was expected
>>> arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
>>> clock-names:4: 'hclk_isp_wrap' was expected
>>>
>>> arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: 'power-domains'
>>> is a required property
>>>
>>> arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: clock-names:1:
>>> 'dphy-cfg' was expected
>>> arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: clock-names:
>>> ['dphy-ref', 'pclk'] is too short
>>> arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: clocks: [[7,
>>> 126], [7, 358]] is too short
>>>
>>>
>>> Inside yaml:
>>> Use enum and sort.
>>>>>  properties:
>>>>>    compatible:
>>>
>>>>>      const: rockchip,rk3399-cif-isp
>>>>> +    const: rockchip,rk3288-rkisp1
>>>
>>>     enum:
>>>       - rockchip,rk3288-rkisp1
>>>       - rockchip,rk3399-cif-isp
>>>
>>>>>  properties:
>>>>>    compatible:
>>>>>      const: rockchip,rk3399-mipi-dphy-rx0
>>>>> +    const: rockchip,rk3288-mipi-dphy-rx0
>>>
>>>     enum:
>>>       - rockchip,rk3288-mipi-dphy-rx0
>>>       - rockchip,rk3399-mipi-dphy-rx0
>>>
>>>>
>>>> Please, keep consistency, or rk3288-cif-isp, or we change
>> rk3399-cif-isp to be rk3399-rkisp1.
>>>
>>>
>>> On 4/6/20 9:30 AM, Karthik Poduval wrote:
>>>> ISP and DPHY device entries missing so add them.
>>>>
>>>
>>>> tested on tinkerbaord with ov5647 using command
>>>> cam -c 1 -C -F cap
>>>
>>> Disclose dts node for ov5647 in cover letter, so people can reproduce
>>> this experiment.
>>>
>>> Caution!
>>> Without dts node this command doesn't work correct.
>>>
>>> make ARCH=arm dtbs_check
>>>
>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>>>
>>> make ARCH=arm dtbs_check
>>>
>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
>>>
>>> Needed to detect missing: phys, phy-names and ports ,etc.
>>>
>>> &isp {
>>>         status = "okay";
>>> };
>>>
>> Makes sense, that's why my kernel compilation passed and I didn't
>> these errors. Thanks for the command, I will verify dts for
>> correctness in next patch series.
>>
>>> Needed to detect missing: power-domains, etc.
>>>
>>> &mipi_phy_rx0 {
>>>         status = "okay";
>>> };
>>>
>>>>
>>>> Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
>>>> Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
>>>> ---
>>>>  arch/arm/boot/dts/rk3288.dtsi | 25 +++++++++++++++++++++++++
>>>>  1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/rk3288.dtsi
>> b/arch/arm/boot/dts/rk3288.dtsi
>>>> index 9beb662166aa..adea8189abd9 100644
>>>> --- a/arch/arm/boot/dts/rk3288.dtsi
>>>> +++ b/arch/arm/boot/dts/rk3288.dtsi
>>>> @@ -247,6 +247,23 @@
>>>>               ports = <&vopl_out>, <&vopb_out>;
>>>>       };
>>>>
>>>
>>>> +     isp: isp@ff910000 {
>>>
>>> For nodes:
>>> Sort things without reg alphabetical first,
>>> then sort the rest by reg address.
>>>
>> Sure
>>>> +             compatible = "rockchip,rk3288-rkisp1";
>>>> +             reg = <0x0 0xff910000 0x0 0x4000>;
>>>> +             interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>>>> +             clocks = <&cru SCLK_ISP>, <&cru ACLK_ISP>,
>>>> +                      <&cru HCLK_ISP>, <&cru PCLK_ISP_IN>,
>>>> +                      <&cru SCLK_ISP_JPE>;
>>>> +             clock-names = "clk_isp", "aclk_isp",
>>>> +                           "hclk_isp", "pclk_isp_in",
>>>> +                           "sclk_isp_jpe";
>>>> +             assigned-clocks = <&cru SCLK_ISP>, <&cru SCLK_ISP_JPE>;
>>>> +             assigned-clock-rates = <400000000>, <400000000>;
>>>
>>>> +             power-domains = <&power RK3288_PD_VIO>;
>>>> +             iommus = <&isp_mmu>;
>>>
>>> sort
>>>
>>> Something missing?
>>> Where are the ports and port nodes?
>>
>> I was assuming that this would be a part of the board specific dtsi or
>> dts entry where the isp node would be overriden and the i2c camera
>> port
>> and the isp port remote-endpoints would be connected. I had this as a
>> part of my first patch series. However I was advised by Helen to not
>> include the ov5647
>> dtsi as it isn't hardwired to the SoC and resides on an camera adapter
>> board.
>>
>> Should this be defined without the remote-endpoint phandle since we
>> don't know exactly which sensor gets connected in this dtsi file ?
>>
>>>
>>>> +             status = "disabled";

Question for Heiko:
Should we add status to Helen's serie as well?

>>>> +     };
>>>> +
>>>>       sdmmc: mmc@ff0c0000 {
>>>>               compatible = "rockchip,rk3288-dw-mshc";
>>>>               max-frequency = <150000000>;
>>>> @@ -891,6 +908,14 @@
>>>>                       status = "disabled";
>>>>               };
>>>>
>>>
>>>> +             mipi_phy_rx0: mipi-phy-rx0 {
>>>
>>> Use separate patch.
>>>
>>> For nodes:
>>> Sort things without reg alphabetical first,
>>> then sort the rest by reg address.
>>>
>> Sure
>>
>>>> +                     compatible = "rockchip,rk3288-mipi-dphy-rx0";
>>>> +                     clocks = <&cru SCLK_MIPIDSI_24M>, <&cru
>> PCLK_MIPI_CSI>;
>>>> +                     clock-names = "dphy-ref", "pclk";
>>> Something missing?
>>> Does this phy have a power domain?
>> The tinkerboard debian kernel (where I referred to for this patch)
>> didn't have it defined for the DPHY. I would guess that it would be
>> the same as the ISP i.e. RK3288_PD_VIO,
>> does anyone know the answer to this or do I have to reach out to
>> Rockchip engineering ?
>>>
>>>> +                     #phy-cells = <0>;
>>>> +                     status = "disabled";
>>>> +             };
>>>> +
>>>>               io_domains: io-domains {
>>>>                       compatible = "rockchip,rk3288-io-voltage-domain";
>>>>                       status = "disabled";
>>>>
>>>
>>
>>
>> --
>> Regards,
>> Karthik Poduval
>>
> 
> 

