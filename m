Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE8A67D205
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 17:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbjAZQpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 11:45:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbjAZQos (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 11:44:48 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E435B4EE1
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 08:44:46 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id k6so2539776vsk.1
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 08:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+GKhXRtFla3n69+RrujfD2tYNXR8tcz2k8YNzkR/5M0=;
        b=BAbpirP9ttf/3fhDPbrPmpTJLdTXV4HtomF8nmKVsrBF9BC9NHnqTR3l1zWfMoNMUn
         vE5z8/91QHt5cvbumbqGUA3DtLc2slQcnY/010zK5QbStgU5UsPABdQa0kk8FEMKaeUv
         X23Nh9oCJqJvNbtlL1TkOeDpG0f24RljOxQQeF5c/LKvIxWQ3Gr5syhk8tCSLOmsTsed
         DkEs7MGFzLAu9U0VYrtitXziuVlwkl6+xe7uNfWZm8h8XHMsQSZ5KkyQ8YTohX8R44X7
         1NcBFBsetjjgSKVK0h1p33mCkRTXfYz3JZDVL89s+WKBiwjudrWYS4PryJ6oTiCN1fFY
         XaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GKhXRtFla3n69+RrujfD2tYNXR8tcz2k8YNzkR/5M0=;
        b=VflyS927r9SQmm27cfEb/cJAWDMMKqomCytTrZFMan6xOwaZaAeREZdCafebagZEu/
         74pHvmIcy4GmtO6YlCY4hLay2tBEXQtbSzjuveSPHfKk7uaWGnLK1spQ2Ifq4329vWXq
         HhwBzJSVrbXr+VPu7i3oZ7bKXxs3xEG1eWTdOW7CV4GcUDcajeWmSAVrinp21PV7D9/M
         77hkk/eFdRDjKXluRxc0glp19IyitzAKu2425Kp8rFoIRWbpdJQFSR0tucZtfh8LqyZk
         zah/dMHRPEoA5jRO/ieZRGKj5pzOISWi9yoTmfPUHCjcqfeDsRg0h+vMTxiDaTadndVH
         Y4FQ==
X-Gm-Message-State: AO0yUKXjqnmQhHpi9gw+yBgrJPwcZkF/e0TO1YgAIn1M0plA5xdv0+hK
        yB/0+H+yabdrFPbESbZlu9srI1bp6Rs2p8k0LzRx3ZLtYJSJ7Q==
X-Google-Smtp-Source: AK7set/lQSDCa9iM49ZoKW+7/2T4pPn5yynSEu5FPxi7ynJ6PnHraSZUIuP1jmwMwLRNXbHeBvsbaEoDWSfOQFXg0mo=
X-Received: by 2002:a05:6102:73b:b0:3e8:b4c5:1ccc with SMTP id
 u27-20020a056102073b00b003e8b4c51cccmr909563vsg.28.1674751485921; Thu, 26 Jan
 2023 08:44:45 -0800 (PST)
MIME-Version: 1.0
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <Y9KTkSqgyxJbvsj9@kekkonen.localdomain> <CAPY8ntCWUSbvUKziuq0ABX2vOGJyCwtQN7MEt5LXQf0yKpfMKA@mail.gmail.com>
 <Y9Kj//mOE9Fq6ZXb@kekkonen.localdomain>
In-Reply-To: <Y9Kj//mOE9Fq6ZXb@kekkonen.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 26 Jan 2023 16:44:30 +0000
Message-ID: <CAPY8ntC0ZB3SJ08rLD5Y+rRBtqVrESsfbLcfBaE0EqiLV32B+g@mail.gmail.com>
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

Hi Sakari

On Thu, 26 Jan 2023 at 16:02, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Thu, Jan 26, 2023 at 03:48:04PM +0000, Dave Stevenson wrote:
> > Hi Jacopo and Sakari
> >
> > On Thu, 26 Jan 2023 at 14:52, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Jacopo,
> > >
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
>
> Yes, this is the problem with register list based drivers. Well spotted.

It fell out when I flipped the image and the Bayer order didn't change.

> I remember one driver for a Toshiba sensor using value of 5 for a register
> the range of which was 2--10, but only even values were allowed. It worked
> nonetheless... oh well.
>
> I wonder if this sensor would work better with the CCS driver

That's a question I'll leave to others to investigate :-)

> > That means that when you initially implement flips the Bayer order
> > won't change, but you change the field of view by one line.
> > The start and end values also break the requirements listed in the
> > datasheets for STA/END values being multiples of X (table 4-2 of the
> > datasheet). Correcting that will change the Bayer order when inverted.
> > Does that count as a regression to userspace? I hope not. Memory says
> > that if you don't correct Y_ADD_END then some of the binned modes
> > misbehave.
>
> Most sensors also require even values for the ?_ADDR_START registers (and
> odd for the _ADDR_END registers). Using an invalid value sometimes might
> work, too, but only testing will tell.
>
> >
> > I have been through this loop before as Soho Enterprise [1] make an
> > IMX258 board for the Pi. I haven't upstreamed the patches [2] though
> > (sorry).
>
> It'd be nice if both worked with the same driver.

All my patches on that branch should work for existing users, other
than potentially the change of Bayer order if they're making
assumptions.

I have been in touch with Sony about IMX258, however they couldn't
release some information as it was confidential to some company called
Intel ;-)
The PDAF or non-PDAF version information is in the OTP, but they can't
release the details with regard to where.

  Dave

> --
> Kind regards,
>
> Sakari Ailus
