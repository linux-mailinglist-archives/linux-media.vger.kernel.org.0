Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5208958D69A
	for <lists+linux-media@lfdr.de>; Tue,  9 Aug 2022 11:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236222AbiHIJif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Aug 2022 05:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235278AbiHIJie (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Aug 2022 05:38:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A87220F5F
        for <linux-media@vger.kernel.org>; Tue,  9 Aug 2022 02:38:33 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1oLLh0-0006zv-Qo; Tue, 09 Aug 2022 11:38:30 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1oLLgx-0003cR-Q4; Tue, 09 Aug 2022 11:38:27 +0200
Date:   Tue, 9 Aug 2022 11:38:27 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V1
Message-ID: <20220809093827.GA8383@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <1ca14c26-2e47-b144-1f5a-02824e81269a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ca14c26-2e47-b144-1f5a-02824e81269a@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 05 Aug 2022 13:35:48 +0200, Hans Verkuil wrote:
> Here is some more information about the Media Summit:
> 
> Date: Monday September 12
> Time: 9:00-17:00
> Location: Convention Centre Dublin
> Room: The Liffey B - Part 1 (subject to change)
> Sponsored by: Cisco Systems Norway and Collabora
> 
> We will have a projector or display to show presentations, power strips,
> a whiteboard and beverages. For lunch we are on our own.
> 
> It's co-located with the OSS Europe conference:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/
> 
> Attendees:
> 
> Sakari Ailus <sakari.ailus@linux.intel.com>
> Kieran Bingham <kieran.bingham@ideasonboard.com>
> Nicolas Dufresne <nicolas@ndufresne.ca>
> Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Hidenori Kobayashi <hidenorik@chromium.org>
> Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Ricardo Ribalda <ribalda@chromium.org>
> Maxime Ripard <maxime@cerno.tech>
> Daniel Scally <djrscally@gmail.com>
> Jernej Škrabec <jernej.skrabec@gmail.com>
> Dave Stevenson <dave.stevenson@raspberrypi.com> (from 11 am onwards)
> Hans Verkuil <hverkuil@xs4all.nl>
> Philipp Zabel <p.zabel@pengutronix.de>
> 
> Note: there are 5 seats left, so if you are interested in this, mail me.

I would like to join as well: Michael Tretter <m.tretter@pengutronix.de>

Michael
