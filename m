Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 756F75B17B8
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 10:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbiIHIwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 04:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbiIHIwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 04:52:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC7D7F776C
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 01:51:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F5ED888;
        Thu,  8 Sep 2022 10:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662627082;
        bh=eLpHcxXiey91mNiMMXhZP/KNgBdDBAUo1D7PvEVlO3A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NxIY2ZUYwK4hPYfDiBWmL/e01ynHlKk37858rJKatgv21eXkn50D4VZPUx1Sc2GIY
         m/M6FV4xwny/i4E8ZGLtfO4ljtdwHy3PsXUOVBFDyd7atBXEEywmIiKiEiCDL8Pt0U
         a4mtZLbXmaoBgCUHo+8DTsX0A67Hkso1zzNJkQPg=
Date:   Thu, 8 Sep 2022 11:51:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        Gregor Jasny <gjasny@googlemail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [Media Summit] Finalizing the v4l-utils conversion to meson
Message-ID: <Yxms+sBJaxFWxqgd@pendragon.ideasonboard.com>
References: <YwwXrJ2ajZvZhUk6@pendragon.ideasonboard.com>
 <3ed0fa60-ed41-3969-ee42-e7f6fa413505@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ed0fa60-ed41-3969-ee42-e7f6fa413505@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Sep 08, 2022 at 10:41:21AM +0200, Hans Verkuil wrote:
> On 29/08/2022 03:34, Laurent Pinchart wrote:
> > Hello,
> > 
> > This mail (and hopefully mail thread) aims to prepare for the Media
> > Summit 2022 discussion about finalizing the conversion of v4l-utils to
> > meson.
> > 
> > The original port of v4l-utils to meson was done by Ariel D'Alessandro
> > (big thanks for that !) and posted to the linux-media mailing list in
> > April 2022 ([1]). Another RFC version followed ([2]), and the series
> > then graduated to non-RFC ([3]) with new versions following ([4], [5]
> > and [6]) until v5 ([7]) in May 2021. I believe it is time to decide if
> > we want to move to a more modern build system or stay for the foreseable
> > future in the past (this statement should indicate my opinion on the
> > subject :-)).
> > 
> > I maintain a branch with the meson integration that I keep rebasing on
> > top of the v4l-utils master branch. You can find it at
> > 
> > 	git://linuxtv.org/pinchartl/v4l-utils.git meson
> > 
> > I have also just posted the latest version of the integration patches in
> > a v6 ([8]).
> > 
> > I have been using the meson integration for about 2 years now, and it
> > has provided me with a much smoother experience than autoconf, both for
> > native builds and cross builds. Long gone are the day where I had to
> > fight autoconf and hack various Makefile.am to comment out pieces of the
> > tree that would fail to compile properly and wouldn't want to get
> > disabled through autoconf. These issues are most likely due to
> > shortcomings in the autoconf usage in v4l-utils than problems with
> > autoconf and automake themselves, but I quickly gave up on trying to fix
> > that as meson just worked out of the box as intended.
> > 
> > This being said, I won't pretend that the current implementation would
> > work perfectly for everybody. I twould thus like to get feedback on how
> > to move forward.
> > 
> > 1. Is there a general agreement that replacing autoconf is a good idea,
> > provided that any technical issue in the proposed meson implementation
> > (if any) can be fixed ? Or would it require fighting ophidiophobia and
> > other non-technical issues that would make it a lost battle from the
> > start ?
> 
> I did a quick check to see if it handles setting the date/build/sha
> correctly for some of the utilities I maintain (i.e. v4l2/cec-compliance
> needs to show the SHA of the commit it was built from), and that seems to
> be OK.
> 
> Given the fact that it is better at cross-compiling I have no objection
> to switching over.
> 
> It should be a complete switch, though. It's one or the other, not both.

I agree, maintaining both would increase the maintenance burden and
guarantee that bugs would creep in over time.

> If we do this, then I think we should try and prevent adding new libs
> or applications for a bit (one kernel cycle?) to make it easy to revert
> if we run into unexpected problems. And also bump the version number
> and ask Gregor to check that it builds fine for debian.

I'm fine with that. Maintaining a meson branch on top of v4l-utils has
been relatively low effort, there were occasional additions to
v4l-utils, but they were easy to handle. I would think that reverting
would be equally easy, if needed.

I will also be there to help addressing any bug in the build system.

> > 2. What are the technical issues that still need to be solved (if any)
> > to replace autoconf with meson ?
> > 
> > There's no need to wait for the media summit to start answering those
> > questions, if we can resolve the issue before meeting face to face,
> > we'll have more time to discuss other questions :-)
> > 
> > [1] https://lore.kernel.org/linux-media/20200408195611.55421-1-ariel@vanguardiasur.com.ar
> > [2] https://lore.kernel.org/linux-media/20200429151639.5003-1-ariel@vanguardiasur.com.ar
> > [3] https://lore.kernel.org/linux-media/20200618133303.28676-1-ariel@vanguardiasur.com.ar
> > [4] https://lore.kernel.org/linux-media/20200721151434.115651-1-ariel@vanguardiasur.com.ar
> > [5] https://lore.kernel.org/linux-media/20200806155519.79748-1-ariel@vanguardiasur.com.ar
> > [6] https://lore.kernel.org/linux-media/20210317172227.620584-1-ariel.dalessandro@collabora.com
> > [7] https://lore.kernel.org/linux-media/20210512184946.102863-1-ariel.dalessandro@collabora.com
> > [8] https://lore.kernel.org/linux-media/20220829013327.5791-1-laurent.pinchart@ideasonboard.com

-- 
Regards,

Laurent Pinchart
