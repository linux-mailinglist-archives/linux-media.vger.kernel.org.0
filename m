Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39F1319C712
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 18:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732530AbgDBQai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 12:30:38 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:46980 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732289AbgDBQai (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 12:30:38 -0400
Received: by mail-ua1-f67.google.com with SMTP id y17so1414243uap.13
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2020 09:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7th2iD1ABn0C+Wl71DyvUDfvyie1Nm1hEQzvtHG5pDY=;
        b=NL+C3uuYDsfvvrYltCOUrS/oys2rn+v9T7nManDGJSd+MXpLNA2JMJc2Qcl0CuV/LX
         gUnyFD83/Mhh/wCaX/l34eoKiMhfOHmbvAIIBSHQpathh4kKIfOxC8NbTyjDm1bmTK+r
         rYfzqml2EdbmG2ab8JC5D95bcNS/ePK4V7Nsvl8MBs1wS6z336dwclEsHOsc8lRL2E9G
         3JcQXrh2GY9SiZafp4FiS6AP0ip9Tbm+4s/sJzzkDkKZU6tChStmTQa2pTUGHhzr7aNI
         dDYED+jV30yk3ZaxCe2CTggaVmEl/6TG874xD7WxLU0KXLvdEmMdRjpcDmdrPoWikLXc
         QobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7th2iD1ABn0C+Wl71DyvUDfvyie1Nm1hEQzvtHG5pDY=;
        b=UQqspxkKLOQ7Rek6305pW1uFughy2Np1h0A94qNF/RaGnr07vzYTu4rnqYxmlOQY6K
         akQCU8HfRPc7JJV9w1yrbyRLD/KZ9fgiAcH9f0n/c0eBSI1K+xGLgeHd0o2e9PDLyQNa
         hIhaM/7vzViRgUf7ivb2FESHumyi9xaWYYnpYE6AcKWGClcmwaEv8AwNHO57Ydzt+Vpd
         ozGXevkKZ5VeWlDQ6XMrrsAv1uDIA6A8QpdqjJN6DvohWK2oJr9gVgJ6rFxsS617iNUP
         ufXlSCGoKM+zOch5X0M/S3JjJK86o3+QbFkwP53zJ1mQH1bSPjYGuoP79LFcmtmEpz4K
         A0eg==
X-Gm-Message-State: AGi0PuZNrMvU9kX4l8Zk9kTmHpPymTSKv/6oIjIlEy8r2m3qEUgkjx7z
        rgZakTR24nv4yHWDb7pAM/ewuCSLOTV166h8mJE9fg==
X-Google-Smtp-Source: APiQypJmH+/NredLIsSd0/6ajG3uMT42xAs2RsUewwBzpVvxvITk55xVyHkrChl8yEGEvGVCkgJeKT80pEMIPzFmeRc=
X-Received: by 2002:a9f:35e6:: with SMTP id u35mr3183185uad.32.1585845036078;
 Thu, 02 Apr 2020 09:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAFP0Ok_3yTv9QWAykvBk3yLgbThycVPdx0taU9F1Wo_WTnVjyA@mail.gmail.com>
 <c892675e-79c0-5476-52c6-cd364adef4d7@collabora.com> <CAFP0Ok8Ex=roGNc___FyiUVG+mY-bf2RjbQpRaaubmMg0CdWwA@mail.gmail.com>
 <c8d10bc2-d3f8-6325-b90f-1530aaa43df7@collabora.com>
In-Reply-To: <c8d10bc2-d3f8-6325-b90f-1530aaa43df7@collabora.com>
From:   karthik poduval <karthik.poduval@gmail.com>
Date:   Thu, 2 Apr 2020 09:30:25 -0700
Message-ID: <CAFP0Ok_aQcM-zyMWX-_Jz6ZeYTvZukUGZ1=aCk+GrR98Vc3wRg@mail.gmail.com>
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

On Thu, Apr 2, 2020 at 7:46 AM Helen Koike <helen.koike@collabora.com> wrote:
>
>
>
> On 4/1/20 11:29 PM, karthik poduval wrote:
> > On Wed, Apr 1, 2020 at 5:00 PM Helen Koike <helen.koike@collabora.com> wrote:
> >>
> >> Hi Karthik,
> >>
> >> It is nice to see this driver being used and tested elsewhere.
> >>
> >> How did you tested the series? It would be nice to add it in the commit message.
> >>
> > Firstly thank you for your work on the rkisp1 and libcamera and
> > efforts of bringing it to mainline kernel. I tested the patch series
> > using yocto build with meta-rockchip and using media kernel tree TOT.
> > I also used libcamera to configure the pipeline (since it was more
> > convenient as compared to media-ctl commands). Sure I will add them to
> > the commit message in my next commit. Would this commit be the best
> > place to include testing instructions or include into all 4 commits
> > that I posted ?
>
> Nice, I'm glad it worked fine.
>
> I think you could just quickly mention in the commits something like:
>
> "Tested streaming on a tinkerboard with ov5647 with libcamera command: cam ..."
>
Thanks will do.
> >> On 3/31/20 4:57 AM, karthik poduval wrote:
> >>> ov5647 is one of the two camera modules as described in
> >>> https://tinkerboarding.co.uk/wiki/index.php/CSI-camera
> >>>
> >>> changes ported over from https://github.com/TinkerBoard/debian_kernel.git
> >>>
> >>> Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
> >>> Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
> >>
> >> please, see my comments from previous commit.
> >>
> >>> ---
> >>>  arch/arm/boot/dts/rk3288-tinker.dtsi | 37 ++++++++++++++++++++++++++++
> >>
> >> I wondering if changing thinkerboard dts make sense. Is the camera really hardwired
> >> on the tinker board, or is it an add-on?
> >>
> >> Regards,
> >> Helen
> > No the camera isn't hardwired but connects over a flex cable to an
> > adapter board, however based on my search I found that only 2 camera
> > adapter boards have been made for tinkerboard, IMX219 and OV5647. The
> > only camera adapter board I have with me is ov5647. Normally offboard
> > peripherals also need device tree entries. The tinkerbaord debain 4.4
> > kernel includes imx219 device entry in the device tree and provides
> > ov5647 device tree entry as an overlay. What is the recommendation
> > here ? Should it be an overlay or not added at all ?
>
> So usually this change don't go to the board's dtsi, otherwise you are
> mandating other users to use the same sensor as you did.
>
> I'm not sure how would be the alternative though, since overlays don't usually go upstream,
> and I'm not sure if there is a way to declare a "expected" node.
>
> Regards,
> Helen
Agree so let me abandon this commit then, the documentation devicetree
bindings example should help with anyone who is trying to bring up an
image sensor. For reference sake I am thinking of putting up my ov5647
and tinkerbaord changes to a custom yocto layer which would make it
that configuration (tinkerbaord + ov5647) specific.
>
> >>
> >>>  1 file changed, 37 insertions(+)
> >>>
> >>> diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi
> >>> b/arch/arm/boot/dts/rk3288-tinker.dtsi
> >>> index 312582c1bd37..720dd80ea3aa 100644
> >>> --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
> >>> +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
> >>> @@ -107,6 +107,13 @@
> >>>          startup-delay-us = <100000>;
> >>>          vin-supply = <&vcc_io>;
> >>>      };
> >>> +
> >>> +    ext_cam_clk: external-camera-clock {
> >>> +        compatible = "fixed-clock";
> >>> +        clock-frequency = <25000000>;
> >>> +        clock-output-names = "CLK_CAMERA_25MHZ";
> >>> +        #clock-cells = <0>;
> >>> +    };
> >>>  };
> >>>
> >>>  &cpu0 {
> >>> @@ -345,12 +352,42 @@
> >>>
> >>>  &i2c2 {
> >>>      status = "okay";
> >>> +    camera0: ov5647@36 {
> >>> +        compatible = "ovti,ov5647";
> >>> +        reg = <0x36>;
> >>> +        clocks = <&ext_cam_clk>;
> >>> +        status = "okay";
> >>> +        enable-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
> >>> +        port {
> >>> +            ov5647_out: endpoint {
> >>> +                remote-endpoint = <&isp_mipi_in>;
> >>> +                data-lanes = <1 2>;
> >>> +            };
> >>> +        };
> >>> +    };
> >>>  };
> >>>
> >>>  &i2c5 {
> >>>      status = "okay";
> >>>  };
> >>>
> >>> +&isp {
> >>> +    status = "okay";
> >>> +    phys = <&mipi_phy_rx0>;
> >>> +    phy-names = "dphy";
> >>> +
> >>> +    port {
> >>> +        isp_mipi_in: endpoint {
> >>> +            remote-endpoint = <&ov5647_out>;
> >>> +            data-lanes = <1 2>;
> >>> +        };
> >>> +    };
> >>> +};
> >>> +
> >>> +&mipi_phy_rx0 {
> >>> +    status = "okay";
> >>> +};
> >>> +
> >>>  &i2s {
> >>>      #sound-dai-cells = <0>;
> >>>      status = "okay";
> >>>
> >>
> >



-- 
Regards,
Karthik Poduval
