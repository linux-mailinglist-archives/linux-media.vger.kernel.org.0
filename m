Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C620B1195
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 16:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732835AbfILO5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 10:57:15 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56303 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732819AbfILO5O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 10:57:14 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i8QX0-0005A7-Fw; Thu, 12 Sep 2019 16:57:10 +0200
Message-ID: <1568300229.3069.4.camel@pengutronix.de>
Subject: Re: [RFC] V4L2 & Metadata: switch to /dev/v4l-metaX instead of
 /dev/videoX
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Thu, 12 Sep 2019 16:57:09 +0200
In-Reply-To: <cb7fe2ed-d1f2-6ac8-6c0f-ec6b1aa5ddf3@xs4all.nl>
References: <f26a4eb0-7009-a25f-29bc-3a292d2d79e1@xs4all.nl>
         <60769f0c-506c-4057-00ce-f4c8620441c5@ideasonboard.com>
         <20190912112114.3a66663f@coco.lan>
         <cb7fe2ed-d1f2-6ac8-6c0f-ec6b1aa5ddf3@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-09-12 at 16:49 +0200, Hans Verkuil wrote:
> On 9/12/19 4:21 PM, Mauro Carvalho Chehab wrote:
> > Em Thu, 12 Sep 2019 14:16:11 +0100
> > Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:
> > 
> > > Hi Hans,
> > > 
> > > On 12/09/2019 08:48, Hans Verkuil wrote:
> > > > Hi all,
> > > > 
> > > > I am increasingly unhappy about the choice of /dev/videoX for metadata devices.
> > > > 
> > > > It is confusing for end-users (especially w.r.t. the common uvc driver) and
> > > > if we want to change this, then we need to do it soon.
> > 
> > Kernel has (about) nothing to do with how the userspace devnodes are
> > named, as the actual name is given by udev.
> 
> To my knowledge the standard udev rules do not rename anything for media
> devices, so in reality it IS the kernel that decides this.
> 
> But this is why I suggested to put it under a kernel config option.
> 
> > 
> > Anyway, from Kernel standpoint, it sounds too late to change the name
> > of the devices from "videoX" to something else, as a change like that
> > may break existing apps.
> > 
> > It could make sense to have something like that at udev rules.
> 
> But wouldn't that break existing apps as well?
> 
> A bigger problem is that it isn't easy to detect the difference between
> a regular video device and a metadata device: you'd have to call QUERYCAP
> to determine that.

v4l_id does call VIDIOC_QUERYCAP [1] to fill the ID_V4L_CAPABILITIES
colon separated list.

[1] https://github.com/systemd/systemd/blob/master/src/udev/v4l_id/v4l_id.c#L66

regards
Philipp
