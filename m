Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB10F67CA38
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 12:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237278AbjAZLrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 06:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237248AbjAZLq7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 06:46:59 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8EF82CFED
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 03:46:56 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 197B820073;
        Thu, 26 Jan 2023 13:46:55 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1674733615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lhqZrDdJVV+yK+wtN6P22iB7FSo/EaIuwFI2/QPnk4I=;
        b=q8LxORWQkFxUepfEVR9Xoi7YiqRbwvyfOP66ULzHU9WdHCihvQYVyNnKchhdznefVfhXOt
        lqwHUVmVr2oCMFsLKMEEGbVRRb1JEbgYbYQRZ3wi8zozwLeSk4m5sZEQqLaB3Gop6EwX41
        GVjbB1oGOxaDCHlTr2DqP66SYs7Sz0I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1674733615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lhqZrDdJVV+yK+wtN6P22iB7FSo/EaIuwFI2/QPnk4I=;
        b=K9bzAK+ZXcKIyvq7kjiFreQLECtthcc2mWEs8w1eqKdmMiIYA/cb8/dBwopn5uN7D9rBnA
        f4pUvaQY+mFMd249+o/EcKUoXtUeJ8oFhEvwDozIGyIsBwdjEqh9rCoOvhp31MRr3jAKsU
        HHEzs1GSyyZRn4r6W21PhgFbzzroUBI=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1674733615; a=rsa-sha256; cv=none;
        b=q5z19jbPnF0JYV/hJltN6VwogQdbJPOK78uty9ElqqQMTr3HpPAV3EoZkahxFwF2Ep2Qu1
        J4BKzszCRsrphlzwSIzaaK636KP7Xz3OLXV+/7ttfQhs3OXbqCsA6Lrf86LTMMhOoUvgp1
        NXyoJdydDVij/73GHAqurtvwj2NfaMI=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 56568634C91;
        Thu, 26 Jan 2023 13:46:18 +0200 (EET)
Date:   Thu, 26 Jan 2023 13:46:17 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [RFC] Interactions between camera sensor rotation and flip
 controls
Message-ID: <Y9JoCU280XiCWAb7@valkosipuli.retiisi.eu>
References: <Y9G3RV1+Tz23GTA5@pendragon.ideasonboard.com>
 <Y9G4zLehoFIq6D/1@pendragon.ideasonboard.com>
 <Y9JMZc6aSMSt0wcN@valkosipuli.retiisi.eu>
 <20230126101626.uocuz3og7dgalg66@uno.localdomain>
 <Y9JcwIwfTxzO/mzU@pendragon.ideasonboard.com>
 <Y9Jh67fI3GzFXSVt@valkosipuli.retiisi.eu>
 <Y9Jkm95dWMgzJlxO@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9Jkm95dWMgzJlxO@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jan 26, 2023 at 01:31:39PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Jan 26, 2023 at 01:20:11PM +0200, Sakari Ailus wrote:
