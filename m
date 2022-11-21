Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26DD6330BC
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 00:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbiKUXjH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 18:39:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbiKUXjC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 18:39:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2941A49B7A
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 15:38:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DBF488F;
        Tue, 22 Nov 2022 00:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669073936;
        bh=CqKtBbc+UztcReSsY5uc7wHmjqnU7LShRraVJC+DhjE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nIw6Pcl3Z/Ap3qVz93mC5/XwW2FMds+r9WuTUEeiOkSRRRUqIKi21drT533ej/my1
         nMzIOlQBD8fUIexazhHnRPoPWlRQHdK89Ykg9R55Svw6P/IHtix+ovu7M7tdT5wpr/
         r0+I5V6ZjGJ5c/HqgBgn5J05BCp7TKK7k2p/cDa0=
Date:   Tue, 22 Nov 2022 01:38:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 00/10] media: ar0521: Add analog gain, rework clock
 tree
Message-ID: <Y3wMAVlpal8SHJuF@pendragon.ideasonboard.com>
References: <20221104142452.117135-1-jacopo@jmondi.org>
 <20221121174933.fousgbqgmgxvvdmf@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221121174933.fousgbqgmgxvvdmf@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Nov 21, 2022 at 06:49:33PM +0100, Jacopo Mondi wrote:
> I just noticed patch 10/10 was missing.
> 
> Now sent in reply to this thread.
> 
> While at it, gentle ping to see if this can make it for 6.2 ?

I'm drowning in reviews, so you'll need another volunteer.

> On Fri, Nov 04, 2022 at 03:24:43PM +0100, Jacopo Mondi wrote:
> > Hello,
> >   this series adds a few features to the ar0521 driver to enable its usage
> > with libcamera.
> >
> > In particular:
> > - enum_frame_sizes
> > - global analog gain control
> > - LINK_FREQ
> > - Rework blanking handligs
> >
> > v3 (Dave)
> > - Check __v4l2_ctrl_modify_range() return value
> > - Make LINK_FREQ readonly to avoid additional churn in s_ctrl
> > - Fix trivial early return in s_ctrl
> > - Use exposure's default value when modifying the controls' limits
> > - Change the exposure default to 0x70 to match the register default value
> >
> > v2:
> > - I have dropped the most controverse part that allows to change the link
> >   frequency to obtain 60FPS. It can be eventually be applied on top.
> > - Use register 0x3028 to control analog gain not to overwrite the global digital
> >   gain.
> > - Fix the HBLANK/VBLANK max by using the values read from on-chip registers.
> > - Fix handling of LINK_FREQ in s_cltr (but do not make the control read only).
> > - Fix errors reported by 0-days:
> >   - use do_div() for 64-bit division
> >   - declare variables in function scope and not in case scope in s_ctrl
> >
> > Jacopo Mondi (10):
> >   media: ar0521: Implement enum_frame_sizes
> >   media: ar0521: Add V4L2_CID_ANALOG_GAIN
> >   media: ar0521: Set maximum resolution to 2592x1944
> >   media: ar0521: Rework PLL computation
> >   media: ar0521: Refuse unsupported controls
> >   media: ar0521: Add LINK_FREQ control
> >   media: ar0521: Adjust exposure and blankings limits
> >   media: ar0521: Setup controls at s_stream time
> >   media: ar0521: Rework startup sequence
> >   media: ar0521: Tab-align definitions
> >
> >  drivers/media/i2c/ar0521.c | 352 ++++++++++++++++++++++++++-----------
> >  1 file changed, 250 insertions(+), 102 deletions(-)
> >

-- 
Regards,

Laurent Pinchart
