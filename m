Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8BB29F616
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 21:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgJ2UUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 16:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgJ2UUL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 16:20:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBB7C0613CF;
        Thu, 29 Oct 2020 13:20:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5607C50E;
        Thu, 29 Oct 2020 21:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604002807;
        bh=UnhjckKFeRuTtIPfUUDicRD7MhuMU9sCDF/lmZTn8H4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GG9I+74YilJnDHsYvkBlLyd/uMoNuqRTc2Cid3UkxrfANFAlXBrotpdHQb1czjnSH
         aisCQjtc/GCJmkVSEAr+bfgSnjdfnVjEWO2iZpcjZt5mtCeSs7BU8sf70IFh1XT8Iu
         4QFCAhncFFHa0r43HYachb741GgJ3WZ/gGDMbV+g=
Date:   Thu, 29 Oct 2020 22:19:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linus.walleij@linaro.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201029201918.GD15024@pendragon.ideasonboard.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201024012411.GT5979@pendragon.ideasonboard.com>
 <d188f8b5-ed3b-f91b-171a-26afeb7d213e@gmail.com>
 <20201024093702.GA3939@pendragon.ideasonboard.com>
 <20201026161050.GQ4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201026161050.GQ4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Mon, Oct 26, 2020 at 06:10:50PM +0200, Andy Shevchenko wrote:
> On Sat, Oct 24, 2020 at 12:37:02PM +0300, Laurent Pinchart wrote:
> > On Sat, Oct 24, 2020 at 09:50:07AM +0100, Dan Scally wrote:
> > > On 24/10/2020 02:24, Laurent Pinchart wrote:
> > > > On Mon, Oct 19, 2020 at 11:59:03PM +0100, Daniel Scally wrote:
> 
> > > >> +		adev = acpi_dev_get_first_match_dev(supported_devices[i], NULL, -1);
> > > >
> > > > What if there are multiple sensor of the same model ?
> > > 
> > > Hmm, yeah, that would be a bit of a pickle. I guess the newer
> > > smartphones have multiple sensors on the back, which I presume are the
> > > same model. So that will probably crop up at some point. How about
> > > instead I use bus_for_each_dev() and in the applied function check if
> > > the _HID is in the supported list?
> > 
> > Sounds good to me.
> > 
> > > >> +		if (!adev)
> > > >> +			continue;
> 
> Please, don't.
> 
> If we have so weird ACPI tables it must be w/a differently. The all, even badly
> formed, ACPI tables I have seen so far are using _UID to distinguish instance
> of the device (see second parameter to the above function).
> 
> If we meet the very broken table I would like rather to know about, then
> silently think ahead what could be best.
> 
> I.o.w. don't change this until we will have a real example of the problematic
> firmware.

I'm not sure to follow you. Daniel's current code loops over all the
supported HID (as stored in the supported_devices table), and then gets
the first ACPI device for each of them. If multiple ACPI devices exist
with the same HID, we need to handle them all, so enumerating all ACPI
devices and checking whether their HID is one we handle seems to be the
right option to me.

-- 
Regards,

Laurent Pinchart
