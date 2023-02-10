Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11718691E67
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 12:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbjBJLfS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 06:35:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjBJLfR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 06:35:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B00271F07
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 03:35:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AF7927C;
        Fri, 10 Feb 2023 12:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676028915;
        bh=BCCOHpkCVGThX6ksdJ6uABjuM8PelMmC6tLHGzcCA54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lerfKsljU4GprnNsU2CAdwoWU31Ejq50+ry83cQgCiE9x4LiwzZFxwgcqEodSlFPw
         QM+Ft/1r6sZLK5ZOFi5JKNUH5KsLUlOrVbJgjJKRLhX9k8Ln5wVwoI03pP9bR8N+Op
         bFRxmdHvaWhcdypLkOHWnGX/rbd9OYmmtC35RTHg=
Date:   Fri, 10 Feb 2023 13:35:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+Yr8dOcDptuUe4D@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <Y+YamxehIUdF5aU7@kekkonen.localdomain>
 <Y+Ycf4SpMaUfdR5m@pendragon.ideasonboard.com>
 <Y+Yg217HSEi4c+mP@kekkonen.localdomain>
 <Y+YiNyC7TeOEn/Hi@smile.fi.intel.com>
 <974597c0-1614-97d5-d933-e52bb1a062ab@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <974597c0-1614-97d5-d933-e52bb1a062ab@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 10, 2023 at 12:19:30PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 2/10/23 11:53, Andy Shevchenko wrote:
> > On Fri, Feb 10, 2023 at 12:47:55PM +0200, Sakari Ailus wrote:
> >> On Fri, Feb 10, 2023 at 12:29:19PM +0200, Laurent Pinchart wrote:
> >>> On Fri, Feb 10, 2023 at 12:21:15PM +0200, Sakari Ailus wrote:
> >>>> On Thu, Feb 09, 2023 at 06:11:12PM +0200, Laurent Pinchart wrote:
> > 
> > ...
> > 
> >>>> I took a look at this some time ago, too, and current regmap API is a poor
> >>>> fit for CCI devices. CCI works on top of e.g. both I²C and I3C so something
> >>>> on top of regmap is a better approach indeed.
> >>>
> >>> I'm confused, is regmap a poor fit, or a better approach ?
> >>
> >> I'm proposing having something on top of regmap, but not changing regmap
> >> itself.
> > 
> > I don't understand why we can't change regmap? regmap has a facility called
> > regmap bus which we can provide specifically for these types of devices. What's
> > wrong to see it done?
> 
> It is fairly easy to layer the few 16 and 24 bit register accesses over
> a standard regmap with 16 bit reg-address and 8 bit reg-data width using
> regmap_bulk_write() to still do the write in e.g. a single i2c-transfer.

I think we could also use regmap_raw_write().

> So if we want regmap for underlying physical layer independence, e.g.
> spi / i2c / i3c. we can just use standard regmap with a 
> cci_write_reg helper on top.

Agreed. We can start experimenting with this, and if somebody has use
cases outside of the camera sensor drivers space, we could later move
those helpers to regmap.

> I think that would be the most KISS solution here. One thing to also keep
> in mind is the amount of work necessary to convert existing sensor drivers.
> Also keeping in mind that it is not just the in tree sensor drivers, but
> also all out of tree sensor drivers which I have seen use similar constructs.

If this was the only issue to handle when porting drivers to mainline
and upstreaming them, I'd be happy :-)

> Requiring drivers to have a list / array of structs of all used register
> addresses + specifying the width per register address is not going to scale
> very poorly wrt converting all the code out there and I'm afraid that
> letting regmap somehow deal with the register-width issue is going to
> require something like this.

Did you mean "not going to scale very well" ? I'm not sure to understand
what you mean here.

-- 
Regards,

Laurent Pinchart