> > On Thu, Jan 26, 2023 at 12:58:08PM +0200, Laurent Pinchart wrote:
> > > On Thu, Jan 26, 2023 at 11:16:26AM +0100, Jacopo Mondi wrote:
> > > > On Thu, Jan 26, 2023 at 11:48:21AM +0200, Sakari Ailus wrote:
> > > > > On Thu, Jan 26, 2023 at 01:18:36AM +0200, Laurent Pinchart wrote:
> > > > > > On Thu, Jan 26, 2023 at 01:12:06AM +0200, Laurent Pinchart wrote:
> > > > > > > Hello,
> > > > > > >
> > > > > > > Jacopo, Sakari and I ended up having a long discussion today about the
> > > > > > > interactions between sensor rotation (as described in the device tree)
> > > > > > > and the V4L2 flip controls. The conversation started from the imx258
> > > > > > > series that Jacopo recently posted ([1]) and ended up as an in-depth
> > > > > > > analysis of the problem.
> > > > > > >
> > > > > > > The notes we have taken are copied below. Feedback would be appreciated,
> > > > > > > I will then translate that into patches for the kernel documentation.
> > > > > > >
> > > > > > > [1] https://lore.kernel.org/linux-media/20230117100603.51631-1-jacopo.mondi@ideasonboard.com/
> > > > > > >
> > > > > > > ## Problem description
> > > > > > >
> > > > > > > V4L2 has five different elements that related to flipping and rotation:
> > > > > > >
> > > > > > > - Device tree "rotation" property
> > > > > > > - V4L2_CID_CAMERA_SENSOR_ROTATION control
> > > > > > > - V4L2_CID_ROTATE control
> > > > > > > - V4L2_CID_HFLIP and V4L2_CID_VFLIP controls
> > > > > > > - Bayer pattern exposed through media bus codes
> > > > > > >
> > > > > > > While all those components are (more or less) well-defined in the API, their
> > > > > > > interactions have never been defined. This has led to different drivers
> > > > > > > implementing different behaviours.
> > > > > > >
> > > > > > > ### Full-featured drivers
> > > > > > >
> > > > > > > List of drivers that parse the DT rotation property and expose
> > > > > > > V4L2_CID_CAMERA_SENSOR_ROTATION, V4L2_CID_HFLIP and V4L2_CID_VFLIP:
> > > > > > >
> > > > > > > $ git grep -l FLIP $(git grep -l v4l2_ctrl_new_fwnode_properties -- drivers/media/i2c/)
> > > > > > > - drivers/media/i2c/imx219.c
> > > > > > > - drivers/media/i2c/ov08x40.c
> > > > > > > - drivers/media/i2c/ov13b10.c
> > > > > > > - drivers/media/i2c/ov5640.c
> > > > > > > - drivers/media/i2c/ov5675.c (to be upstreamed)
> > > > > > > - drivers/media/i2c/ov5693.c
> > > > > > > - drivers/media/i2c/ov8865.c
> > > > > > > - drivers/media/i2c/ov9282.c
> > > > > > >
> > > > > > > All those drivers by ov5640 program the sensor with the HFLIP and VFLIP values
> > > > > > > as-is, without taking the rotation property into account. ov5640 inverts the
> > > > > > > flipping controls transparently when the rotation is 180, but does still expose
> > > > > > > the rotation value to userspace unmodified (commit
> > > > > > > 1066fc1c2afdbe5977eae37314f0c21462e82b9a, merged in v6.0).
> > > > > > >
> > > > > > > ### Flip-enabled drivers
> > > > > > >
> > > > > > > List of drivers that expose the V4L2_CID_HFLIP and V4L2_CID_VFLIP but not
> > > > > > > V4L2_CID_CAMERA_SENSOR_ROTATION:
> > > > > > >
> > > > > > > $ git grep -vl v4l2_ctrl_new_fwnode_properties $(git grep -l V4L2_CID_HFLIP -- drivers/media/i2c/)
> > > > > > > - drivers/media/i2c/ccs/ccs-core.c
> > > > > > > - drivers/media/i2c/hi847.c
> > > > > > > - drivers/media/i2c/imx208.c
> > > > > > > - drivers/media/i2c/imx219.c
> > > > > > > - drivers/media/i2c/imx319.c
> > > > > > > - drivers/media/i2c/imx355.c
> > > > > > > - drivers/media/i2c/mt9m032.c
> > > > > > > - drivers/media/i2c/mt9m111.c
> > > > > > > - drivers/media/i2c/mt9p031.c
> > > > > > > - drivers/media/i2c/mt9v011.c
> > > > > > > - drivers/media/i2c/ov08d10.c
> > > > > > > - drivers/media/i2c/ov08x40.c
> > > > > > > - drivers/media/i2c/ov13b10.c
> > > > > > > - drivers/media/i2c/ov2640.c
> > > > > > > - drivers/media/i2c/ov2680.c
> > > > > > > - drivers/media/i2c/ov5640.c
> > > > > > > - drivers/media/i2c/ov5645.c
> > > > > > > - drivers/media/i2c/ov5648.c
> > > > > > > - drivers/media/i2c/ov5675.c
> > > > > > > - drivers/media/i2c/ov5693.c
> > > > > > > - drivers/media/i2c/ov6650.c
> > > > > > > - drivers/media/i2c/ov7251.c
> > > > > > > - drivers/media/i2c/ov7670.c
> > > > > > > - drivers/media/i2c/ov772x.c
> > > > > > > - drivers/media/i2c/ov7740.c
> > > > > > > - drivers/media/i2c/ov8856.c
> > > > > > > - drivers/media/i2c/ov8865.c
> > > > > > > - drivers/media/i2c/ov9282.c
> > > > > > > - drivers/media/i2c/ov9640.c
> > > > > > > - drivers/media/i2c/ov9650.c
> > > > > > > - drivers/media/i2c/rj54n1cb0c.c
> > > > > > > - drivers/media/i2c/s5k5baf.c
> > > > > > > - drivers/media/i2c/s5k6aa.c
> > > > > > > - drivers/media/i2c/st-vgxy61.c
> > > > > > > - drivers/media/i2c/vs6624.c
> > > > > > >
> > > > > > > Among those, the ccs driver parses the DT rotation property manually and
> > > > > > > compensates for it transparently by inverting the flip values. The ov772x and
> > > > > > > s5k6aa use a similar mechanism, but based on platform data instead of DT.
> > > > > > >
> > > > > > > ### Rotation-aware drivers
> > > > > > >
> > > > > > > List of drivers that parse the DT rotation property manually:
> > > > > > >
> > > > > > > $ git grep -l '"rotation"' -- drivers/media/i2c/
> > > > > > > - drivers/media/i2c/ccs/ccs-core.c
> > > > > > > - drivers/media/i2c/imx258.c
> > > > > > > - drivers/media/i2c/ov02a10.c
> > > > > > >
> > > > > > > All those drivers parse the DT rotation property and compensates for it
> > > > > > > transparently. The ccs driver inverts the HFLIP and VFLIP controls exposed to
> > > > > > > userspace, while the imx258 and ov02a10 flip the image internally but do not
> > > > > > > expose the HFLIP and VFLIP controls.
> > > > > > >
> > > > > > > ## API standardization
> > > > > > >
> > > > > > > There is a consensus that a standardized API is required. There is also a
> > > > > > > consensus that the V4L2_CID_ROTATE control must *not* be used by any sensor
> > > > > > > driver. No sensor driver expose that control at the moment, so this shouldn't be
> > > > > > > a problem.
> > > > > > >
> > > > > > > ### API for new drivers
> > > > > > >
> > > > > > > - Expose the rotation property through V4L2_CID_CAMERA_SENSOR_ROTATION as-is.
> > > > > > > - Expose the V4L2_CID_HFLIP and V4L2_CID_VFLIP controls as-is.
> > > > > > > - A sensor driver that enables horizontal or vertical flipping *must* expose the
> > > > > > >   HFLIP and VFLIP controls. It *should* expose them writable, but *may* expose
> > > > > > >   them read-only if not enough information is available to implement them as
> > > > > > >   writable in the driver.
> > > > > > >
> > > > > > > ### Backward-compatibility
> > > > > > >
> > > > > > > For drivers:
> > > > > > >
> > > > > > > - We don't care about existing drivers that use platform data (ov772x and
> > > > > > >   s5k6aa). The s5k6aa driver requires platform data, so it could be dropped as
> > > > > > >   nobody is supplying platform data in mainline.
> > > > > > > - The full-featured drivers comply with the API for new drivers except for
> > > > > > >   ov5640. Those are thus fine.
> > > > > > > - The ov5640 gained V4L2_CID_CAMERA_SENSOR_ROTATION support in v6.0, we should
> > > > > > >   fix it, even if it changes the userspace-visible behaviour.
> > > > > > >   - Dropping the internal flip has a higher risk of breaking applications.
> > > > > > >   - Overriding the V4L2_CID_CAMERA_SENSOR_ROTATION value and setting it
> > > > > > >     to 0 when it is 180 is less risky.
> > > > > > > - ccs should expose the V4L2_CID_CAMERA_SENSOR_ROTATION control, and modify it
> > > > > > >   internally to account the transparent 180° compensation.
> > > > > > > - For imx258 and ov02a10, two options are possible:
> > > > > > >   - Expose the V4L2_CID_CAMERA_SENSOR_ROTATION control as-is, and expose the
> > > > > > >     HFLIP and VFLIP controls read-only and hardcoded to enabled (for imx258) or
> > > > > > >     set based on the rotation (for ov02a10). The controls could later be made
> > > > > > >     writable. This only risk of userspace breakage would be with applications
> > > > > > >     that consider the V4L2_CID_CAMERA_SENSOR_ROTATION control but not the flip
> > > > > > >     controls. This is considered to be low-risk.
> > > > > > >   - Do as ccs (overriding the V4L2_CID_CAMERA_SENSOR_ROTATION value).
> > > > > > >     This is the option preferred by Sakari as it would unify the
> > > > > > >     behaviour of the ccs, imx258 and ov02a10 drivers.
> > > > > >
> > > > > > There is possibly an important user-visible difference between those two
> > > > > > options. For rolling-shutter sensors, the motion of objects in the scene
> > > > > > will have a different skew effect depending on the sensor rotation. It
> > > > > > is thus important for userspace to know the real rotation. For this
> > > > >
> > > > > How will it be different? The only user-visible difference, as far as I can
> > > > > tell, is the order of the Bayer pattern.
> > > > 
> > > > I expressed a similar concern as the one Laurent has here summarized.
> > > > 
> > > > I'm thinking about industrial/machine vision applications where knowing the
> > > > real mounting rotation and being in control of the row/col read
> > > > direction is possibily important with rolling shutters and fast moving
> > > > objects? This is mostly speculation, but it might be a valid use case
> > > > for very specialized applications..
> > > > 
> > > > If we compensate V4L2_CID_CAMERA_SENSOR_ROTATION and invert flips to
> > > > hide the implicit mirroring that takes place in the driver,
> > > > application that expects full control might get confused.
> > > 
> > > That's my concern too. Imagine an object moving in the top-down
> > > direction in front of the sensor. With rolling-shutter sensors, the
> > > object will appear stretched vertically if the sensor is mounted
> > > upside-up, and squashed if the sensor is mounted upside-down. This may
> > > be important information for applications.
> > 
> > That's not how it works: with the pixel matrix reading direction changed,
> > it is read in the same (upright) order than when mounted upright. It
> > couldn't be different: the sensor does not have a large buffer where to
> > store the data. It's simply sent over the CSI-2 bus in the order it is
> > read.
> 
> Now that you mention it, it's quite obvious indeed. I'm not sure how I
> got this wrong.
> 
> > > > > The users of these drivers have relied on getting upright images without
> > > > > further device configuration. The existing user space can be expected to
> > > > > break if this is changed.
> > > > 
> > > > Users that do not manipulate flips doesn't need to be changed, and as
> > > > those drivers do not expose flips I don't think there's any issue
> > > > here ? IOW current users will continue to work as they do afaict
> > > > 
> > > > However they will find H/VFLIP enabled by default and (once V/FLIP
> > > > controls are registered and made writable) they will have to "disable"
> > > > the control to mirror/flip the image if they want to do so.
> > > > 
> > > > I don't think that's an issue but maybe I'm overlooking it.
> > > 
> > > For the imx258 and ov02a10, existing users that have the ability to take
> > > flip controls or the sensor rotation controls into account, but not
> > > both, may be affected. Users that take neither controls into account, or
> > > all of them, should be fine. I thus don't expect regressions. For ccs,
> > > we may need to check more carefully.
> > 
> > If the flip control defaults are changed, then there could be fewer
> > regressions. But it's hard to tell: the control values are have a
> > different meaning after the change.
> 
> For ccs I agree. Are you concerned about imx258 and ov02a10 ? While we
> could handle those two the same way as ccs, handling them the same way
> as new drivers but with different defaults for the h/v flip controls has
> the advantage of making the implementation simpler, and aligning it with
> all the other drivers except ccs. That would be my preference, but if
> you strongly prefer otherwise, I'm OK with that as well.

