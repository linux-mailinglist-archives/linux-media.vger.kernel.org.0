Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F14567D116
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 17:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjAZQNp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 11:13:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjAZQNo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 11:13:44 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E43C51BDC
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 08:13:42 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso2197844pjf.1
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 08:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OuV6ArfPI1NkeZmwOQ7KRH78uXPfNbn/uhsbenhwSo4=;
        b=dyeoz/8yvKhtESocUhRpRKBZAJkAMeh5kNZTUYTrcdUFASEBf2fHGyJ37WgcsnoG1X
         nZlIg51abQO2ZtySrrJHsD9KlgU7fqnBSDMcM3Eggcg6RcOiAHQxhYsPxAAyDzlLyMwP
         i9hLvKDrdkp1Mu6IXFDUXmAnsuurWfSWExiAmmkFttE2ZbpFDrqxLNuui2+NxPiQPXNj
         dVW+EsGtDlIlXMHQzdzKI0fjW2hxNKKJNkeh1PlwzG3zEUImW67K88/KHdQx1pyPhcfN
         BLKwxkEu4h5WHLQaGa4pmsEcRtb+ObMUBWz3eiLcwsymop36ZFXEgfu+GLAwPBy8pSQi
         BjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuV6ArfPI1NkeZmwOQ7KRH78uXPfNbn/uhsbenhwSo4=;
        b=dnDpQx9r5T3D6EZlsO760wwUt9h0ZSmYBAUzOOjUVA3MAYXeMtLoUiJkUEHdNS41pr
         4uRTYIE+i9AXL1C3+I7K8Gh6MG8k1TmI1tMwBqqpltqc8yHhSfVOEs6YkkVly73sRlyp
         3DQh51ly9Qy6LCwtNuScBCXyvLyF4sxfjS6lzxl1QE+TquCBRushZyZAq0tgu2Pc124H
         TI+Hw1PajNasa0jT1ru4K1aXo246QRCHtndLz/OTWjrHv+urPsbeWVNcsqfR5GP5rGH4
         oq/BcsNtYF34a1l+b4N3n3+cgwdQG7leJ3FwFXWQw6h6y/WBwNK7mb+MGzqtSr8wRPCo
         KZpA==
X-Gm-Message-State: AO0yUKX/bAFzNQmJPysoVh192ShjoeRBGtxNHTH97Ld3DySk4pCcdL6N
        UvcEicWOwyvBIPOYLVJFNwMLW/biJBFLbtudFK/YQg==
X-Google-Smtp-Source: AK7set9eVYF+6pbZIJ8pxQu7+V5b93vKF8h+goUIAVHXRVCAluNYxb3mptg17TbVmQDpyc1HhMHwBFgXPa9Y5JN7X2E=
X-Received: by 2002:a17:90b:f87:b0:22c:30a:e88 with SMTP id
 ft7-20020a17090b0f8700b0022c030a0e88mr1203522pjb.171.1674749622367; Thu, 26
 Jan 2023 08:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <Y9KTkSqgyxJbvsj9@kekkonen.localdomain> <CAPY8ntCWUSbvUKziuq0ABX2vOGJyCwtQN7MEt5LXQf0yKpfMKA@mail.gmail.com>
 <Y9Kjzm2PqSRBuoBT@pendragon.ideasonboard.com>
In-Reply-To: <Y9Kjzm2PqSRBuoBT@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 26 Jan 2023 16:13:25 +0000
Message-ID: <CAPY8ntDPoacU1P2TUGEhWmzrx3ykbTFzrTQRjWZrd4sTXLKRwA@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Robert Mader <robert.mader@collabora.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, 26 Jan 2023 at 16:01, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Thu, Jan 26, 2023 at 03:48:04PM +0000, Dave Stevenson wrote:
> > On Thu, 26 Jan 2023 at 14:52, Sakari Ailus wrote:
> > > On Tue, Jan 17, 2023 at 11:06:00AM +0100, Jacopo Mondi wrote:
> > > > Currently the imx258 driver requires to have the 'rotation' device node
> > > > property specified in DTS with a fixed value of 180 degrees.
> > > >
> > > > The "rotation" fwnode device property is intended to allow specify the
> > > > sensor's physical mounting rotation, so that it can be exposed through
> > > > the read-only V4L2_CID_CAMERA_SENSOR_ROTATION control and applications
> > > > can decide how to compensate for that.
> > > >
> > > > The imx258 driver has read-only VFLIP and HFLIP enabled, resulting in
> > > > a 180 degrees image rotation being produced by the sensor. But this
> > > > doesn't imply that the physical mounting rotation should match the
> > > > driver's implementation.
> > > >
> > > > I took into the series Robert's patch that register device node properties and
> > > > on top of that register flips controls, in order to remove the hard requirement
> > > > of the 180 degrees rotation property presence.
> > >
> > > Reconsidering these patches after the flipping vs. rotation discussion,
> > > they seem fine. The only thing I'd like to see, after removing the rotation
> > > property check, would be to add support for the actual flipping controls.
> > > I'm pretty sure they can be found in the same registers as on CCS --- the
> > > rest of the registers look very much like that. Would you like to send a
> > > patch? :-)
> >
> > Yes it is register 0x0101, bits 0 (H) & 1 (V).
> >
> > Do watch out as there are register errors in the driver. Currently
> > Y_ADD_STA is set to 0, and Y_ADD_END to 3118, giving 3119 lines total.
> > That means that when you initially implement flips the Bayer order
> > won't change, but you change the field of view by one line.
> > The start and end values also break the requirements listed in the
> > datasheets for STA/END values being multiples of X (table 4-2 of the
> > datasheet). Correcting that will change the Bayer order when inverted.
> > Does that count as a regression to userspace? I hope not. Memory says
> > that if you don't correct Y_ADD_END then some of the binned modes
> > misbehave.
>
> As long as the driver reports the correct bayer pattern, it should be
> fine.

It does report the correct Bayer order so I would hope so too, however
I know the hard coding that can go on in client apps!

> Interactions between formats and flip controls is something we still
> need to clarify. I plan to have a follow-up discussion on this with
> Jacopo and Sakari after sending documentation patches for the
> interactions between rotation and flips. If you would like to join the
> fun, please let me know.

Feel free to send me an invite for future discussions, however I'm
currently assigned to other tasks and have been told to leave image
sensors alone :-(

> Also, if you have any comment on the rotation & flip discussion notes,
> and especially if there's anything that doesn't seem right to you,
> feedback would be appreciated. If everything is good, you can just ack
> the documentation patches when I'll post them :-)

I have the luxury of being able to largely ignore the existing
clients, but the proposals as currently described seem like they
should work for all parties. I'll respond to your docs when they're
posted.

> > I have been through this loop before as Soho Enterprise [1] make an
> > IMX258 board for the Pi. I haven't upstreamed the patches [2] though
> > (sorry).
>
> Thanks for sharing the branch.

No problem. I am trying to persuade management here that it is worth
the effort to upstream patches, but it's tough going sometimes.
I do always try to ensure that our downstream patches follow the rules
and have SoB etc, so others are at liberty to lift them if they wish.

  Dave

> > [1] https://soho-enterprise.com/
> > [2] https://github.com/raspberrypi/linux/commits/rpi-5.15.y/drivers/media/i2c/imx258.c
>
> --
> Regards,
>
> Laurent Pinchart
