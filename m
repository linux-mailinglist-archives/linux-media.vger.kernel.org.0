Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C292EFC9A
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 02:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbhAIBKl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 20:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbhAIBKk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 20:10:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71077C061573
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 17:10:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD218DA;
        Sat,  9 Jan 2021 02:09:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610154598;
        bh=ErDdCP2F8LdyUk3AH5fI+psfl+LRxANcP+6uXVkXB20=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UReDswvXJ6EyntU/yKOeBbpVUeJfU/eHyxXWQaK/gT5US3gIAn7rp9Qoqbx2K/Tml
         Ryn8wVqdeUh30VOjDWYa/Crl3mYih8FNq27kZWtNiDGXaiCDLabhrQi8eezdNGuxYm
         8o/sRwb/JaWEt+AgSkLcEdhsGFjcMvXPX+OM2vv4=
Date:   Sat, 9 Jan 2021 03:09:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 20/75] media: imx: capture: Rename ioctl operations with
 legacy prefix
Message-ID: <X/kCWdynMK8w4sV+@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-21-laurent.pinchart@ideasonboard.com>
 <e47bf3ba-6d9a-52cf-f232-ce4b02a46e2e@gmail.com>
 <fbf3aaa4454f2ada8f7b8f5e8b990a4e66577427.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fbf3aaa4454f2ada8f7b8f5e8b990a4e66577427.camel@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Thu, Jan 07, 2021 at 11:52:33AM +0100, Philipp Zabel wrote:
> On Wed, 2021-01-06 at 09:51 -0800, Steve Longerbeam wrote:
> > Hi Laurent,
> > 
> > I guess I have fallen behind the times with v4l2, but I wasn't aware 
> > that the /dev/video nodes and VIDIOC_* APIs are now considered legacy!
> 
> I don't think Laurent considers the video node legacy, just the fact
> that the current implementation looks at the subdev source pad's active
> format in ENUM_FRAMESIZES and ENUM_/G/S/TRY_FMT.

Correct. The legacy part here is control of the source subdev through
the video node. It should instead be handled with the media controller
API. The DMA engine side is still handled through the video node, and
that's totally fine.

> I see the behavior of VIDIOC_ENUM_FMT was extended/defined for MC-
> centric devices last year, to allow enumerating all pixel formats or
> filter pixel formats for a given mbus format:
> 
> e5b6b07a1b45 ("media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices")
> cfe9e707c564 ("media: open.rst: document mc-centric and video-node-centric")
> 
> > On 1/5/21 7:27 AM, Laurent Pinchart wrote:
> > > The i.MX media drivers implement a legacy video node API, where the
> > > format of the video node is influenced by the active format of the
> > > connected subdev (both for enumeration and for the get, set and try
> > > format ioctls), and where controls exposed by the subdevs in the
> > > pipeline are inherited by the video node.
> 
> But I don't quite understand why G/S/TRY_FMT should not respect the
> connected subdev source pad's active format. Should MC-centric devices
> allow to set non-working configurations and only error out on stream
> start? Is this documented?

It's the currently recommended practice, but I'm not sure it's
documented.

There are multiple issues here. One of them is that we could limit
VIDIOC_S_FMT to formats compatible with the connected source subdev with
minimum complexity in the implementation, but the source subdev could
then see its configuration being changed by userspace, and updating the
format on the video node automatically would be not only more difficult,
but potentially confusing for userspace as formats are not supposed to
change automatically. For this reason, we need to validate the full
pipeline at stream on time in any case, and restricting the format
ioctls on the video node to the active configuration of the connected
subdev would thus not be that useful.

Another issue is that we've had cases in the past where it was useful
for userspace to configure the video node with a format not matching the
connected subdev, with the subdev configuration later being changed to
match the video node, before starting the stream. I'm not sure if this
use case is still valid today though.

> The current "legacy" vb2_ops check the subdev in ENUM_FRAMESIZES and
> ENUM_FRAMEINTERVALS, and in TRY_FMT/S_FMT to determine format and
> possible interlacing options. If the MC-centric ops just drop that,
> there is no way to determine which interlacing combinations are actually
> supported.

Could you elaborate a little bit here ? We don't have an API to
explicitly enumerate supported interlacing types. This can be done by
calling VIDIOC_TRY_FMT with all field types and see which ones are
supported. You can still do so with the MC-based API, the video node
will return from VIDIOC_TRY_FMT the interlacing types intrinsicly
supported by the video node, and you can query from the source subdev
the interlacing types supported by the source. Userspace can then
combine the information to find what is supported. In this case, with a
source producing V4L2_FIELD_SEQ_TB, and the video node not reporting
V4L2_FIELD_SEQ_TB but reporting V4L2_FIELD_INTERLACED_TB, wouldn't the
application be able to know that V4L2_FIELD_INTERLACED_TB will work ?

-- 
Regards,

Laurent Pinchart
