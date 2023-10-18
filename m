Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79D47CD93D
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 12:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbjJRKce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 06:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjJRKcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 06:32:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC3495
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 03:32:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BDE65AA;
        Wed, 18 Oct 2023 12:32:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697625133;
        bh=EBf2gRrszUNCydXCkkM3v3+LORpm47xrdkN2cij8+xM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hURoJUX41BKctgjwEblg7g4piptIV9el1jMtoJGq2LkcKtIYu3pZuGcx/HOw/hgXh
         sv1jRQdDb069dUbdlay1KTk0aRxP5DtsiuCgSbLDJCEGjnynqtypOWvSPHEDFuOVnD
         7X8GlLpeaZelw5BKja+qJ5f7AGCzcKooFj1SM5zs=
Date:   Wed, 18 Oct 2023 13:32:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Umang Jain <umang.jain@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: Sensor driver support with CCS
Message-ID: <20231018103227.GC11118@pendragon.ideasonboard.com>
References: <54ntzswkt2eyhjdrrr4yk5fnru4msoc2fn6esuxffa6obp3met@mw2jqxtivbtp>
 <ZS+lH9G/SR2L2lGX@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZS+lH9G/SR2L2lGX@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 18, 2023 at 09:27:59AM +0000, Sakari Ailus wrote:
> On Wed, Oct 18, 2023 at 12:04:46PM +0530, Umang Jain wrote:
> > Hello everyone,
> > 
> > Past few weeks I have been working to support IMX519 sensor with CCS
> > driver. The highlight is that I can capture frames with CCS driver now,
> > with a few workarounds. This thread summarises the issues that we faced
> > and act as placeholder for more open and structured discussion.
> > 
> > - First open question is regarding the upstream support of a sensor
> >   driver with CCS. How should we term that a sensor is 'mainline-supported'
> >   if it is getting supported by CCS. How can one use a sensor out of the box
> >   with mainline kernel, when supported by CCS?
> 
> If the sensor is fully compliant, it should "just work", but then there's
> the question of CCS static data if the sensor needs it.
> 
> For devices that aren't fully compliant this is a more complicated
> question. Some devices might work with some parameters only, in particular
> horizontal blanking is a sensitive value. The approach here should be to
> set minimum and maximum to the same value to force horizontal blanking
> value that is known to work. The if rules could be used for this as well.
> 
> > 
> > - Continued from the previous discusion point, the more specific question is
> >   about the sensor-specific static data that is composed of
> >   manfacturer-specific-registers (MSRs) and (maybe) overridden
> >   sensor-read-only-regs which are created as part of ccs-tools [1].
> >   This becomes part of firmware? which needs to live /lib/firmware and
> >   then picked up by CCS driver.
> > 
> >   Where can they be centralized ? is linux-firmware an option? [2].
> 
> I'd favour this.

linux-firmware could host the binary files, but how about the YAML
sources ?

> > - It was noticed that with current version of CCS - I was only able to
> >   get 1/3 buffer filled. This was due to the fact that LINE_LENGTH_PCK
> >   and FRAME_LENGTH_LINES registers are not getting updated to permissible
> >   values in / before ccs_start_streaming() starts. Hence they are stuck
> >   with values from probe time.
> 
> If you're not changing vertical or horizontal blanking, these are likely
> the correct values from driver perspective. If these values do not work
> however, then you most likely have an issue with sensor provided limit and
> capability information. This should be fixed using CCS static data.

I may have understood Umang incorrectly, but I thought he meant that the
driver doesn't program those registers if the controls are not changed
by userspace, and the register power-up default values are not right.
Umang, is my understanding wrong ?

> > These are top issues we faced while trying to support IMX519. This thread
> > will act as placeholder to have more discussions in the open and/or help
> > other sensors that can be supported with CCS.
> 
> I'm happy to see you using the CCS driver on a sensor I haven't used
> before. The above issues, while they prevent meaningfully using the sensor
> right now, they also seem easy to resolve.
> 
> Additionally --- if the sensor does not provide meaningful values for its
> vendor and model, we could use the device's compatible string as the basis
> for the firmware file name. I can post a patch for this.

-- 
Regards,

Laurent Pinchart
