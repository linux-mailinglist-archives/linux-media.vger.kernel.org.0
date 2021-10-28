Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527B743DD00
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 10:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhJ1Ij3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 04:39:29 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38969 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1Ij1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 04:39:27 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 965E060002;
        Thu, 28 Oct 2021 08:36:55 +0000 (UTC)
Date:   Thu, 28 Oct 2021 10:37:45 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 06/13] media: subdev: Add for_each_active_route() macro
Message-ID: <20211028083745.mnhvuqs67p3l5bmy@uno.localdomain>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-7-jacopo+renesas@jmondi.org>
 <04b63dbf-28ee-23d4-5d75-a33729e9f332@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <04b63dbf-28ee-23d4-5d75-a33729e9f332@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Thu, Oct 28, 2021 at 11:27:05AM +0300, Tomi Valkeinen wrote:
> Hi Jacopo,
>
> On 17/10/2021 21:24, Jacopo Mondi wrote:
> > Add a for_each_active_route() macro to replace the repeated pattern
> > of iterating on the active routes of a routing table.
> >
> > Replace the existing occurrences of such pattern in the codebase.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >   drivers/media/i2c/ds90ub913.c             |  8 ++------
> >   drivers/media/i2c/ds90ub953.c             |  7 ++-----
> >   drivers/media/i2c/ds90ub960.c             |  8 ++------
> >   drivers/media/i2c/max9286.c               | 10 ++--------
> >   drivers/media/platform/ti-vpe/cal-video.c |  9 ++-------
> >   drivers/media/v4l2-core/v4l2-subdev.c     | 18 ++++++++++++++++++
> >   include/media/v4l2-subdev.h               | 11 +++++++++++
> >   7 files changed, 39 insertions(+), 32 deletions(-)
>
> I'll pick this one to my branch, if you don't mind.

My pleasure! Go ahead please!

>
>  Tomi
