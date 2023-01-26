Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4792F67D099
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbjAZPse (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbjAZPs2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:48:28 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA3C2CC57
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:48:21 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id jl3so2169573plb.8
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FXGWFT+J6GQ46bAnsTIvfGboGW/MkRdb1QNjx5Y83FM=;
        b=UpiMvmRoN7+H/dhxqlpOpWkvgJXCH1lXEdJ5DSQCMIXwCU+ZDrGCnbYemlBOXUPSdP
         RPf21si+IOyGKsoAeTOQ16FcwSvBiIKgyezYg3r17UnV0YfLpLCIIMzIjeS9GVYat2B3
         KkKIGc3XgDpYooSI9VNuwHDx8m59rcKTRSnYNRbyhtHQ/8mqqkZEx6skwaI1QvtR1x7a
         DUOJXeP4QHZbyT3x5Gn4up5XmV+1eCxc9zu9wM6kOfKfxm/xxha+dV6uT44qB8eW5nsg
         H2fuUunkuKYHHjFRIKK4x3agJLUY+yOt19Z6IfkgYUsbaAzH1siMlhF6yGRaerA7e8dk
         qd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXGWFT+J6GQ46bAnsTIvfGboGW/MkRdb1QNjx5Y83FM=;
        b=nh60BZXj7lnwNgcp096I8pDDEsJUAerdrQHvmEL3GqJvOe7lagLmQZtHG/XMVfIheH
         DT5tfK90OJj3G+Vm7DeTlOk3zwMu9vMDPk5hPZupAN2VuWrcJnLYb27SNYiuTfxWn/S1
         pQ/qu6x+q8O/TLpNPRDdC0BRgdXs4NKm9OLhxbRWvHBZ2eFQSPj1MuwkHP34jf268Y17
         Lid8gizx+7eZuhLhdmVZLFghBLUi5T8D9e5pFn5hXWpk6GPgc+rG5E+Tddv8+dwp2nzk
         J1YWXppdTLhdXjI8i0s0ygxH0QNrgBXBsDBRUXYB7qrwP664jp703YjuS6k/G2i/iL7f
         zZsg==
X-Gm-Message-State: AFqh2krGm12TDneEYGhi1HzJ7BvO/lBPJ2slAw8OZEaxGBod7chARz6B
        lQ2sRn0NBkhKYLgXV87zZqv1WCAiRMNisb3Ma1ZRIg==
X-Google-Smtp-Source: AMrXdXvm8tYAFsj70z1IGKVvw09+9JJcUpxVOGEEK7TGOdJxMYdJkLNsCzcqds6mUWF5NEjYDkS6HiR/ZBn52DF9IVA=
X-Received: by 2002:a17:902:d894:b0:193:405:1704 with SMTP id
 b20-20020a170902d89400b0019304051704mr4114436plz.31.1674748101210; Thu, 26
 Jan 2023 07:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com> <Y9KTkSqgyxJbvsj9@kekkonen.localdomain>
In-Reply-To: <Y9KTkSqgyxJbvsj9@kekkonen.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 26 Jan 2023 15:48:04 +0000
Message-ID: <CAPY8ntCWUSbvUKziuq0ABX2vOGJyCwtQN7MEt5LXQf0yKpfMKA@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Robert Mader <robert.mader@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Hi Jacopo and Sakari

On Thu, 26 Jan 2023 at 14:52, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Jacopo,
>
> On Tue, Jan 17, 2023 at 11:06:00AM +0100, Jacopo Mondi wrote:
> > Currently the imx258 driver requires to have the 'rotation' device node
> > property specified in DTS with a fixed value of 180 degrees.
> >
> > The "rotation" fwnode device property is intended to allow specify the
> > sensor's physical mounting rotation, so that it can be exposed through
> > the read-only V4L2_CID_CAMERA_SENSOR_ROTATION control and applications
> > can decide how to compensate for that.
> >
> > The imx258 driver has read-only VFLIP and HFLIP enabled, resulting in
> > a 180 degrees image rotation being produced by the sensor. But this
> > doesn't imply that the physical mounting rotation should match the
> > driver's implementation.
> >
> > I took into the series Robert's patch that register device node properties and
> > on top of that register flips controls, in order to remove the hard requirement
> > of the 180 degrees rotation property presence.
>
> Reconsidering these patches after the flipping vs. rotation discussion,
> they seem fine. The only thing I'd like to see, after removing the rotation
> property check, would be to add support for the actual flipping controls.
> I'm pretty sure they can be found in the same registers as on CCS --- the
> rest of the registers look very much like that. Would you like to send a
> patch? :-)

Yes it is register 0x0101, bits 0 (H) & 1 (V).

Do watch out as there are register errors in the driver. Currently
Y_ADD_STA is set to 0, and Y_ADD_END to 3118, giving 3119 lines total.
That means that when you initially implement flips the Bayer order
won't change, but you change the field of view by one line.
The start and end values also break the requirements listed in the
datasheets for STA/END values being multiples of X (table 4-2 of the
datasheet). Correcting that will change the Bayer order when inverted.
Does that count as a regression to userspace? I hope not. Memory says
that if you don't correct Y_ADD_END then some of the binned modes
misbehave.

I have been through this loop before as Soho Enterprise [1] make an
IMX258 board for the Pi. I haven't upstreamed the patches [2] though
(sorry).

  Dave

[1] https://soho-enterprise.com/
[2] https://github.com/raspberrypi/linux/commits/rpi-5.15.y/drivers/media/i2c/imx258.c

> --
> Regards,
>
> Sakari Ailus
