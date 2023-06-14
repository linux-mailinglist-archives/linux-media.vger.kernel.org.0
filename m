Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D60907309B7
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 23:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjFNVXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 17:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjFNVW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 17:22:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8A110CB
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 14:22:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B857975A;
        Wed, 14 Jun 2023 23:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686777746;
        bh=a3byV1vRE4R2xD5vPLGDRz6Rubvt7L+N1y5VuH7THm8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oavBWdFA9l7ZzzpLjy1rpQl0/k9/Zt2ADaoHH7emPpgtNcU+c6whlnBbzgiSh6juf
         125APftw3Wtwg1urk6M3cobt6Gv9FHYWIxwj4wAGOMt2Aw3plAllLO1lrZMGb7ZC4v
         VcrKucJa6nzwVATP5D1iPF7+HUycOXvzUeAAZX70=
Date:   Thu, 15 Jun 2023 00:22:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        hverkuil@xs4all.nl
Subject: Re: OV5693 Kconfig missing a select VIDEO_V4L2_SUBDEV_API ?
Message-ID: <20230614212257.GB20723@pendragon.ideasonboard.com>
References: <ce81b73f-48db-038d-2671-bccbb3490786@redhat.com>
 <ZInlO48ACwQ3lwYX@kekkonen.localdomain>
 <813f8b84-4737-3898-24eb-30099ffb6043@redhat.com>
 <ZIojWLapfr/pBeQH@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZIojWLapfr/pBeQH@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 14, 2023 at 08:30:16PM +0000, sakari.ailus@linux.intel.com wrote:
> On Wed, Jun 14, 2023 at 06:50:14PM +0200, Hans de Goede wrote:
> > On 6/14/23 18:05, sakari.ailus@linux.intel.com wrote:
> > > On Wed, Jun 14, 2023 at 05:47:01PM +0200, Hans de Goede wrote:
> > >> Hi All,
> > >>
> > >> The ov5693 driver uses v4l2_subdev_get_try_crop() /
> > >> v4l2_subdev_get_try_format() both of which are
> > >> only defined if CONFIG_VIDEO_V4L2_SUBDEV_API=y .
> > >>
> > >> Yet it does not do select VIDEO_V4L2_SUBDEV_API
> > >> in its Kconfig bits ?
> > >>
> > >> Note I've not seen any build errors because of this,
> > >> I guess we somehow end up getting away with this...
> > >>
> > >> But still I think the select should be added ?
> > > 
> > > I agree.
> > > 
> > > The reason there haven't been compile failures is that there's a vast
> > > number of sensor drivers that all select this so for a failure you'd need
> > > to select this one but none of the others.
> > > 
> > > I can send a fix.
> > 
> > Also see my follow-up email. If we're going to fix this
> > we really should fix it properly. As mentioned in
> > my folow-up email an intermediate Kconfig option
> > might be best.
> > 
> > E.g. doing:
> > 
> > grep -l v4l2_async_register_subdev drivers/media/i2c/*.c
> > 
> > And comparing that to Kconfig finds the following Kconfig
> > entries lacking a select V4L2_FWNODE / select V4l2_ASYNC
> > 
> > VIDEO_IMX208
> > VIDEO_IMX258
> > VIDEO_IMX274
> > VIDEO_IMX319
> > VIDEO_IMX355
> > VIDEO_OV6650
> > VIDEO_OV7740
> > VIDEO_OV9640
> > VIDEO_OV9650
> > 
> > and I stopped checking after the ov* drivers since I think
> > the above list makes my point.
> 
> Yeah, sometimes difficult to find errors get repeated. Luckily it's "just"
> a compilation problem.
> 
> Using V4L2 fwnode and V4L2 sub-device APIs are still unrelated as such
> although in practice they do often happen together. There are still quite a
> few sensor drivers that don't need both of them. Some can be compiled with
> VIDEO_V4L2_SUBDEV_API disabled, too, but I'm not sure how useful that
> really is. The rest are probably not usable outside a very specific scope,
> such as I²C async matching used by a handful of receiver drivers (none use
> MC, thus no sub-device API either).
> 
> Perhaps we could group these in two classes where the common class has
> V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API selected? I'm not sure having an
> intermediate, somewhat obscure, option would be helpful.
> 
> Also cc Hans and Laurent.

I'm all for simplifying the current state and removing the need to get
every Kconfig entry right by moving the dependencies to a common
location.

-- 
Regards,

Laurent Pinchart
