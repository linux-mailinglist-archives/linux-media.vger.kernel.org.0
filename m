Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C27CA182616
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 01:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731484AbgCLAB7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 20:01:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57550 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731399AbgCLAB7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 20:01:59 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A6BD5F;
        Thu, 12 Mar 2020 01:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583971318;
        bh=WTcOFcM2fx/qrVF2PdT4fX7/zOrgJGT1he3D7mDvBjA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jzmi8zZNBDNCAEmR/wk6cavx7LleQsfeQ7hP8f8Jo/kPWpL44LgLB2dzJMpmdGFAC
         SV+OBUi66sVg+MP+iG7ib0bNKUrZEYfwN/lnXOmu3uD+0aN8EGwKDs3W3rLpHCPog2
         jmajhJQOLOfWbVhW28ST0wQmf+aNILGQpek1j49o=
Date:   Thu, 12 Mar 2020 02:01:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH 7/7] media: imx: imx7-media-csi: Fix video field handling
Message-ID: <20200312000154.GE1639@pendragon.ideasonboard.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
 <20191024004155.32068-8-laurent.pinchart@ideasonboard.com>
 <3d979bfa-0bb2-0dde-9bc7-83ee3923d33a@gmail.com>
 <20200309205238.GH4916@pendragon.ideasonboard.com>
 <ed913970-573e-4bee-ce84-28513a7869a9@gmail.com>
 <20200310154937.GA32319@pendragon.ideasonboard.com>
 <e981b9cd-c5ab-1771-5b7f-2cd087215d79@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e981b9cd-c5ab-1771-5b7f-2cd087215d79@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Wed, Mar 11, 2020 at 04:54:35PM -0700, Steve Longerbeam wrote:
> On 3/10/20 8:49 AM, Laurent Pinchart wrote:
> > Hi Steve and Rui,
> >
> > I've spent more time on the i.MX7 support in the i.MX media staging
> > driver today, and I've reached a point where I'm not comfortable moving
> > forward without your ack.
> >
> > I found format handling to be very broken, the driver enumerates formats
> > that are not supported by the device, and doesn't properly handle the
> > supported formats. While trying to fix that, I found out that the common
> > i.MX6 and i.MX7 helpers (imx-media-capture.c and imx-media-utils.c) get
> > in the way, as i.MX6 and i.MX7 format support are very entangled. I
> > would like to split the two in order to clean up the i.MX7 code, which
> > would also give an opportunity to later clean the i.MX6 code if desired.
> >
> > Before moving in that time-consuming direction, I want to make sure this
> > will be accepted, as I don't want to spend days of work for nothing. If
> > you want to discuss this in real time, I'm available in the #v4l channel
> > on Freenode (nickname pinchartl).
> 
> I'm on vacation returning March 16, maybe we can chat on irc when I 
> return. I'm in California (PDT).

Sure. Enjoy your vacation :-)

In the meantime, I've moved forward with development without duplicating
the whole imx-media-capture.c file, and I believe I'm close to reaching
a working result. Some parts were not pretty (it's a staging driver
after all), and if you agree with my approach, I think the end result
will be much cleaner. Let's talk about it when you come back.

-- 
Regards,

Laurent Pinchart
