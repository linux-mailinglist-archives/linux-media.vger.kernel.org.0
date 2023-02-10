Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB9C691E66
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 12:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbjBJLfE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 06:35:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjBJLfB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 06:35:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5360B72DD0
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 03:35:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C762127C;
        Fri, 10 Feb 2023 12:34:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676028898;
        bh=Ffl1cyU5TLZfkGB7NTCX097mcL2f4GPZl9iPOEmdqVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vt4tH43Lm3dlKnYL3SlOnPbRObdSC+g8WnGq9YQwPNt1sJRTuNHX/E0oi38n25OV4
         9QnulthSZkUFU8gahY5NdSvswr+kT/fJuaGgrKkS8QoGSxr0VQZmk5L5QOdE3ZdYGA
         OiE5Kfb7Jovq6sWyilP0iAj+5dLUn35Zsl6oPY5Y=
Date:   Fri, 10 Feb 2023 13:34:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+Yr4MqbUyXX07YN@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <Y+YamxehIUdF5aU7@kekkonen.localdomain>
 <Y+Ycf4SpMaUfdR5m@pendragon.ideasonboard.com>
 <Y+Yg217HSEi4c+mP@kekkonen.localdomain>
 <Y+Yk0IaBghjj18C8@pendragon.ideasonboard.com>
 <Y+Yn9JRsZOb6ZuzW@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+Yn9JRsZOb6ZuzW@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Feb 10, 2023 at 01:18:12PM +0200, Sakari Ailus wrote:
> On Fri, Feb 10, 2023 at 01:04:48PM +0200, Laurent Pinchart wrote:
> > > > > > > > Also, may I
> > > > > > > > suggest to have a look at drivers/media/i2c/imx290.c for an example of
> > > > > > > > how registers of different sizes can be handled in a less error-prone
> > > > > > > > way, using single read/write functions that adapt to the size
> > > > > > > > automatically ?
> > > > > > > 
> > > > > > > Yes I have seen this pattern in drivers/media/i2c/ov5693.c too
> > > > > > > (at least I assume it is the same pattern you are talking about).
> > > > > > 
> > > > > > Correct. Can we use something like that to merge all the ov*_write_reg()
> > > > > > variants into a single function ? Having to select the size manually in
> > > > > > each call (either by picking the function variant, or by passing a size
> > > > > > as a function parameter) is error-prone. Encoding the size in the
> > > > > > register macro is much safer, easing both development and review.
> > > > > 
> > > > > I think so, too.
> > > > > 
> > > > > That doesn't mean we shouldn't have function variants for specific register
> > > > > sizes (taking just register addresses) though.
> > > > 
> > > > I don't see why we should have multiple APIs when a single one works.
> > > 
> > > Yes, it "works", but the purpose of the API is to avoid driver code. A
> > > driver accessing fixed width registers is likely to use a helper function
> > > with an API that requires encoding the width into the register address.
> > 
> > Why not ? I don't see anything wrong with having that as a single API,
> > it doesn't make life more complicated for driver authors or reviewers.
> 
> Given that the reviewers (at least me) haven't had noteworthy issues when
> each driver implements their own register access functions, I'm not
> concerned having ~ six register read functions instead of one or two.
> Driver authors should pick the one that fits the purpose best, and not be
> required to implement wrappers in drivers --- which is exactly the
> situation we have today.

It's of course always technically possibly to have more functions, but I
don't see any practical advantage.

-- 
Regards,

Laurent Pinchart
