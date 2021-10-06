Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7296242355A
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 03:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237053AbhJFBM1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 21:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbhJFBM0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 21:12:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F04C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 18:10:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 858BC581;
        Wed,  6 Oct 2021 03:10:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633482633;
        bh=N2BKoGRCXQENV8nfUjizZDNNlL3JbVfA+d7JUpwF72o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UYq/5nhjyX+bBKd5KDE4wjP5jDo5Nc0YOB5VyJK2t61wQqr1xfhW8P6gP3JpPkzmS
         eubYwrtQBOqHyD0WCsKzbqIR4Ymus/WoMDUHUNl5Z9fiVRdoB8F1Trc2lVMBg7GLr/
         Qn5HwrvSsE1vsx/5RtgWFR9/D5rrIRkxn4hl+tgU=
Date:   Wed, 6 Oct 2021 04:10:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     David Plowman <david.plowman@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 0/2] New V4L2 control V4L2_CID_NOTIFY_GAINS
Message-ID: <YVz3griwfTn4xvG/@pendragon.ideasonboard.com>
References: <20210816113909.234872-1-david.plowman@raspberrypi.com>
 <YTdp9Ux0p38F+hfz@pendragon.ideasonboard.com>
 <CAHW6GYJ8cSDJ+DMejrm3EjwGRWoebVsM1OuUfwH-YBP5gO6qTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHW6GYJ8cSDJ+DMejrm3EjwGRWoebVsM1OuUfwH-YBP5gO6qTQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

On Tue, Oct 05, 2021 at 10:37:54AM +0100, David Plowman wrote:
> Hi Laurent, Sakari, everyone
> 
> I was wondering whether I might give this another little nudge just so
> that it doesn't get lost.

I've already reviewed it, I can only join you to nicely ask Sakari if he
could have a look :-) I know he has lots of patches on his plate at the
moment though.

Hans, would you like to share your opinion on this series ?

> On Tue, 7 Sept 2021 at 14:32, Laurent Pinchart wrote:
> >
> > Hello,
> >
> > I've reviewed this series and it looks good to me. Sakari, would you
> > like to have a look, or should I send a pull request ?
> >
> > On Mon, Aug 16, 2021 at 12:39:07PM +0100, David Plowman wrote:
> > > Hi again everyone
> > >
> > > Thanks for last round of feedback, leading to this v6 pair of
> > > patches. I've made the documentation improvements that were suggested,
> > > and accordingly added Laurent's "Reviewed-by" tags.
> > >
> > > Thanks and best regards
> > >
> > > David
> > >
> > > David Plowman (2):
> > >   media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
> > >   media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control
> > >
> > >  .../media/v4l/ext-ctrls-image-source.rst      | 20 +++++++++++++++++++
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
> > >  include/uapi/linux/v4l2-controls.h            |  1 +
> > >  3 files changed, 22 insertions(+)

-- 
Regards,

Laurent Pinchart
