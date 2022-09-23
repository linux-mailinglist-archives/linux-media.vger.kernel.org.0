Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BA45E7C19
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 15:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbiIWNnM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 09:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiIWNnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 09:43:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F92B13A048
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 06:43:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64A7F4F7;
        Fri, 23 Sep 2022 15:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663940587;
        bh=JL9mb98uZ5VEyClhNPJj2+sWsBkwPHm/9khHQGUAJEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hbHa54Rxyr9u4steZJR6PttRBW/Bg0QIpKnzFM/vitwto59dKR/CR7nMJ5FeniJS0
         bI2YiLh4x8zN0gkmPFkqM3MQAUI8QA9kncKKL+dyQFjVhilZ1i3wbG1bxmOfV0Hnyf
         UarIacgNqIqAmHmgygGweE1Qk4l40pdl2IsC1KyI=
Date:   Fri, 23 Sep 2022 16:42:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: RFC: Arducam 64 MP (Hawkeye)
Message-ID: <Yy233GUnCgEXuVyP@pendragon.ideasonboard.com>
References: <166392656967.56880.6892202016312600929@Monstersaurus>
 <Yy2EZ4JwG01UKLhX@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yy2EZ4JwG01UKLhX@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Fri, Sep 23, 2022 at 10:03:19AM +0000, Sakari Ailus wrote:
> On Fri, Sep 23, 2022 at 10:49:29AM +0100, Kieran Bingham wrote:
> > Hi Sakari, Laurent,
> > 
> > Last night I hooked up the Arducam 64 MP Hawkeye camera [0], to an RPi4,
> > and added the camera helper for the RaspberryPi IPA to libcamera, and
> > was able to use the camera directly with dtoverlay=arducam_64mp in the
> > Raspberry Pi /boot/config.txt using the latest release from Raspberry
> > Pi.
> > 
> > Raspberry Pi have already added the driver for this camera [1] to their
> > tree, and I have been given the tuning files from Arducam.
> > 
> > This has allowed me to capture an image with pretty good response to
> > changing lighting conditions, and colours. [2] ... The AF isn't yet
> > enabled, so that shot is out of focus a little. (That's for later).
> > 
> > Arducam do not wish to name the sensor used in the module, and have
> > called it the 'arducam_64mp'. But attempting to upstreaming this with
> > that name worries me.
> > 
> > Furthermore, we would like to maintain libcamera as supporting cameras
> > that have 'upstream' drivers (or drivers that are on their way
> > upstream), so I'm keen to identify how we can upstream the drivers to
> > create a better experience for users who are currently finding that they
> > need to run a fork of libcamera to operate the module.
> > 
> > So ultimately - my open question is ... Is it acceptable to have camera
> > drivers that are named by their 'module/integration' rather than their
> > sensor?
> 
> A lot of users (especially the existing ones) depend on the entity name
> currently. I don't think we could change it. For new ones I guess that
> would be possible.
> 
> Alternatively this could be a string control I think. That could be added
> to existing drivers as well.

The question here, as far as I understand, isn't about the entity name
exposed to userspace, but about the driver name. The entity name
certainly matters too.

Camera sensor drivers we have in the mainline kernel are named after the
camera sensor model, and I think we should continue that. If this were a
custom silicon made by Arducam they could name it any way they want, but
if it's a sensor from a known sensor manufacturer, I don't think the
name should be hidden. I wouldn't be surprised if it would be possible
to identify the camera sensor relatively easily from the register set
anyway, which would render this whole game pointless.

One of the major advantages of upstreaming driver is the community
maintenance that you get from free, including improvements to the driver
from other developers who use the same camera sensor in a different
product. We don't want to have multiple drivers for the same hardware in
the mainline kernel, there are precedents for that due to historical
reasons (mostly people not realizing that the same IP core was used in
different SoCs), and there are efforts to fix that. I don't see a reason
to go the opposite way.

TL;DR: Unless there's a very compeling reason not to follow the usual
practice, I don't see why we should make an exception in this case.

-- 
Regards,

Laurent Pinchart
