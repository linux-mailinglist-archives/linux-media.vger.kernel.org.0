Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325982313F5
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 22:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbgG1Uat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 16:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728723AbgG1Uas (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 16:30:48 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF654C061794
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 13:30:48 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id t7so2074679otp.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QiWlYyzn9n0T8EwLlp2hHlFqkXuVORcuySURVI0nC3g=;
        b=TBTLI/Xqpk9wnGF54Fpk0Cf0S89SK3IkFq/RReQcOE3+6F2vXJFXH+uInfKQv/KxaH
         pyRGprzMzV+UeXZ4ik8HXFJkRM+epD6GHwZdEmBkb6vWDAeVB86DbTrX0NldK7SLvfyP
         KqJXx157HM3na5CFJ+fbcmtJI1ANy27NI9Y4F6wKtR+wTIVBNCBIDDi7s4RYZquy1Be7
         BwQbyGNgMhcoR8L32i/851R3gd3qR3QLlt3cJpvBAjDEPN3GPx4WFkUsz/KwaqhyX4DL
         oHMqAQmOBJAT0Njx8xo6KQSdF28ohrwqeJizLM7yIfnUWe5/iu8OvZR0h7UXZ9wxYx5r
         BW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QiWlYyzn9n0T8EwLlp2hHlFqkXuVORcuySURVI0nC3g=;
        b=XI/z9UkpdVeSuZYO1ex0JgD8YSktlRU9HiaB2qRriV86qrx0pRYgyZj14oRUM8EaWX
         wg3jbOoMvF6WxGUrzWUnJ2Zv2gXmmSkexXtprgxugykMyEk2KcgQ/VRX4jSoXj0y66OH
         yzb+enbvbn1bh2+rqyZaTSDwjKIoB3Fu9ppskbxd7mqZdwv+n2k75g0PvSSJf4dF7DX5
         VNw/oou9nfH2pyLyIqKrfuV+8vo3Vx61HHXOO68Ek0d+Kra+DM+DV5u+jMvIZ50eahXj
         /LwSa0OK+qO0nDWF77GMWaRgZEbQQzacRm1gaQW6dDK/INht76yU0+Kejxp9OlMIMLm1
         SNMg==
X-Gm-Message-State: AOAM533Zxs2/ysXdIEjN/WzWUoYMIc6t/xBGmMhmCcyDWDNzVK50bPl4
        aOBS9O4VRHyqhDaHvlno02EOgTUS5QTheaSfw8A=
X-Google-Smtp-Source: ABdhPJwN1sRSTjOAOEV8belB7Jj3pDIqiPVQNodOmgT5ODtLAvveCy6oLOSJh5o2iKQsuFbsarmNL/2i8MZQd1rykvY=
X-Received: by 2002:a9d:7dd3:: with SMTP id k19mr24384319otn.43.1595968248055;
 Tue, 28 Jul 2020 13:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8vt1HEhJzc4jN22=7PnVrkcKjzFx7Q9E1ZK-YAtc09q0w@mail.gmail.com>
 <20200728184249.GI13753@pendragon.ideasonboard.com> <CA+V-a8upEM4fA=8_3AHEGysEc841SRafvSMioBRgd97bUKgw4g@mail.gmail.com>
 <20200728195451.GM13753@pendragon.ideasonboard.com>
In-Reply-To: <20200728195451.GM13753@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 28 Jul 2020 21:30:21 +0100
Message-ID: <CA+V-a8vrVgGg9u1QQ6-wQXBKCvY+D35=58iBp19xRa_EFyxNTw@mail.gmail.com>
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

On Tue, Jul 28, 2020 at 8:55 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Tue, Jul 28, 2020 at 08:04:39PM +0100, Lad, Prabhakar wrote:
> > On Tue, Jul 28, 2020 at 7:43 PM Laurent Pinchart wrote:
> > > On Tue, Jul 28, 2020 at 06:50:21PM +0100, Lad, Prabhakar wrote:
> > > > Hi,
> > > >
> > > > I am currently investigating adding support for the BT656 format which
> > > > is currently missing in the driver.
> > > >
> > > > The platform which I am currently testing can support both 8-bit DVP
> > > > and BT656 modes.
> > > > * Testing DVP mode capturing 320x240, 640x480 worked  OK with random
> > > > green lines in-between
> > > >
> > > > Following is the chunk of code which enables BT656 support,  (for
> > > > BT656 mode ov5640_set_dvp_pclk() is used), with the below changes I
> > > > can get 640x480 working
> > > >
> > > > #define OV5640_REG_CCIR656_CTRL00    0x4730
> > > >
> > > > static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> > > > {
> > > >     int ret;
> > > >
> > > >     ret = ov5640_write_reg(sensor,
> > > >                    OV5640_REG_IO_MIPI_CTRL00, on ? 0x18: 0);
> > > >     if (ret)
> > > >         return ret;
> > > >
> > > >     ret = ov5640_write_reg(sensor,
> > > >                    OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
> > > >     if (ret)
> > > >         return ret;
> > > >
> > > >     ret = ov5640_write_reg(sensor,
> > > >                    OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
> > > >     if (ret)
> > > >         return ret;
> > > >
> > > >     return ov5640_write_reg(sensor,
> > > >                 OV5640_REG_CCIR656_CTRL00, on ? 0x1: 0x0);
> > > > }
> > > >
> > > > As soon as I change the code to below to disable the data pads on
> > > > stream OFF as below it stops working!
>
> What stops working ? BT.656, non-BT.656, or both ? And how exactly does
> it stop working ? The change below only affects the !on case, does the
> first capture succeed and the subsequent captures fail ?
>
Sorry for the confusion. I am mainly focusing on BT.656 atm, so with
the below (!on case) BT.6565 stops working. Using yavta to capture
single frames [1] the first run is OK and subsequent fails and its
similar behaviour with gstreamer pipeline [2] too.

[1] yavta /dev/video$1 -c1 -n3 -s640x480 -fUYVY -Fov.raw
[2] gst-launch-1.0 -emv v4l2src device=/dev/video$1 io-mode=dmabuf !
queue ! 'video/x-raw,format=UYVY,width=640,height=480,framerate=30/1'
! queue ! videoconvert ! queue ! fbdevsink sync=false

Cheers,
Prabhakar

> > > > static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> > > > {
> > > >     int ret;
> > > >
> > > >     ret = ov5640_write_reg(sensor,
> > > >                    OV5640_REG_IO_MIPI_CTRL00, on ? 0x18: 0);
> > > >     if (ret)
> > > >         return ret;
> > > >
> > > >     ret = ov5640_write_reg(sensor,
> > > >                    OV5640_REG_PAD_OUTPUT_ENABLE01, on ? 0x7f, 0);
> > >
> > > s/,/:/ ? Is that a typo in your e-mail, or also in the code you've
> > > tested ? I assume the former as the latter shouldn't compile.
> >
> > My bad it's a typo :) as my code base had one which doesnt disable
> > data pads on stream off, so I mistyped while hand crafting it.
> >
> > > >     if (ret)
> > > >         return ret;
> > > >
> > > >     ret = ov5640_write_reg(sensor,
> > > >                    OV5640_REG_PAD_OUTPUT_ENABLE02, on ? 0xfc, 0);
> > > >     if (ret)
> > > >         return ret;
> > > >
> > > >     return ov5640_write_reg(sensor,
> > > >                 OV5640_REG_CCIR656_CTRL00, on ? 0x1: 0x0);
> > > > }
> > > >
> > > > Looking at the datasheet [1] I don't find it wrong or is there any
> > > > information missing in this freely available datasheet.
> > > >
> > > > Ideally BT656 mode should just work in DVP mode by setting 0x1 in
> > > > 0x4730, but doesn work.
> > > >
> > > > Is there anything  I'm missing here, any thoughts ?
> > > >
> > > > [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>
> --
> Regards,
>
> Laurent Pinchart
