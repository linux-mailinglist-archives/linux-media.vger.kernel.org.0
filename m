Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02F9F19BA4F
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 04:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732660AbgDBCaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 22:30:05 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:33299 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732435AbgDBCaF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 22:30:05 -0400
Received: by mail-ua1-f65.google.com with SMTP id v24so639407uak.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2020 19:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lfuxwXdO5Qm1FnVjQ4TY3lkUwjQwsijR0iep+YfIhi8=;
        b=cxgY3XzAkmh2xMmV1Sm2e+CnYa+3xWXNCjv5MVPGF1/yVpxWTn9A2gHU3p8TIFGsiL
         DRk+v/FdGeBIURCNaW5i9SQWwnOs79TW/pafrdhvKfufmJEoG2jXPBXMDJzU2gZtD5I3
         DghL8PBRbtldndjn3uKc2/j5+txcPIwcfzogDdOZ657fEwiWSNHGMFA6DiXsUsx0ezEY
         3R8iRug0HfO3Qjlbo34M8bzQMXVZiUbBXRdq2+yXDacLXtJe2xXRhmQI+Rld86GH7Ywh
         BrGJ5BzyoUA0rHvXBTKEuheOrhfgq8fb3+Ki4B4RWKWb2s2CuHwbnbjDn8Z0xNucRCYU
         7dYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lfuxwXdO5Qm1FnVjQ4TY3lkUwjQwsijR0iep+YfIhi8=;
        b=OoOD9lMt2AcXlTcwRMoRpwHkQLHZ7DFwykdnDygrRIFuITsdAUy4onfoG7N4G8cWlk
         sC5q210FruGFFQE1fgienhGL6niT29Hc0pCjPAL8G1nhQUbmVMPodTJRBngIyqNSjcKw
         c+CTz2deQtjnpQTTys5OtVjbnlK+YfyWCNY0GmdvKrTgXaC5S+cORcWXEg+e/0J0KcI6
         aWP+9UDTFtwnnLFd8JeXQbNe/xwJnE7cyFZXoboHxOjSUriQ7aBEz39CdyUKeV7UMQ/R
         uGSem312giDa2gyCFGg9agzLcFq833pytQEJh/5mCJ94tN0AheaqSMgILj0Tqz+q+RPN
         x9IQ==
X-Gm-Message-State: AGi0PuamMk/CD8p7jSY873kUNfTsgc/gfovVCZReQ+qmk/C3EtyD100e
        WhMuQ0xD9x/wWRZoBtXw7cASF4hoqzOQ4gDgz8M=
X-Google-Smtp-Source: APiQypL6v0APr0Y96z5b5yvzQxGzTiuzCLtBGQcjHhglKlMOwVnPGMa40bzubApt5ri7Xm8H2PIL5cEiJbr3RU+ZWmQ=
X-Received: by 2002:ab0:477:: with SMTP id 110mr1075527uav.56.1585794603834;
 Wed, 01 Apr 2020 19:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAFP0Ok_3yTv9QWAykvBk3yLgbThycVPdx0taU9F1Wo_WTnVjyA@mail.gmail.com>
 <c892675e-79c0-5476-52c6-cd364adef4d7@collabora.com>
In-Reply-To: <c892675e-79c0-5476-52c6-cd364adef4d7@collabora.com>
From:   karthik poduval <karthik.poduval@gmail.com>
Date:   Wed, 1 Apr 2020 19:29:51 -0700
Message-ID: <CAFP0Ok8Ex=roGNc___FyiUVG+mY-bf2RjbQpRaaubmMg0CdWwA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: rockchip: add ov5647 camera module support
 to tinkerboard
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 1, 2020 at 5:00 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Hi Karthik,
>
> It is nice to see this driver being used and tested elsewhere.
>
> How did you tested the series? It would be nice to add it in the commit message.
>
Firstly thank you for your work on the rkisp1 and libcamera and
efforts of bringing it to mainline kernel. I tested the patch series
using yocto build with meta-rockchip and using media kernel tree TOT.
I also used libcamera to configure the pipeline (since it was more
convenient as compared to media-ctl commands). Sure I will add them to
the commit message in my next commit. Would this commit be the best
place to include testing instructions or include into all 4 commits
that I posted ?
> On 3/31/20 4:57 AM, karthik poduval wrote:
> > ov5647 is one of the two camera modules as described in
> > https://tinkerboarding.co.uk/wiki/index.php/CSI-camera
> >
> > changes ported over from https://github.com/TinkerBoard/debian_kernel.git
> >
> > Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
> > Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
>
> please, see my comments from previous commit.
>
> > ---
> >  arch/arm/boot/dts/rk3288-tinker.dtsi | 37 ++++++++++++++++++++++++++++
>
> I wondering if changing thinkerboard dts make sense. Is the camera really hardwired
> on the tinker board, or is it an add-on?
>
> Regards,
> Helen
No the camera isn't hardwired but connects over a flex cable to an
adapter board, however based on my search I found that only 2 camera
adapter boards have been made for tinkerboard, IMX219 and OV5647. The
only camera adapter board I have with me is ov5647. Normally offboard
peripherals also need device tree entries. The tinkerbaord debain 4.4
kernel includes imx219 device entry in the device tree and provides
ov5647 device tree entry as an overlay. What is the recommendation
here ? Should it be an overlay or not added at all ?
>
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi
> > b/arch/arm/boot/dts/rk3288-tinker.dtsi
> > index 312582c1bd37..720dd80ea3aa 100644
> > --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
> > +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
> > @@ -107,6 +107,13 @@
> >          startup-delay-us = <100000>;
> >          vin-supply = <&vcc_io>;
> >      };
> > +
> > +    ext_cam_clk: external-camera-clock {
> > +        compatible = "fixed-clock";
> > +        clock-frequency = <25000000>;
> > +        clock-output-names = "CLK_CAMERA_25MHZ";
> > +        #clock-cells = <0>;
> > +    };
> >  };
> >
> >  &cpu0 {
> > @@ -345,12 +352,42 @@
> >
> >  &i2c2 {
> >      status = "okay";
> > +    camera0: ov5647@36 {
> > +        compatible = "ovti,ov5647";
> > +        reg = <0x36>;
> > +        clocks = <&ext_cam_clk>;
> > +        status = "okay";
> > +        enable-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
> > +        port {
> > +            ov5647_out: endpoint {
> > +                remote-endpoint = <&isp_mipi_in>;
> > +                data-lanes = <1 2>;
> > +            };
> > +        };
> > +    };
> >  };
> >
> >  &i2c5 {
> >      status = "okay";
> >  };
> >
> > +&isp {
> > +    status = "okay";
> > +    phys = <&mipi_phy_rx0>;
> > +    phy-names = "dphy";
> > +
> > +    port {
> > +        isp_mipi_in: endpoint {
> > +            remote-endpoint = <&ov5647_out>;
> > +            data-lanes = <1 2>;
> > +        };
> > +    };
> > +};
> > +
> > +&mipi_phy_rx0 {
> > +    status = "okay";
> > +};
> > +
> >  &i2s {
> >      #sound-dai-cells = <0>;
> >      status = "okay";
> >
>

-- 
Regards,
Karthik Poduval
