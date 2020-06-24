Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0CC206E97
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 10:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389226AbgFXIFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 04:05:22 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:45580 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387606AbgFXIFW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 04:05:22 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 89F623C058B;
        Wed, 24 Jun 2020 10:05:19 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iA6rj-Yq34I2; Wed, 24 Jun 2020 10:05:14 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 2B8933C04C1;
        Wed, 24 Jun 2020 10:04:36 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.22) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 24 Jun
 2020 10:04:35 +0200
Date:   Wed, 24 Jun 2020 10:04:31 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>, <lolivei@synopsys.com>,
        <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil@xs4all.nl>, <laurent.pinchart@ideasonboard.com>,
        <roman.kovalivskyi@globallogic.com>,
        <dave.stevenson@raspberrypi.org>, <naush@raspberrypi.com>,
        <mrodin@de.adit-jv.com>, <hugues.fruchet@st.com>,
        <mripard@kernel.org>, <aford173@gmail.com>,
        <sudipi@jp.adit-jv.com>, <andrew_gabbasov@mentor.com>,
        <linux-media@vger.kernel.org>,
        <libcamera-devel@lists.libcamera.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH 00/25] media: ov5647: Support RaspberryPi Camera Module v1
Message-ID: <20200624080431.GA26623@lxhi-065.adit-jv.com>
References: <20200622171910.608894-1-jacopo@jmondi.org>
 <20200622172614.gcwxubshubl7qzpl@uno.localdomain>
 <20200623103002.GA10561@lxhi-065.adit-jv.com>
 <20200623104903.47op5yrtb3swccnz@uno.localdomain>
 <20200623121709.GA6961@lxhi-065.adit-jv.com>
 <20200624074749.ttow6mxjp2yt4ow3@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200624074749.ttow6mxjp2yt4ow3@uno.localdomain>
X-Originating-IP: [10.72.94.22]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Jun 24, 2020 at 09:47:49AM +0200, Jacopo Mondi wrote:
> On Tue, Jun 23, 2020 at 02:17:49PM +0200, Eugeniu Rosca wrote:
> > Hi Jacopo,
> >
> > On Tue, Jun 23, 2020 at 12:49:03PM +0200, Jacopo Mondi wrote:
> > > On Tue, Jun 23, 2020 at 12:30:02PM +0200, Eugeniu Rosca wrote:
> > > > On Mon, Jun 22, 2020 at 07:26:14PM +0200, Jacopo Mondi wrote:
> > > > > My ISP has rejected the rest of the series: too many emails :(
> > > > > Has it ever happened to anyone else ? How did you solved this ?
> > > >
> > > > I guess leaving 5-10 seconds between sending individual patches should
> > > > overcome this? I wonder if git provides a built-in command for that?
> > > >
> > >
> > > git send-email does provide the --batch-size --relogin-delay options,
> > > as Ezequiel suggested me in #v4l.
> > >
> > > I tried re-sending with a 10 email batch and a 5 seconds delay but I
> > > got the same failure. I was not able to find any description of the
> > > email number limits for the SMTP server I'm using, so I could only go
> > > and try. I think the extensive CC list of this series which I got from
> > > Roman's series plays a role, so I can't try just by sending to
> > > myself... I wonder if I should send the series in chunks, the first 10
> > > patches went out (2 times '-.- ) already...
> >
> > Any time you send a new batch, please call 'git send-email' with
> > '--in-reply-to=<cover-letter-id>' to allow LKML front-ends identify
> > the patches as belonging to one topic and make it less of a pain
> > for people to go through these discussions later on.
> 
> Thanks for the suggestion, I hope I got it right ;) The series has now
> been resent.

That's right. I now see all 25 patches appearing under the same umbrella
of https://patchwork.linuxtv.org/cover/64822/ (via "Related"), even if
the last 15 have been sent out at a later point in time.

-- 
Best regards,
Eugeniu Rosca
