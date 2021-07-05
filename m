Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384BE3BBE8D
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 16:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhGEPAB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 11:00:01 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:35233 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhGEPAA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 11:00:00 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id C44BF24000B;
        Mon,  5 Jul 2021 14:57:21 +0000 (UTC)
Date:   Mon, 5 Jul 2021 16:58:11 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC 0/4] media: Introduce post_register() subdev operation
Message-ID: <20210705145811.i76paws7y2qjfb7u@uno.localdomain>
References: <20210617171611.80542-1-jacopo+renesas@jmondi.org>
 <c97229bf-84a0-f5ba-b5fc-a14b563c2684@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c97229bf-84a0-f5ba-b5fc-a14b563c2684@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jun 18, 2021 at 12:21:43PM +0200, Hans Verkuil wrote:
> On 17/06/2021 19:16, Jacopo Mondi wrote:
> > Hello Hans,
> >    this is the result of the discussion we had yesterday, sent out just to
> > have a taste of how it looks like.
> >
> > I won't pretend I like the outcome: it feels a bit hackish and meant to support
> > this precise use case.
> >
> > Compared to the proposal to resurect 'init()' it indeed has the advantage that
> > the subdevice driver works in both deffered and non-deferred mode, but the
> > notifier flags seems really custom.
> >
> > Also, being the new flag part of the notifier it won't be available for i2c
> > subdevs.
> >
> > What do you think ? Does the result match your understanding ?
>
> That's what I came up with, yes. I think some of the names can be improved,
> but otherwise the mechanism is what I had in mind.

Great then! Do you have any suggestions on names that can help moving
forward ?

Thanks
  j

>
> Regards,
>
> 	Hans
>
> >
> > Thanks
> >   j
> >
> > Jacopo Mondi (4):
> >   media: v4l2-subdev: Introduce post_register() core op
> >   media: v4l2-async: Add notifier flags
> >   media: v4l2-async: Call post_register() subdev op
> >   media: i2c: gmsl: Defer camera intialization
> >
> >  drivers/media/i2c/max9286.c          | 21 ++++++--
> >  drivers/media/i2c/rdacm20.c          | 81 ++++++++++++++++------------
> >  drivers/media/v4l2-core/v4l2-async.c | 11 ++++
> >  include/media/v4l2-async.h           | 10 ++++
> >  include/media/v4l2-subdev.h          |  3 ++
> >  5 files changed, 89 insertions(+), 37 deletions(-)
> >
> > --
> > 2.31.1
> >
>
