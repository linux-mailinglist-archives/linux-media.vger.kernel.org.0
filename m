Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6473018ADCD
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgCSH7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:59:34 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35432 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgCSH7d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:59:33 -0400
Received: by mail-ot1-f68.google.com with SMTP id k26so1459160otr.2;
        Thu, 19 Mar 2020 00:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WGuLoQf5u7HUV1s6V0PJEh7hCfVde9pwvIQPGZyYQTI=;
        b=qZiDLa46teEuK2rajTRflr18qRzuR5NndOEGPXvlr179Ju8VL/Ofce4AkeFhLh9nip
         ZzanXJjbrpiMXdwMWwWbxtH6/xd5p3Rv2zLp8hHz6SnTxoue1HQImJyWAsjDRlcy6dEK
         OBVEwGw4iaSkXk4HJGaaK9vwv4zP+n2f+wSY7yFNmP3x5iCylUTqJexNG2NZfBgmqzq3
         OmDZAmbmwEA8ihQmQ/pSd/MfRj5GbxMmFGYUGA2vOAmPbsufKqiTdB2PuCwb0Vp780PU
         uPYuF2pPCfvFi/xs4a7AXzUHO5T2amrQ8OYt+3U0k7qlidGY9rL7k+JHNi0ogA4hdsZy
         2s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WGuLoQf5u7HUV1s6V0PJEh7hCfVde9pwvIQPGZyYQTI=;
        b=AgkH5DYLu25M2ljr6f7Q5ai5UfTWJlRCaESDdnwuLw0YJlFKICMIBzij4PxTIOihLg
         UIgunMDWGQRWLqLfPWqyyxsQjM8Gdu7Zey1Prn3zqC1JGyvatxzKkqW6lwJcruu5Qr/1
         ULjDNHcyUEDi90+boywyztRnR4pKXZ3e4YbJZNsRQcdiC3hxX9tH2tU/6eBxCEOgDbLU
         KqammAmMUKHybqUoV2OLROjmKLPe4akoQGiB5zIj+z/JYhkBajU5ZXrnmsIL3IEw3MlF
         6RTy7/ItdTHSMTNXm+TDTM5MdwuqW40whX4JfhhRPlYMZo2je82Nos8DLwHtSkUXqy0h
         sgjg==
X-Gm-Message-State: ANhLgQ3CvQqmnrleVhwIvOtnR1AFj3s5N9ozOAGLV2ekshHdni9ndutm
        0A9SZOZDtOokMaC5/RUtNkte6vEo6E18XVxIZnfwyUCdfCg=
X-Google-Smtp-Source: ADFU+vuIIIHNA4ZO912/LtdlGvI64BbtmJSEPBlpDdMaqv4OGgHNQe3VeUMReQ1HsRfr1TuzQnePy7S0Yf9T2aZ2n6A=
X-Received: by 2002:a9d:64ca:: with SMTP id n10mr1287571otl.325.1584604772313;
 Thu, 19 Mar 2020 00:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200313212345.GM4751@pendragon.ideasonboard.com> <OSBPR01MB359079EAA32E0DCBF63C6886AAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20200318231856.GI24538@pendragon.ideasonboard.com>
In-Reply-To: <20200318231856.GI24538@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 19 Mar 2020 07:59:06 +0000
Message-ID: <CA+V-a8sUscZPW0xWANnkQQHwXobR-ABZc2RzfGr+0uumV6V+tQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] media: i2c: ov5645: Set maximum leverage of
 external clock frequency to 24480000
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

On Wed, Mar 18, 2020 at 11:19 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Fri, Mar 13, 2020 at 09:31:25PM +0000, Prabhakar Mahadev Lad wrote:
> > On 13 March 2020 21:24, Laurent Pinchart wrote:
> > > On Fri, Mar 13, 2020 at 09:12:33PM +0000, Lad Prabhakar wrote:
> > > > While testing on Renesas RZ/G2E platform, noticed the clock frequency
> > > > to be 24242424 as a result the probe failed. However increasing the
> > > > maximum leverage of external clock frequency to 24480000 fixes this
> > > > issue. Since this difference is small enough and is insignificant set
> > > > the same in the driver.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > >  drivers/media/i2c/ov5645.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > > index 4fbabf3..b49359b 100644
> > > > --- a/drivers/media/i2c/ov5645.c
> > > > +++ b/drivers/media/i2c/ov5645.c
> > > > @@ -1107,8 +1107,10 @@ static int ov5645_probe(struct i2c_client *client)
> > > >  }
> > > >
> > > >  xclk_freq = clk_get_rate(ov5645->xclk);
> > > > -/* external clock must be 24MHz, allow 1% tolerance */
> > > > -if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> > > > +/* external clock must be 24MHz, allow a minimum 1% and a maximum of 2%
> > > > + * tolerance
> > >
> > > So where do these numbers come from ? I understand that 2% is what you
> > > need to make your clock fit in the range, but why -1%/+2% instead of -
> > > 2%/+2% ? And why not 2.5 or 3% ? The sensor datasheet documents the
> > > range of supported xvclk frequencies to be 6MHz to 54MHz. I understand
> > > that PLL parameters depend on the clock frequency, but could they be
> > > calculated instead of hardcoded, to avoid requiring an exact 24MHz input
> > > frequency ?
> >
> > To be honest I don't have the datasheet for ov5645, the flyer says 6-54Mhz but the
> > logs/comment says 24Mhz.
>
> The OV5645 clock topology is fairly complex, with two PLLs and different
> set of output dividers. It however shouldn't be impossible to calculate
> the PLL configuration in the driver, but would require some dedication,
> and is probably not worth it.
>
> I've discussed the matter with Sakari, and we concluded that this is
> just a sanity check. We advise increasing the tolerance by a bigger
> amount to avoid patching this for every new board (completely
> arbitrarily, +/- 5%), and turning the fatal error into a dev_warn,
> dropping the return -EINVAL statement.
>
Thank you for looking into this. I'll update the patch accordingly.

Cheers,
--Prabhakar

> > > > + */
> > > > +if (xclk_freq < 23760000 || xclk_freq > 24480000) {
> > > >  dev_err(dev, "external clock frequency %u is not supported\n",
> > > >  xclk_freq);
> > > >  return -EINVAL;
>
> --
> Regards,
>
> Laurent Pinchart
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
