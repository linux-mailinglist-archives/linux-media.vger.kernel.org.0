Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D675B2CF1
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 05:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiIIDbE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 23:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiIIDbC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 23:31:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E0783BEB
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 20:31:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 147A487F;
        Fri,  9 Sep 2022 05:30:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662694258;
        bh=f20O3rZyaowG0YdmhEgTIqGv7+GSqWlXZDw2y4akimg=;
        h=Date:From:To:Cc:Subject:From;
        b=rCQrSJi7XYM1b910LIooGCI/tja5XoMtxrZVm2LAUVF7ZEc0aLSYZ2eUplKwq0jlJ
         FpaHZIBEtA3lD4GcUfXOPG8KgPZoSyy5XN8+ysOULZluOOMP3bmiXr8rjCHkUSUQRp
         BsPFfrbAw7FH3D4mdkbcO8dmObgNNRlxuZ9HBXEU=
Date:   Fri, 9 Sep 2022 06:30:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [Media Summit] V4L2 streams support
Message-ID: <YxqzYS4U7qpGyjSX@pendragon.ideasonboard.com>
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

In preparation for the discussion regarding V4L2 streams support ([1])
during the media summit, I've prepared a slide deck that explains the
API proposal. You can download it from [2].

I tried to go through the whole API, including the userspace API, the
in-kernel API and the in-kernel helpers, with enough details to allow at
least a basic understanding of the proposal. If anyone has time to
provide feedback on what lacks clarity, I will try to find time to
update the slides before Monday.

There is also a set of questions in the slides, covering points that I'm
either unsure or not very happy about. Those will need to be sorted out
in order to merge this API. Additional questions are welcome, possibly
by e-mail already.

Tomi, I would appreciate if you could have a look, and let me know if
I've missed something, made obvious mistakes, or if you have other open
questions about the userspace API that need to be addressed and should
be discussed during the media summit.

[1] https://lore.kernel.org/linux-media/20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com
[2] https://ideasonboard.org/talks/20220912-media-summit-streams.pdf

-- 
Regards,

Laurent Pinchart
