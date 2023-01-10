Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C03E66415C
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 14:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238055AbjAJNN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 08:13:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238628AbjAJNNt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 08:13:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB65D224
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 05:13:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A984A10B;
        Tue, 10 Jan 2023 14:13:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673356426;
        bh=lpZUt5icHmqMEaeEj2zk5SSb5oCV69epH0BGLRXjsME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZLuRlruSfaWQFRkRJS72z2MPXm9hFERO1vldQ2Di1UgQJOAjWZNPW1RkSOtRtXu5+
         0UbnPBlRVT6tztOlLg+ogZ1IvSzkDyar1napTHT2vdumZ8fJpFWw9ROmg6aRwc1z42
         obgJoI2oDCn4mznhpSHGYfSGSwc9tOxA2pXdsQ/A=
Date:   Tue, 10 Jan 2023 15:13:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Pekka Paalanen <ppaalanen@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org,
        Sophie Friedrich <lkml@flowerpot.me>
Subject: Re: Potential integration of thermal cameras into v4l
Message-ID: <Y71kh/vo6l54W7xm@pendragon.ideasonboard.com>
References: <e9da9461-240e-f5b4-089e-378b85734632@flowerpot.me>
 <20230110104626.23f476df@ferris.localdomain>
 <20230110114518.cp3bitj4hketc2ix@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230110114518.cp3bitj4hketc2ix@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Tue, Jan 10, 2023 at 12:45:18PM +0100, Jacopo Mondi via libcamera-devel wrote:
> On Tue, Jan 10, 2023 at 10:46:26AM +0200, Pekka Paalanen wrote:
> > On Sat, 7 Jan 2023 22:58:41 +0100 Sophie Friedrich wrote:
> >
> > > Hello people,
> > >
> > > over the past months I've written a driver for the Guide MobIR Air¹
> > > USB-C thermal camera. The driver uses v4l2loopback and runs in user
> > > space with python.² The driver manages camera state, calibration and
> > > conversion of the raw microbolometer to temperature values.
> > >
> > > In my research I couldn't find any mentions of a thermal camera support
> > > in the Linux kernel nor the media subsystem, so I assume I'm the first
> > > to ask here and we would presumably need lay out some ground work.
> > >
> > > The current camera driver outputs the temperature in the Y16 format as
> > > Kelvin * 100 (i.e. 28056 (raw) -> 280.56K -> 7.41°C). This allows for
> > > further processing down the line with i.e. OpenCV, but has its
> > > limitations. Especially as temps of only up to 382.2°C can be displayed
> > > currently.
> > >
> > > Does it seem feasible to integrate support for thermal cameras in the
> > > Linux kernel and more specifically in the v4l2 subsystem?
> >
> > Hi,
> >
> > since no-one else replied to you yet, I thought to mention my 2c
> > (I don't really do camera stuff myself so far):
> >
> > Perhaps the best place is to reach out to the libcamera community:
> > https://libcamera.org/
> 
> cc-ed the libcamera list
> 
> I agree it would be interesting to better understand what you mean by
> driver here.
> 
> The camera seems to be a UVC camera, does it deliver frames with the
> current UVC driver or do you need kernel patches to support it ?

From a quick glance at the github project linked below, it doesn't seem
to be a UVC camera.

Sophie, could you please share the `lsusb -v` output for the device (you
can limit it to a specific device with `-d VID:PID`), running as root
(e.g. with `sudo`) if possible ?

> I would also be interested why it needs to go through v4l2loopback..
> 
> > It sounds to me like you want to do some hardware-specific
> > processing in userspace, and it might not be great to try to come
> > up with a generic thermal camera API at the kernel UAPI level.
> > That's where libcamera fits in.
> >
> > As for the pixel type, maybe use a floating-point type to avoid
> > range/precision problems? E.g. DRM_FORMAT_R32F for application
> > facing API. That format does not seem to exist yet, but it's
> > trivial to add into kernel's drm_fourcc.h and should be well
> > accepted IMO.
> >
> > > [1]: https://www.guideir.com/products/mobileaccessories/mobirair/data_300.html
> > > [2]: https://github.com/tyalie/pyMobirAir-v4l2/
> 
> This link is broken :)

Works for me.

-- 
Regards,

Laurent Pinchart
