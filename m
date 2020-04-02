Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0370C19C49F
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 16:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388571AbgDBOq3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 10:46:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43940 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388288AbgDBOq3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 10:46:29 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id DF666297C4B
Subject: Re: [PATCH 4/4] ARM: dts: rockchip: add ov5647 camera module support
 to tinkerboard
To:     karthik poduval <karthik.poduval@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
References: <CAFP0Ok_3yTv9QWAykvBk3yLgbThycVPdx0taU9F1Wo_WTnVjyA@mail.gmail.com>
 <c892675e-79c0-5476-52c6-cd364adef4d7@collabora.com>
 <CAFP0Ok8Ex=roGNc___FyiUVG+mY-bf2RjbQpRaaubmMg0CdWwA@mail.gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <c8d10bc2-d3f8-6325-b90f-1530aaa43df7@collabora.com>
Date:   Thu, 2 Apr 2020 11:46:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAFP0Ok8Ex=roGNc___FyiUVG+mY-bf2RjbQpRaaubmMg0CdWwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/1/20 11:29 PM, karthik poduval wrote:
> On Wed, Apr 1, 2020 at 5:00 PM Helen Koike <helen.koike@collabora.com> wrote:
>>
>> Hi Karthik,
>>
>> It is nice to see this driver being used and tested elsewhere.
>>
>> How did you tested the series? It would be nice to add it in the commit message.
>>
> Firstly thank you for your work on the rkisp1 and libcamera and
> efforts of bringing it to mainline kernel. I tested the patch series
> using yocto build with meta-rockchip and using media kernel tree TOT.
> I also used libcamera to configure the pipeline (since it was more
> convenient as compared to media-ctl commands). Sure I will add them to
> the commit message in my next commit. Would this commit be the best
> place to include testing instructions or include into all 4 commits
> that I posted ?

Nice, I'm glad it worked fine.

I think you could just quickly mention in the commits something like:

"Tested streaming on a tinkerboard with ov5647 with libcamera command: cam ..."

>> On 3/31/20 4:57 AM, karthik poduval wrote:
>>> ov5647 is one of the two camera modules as described in
>>> https://tinkerboarding.co.uk/wiki/index.php/CSI-camera
>>>
>>> changes ported over from https://github.com/TinkerBoard/debian_kernel.git
>>>
>>> Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
>>> Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
>>
>> please, see my comments from previous commit.
>>
>>> ---
>>>  arch/arm/boot/dts/rk3288-tinker.dtsi | 37 ++++++++++++++++++++++++++++
>>
>> I wondering if changing thinkerboard dts make sense. Is the camera really hardwired
>> on the tinker board, or is it an add-on?
>>
>> Regards,
>> Helen
> No the camera isn't hardwired but connects over a flex cable to an
> adapter board, however based on my search I found that only 2 camera
> adapter boards have been made for tinkerboard, IMX219 and OV5647. The
> only camera adapter board I have with me is ov5647. Normally offboard
> peripherals also need device tree entries. The tinkerbaord debain 4.4
> kernel includes imx219 device entry in the device tree and provides
> ov5647 device tree entry as an overlay. What is the recommendation
> here ? Should it be an overlay or not added at all ?

So usually this change don't go to the board's dtsi, otherwise you are
mandating other users to use the same sensor as you did.

I'm not sure how would be the alternative though, since overlays don't usually go upstream,
and I'm not sure if there is a way to declare a "expected" node.

Regards,
Helen

>>
>>>  1 file changed, 37 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi
>>> b/arch/arm/boot/dts/rk3288-tinker.dtsi
>>> index 312582c1bd37..720dd80ea3aa 100644
>>> --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
>>> +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
>>> @@ -107,6 +107,13 @@
>>>          startup-delay-us = <100000>;
>>>          vin-supply = <&vcc_io>;
>>>      };
>>> +
>>> +    ext_cam_clk: external-camera-clock {
>>> +        compatible = "fixed-clock";
>>> +        clock-frequency = <25000000>;
>>> +        clock-output-names = "CLK_CAMERA_25MHZ";
>>> +        #clock-cells = <0>;
>>> +    };
>>>  };
>>>
>>>  &cpu0 {
>>> @@ -345,12 +352,42 @@
>>>
>>>  &i2c2 {
>>>      status = "okay";
>>> +    camera0: ov5647@36 {
>>> +        compatible = "ovti,ov5647";
>>> +        reg = <0x36>;
>>> +        clocks = <&ext_cam_clk>;
>>> +        status = "okay";
>>> +        enable-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
>>> +        port {
>>> +            ov5647_out: endpoint {
>>> +                remote-endpoint = <&isp_mipi_in>;
>>> +                data-lanes = <1 2>;
>>> +            };
>>> +        };
>>> +    };
>>>  };
>>>
>>>  &i2c5 {
>>>      status = "okay";
>>>  };
>>>
>>> +&isp {
>>> +    status = "okay";
>>> +    phys = <&mipi_phy_rx0>;
>>> +    phy-names = "dphy";
>>> +
>>> +    port {
>>> +        isp_mipi_in: endpoint {
>>> +            remote-endpoint = <&ov5647_out>;
>>> +            data-lanes = <1 2>;
>>> +        };
>>> +    };
>>> +};
>>> +
>>> +&mipi_phy_rx0 {
>>> +    status = "okay";
>>> +};
>>> +
>>>  &i2s {
>>>      #sound-dai-cells = <0>;
>>>      status = "okay";
>>>
>>
> 
