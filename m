Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 369225A439F
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 09:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiH2HPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 03:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiH2HPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 03:15:41 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E1727FF0
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 00:15:38 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 0EA86240004;
        Mon, 29 Aug 2022 07:15:30 +0000 (UTC)
Date:   Mon, 29 Aug 2022 09:15:28 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Subject: [Media Summit] Using the selection API to control image sensor
 subsampling
Message-ID: <20220829071528.6fxm4kdvpjzkr3yw@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

   I have prepared a slide deck to brief on the discussion for
the topic specified in the subject. Slides are available at
https://nc.nibble.pw/s/oib8jzNjjtgB9c6 as an attachment of ~5MB would
probably be caught by the mailing list filter

I'll here copy a brief summary as presented in Hans' agenda:

-------------------------------------------------------------------------------
11:45 Jacopo: Representing addition sensor processing stages.

  How to represent additional processing stages that happens
  on the sensor side, mostly additional subsampling/cropping that happen
  between the analogue cropping on the full pixel array and the final
  image sent on the wire.

  https://lore.kernel.org/linux-media/CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com/

  Dave made a good introduction of the issue his email which got
  largely unanswered.

  The issue is particularly relevant for RAW sensors, where applying
  subsampling has an impact on the sensor's sensitivity and requires
  to adjust the gains and exposure accordingly.
-------------------------------------------------------------------------------

The slide deck:

- Introduces the topic in slides [1-10]

- Presents Dave's proposed use case and how it is currently handled in
  mainline drivers in slides [11-31] using as example the imx274,
  mt9p031 and CCS drivers.

- Proposes a best-effort solution for imx219 in slides [32-37]

- The last two slides presents two discussion topics which I will copy
  here

  ------------------------------------------------------------------------
  Do we need new abstractions ?

  - An image sensor abstraction built on top of multiple subdevices
    - Would it really make userspace any simpler ?

  - Image sensor specific SELECTION_TARGETS
    - Conflicts with format selection are bound to happen with a single
      source pad
      - Can a “special” sink pad that represents the raw pixel array help ?
    - Does not scale to represent complex sensors with multiple scalers
  ------------------------------------------------------------------------

The imx219 proposal can be discussed by email or in person, while the
questions in the last two slides might be worth being discussed during
the meeting.

Thanks
   j

