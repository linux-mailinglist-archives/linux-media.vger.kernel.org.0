Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937DD206DFD
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 09:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389950AbgFXHo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 03:44:29 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57623 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389583AbgFXHo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 03:44:29 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id ED71920008;
        Wed, 24 Jun 2020 07:44:21 +0000 (UTC)
Date:   Wed, 24 Jun 2020 09:47:49 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     lolivei@synopsys.com, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH 00/25] media: ov5647: Support RaspberryPi Camera Module v1
Message-ID: <20200624074749.ttow6mxjp2yt4ow3@uno.localdomain>
References: <20200622171910.608894-1-jacopo@jmondi.org>
 <20200622172614.gcwxubshubl7qzpl@uno.localdomain>
 <20200623103002.GA10561@lxhi-065.adit-jv.com>
 <20200623104903.47op5yrtb3swccnz@uno.localdomain>
 <20200623121709.GA6961@lxhi-065.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200623121709.GA6961@lxhi-065.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugeniu,

On Tue, Jun 23, 2020 at 02:17:49PM +0200, Eugeniu Rosca wrote:
> Hi Jacopo,
>
> On Tue, Jun 23, 2020 at 12:49:03PM +0200, Jacopo Mondi wrote:
> > On Tue, Jun 23, 2020 at 12:30:02PM +0200, Eugeniu Rosca wrote:
> > > On Mon, Jun 22, 2020 at 07:26:14PM +0200, Jacopo Mondi wrote:
> > > > My ISP has rejected the rest of the series: too many emails :(
> > > > Has it ever happened to anyone else ? How did you solved this ?
> > >
> > > I guess leaving 5-10 seconds between sending individual patches should
> > > overcome this? I wonder if git provides a built-in command for that?
> > >
> >
> > git send-email does provide the --batch-size --relogin-delay options,
> > as Ezequiel suggested me in #v4l.
> >
> > I tried re-sending with a 10 email batch and a 5 seconds delay but I
> > got the same failure. I was not able to find any description of the
> > email number limits for the SMTP server I'm using, so I could only go
> > and try. I think the extensive CC list of this series which I got from
> > Roman's series plays a role, so I can't try just by sending to
> > myself... I wonder if I should send the series in chunks, the first 10
> > patches went out (2 times '-.- ) already...
>
> Any time you send a new batch, please call 'git send-email' with
> '--in-reply-to=<cover-letter-id>' to allow LKML front-ends identify
> the patches as belonging to one topic and make it less of a pain
> for people to go through these discussions later on.

Thanks for the suggestion, I hope I got it right ;) The series has now
been resent.

Thanks
   j

>
> --
> Best regards,
> Eugeniu Rosca
