Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED4305B175B
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 10:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbiIHIli (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 04:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbiIHIlb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 04:41:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62530112E7F
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 01:41:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F287DB81F4B
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 08:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82020C433C1;
        Thu,  8 Sep 2022 08:41:23 +0000 (UTC)
Message-ID: <3ed0fa60-ed41-3969-ee42-e7f6fa413505@xs4all.nl>
Date:   Thu, 8 Sep 2022 10:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Media Summit] Finalizing the v4l-utils conversion to meson
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        Gregor Jasny <gjasny@googlemail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <YwwXrJ2ajZvZhUk6@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <YwwXrJ2ajZvZhUk6@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 29/08/2022 03:34, Laurent Pinchart wrote:
> Hello,
> 
> This mail (and hopefully mail thread) aims to prepare for the Media
> Summit 2022 discussion about finalizing the conversion of v4l-utils to
> meson.
> 
> The original port of v4l-utils to meson was done by Ariel D'Alessandro
> (big thanks for that !) and posted to the linux-media mailing list in
> April 2022 ([1]). Another RFC version followed ([2]), and the series
> then graduated to non-RFC ([3]) with new versions following ([4], [5]
> and [6]) until v5 ([7]) in May 2021. I believe it is time to decide if
> we want to move to a more modern build system or stay for the foreseable
> future in the past (this statement should indicate my opinion on the
> subject :-)).
> 
> I maintain a branch with the meson integration that I keep rebasing on
> top of the v4l-utils master branch. You can find it at
> 
> 	git://linuxtv.org/pinchartl/v4l-utils.git meson
> 
> I have also just posted the latest version of the integration patches in
> a v6 ([8]).
> 
> I have been using the meson integration for about 2 years now, and it
> has provided me with a much smoother experience than autoconf, both for
> native builds and cross builds. Long gone are the day where I had to
> fight autoconf and hack various Makefile.am to comment out pieces of the
> tree that would fail to compile properly and wouldn't want to get
> disabled through autoconf. These issues are most likely due to
> shortcomings in the autoconf usage in v4l-utils than problems with
> autoconf and automake themselves, but I quickly gave up on trying to fix
> that as meson just worked out of the box as intended.
> 
> This being said, I won't pretend that the current implementation would
> work perfectly for everybody. I twould thus like to get feedback on how
> to move forward.
> 
> 1. Is there a general agreement that replacing autoconf is a good idea,
> provided that any technical issue in the proposed meson implementation
> (if any) can be fixed ? Or would it require fighting ophidiophobia and
> other non-technical issues that would make it a lost battle from the
> start ?

I did a quick check to see if it handles setting the date/build/sha
correctly for some of the utilities I maintain (i.e. v4l2/cec-compliance
needs to show the SHA of the commit it was built from), and that seems to
be OK.

Given the fact that it is better at cross-compiling I have no objection
to switching over.

It should be a complete switch, though. It's one or the other, not both.

If we do this, then I think we should try and prevent adding new libs
or applications for a bit (one kernel cycle?) to make it easy to revert
if we run into unexpected problems. And also bump the version number
and ask Gregor to check that it builds fine for debian.

Regards,

	Hans

> 
> 2. What are the technical issues that still need to be solved (if any)
> to replace autoconf with meson ?
> 
> There's no need to wait for the media summit to start answering those
> questions, if we can resolve the issue before meeting face to face,
> we'll have more time to discuss other questions :-)
> 
> [1] https://lore.kernel.org/linux-media/20200408195611.55421-1-ariel@vanguardiasur.com.ar
> [2] https://lore.kernel.org/linux-media/20200429151639.5003-1-ariel@vanguardiasur.com.ar
> [3] https://lore.kernel.org/linux-media/20200618133303.28676-1-ariel@vanguardiasur.com.ar
> [4] https://lore.kernel.org/linux-media/20200721151434.115651-1-ariel@vanguardiasur.com.ar
> [5] https://lore.kernel.org/linux-media/20200806155519.79748-1-ariel@vanguardiasur.com.ar
> [6] https://lore.kernel.org/linux-media/20210317172227.620584-1-ariel.dalessandro@collabora.com
> [7] https://lore.kernel.org/linux-media/20210512184946.102863-1-ariel.dalessandro@collabora.com
> [8] https://lore.kernel.org/linux-media/20220829013327.5791-1-laurent.pinchart@ideasonboard.com
> 