After thinking about this more, I think in the long run it'd be great if we
had all the interfaces aligned, including CCS. The fallout is likely be
very limited, if there is any, even if we change how this works for CCS.
Likely the best way to avoid it would be to default the flipping controls
into values that cause the image to be upright with the default
configuration, but that, I suppose, would again be a divergence from what
the other drivers are doing. Still for applications that already get the
CAMERA_SENSOR_ROTATION property, it would be a small step to set the
flipping controls as well. Again this not exactly as it has been documented
to work, nevertheless still closer to it.

I don't have a wrong opinion about this either way actually. All I want is
that we all are aware of the same facts when making the decision.

In fact there are two things that I'm interested in: not breaking existing
applications if possible and making this work reasonably well for
libcamera.

> 
> > > > > > reason, I think it would be better to never override the
> > > > > > V4L2_CID_CAMERA_SENSOR_ROTATION value exposed to userspace, thus going
> > > > > > for the first of the above two options. The ccs driver should ideally do
> > > > > > the same.
> > > > > >
> > > > > > > For userspace:
> > > > > > >
> > > > > > > - If the V4L2_CID_CAMERA_SENSOR_ROTATION control is not exposed, userspace
> > > > > > >   *must* assume that the rotation is 0.
> > > > > > > - If the HFLIP and VFLIP controls are not exposed, userspace *must* assume that
> > > > > > >   no flipping occurs.
> > > > > > > - The captured video is upright if rotation == 0 and both flipping controls are
> > > > > > >   disabled or rotation == 180 and both flipping controls are enabled.
> > > > > > > - Userspace *must* support read-only HFLIP and VFLIP controls.

-- 
Kind regards,

Sakari Ailus
