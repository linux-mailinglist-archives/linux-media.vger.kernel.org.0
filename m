Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 397A05A40B3
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiH2Beu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiH2Bet (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:34:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FEA316
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:34:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84E96481;
        Mon, 29 Aug 2022 03:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661736884;
        bh=E4Q03Zw+CElOwWpkznXKfYhjiFYunnkp266T65bIbIo=;
        h=Date:From:To:Cc:Subject:From;
        b=MeMJlkpNXh2vCjx3T8aaIjKp/d4nPD4DRXPo6KpLDS4NP282TGhb9B1ycdeo+WLlq
         EuQVTMAlI3KA9pZ3wiINGzPhUrBIzB2wKCF+0DPTD9ysfmZAPamv74FZ8vOgPPHQnF
         s0Nfn3K0VSHTPhup4CeSAG1+SRYO3VUbWC0BN19c=
Date:   Mon, 29 Aug 2022 04:34:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
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
Subject: [Media Summit] Finalizing the v4l-utils conversion to meson
Message-ID: <YwwXrJ2ajZvZhUk6@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This mail (and hopefully mail thread) aims to prepare for the Media
Summit 2022 discussion about finalizing the conversion of v4l-utils to
meson.

The original port of v4l-utils to meson was done by Ariel D'Alessandro
(big thanks for that !) and posted to the linux-media mailing list in
April 2022 ([1]). Another RFC version followed ([2]), and the series
then graduated to non-RFC ([3]) with new versions following ([4], [5]
and [6]) until v5 ([7]) in May 2021. I believe it is time to decide if
we want to move to a more modern build system or stay for the foreseable
future in the past (this statement should indicate my opinion on the
subject :-)).

I maintain a branch with the meson integration that I keep rebasing on
top of the v4l-utils master branch. You can find it at

	git://linuxtv.org/pinchartl/v4l-utils.git meson

I have also just posted the latest version of the integration patches in
a v6 ([8]).

I have been using the meson integration for about 2 years now, and it
has provided me with a much smoother experience than autoconf, both for
native builds and cross builds. Long gone are the day where I had to
fight autoconf and hack various Makefile.am to comment out pieces of the
tree that would fail to compile properly and wouldn't want to get
disabled through autoconf. These issues are most likely due to
shortcomings in the autoconf usage in v4l-utils than problems with
autoconf and automake themselves, but I quickly gave up on trying to fix
that as meson just worked out of the box as intended.

This being said, I won't pretend that the current implementation would
work perfectly for everybody. I twould thus like to get feedback on how
to move forward.

1. Is there a general agreement that replacing autoconf is a good idea,
provided that any technical issue in the proposed meson implementation
(if any) can be fixed ? Or would it require fighting ophidiophobia and
other non-technical issues that would make it a lost battle from the
start ?

2. What are the technical issues that still need to be solved (if any)
to replace autoconf with meson ?

There's no need to wait for the media summit to start answering those
questions, if we can resolve the issue before meeting face to face,
we'll have more time to discuss other questions :-)

[1] https://lore.kernel.org/linux-media/20200408195611.55421-1-ariel@vanguardiasur.com.ar
[2] https://lore.kernel.org/linux-media/20200429151639.5003-1-ariel@vanguardiasur.com.ar
[3] https://lore.kernel.org/linux-media/20200618133303.28676-1-ariel@vanguardiasur.com.ar
[4] https://lore.kernel.org/linux-media/20200721151434.115651-1-ariel@vanguardiasur.com.ar
[5] https://lore.kernel.org/linux-media/20200806155519.79748-1-ariel@vanguardiasur.com.ar
[6] https://lore.kernel.org/linux-media/20210317172227.620584-1-ariel.dalessandro@collabora.com
[7] https://lore.kernel.org/linux-media/20210512184946.102863-1-ariel.dalessandro@collabora.com
[8] https://lore.kernel.org/linux-media/20220829013327.5791-1-laurent.pinchart@ideasonboard.com

-- 
Regards,

Laurent Pinchart
