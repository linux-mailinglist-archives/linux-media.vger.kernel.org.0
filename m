Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6031718ADD5
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 09:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgCSIAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 04:00:50 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42098 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgCSIAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 04:00:50 -0400
Received: by mail-ot1-f68.google.com with SMTP id a2so1416087otq.9;
        Thu, 19 Mar 2020 01:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cp6FuxyMS+1ByUBjPxoD3NwLVLlSPXMt0GftNsobXo8=;
        b=I+5SgItMsOfL1TEOphtTmlHHUR+fYjTYMqlVvG2hDzCjF/+QTGewomWQ4s4JZ4PwYU
         iDgen+PLOqqPh2x/L0XyjBIlfsxbIFHxe9JpxZM3oTsud3+N8WT2kXLluDnmFhEYCZym
         bRlzaVRRHsAAgaSpnQe3T8bypNY7cYLG8PFsqoUkX3cIMWUl0h77AvFdSWB+vNcQIR4u
         8NWMQaxpgj9W1sFa5at2oCirwlXQm1aOIteI/hncI31j5iwk9D0nkAV+OLJAeBH/4qgK
         6uPtqggsKQRkIOzZSxsBYr5it/M9TC7QtzyfhePhlV3yYIfq95j7nxf4Yq3Rgvux0KEp
         tdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cp6FuxyMS+1ByUBjPxoD3NwLVLlSPXMt0GftNsobXo8=;
        b=nQSLXAtI0HHrxPTA+kQX50/tFksiwsWhwhoyUBvM4YcSj2V60gTIOFBXVtnqO+WzSY
         77kMEBEEnvjdTjIhF+X9SOYk/AvbIzLtbnlHqnOaIBKetLCtjXHaVH/GbXH9SO6/d5cD
         KF6oZBN3kVqQX83BfJeHlsv/cpOTVcl0FWFwkpdju07RotIkv5Wjv46IZ704d+Fan+nC
         uZiP2F01uKj6ZTKZDqc0dNN+JcPzt9qv34AW24NqWZAChT5UhjFuqkQxyZKJqZKveyy/
         88zvmRJGg2bVzRi4exnp3VQrEONEoHKVy6I6wG5YpgNxEW+iOmlORoT/IpR1ixf9y0Hh
         vs/w==
X-Gm-Message-State: ANhLgQ2udLmdzVUklsd9UdQpaFeF4NmBTot2anjCC7n2HIAUQdmNFSnE
        xqoyvmuqGIW9ZWUWwJs/kfLJ5Ru61NfVUjlcJuM=
X-Google-Smtp-Source: ADFU+vvUwftzmRRclxvvzyhLsc/9O0HFBYAoNjwm2ZtXWTEFy5i/ZJJVw6mYIkj76FgQsO8L29zPqCTxgnWSadb1+Og=
X-Received: by 2002:a9d:64cd:: with SMTP id n13mr1286943otl.274.1584604849293;
 Thu, 19 Mar 2020 01:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200313212345.GM4751@pendragon.ideasonboard.com> <OSBPR01MB359079EAA32E0DCBF63C6886AAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <CA+V-a8t-rA-6AmZry63QeXN6pvGWVtcEEuHaDA1jsS-x+30oiQ@mail.gmail.com> <20200318232236.GJ24538@pendragon.ideasonboard.com>
In-Reply-To: <20200318232236.GJ24538@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 19 Mar 2020 08:00:22 +0000
Message-ID: <CA+V-a8uNLvPS2+sbtiOk2Ytegacf+yKc+GyMTZZdsY+Ovv5nkA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] media: i2c: ov5645: Set maximum leverage of
 external clock frequency to 24480000
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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

On Wed, Mar 18, 2020 at 11:22 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Wed, Mar 18, 2020 at 10:41:57PM +0000, Lad, Prabhakar wrote:
> > On Fri, Mar 13, 2020 at 9:31 PM Prabhakar Mahadev Lad wrote:
> > > On 13 March 2020 21:24, Laurent Pinchart wrote:
> > >> On Fri, Mar 13, 2020 at 09:12:33PM +0000, Lad Prabhakar wrote:
> > >>> While testing on Renesas RZ/G2E platform, noticed the clock frequency
> > >>> to be 24242424 as a result the probe failed. However increasing the
> > >>> maximum leverage of external clock frequency to 24480000 fixes this
> > >>> issue. Since this difference is small enough and is insignificant set
> > >>> the same in the driver.
> > >>>
> > >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>> ---
> > >>>  drivers/media/i2c/ov5645.c | 6 ++++--
> > >>>  1 file changed, 4 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > >>> index 4fbabf3..b49359b 100644
> > >>> --- a/drivers/media/i2c/ov5645.c
> > >>> +++ b/drivers/media/i2c/ov5645.c
> > >>> @@ -1107,8 +1107,10 @@ static int ov5645_probe(struct i2c_client *client)
> > >>>  }
> > >>>
> > >>>  xclk_freq = clk_get_rate(ov5645->xclk);
> > >>> -/* external clock must be 24MHz, allow 1% tolerance */
> > >>> -if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> > >>> +/* external clock must be 24MHz, allow a minimum 1% and a
> > >> maximum of 2%
> > >>> + * tolerance
> > >>
> > >> So where do these numbers come from ? I understand that 2% is what you
> > >> need to make your clock fit in the range, but why -1%/+2% instead of -
> > >> 2%/+2% ? And why not 2.5 or 3% ? The sensor datasheet documents the
> > >> range of supported xvclk frequencies to be 6MHz to 54MHz. I understand
> > >> that PLL parameters depend on the clock frequency, but could they be
> > >> calculated instead of hardcoded, to avoid requiring an exact 24MHz input
> > >> frequency ?
> > >>
> > > To be honest I don't have the datasheet for ov5645, the flyer says 6-54Mhz but the
> > > logs/comment says 24Mhz.
> > >
> > Comparing to ov5640 datasheet [1] (which I am assuming might be
> > similar to ov5645),
>
> Let's assume this to be the case, I see no reason not to :-)
>
> > this change should affect the driver.
>
> How do you mean ?
>
Oops sorry for for the typo I meant shouldn't affect the driver :)

Cheers,
--Prabhakar

> > [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
> >
> > >>> + */
> > >>> +if (xclk_freq < 23760000 || xclk_freq > 24480000) {
> > >>>  dev_err(dev, "external clock frequency %u is not supported\n",
> > >>>  xclk_freq);
> > >>>  return -EINVAL;
>
> --
> Regards,
>
> Laurent Pinchart
