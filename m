Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C692231223
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 21:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732572AbgG1TFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 15:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732560AbgG1TFH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 15:05:07 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC503C061794
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 12:05:07 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id p25so6331607oto.6
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 12:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gS9BotzOK0x/OdqwWtGsR/fjZLuMgGTG1Gua3JSI12A=;
        b=OQQIORrNwtHCeyZ8YY8cfZ8k8qnTnJNyWGbGyLAb/WGqr7OgJkz4cwgOR+bJbCpPZS
         jO7FqGF7h428sLUlwwToQvsoytJhRkVNCc8UK5CFnzDrcmQJgG9xTidzMXKNM2b989Xr
         92JLxjD5WypvIj3vyCNey7X1jutcn3Zt/h/u2GMMBXVrC+MkalhzOCw3crRPNKvC/l29
         Ct8jK4PBfNW0AjyopRV5i4OESnWLATw4xxym19FDjvGxdy1Ct+jSwF1YhI+KXqeUohL7
         LEVMkXMB9bcHSH0ea4o6FQUalkB9erTAbHk+Rv7Y9GIb/IWBygmtdcw11WTQqDH6Imms
         8qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gS9BotzOK0x/OdqwWtGsR/fjZLuMgGTG1Gua3JSI12A=;
        b=tRBUDmso5a3+h2jPZO6xKyuncb/KXIz1qBTGJG1ruaSgW5YOQMAxaiTHOzo8G3OvXs
         BuLRveCiPSBZrFBcf0sX0wLsdlEBgiHsjvkFU1g/MelSjEbDk0SItvFxkDcDROzZV0jB
         zotkyPOEX0Ng7U44L6Hpn15nVS8+HjkIswyjQpBUUcuTjX4RiCZuvvsvtgg9y3hfjtQY
         BYS1r8omLvDBA9KG2hKfo50HMmXD6wgTDh7r9sBUUcb831R4mb8xVALb2XUpD8vudnyw
         vD9UwvI9wVGPld1sqX0epE+h2mCeBMW86UKq8ML45HhbzYv5c+4Gd34wkQ25d7kzb51K
         HNKA==
X-Gm-Message-State: AOAM533+MTXKgujervglsfxz7Mmi2aMSkZwGa+Tyk74MBdhTXDmmU0AL
        JG/bY+cEgRko03IRusS1UnbL53amE7Hc8e78ieA9TA==
X-Google-Smtp-Source: ABdhPJzotPzRQFgZfDSN+BmCu9kUP5KKHeKbUFtvovHkBe5d6aEFeAMakH45cP87zm0N18hJ1HpNzH8tUBHeIHqqunM=
X-Received: by 2002:a9d:6b95:: with SMTP id b21mr24451207otq.365.1595963106623;
 Tue, 28 Jul 2020 12:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8vt1HEhJzc4jN22=7PnVrkcKjzFx7Q9E1ZK-YAtc09q0w@mail.gmail.com>
 <20200728184249.GI13753@pendragon.ideasonboard.com>
In-Reply-To: <20200728184249.GI13753@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 28 Jul 2020 20:04:39 +0100
Message-ID: <CA+V-a8upEM4fA=8_3AHEGysEc841SRafvSMioBRgd97bUKgw4g@mail.gmail.com>
Subject: Re: [Query] OV5640 DVP and BT656 modes
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Jul 28, 2020 at 7:43 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Tue, Jul 28, 2020 at 06:50:21PM +0100, Lad, Prabhakar wrote:
> > Hi,
> >
> > I am currently investigating adding support for the BT656 format which
> > is currently missing in the driver.
> >
> > The platform which I am currently testing can support both 8-bit DVP
> > and BT656 modes.
> > * Testing DVP mode capturing 320x240, 640x480 worked  OK with random
> > green lines in-between
> >
> > Following is the chunk of code which enables BT656 support,  (for
> > BT656 mode ov5640_set_dvp_pclk() is used), with the below changes I
> > can get 640x480 working
> >
> > #define OV5640_REG_CCIR656_CTRL00    0x4730
> >
> > static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> > {
> >     int ret;
> >
> >     ret = ov5640_write_reg(sensor,
> >                    OV5640_REG_IO_MIPI_CTRL00, on ? 0x18: 0);
> >     if (ret)
> >         return ret;
> >
> >     ret = ov5640_write_reg(sensor,
> >                    OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
> >     if (ret)
> >         return ret;
> >
> >     ret = ov5640_write_reg(sensor,
> >                    OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
> >     if (ret)
> >         return ret;
> >
> >     return ov5640_write_reg(sensor,
> >                 OV5640_REG_CCIR656_CTRL00, on ? 0x1: 0x0);
> > }
> >
> > As soon as I change the code to below to disable the data pads on
> > stream OFF as below it stops working!
> >
> > static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> > {
> >     int ret;
> >
> >     ret = ov5640_write_reg(sensor,
> >                    OV5640_REG_IO_MIPI_CTRL00, on ? 0x18: 0);
> >     if (ret)
> >         return ret;
> >
> >     ret = ov5640_write_reg(sensor,
> >                    OV5640_REG_PAD_OUTPUT_ENABLE01, on ? 0x7f, 0);
>
> s/,/:/ ? Is that a typo in your e-mail, or also in the code you've
> tested ? I assume the former as the latter shouldn't compile.
>
My bad it's a typo :) as my code base had one which doesnt disable
data pads on stream off, so I mistyped while hand crafting it.

Cheers,
Prabhakar

> >     if (ret)
> >         return ret;
> >
> >     ret = ov5640_write_reg(sensor,
> >                    OV5640_REG_PAD_OUTPUT_ENABLE02, on ? 0xfc, 0);
> >     if (ret)
> >         return ret;
> >
> >     return ov5640_write_reg(sensor,
> >                 OV5640_REG_CCIR656_CTRL00, on ? 0x1: 0x0);
> > }
> >
> > Looking at the datasheet [1] I don't find it wrong or is there any
> > information missing in this freely available datasheet.
> >
> > Ideally BT656 mode should just work in DVP mode by setting 0x1 in
> > 0x4730, but doesn work.
> >
> > Is there anything  I'm missing here, any thoughts ?
> >
> > [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>
> --
> Regards,
>
> Laurent Pinchart
