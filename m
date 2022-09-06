Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E91DF5AF32A
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 19:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiIFRyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 13:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiIFRyJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 13:54:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8C69BB6A
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 10:53:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32B3C478;
        Tue,  6 Sep 2022 19:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662486834;
        bh=ehXi5nZdKAYQFpxPp5XDa1Bkt3En+q9ZxleZ8/cxrlY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jNqGE25x3fbQMYAOcoQIVPtHKFvm5GgsO8SiYxk6H3drtXfYaoe/4HPveB3ROTEZC
         2zaMyPrWLnwSYGkcNS13vsUxkgA9qWKYXxfHBdwqE/f9vsbOAUQXCr1uUM/A/Y2OzS
         coX6l37UpQngS5rxlDpZSY4R7Ip/yI2YW9VIeAaI=
Date:   Tue, 6 Sep 2022 20:53:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [Media Summit] Imaging Sensor functionality
Message-ID: <YxeJI8Fwf0ExkMTI@pendragon.ideasonboard.com>
References: <CAPY8ntBGKkg=KOXaP9bBv6Y8c7Mgut0=w-LTsvKHZac=zzdJDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBGKkg=KOXaP9bBv6Y8c7Mgut0=w-LTsvKHZac=zzdJDQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, Sep 06, 2022 at 05:14:30PM +0100, Dave Stevenson wrote:
> Hi All.
> 
> I realise that I'm in a slightly different position from many mainline
> Linux-media developers in that I see multiple use cases for the same
> sensor, rather than a driver predominantly being for one
> product/platform. I'm therefore wanting to look at generic solutions
> and fully featured drivers. Users get to decide the use cases, not the
> hardware designers.

Could you clarify here what you mean by users and hardware designers ?
Users can be understood as

- Users of the camera sensor, i.e. OEMs designing a product
- Users of the hardware platform , i.e. software developers writing
  applications
- Users of the software, i.e. end-users

Hardware designers could then equally mean

- Sensor vendors
- SoC vendors
- Board vendors
- Product vendors

> The issues I've raised are things that I've encountered and would
> benefit from a discussion to get views as to the direction that is
> perceived to be workable. I appreciate that some can not be solved
> immediately, but want to avoid too much bikeshedding in the first
> round of patches.
> What's realistic, and what pitfalls/limitations immediately jump out at people.
> 
> Slides are at https://drive.google.com/file/d/1vjYJjTNRL1P3j6G4Nx2ZpjFtTBTNdeFG/view?usp=sharing

Thank you, I will review that ASAP.

> See you on Monday.

-- 
Regards,

Laurent Pinchart
