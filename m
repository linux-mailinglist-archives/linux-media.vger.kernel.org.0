Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E20C691D91
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 12:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbjBJLF4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 06:05:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbjBJLF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 06:05:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454A7126E6
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 03:05:55 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC2C4E70;
        Fri, 10 Feb 2023 12:05:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676027154;
        bh=feA17fMEASBCpKHKrr62YKgPR92pj21tak+ltQ4iprM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kX22YT9DvExSxQxKyhh1NRX+IuW45kl2fyX9YrOt0pJZB8xT8CQzLN0kpGQYefqw6
         DMU2Pb8zRITgBpCwyJbYHNar3dvdxDLJAcALt07fGX+tLrPrDqqI0gTcNk6w8deGe9
         WXGR8FZGAeHpKOS+Tuvg1IiyWAjzmHb4OTNW5u4k=
Date:   Fri, 10 Feb 2023 13:05:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+YlELz9C61HQE0x@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <Y+YamxehIUdF5aU7@kekkonen.localdomain>
 <Y+Ycf4SpMaUfdR5m@pendragon.ideasonboard.com>
 <Y+Yg217HSEi4c+mP@kekkonen.localdomain>
 <Y+YiNyC7TeOEn/Hi@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+YiNyC7TeOEn/Hi@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 10, 2023 at 12:53:43PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 10, 2023 at 12:47:55PM +0200, Sakari Ailus wrote:
> > On Fri, Feb 10, 2023 at 12:29:19PM +0200, Laurent Pinchart wrote:
> > > On Fri, Feb 10, 2023 at 12:21:15PM +0200, Sakari Ailus wrote:
> > > > On Thu, Feb 09, 2023 at 06:11:12PM +0200, Laurent Pinchart wrote:
> 
> ...
> 
> > > > I took a look at this some time ago, too, and current regmap API is a poor
> > > > fit for CCI devices. CCI works on top of e.g. both I²C and I3C so something
> > > > on top of regmap is a better approach indeed.
> > > 
> > > I'm confused, is regmap a poor fit, or a better approach ?
> > 
> > I'm proposing having something on top of regmap, but not changing regmap
> > itself.
> 
> I don't understand why we can't change regmap? regmap has a facility called
> regmap bus which we can provide specifically for these types of devices. What's
> wrong to see it done?

How would that work ?

-- 
Regards,

Laurent Pinchart
