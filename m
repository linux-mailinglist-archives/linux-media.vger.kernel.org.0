Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9253918A844
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 23:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbgCRWdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 18:33:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39604 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgCRWdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 18:33:20 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7603A5F;
        Wed, 18 Mar 2020 23:33:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584570797;
        bh=9m1GSY/Y0chTObQdUK2o5uaKcyUnJ2AtolcRgJvxcRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RqALiKWBqa3oEj6gO5QaKcF2+D0Q54zVl+tnIJcm64PY3+pAw74SREjMR0VoUXZl7
         Bxhj8v/Gih5fORg6/cH+QmbyhmHQxT1lNDBcMZe9bL+6oiBzPs4Q7CtlzJRtILAioN
         vFQ69xXygRCGcB2oHWZgVtjBQL7nPdGcBH8z+xzs=
Date:   Thu, 19 Mar 2020 00:33:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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
Subject: Re: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to
 assigned-clock-rates
Message-ID: <20200318223311.GH24538@pendragon.ideasonboard.com>
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200313212012.GL4751@pendragon.ideasonboard.com>
 <OSBPR01MB35905D6D72DCBF154FCF7C88AAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20200313212717.GO4751@pendragon.ideasonboard.com>
 <CA+V-a8veXbwMrda8UEu2mN6gGgrBJA8Mp7gdN7Q3-iXNw9c4pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8veXbwMrda8UEu2mN6gGgrBJA8Mp7gdN7Q3-iXNw9c4pg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Wed, Mar 18, 2020 at 08:13:00PM +0000, Lad, Prabhakar wrote:
> On Fri, Mar 13, 2020 at 9:27 PM Laurent Pinchart wrote:
> > On Fri, Mar 13, 2020 at 09:25:01PM +0000, Prabhakar Mahadev Lad wrote:
> >> On Sent: 13 March 2020 21:20, Laurent Pinchart wrote:
> >>> On Fri, Mar 13, 2020 at 09:12:31PM +0000, Lad Prabhakar wrote:
> >>>> Use assigned-clock-rates to specify the clock rate. Also mark
> >>>> clock-frequency property as deprecated.
> >>>
> >>> I would phrase it the other way around, this patch mainly deprecates clock-
> >>> frequency, and as a side effect recommends usage of assigned-clock-rates.
> >>>
> >>> "Deprecate usage of the clock-frequency propertly. The preferred method
> >>> to set clock rates is to use assigned-clock-rates."
> >>
> >> Agreed will do that.
> >>
> >>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 5 +++--
> >>>>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> >>>> b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> >>>> index 72ad992..e62fe82 100644
> >>>> --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> >>>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> >>>> @@ -8,7 +8,7 @@ Required Properties:
> >>>>  - compatible: Value should be "ovti,ov5645".
> >>>>  - clocks: Reference to the xclk clock.
> >>>>  - clock-names: Should be "xclk".
> >>>> -- clock-frequency: Frequency of the xclk clock.
> >>>> +- clock-frequency (deprecated): Frequency of the xclk clock.
> >>>
> >>> I would drop this completely. Drivers need to ensure backward compatibility,
> >>> but DT bindings should only document the latest version, the history is
> >>> available in git.
> >>
> >> Sure will drop it.
> >>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>
> >>> While at it, can I enlist you to convert these bindings to yaml ? :-)
> >>>
> >> Sure will do the honours , will make sure yaml patch is ontop of this patch too.
>
> Shall I enlist you as the maintainer  in the json-schema ?
> dt_binding_check says  'maintainers' is a required property.

Do you want to be the new maintainer ? :-) Sakari is maintaining sensor
drivers (in his spare time though) so maybe he could be listed in the DT
bindings too if he wants. Otherwise, I could do it.

> > Thank you :-)
> >
> >>>>  - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> >>>>    to the hardware pin PWDNB which is physically active low.
> >>>>  - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> >>>> @@ -37,7 +37,8 @@ Example:
> >>>>
> >>>>  clocks = <&clks 200>;
> >>>>  clock-names = "xclk";
> >>>> -clock-frequency = <24000000>;
> >>>> +assigned-clocks = <&clks 200>;
> >>>> +assigned-clock-rates = <24000000>;
> >>>>
> >>>>  vdddo-supply = <&camera_dovdd_1v8>;
> >>>>  vdda-supply = <&camera_avdd_2v8>;

-- 
Regards,

Laurent Pinchart
