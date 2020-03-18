Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B0B18A854
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 23:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgCRWiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 18:38:11 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35556 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727174AbgCRWiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 18:38:11 -0400
Received: by mail-ot1-f66.google.com with SMTP id k26so411801otr.2;
        Wed, 18 Mar 2020 15:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OEbb45cGPFZm8qmmQB3oPZ+2/N+3osCrsUq9riyORzM=;
        b=PsUlFx+EpgrcwOaqknrsFqpYwVWuwwev8sFr4FUn9wBNgafRsum7+is+Jdjs/1e9SA
         xTt+RNNSUP8M/ypsUaWm5BAbDqRbmLNrnPCvfpkchubePG8n2S9Pac5fRF+BPLDdqZfA
         JwMMxaQYOy1gbmYrnuK/8T5Cw+L/pwew14vhbixQGdOOL9284sb0hGl8IvNKVPHsgfu5
         LkkeA18Zw8wqFUtY/lBa0koAgl0zxPkJTo5uM3AEvxATxvO8o6dITmUIzCwuIQteGsdF
         gHL1CXZ6f6w7MCwZ5/j88CO8QyvtWJhwsJTXYo8Ngee36RIBI4SW9YRESBeBbfobwX7g
         qf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OEbb45cGPFZm8qmmQB3oPZ+2/N+3osCrsUq9riyORzM=;
        b=TN9loXTkxyQ2mg4yVfHcYZQdNfZMo/TG4F5eJnuDl9ycTkgASU7guiujA4MpMDgEwh
         8DvbxgQtAxQc/X7JoveB969vOASdfNl8JZg20Jw0BpId/aowB9W90Gr+V717zJbw0WCM
         ZiemhE/PiCrEh1F8ZUMrRZuwG4QGtST/t/aVFAxwqTIj9CCEIzFT6cAFAuXsVKEaNy5D
         AD0GuZmvqPZSEx9WtdnJhfJfrn6ZOHgJCGguasZx9Wd6AW4KYqkvZZLHagiAP3H95EJ5
         d7WMvBaETB0yJrtlmjBKjjFVxUkE10/jXFvpazufD9SzStpBLaaBN/zzeCJ7/dH3K8Jr
         QDrA==
X-Gm-Message-State: ANhLgQ1RiIMDWM5q0C03gOLstgLjDXjwAU8mO+W98hZ+zQ3Bm+SGQBZZ
        qIeQx3+YLNn6yYrqFJ7K/txAN7/43D9mSwDV+tY3zCB/CHe15Q==
X-Google-Smtp-Source: ADFU+vsGjSRTwN0zvpiH0XKK8o/xfFABGdDrIZJqfgKbP/+BTkeCH7RyeEQaJfxXTomJkxqErvu7d/IlyGNsJEijbF0=
X-Received: by 2002:a9d:64ca:: with SMTP id n10mr6023292otl.325.1584571089403;
 Wed, 18 Mar 2020 15:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200313212012.GL4751@pendragon.ideasonboard.com> <OSBPR01MB35905D6D72DCBF154FCF7C88AAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20200313212717.GO4751@pendragon.ideasonboard.com> <CA+V-a8veXbwMrda8UEu2mN6gGgrBJA8Mp7gdN7Q3-iXNw9c4pg@mail.gmail.com>
 <20200318223311.GH24538@pendragon.ideasonboard.com>
In-Reply-To: <20200318223311.GH24538@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 18 Mar 2020 22:37:42 +0000
Message-ID: <CA+V-a8u5Tn+i22h-X5OMUjJfSuhjHqsfDX87o5X94r8M+N1e5w@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to assigned-clock-rates
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Mar 18, 2020 at 10:33 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Wed, Mar 18, 2020 at 08:13:00PM +0000, Lad, Prabhakar wrote:
> > On Fri, Mar 13, 2020 at 9:27 PM Laurent Pinchart wrote:
> > > On Fri, Mar 13, 2020 at 09:25:01PM +0000, Prabhakar Mahadev Lad wrote:
> > >> On Sent: 13 March 2020 21:20, Laurent Pinchart wrote:
> > >>> On Fri, Mar 13, 2020 at 09:12:31PM +0000, Lad Prabhakar wrote:
> > >>>> Use assigned-clock-rates to specify the clock rate. Also mark
> > >>>> clock-frequency property as deprecated.
> > >>>
> > >>> I would phrase it the other way around, this patch mainly deprecates clock-
> > >>> frequency, and as a side effect recommends usage of assigned-clock-rates.
> > >>>
> > >>> "Deprecate usage of the clock-frequency propertly. The preferred method
> > >>> to set clock rates is to use assigned-clock-rates."
> > >>
> > >> Agreed will do that.
> > >>
> > >>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>>> ---
> > >>>>  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 5 +++--
> > >>>>  1 file changed, 3 insertions(+), 2 deletions(-)
> > >>>>
> > >>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > >>>> b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > >>>> index 72ad992..e62fe82 100644
> > >>>> --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > >>>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > >>>> @@ -8,7 +8,7 @@ Required Properties:
> > >>>>  - compatible: Value should be "ovti,ov5645".
> > >>>>  - clocks: Reference to the xclk clock.
> > >>>>  - clock-names: Should be "xclk".
> > >>>> -- clock-frequency: Frequency of the xclk clock.
> > >>>> +- clock-frequency (deprecated): Frequency of the xclk clock.
> > >>>
> > >>> I would drop this completely. Drivers need to ensure backward compatibility,
> > >>> but DT bindings should only document the latest version, the history is
> > >>> available in git.
> > >>
> > >> Sure will drop it.
> > >>
> > >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >>>
> > >>> While at it, can I enlist you to convert these bindings to yaml ? :-)
> > >>>
> > >> Sure will do the honours , will make sure yaml patch is ontop of this patch too.
> >
> > Shall I enlist you as the maintainer  in the json-schema ?
> > dt_binding_check says  'maintainers' is a required property.
>
> Do you want to be the new maintainer ? :-) Sakari is maintaining sensor
> drivers (in his spare time though) so maybe he could be listed in the DT
> bindings too if he wants. Otherwise, I could do it.
>
OK I will add myself and Sakari for now and post a v4.

Cheers,
--Prabhakar

> > > Thank you :-)
> > >
> > >>>>  - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> > >>>>    to the hardware pin PWDNB which is physically active low.
> > >>>>  - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > >>>> @@ -37,7 +37,8 @@ Example:
> > >>>>
> > >>>>  clocks = <&clks 200>;
> > >>>>  clock-names = "xclk";
> > >>>> -clock-frequency = <24000000>;
> > >>>> +assigned-clocks = <&clks 200>;
> > >>>> +assigned-clock-rates = <24000000>;
> > >>>>
> > >>>>  vdddo-supply = <&camera_dovdd_1v8>;
> > >>>>  vdda-supply = <&camera_avdd_2v8>;
>
> --
> Regards,
>
> Laurent Pinchart
