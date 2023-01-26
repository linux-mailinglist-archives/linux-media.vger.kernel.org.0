Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07F0567C7C0
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 10:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbjAZJtf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 04:49:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjAZJte (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 04:49:34 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19FD10414
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 01:49:31 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 320171B001FC;
        Thu, 26 Jan 2023 11:49:28 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1674726568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r5Qlo+u1rck+c9EqOMrgF56Xfj+dqg0AiXD7PmLZSRY=;
        b=f7Mj1g9In4v2V3kSxdmaAbCaZRAvLCiCj3Bb3rVBGjjmXnTQBEKBGVFS0F0iMy9B4OumdI
        aHpYeEtlfW99vPU8848WtGbWZpu40lKIEdvPgEHKIcy/Aul3jzOv0LiZqAdyKppGOJJJun
        06tusU7BgVM4K+2OLeVxQ3WMFUI8nLw1YUwFGHt35EPUTESLSnNvBHr99SbLb8h0MobFyu
        pS1NpEx5wb0bLmnx13dEQGLP0q7ZEehfhoWNuq0CKRRskLCViyszGV6pwMuQJ7PW1F/iZ8
        fTU/pU08mJwdwZdFNOGMipyhS58ayD41mpHLvDjvC1SrP+FvsD6YbCsBJu/0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1674726568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r5Qlo+u1rck+c9EqOMrgF56Xfj+dqg0AiXD7PmLZSRY=;
        b=MXnOqTQN8MBLr+N9QgmEW/IO0yHhl1MghBu8LHm3hDSMneZ+44hIcf2QAe4C8ESBe/WE2L
        lKZ6TCs9NI8SdtL+Q17UzH//HCJsH7ybZdHLhAnu1XRvc/D4QGhjeT2bKZsGWUGfWGK8EH
        tRCAF4ykwWuXUU+pzVdvxN46zW/IkhJUXJ3SBywO9vyPTrvy/IkQz7C/z8Bo9KtR3kAn0+
        BCD12Djuuf9sJ4dy3KmC5AgDxAOcuS2paHSmDu+9oUW37SdwPXQWg5OxLuz1j4kLUSXi/1
        +Hw+78kuc0Bu1g0bxKutZ21Nl1lKgIG4p3sK0Kfx3sxpoD5DdgOwNJ55cd83Aw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1674726568; a=rsa-sha256;
        cv=none;
        b=H6rZ9AvVBVJfi49QF8Rbk8mLnHD+xoU/IWDk2++xfDrj8uiNpulas+lnjd8Bjc+g5mFVX2
        kBg2uB7dplfdS6Ya3IoXQfHGAYnAFgXGSqBEr7bFmid5uuk7vVfT6Chc6Be+TYrhhw0MMo
        ump04ckSRhksHu2CGCSbhuqkmv/iu+AMyrAXHTQU/MFi0d+AZBOsGnPecwpSQpVV/qphkU
        t0+BYiFBN3YLZGyYD2r+TtNM6jhPc5OUdTC1Dz4aJ6H6bJ/t5Inn/xJCzdOE24PBMBu2wO
        5FfwMbx84z7OldbgxBb4a6LiCiCy03BhxDyEJUhhUGyjdHJ0TnfkG56M8Ew4pw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 058A1634C91;
        Thu, 26 Jan 2023 11:48:21 +0200 (EET)
Date:   Thu, 26 Jan 2023 11:48:21 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [RFC] Interactions between camera sensor rotation and flip
 controls
Message-ID: <Y9JMZc6aSMSt0wcN@valkosipuli.retiisi.eu>
References: <Y9G3RV1+Tz23GTA5@pendragon.ideasonboard.com>
 <Y9G4zLehoFIq6D/1@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9G4zLehoFIq6D/1@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jan 26, 2023 at 01:18:36AM +0200, Laurent Pinchart wrote:
> Replying to myself to add a personal comment.
> 
> On Thu, Jan 26, 2023 at 01:12:06AM +0200, Laurent Pinchart wrote:
> > Hello,
> > 
> > Jacopo, Sakari and I ended up having a long discussion today about the
> > interactions between sensor rotation (as described in the device tree)
> > and the V4L2 flip controls. The conversation started from the imx258
> > series that Jacopo recently posted ([1]) and ended up as an in-depth
> > analysis of the problem.
> > 
> > The notes we have taken are copied below. Feedback would be appreciated,
> > I will then translate that into patches for the kernel documentation.
> > 
> > [1] https://lore.kernel.org/linux-media/20230117100603.51631-1-jacopo.mondi@ideasonboard.com/
> > 
> > ## Problem description
> > 
> > V4L2 has five different elements that related to flipping and rotation:
> > 
> > - Device tree "rotation" property
> > - V4L2_CID_CAMERA_SENSOR_ROTATION control
> > - V4L2_CID_ROTATE control
> > - V4L2_CID_HFLIP and V4L2_CID_VFLIP controls
> > - Bayer pattern exposed through media bus codes
> > 
> > While all those components are (more or less) well-defined in the API, their
> > interactions have never been defined. This has led to different drivers
> > implementing different behaviours.
> > 
> > ### Full-featured drivers
> > 
> > List of drivers that parse the DT rotation property and expose
> > V4L2_CID_CAMERA_SENSOR_ROTATION, V4L2_CID_HFLIP and V4L2_CID_VFLIP:
> > 
> > $ git grep -l FLIP $(git grep -l v4l2_ctrl_new_fwnode_properties -- drivers/media/i2c/)
> > - drivers/media/i2c/imx219.c
> > - drivers/media/i2c/ov08x40.c
> > - drivers/media/i2c/ov13b10.c
> > - drivers/media/i2c/ov5640.c
> > - drivers/media/i2c/ov5675.c (to be upstreamed)
> > - drivers/media/i2c/ov5693.c
> > - drivers/media/i2c/ov8865.c
> > - drivers/media/i2c/ov9282.c
> > 
> > All those drivers by ov5640 program the sensor with the HFLIP and VFLIP values
> > as-is, without taking the rotation property into account. ov5640 inverts the
> > flipping controls transparently when the rotation is 180, but does still expose
> > the rotation value to userspace unmodified (commit
> > 1066fc1c2afdbe5977eae37314f0c21462e82b9a, merged in v6.0).
> > 
> > ### Flip-enabled drivers
> > 
> > List of drivers that expose the V4L2_CID_HFLIP and V4L2_CID_VFLIP but not
> > V4L2_CID_CAMERA_SENSOR_ROTATION:
> > 
> > $ git grep -vl v4l2_ctrl_new_fwnode_properties $(git grep -l V4L2_CID_HFLIP -- drivers/media/i2c/)
> > - drivers/media/i2c/ccs/ccs-core.c
> > - drivers/media/i2c/hi847.c
> > - drivers/media/i2c/imx208.c
> > - drivers/media/i2c/imx219.c
> > - drivers/media/i2c/imx319.c
> > - drivers/media/i2c/imx355.c
> > - drivers/media/i2c/mt9m032.c
> > - drivers/media/i2c/mt9m111.c
> > - drivers/media/i2c/mt9p031.c
> > - drivers/media/i2c/mt9v011.c
> > - drivers/media/i2c/ov08d10.c
> > - drivers/media/i2c/ov08x40.c
> > - drivers/media/i2c/ov13b10.c
> > - drivers/media/i2c/ov2640.c
> > - drivers/media/i2c/ov2680.c
> > - drivers/media/i2c/ov5640.c
> > - drivers/media/i2c/ov5645.c
> > - drivers/media/i2c/ov5648.c
> > - drivers/media/i2c/ov5675.c
> > - drivers/media/i2c/ov5693.c
> > - drivers/media/i2c/ov6650.c
> > - drivers/media/i2c/ov7251.c
> > - drivers/media/i2c/ov7670.c
> > - drivers/media/i2c/ov772x.c
> > - drivers/media/i2c/ov7740.c
> > - drivers/media/i2c/ov8856.c
> > - drivers/media/i2c/ov8865.c
> > - drivers/media/i2c/ov9282.c
> > - drivers/media/i2c/ov9640.c
> > - drivers/media/i2c/ov9650.c
> > - drivers/media/i2c/rj54n1cb0c.c
> > - drivers/media/i2c/s5k5baf.c
> > - drivers/media/i2c/s5k6aa.c
> > - drivers/media/i2c/st-vgxy61.c
> > - drivers/media/i2c/vs6624.c
> > 
> > Among those, the ccs driver parses the DT rotation property manually and
> > compensates for it transparently by inverting the flip values. The ov772x and
> > s5k6aa use a similar mechanism, but based on platform data instead of DT.
> > 
> > ### Rotation-aware drivers
> > 
> > List of drivers that parse the DT rotation property manually:
> > 
> > $ git grep -l '"rotation"' -- drivers/media/i2c/
> > - drivers/media/i2c/ccs/ccs-core.c
> > - drivers/media/i2c/imx258.c
> > - drivers/media/i2c/ov02a10.c
> > 
> > All those drivers parse the DT rotation property and compensates for it
> > transparently. The ccs driver inverts the HFLIP and VFLIP controls exposed to
> > userspace, while the imx258 and ov02a10 flip the image internally but do not
> > expose the HFLIP and VFLIP controls.
> > 
> > ## API standardization
> > 
> > There is a consensus that a standardized API is required. There is also a
> > consensus that the V4L2_CID_ROTATE control must *not* be used by any sensor
> > driver. No sensor driver expose that control at the moment, so this shouldn't be
> > a problem.
> > 
> > ### API for new drivers
> > 
> > - Expose the rotation property through V4L2_CID_CAMERA_SENSOR_ROTATION as-is.
> > - Expose the V4L2_CID_HFLIP and V4L2_CID_VFLIP controls as-is.
> > - A sensor driver that enables horizontal or vertical flipping *must* expose the
> >   HFLIP and VFLIP controls. It *should* expose them writable, but *may* expose
> >   them read-only if not enough information is available to implement them as
> >   writable in the driver.
> > 
> > ### Backward-compatibility
> > 
> > For drivers:
> > 
> > - We don't care about existing drivers that use platform data (ov772x and
> >   s5k6aa). The s5k6aa driver requires platform data, so it could be dropped as
> >   nobody is supplying platform data in mainline.
> > - The full-featured drivers comply with the API for new drivers except for
> >   ov5640. Those are thus fine.
> > - The ov5640 gained V4L2_CID_CAMERA_SENSOR_ROTATION support in v6.0, we should
> >   fix it, even if it changes the userspace-visible behaviour.
> >   - Dropping the internal flip has a higher risk of breaking applications.
> >   - Overriding the V4L2_CID_CAMERA_SENSOR_ROTATION value and setting it
> >     to 0 when it is 180 is less risky.
> > - ccs should expose the V4L2_CID_CAMERA_SENSOR_ROTATION control, and modify it
> >   internally to account the transparent 180° compensation.
> > - For imx258 and ov02a10, two options are possible:
> >   - Expose the V4L2_CID_CAMERA_SENSOR_ROTATION control as-is, and expose the
> >     HFLIP and VFLIP controls read-only and hardcoded to enabled (for imx258) or
> >     set based on the rotation (for ov02a10). The controls could later be made
> >     writable. This only risk of userspace breakage would be with applications
> >     that consider the V4L2_CID_CAMERA_SENSOR_ROTATION control but not the flip
> >     controls. This is considered to be low-risk.
> >   - Do as ccs (overriding the V4L2_CID_CAMERA_SENSOR_ROTATION value).
> >     This is the option preferred by Sakari as it would unify the
> >     behaviour of the ccs, imx258 and ov02a10 drivers.
> 
> There is possibly an important user-visible difference between those two
> options. For rolling-shutter sensors, the motion of objects in the scene
> will have a different skew effect depending on the sensor rotation. It
> is thus important for userspace to know the real rotation. For this

How will it be different? The only user-visible difference, as far as I can
tell, is the order of the Bayer pattern.

The users of these drivers have relied on getting upright images without
further device configuration. The existing user space can be expected to
break if this is changed.

> reason, I think it would be better to never override the
> V4L2_CID_CAMERA_SENSOR_ROTATION value exposed to userspace, thus going
> for the first of the above two options. The ccs driver should ideally do
> the same.
> 
> > For userspace:
> > 
> > - If the V4L2_CID_CAMERA_SENSOR_ROTATION control is not exposed, userspace
> >   *must* assume that the rotation is 0.
> > - If the HFLIP and VFLIP controls are not exposed, userspace *must* assume that
> >   no flipping occurs.
> > - The captured video is upright if rotation == 0 and both flipping controls are
> >   disabled or rotation == 180 and both flipping controls are enabled.
> > - Userspace *must* support read-only HFLIP and VFLIP controls.

-- 
Kind regards,

Sakari Ailus
