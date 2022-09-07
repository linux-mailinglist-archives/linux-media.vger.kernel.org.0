Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 759955B021A
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 12:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiIGKvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 06:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbiIGKvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 06:51:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A7574CFA
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 03:51:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC1D8DD;
        Wed,  7 Sep 2022 12:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662547874;
        bh=A+gi7T9wTfS2akEBWAAOk/61J5iDCKBJpkY0/Jb2unY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mx7e3XlkPh3/hdMOHOpkjxdBK0ZVN8FlzUZraiQfrMh2tgAjRRWaiTUoHvBtHCEHO
         faH7w3qCuxPGCbAycAPBSkD3ACIXTpwnhujRP3IJYVtTexn9sKhyVr3qR+SrXKN4iq
         fLYNnr+Q9G5hXQ3Mq/aPZk0rzFwAVhjH5YYgBGJY=
Date:   Wed, 7 Sep 2022 13:50:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [Media Summit] ChromeOS Kernel CAM
Message-ID: <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com>
References: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Wed, Sep 07, 2022 at 09:55:12AM +0200, Ricardo Ribalda wrote:
> Hi
> 
> On ChromeOS we have opted to have a camera stack based on the upstream kernel.
> 
> The camera ecosystem has become extremely heterogeneous thanks to the
> proliferation of complex cameras. Meaning that, if ChromeOS wants to
> keep with our upstream commitments, we have to look into how to get
> more involvement from vendors and standardise our stack.
> 
> Kcam is an initiative to support complex cameras in a way that can be
> scalable, is acceptable by the vendors and respect the users rights.
> 
> Slides at: https://drive.google.com/file/d/1Tew21xeKmFlQ7dQxMcIYqybVuQL7La1a/view

Thank you. A few questions and comments for clarification:

- Slide 4 mentions proprietary drivers and UIO drivers. Do you mean UIO
  as in the upstream UIO API, or as in UIO-like drivers with a vendor
  API ?

- Slide 5 mentions "Code developed exclusively by vendor" for Android.
  There's the CameraX initiative (and possibly other I'm not aware of)
  that mixes the high-level HAL implementation from Google with
  low-level vendor code, to simplify (in theory at least) the life of
  vendors. Generally speaking you're right though, the vendor is in
  charge of providing the HAL, regardless of how it's structured
  internally.

- Slide 8 is focussed on notebooks (Chrome OS, but I suppose also
  regular Linux machines) vs. Android when it comes to leveraging the
  camera stack, but let's not forget there are also other markets (IoT
  in particular) that may be structured differently. Not all vendors of
  SoCs that integrate ISPs consider Android as their main target, and
  they may ignore the notebook and mobile markets completely.

- Slide 11 (and previous slides too) mention "Secret Sauce". I really
  dislike that term, as it's very vague. I would like discussions to
  clearly define the scope of that closed-source component, and we
  should come up with a more descriptive name that reflects that
  well-defined scope.

- Slide 16 mentions 122 ioctls to emphasize that V4L2 is a complicated
  API. Most of those are not relevant to cameras. It is thus a bit
  misleading technically, but it can be still perceived as complicated
  by vendors for that reason.

- Still on slide 16, V4L2 as an API is usable without disclosing vendor
  IP. What is not possible is upstreaming a driver. I don't see this as
  significantly different between V4L2 and the new API proposal. I
  expect this to be discussed on Monday.

- On slide 17 the color scheme seems to imply that the daemon is
  open-source, while it's in most cases (maybe in all of them) closed.

- Do you have a real life example of the type of outcome described on
  slide 19 (black box hardware) ?

- Slide 24 mentions parameter buffers, it would be useful to describe
  what those typically contain, and who consumes them once they're
  provided by userspace to the driver.

- Slide 27 mentions that upstreaming a driver will require a camera
  stack with the same open source requirements as V4L2. Doesn't that
  contradict slide 16 that mentions that V4L2 cannot product vendor IP,
  or at least infer that the new API wouldn't protect the vendor IP more
  than V4L2 does ?

- Slide 31 mentions that entities can send operations internally and
  listen to each other events. I'd like to better understand how that
  will work without any abstraction in the API (as that is one of the
  main design decision behind this new API) when those entities are from
  different vendors, and handled by different drivers that are developed
  independently (for instance, the camera sensor and the CSI-2 receiver,
  or even the CSI-2 receiver and the ISP).

- Does the bike on slide 32 illustrate the difficult discussions we've
  had in the past and how progress was hindered ? :-)

> Looking forward to see all of you again on Monday :)

-- 
Regards,

Laurent Pinchart
