Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D8331B2CD
	for <lists+linux-media@lfdr.de>; Sun, 14 Feb 2021 22:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhBNVeg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 16:34:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhBNVee (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 16:34:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 538E6C061756
        for <linux-media@vger.kernel.org>; Sun, 14 Feb 2021 13:33:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AF50B2C;
        Sun, 14 Feb 2021 22:33:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613338430;
        bh=PoO52crXSjH1azBdvJzDhbUDGrmlv8mype5c1aEu1Mg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lwAC8IWH0WjSPA4t/5S230zOeOGkvdLYy4Io1bgz+UWwCdMnwqUnK/Kj/8uTF1K82
         xN1sHKCC6UwZFDsUnWmgM/yEP5ItmQhWhx3Nor9dcehRyinSuOlD0fY3QhtRgEdwQ9
         9PRnaDhl7fOXVOJg2IqGYrpX2CpgVWJludg6WpxQ=
Date:   Sun, 14 Feb 2021 23:33:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 20/75] media: imx: capture: Rename ioctl operations with
 legacy prefix
Message-ID: <YCmXJZsoi7T+YJSU@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-21-laurent.pinchart@ideasonboard.com>
 <e47bf3ba-6d9a-52cf-f232-ce4b02a46e2e@gmail.com>
 <fbf3aaa4454f2ada8f7b8f5e8b990a4e66577427.camel@pengutronix.de>
 <X/kCWdynMK8w4sV+@pendragon.ideasonboard.com>
 <3f44d29c3779b6347a43f181806e4c220c3d7110.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3f44d29c3779b6347a43f181806e4c220c3d7110.camel@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

(CC'ing Sakari)

On Mon, Jan 11, 2021 at 09:40:17AM +0100, Philipp Zabel wrote:
> On Sat, 2021-01-09 at 03:09 +0200, Laurent Pinchart wrote:
> > Could you elaborate a little bit here ? We don't have an API to
> > explicitly enumerate supported interlacing types. This can be done by
> > calling VIDIOC_TRY_FMT with all field types and see which ones are
> > supported. You can still do so with the MC-based API, the video node
> > will return from VIDIOC_TRY_FMT the interlacing types intrinsicly
> > supported by the video node, and you can query from the source subdev
> > the interlacing types supported by the source. Userspace can then
> > combine the information to find what is supported.
> 
> The i.MX6 CSI always captures whole frames, so SEQ_TB or SEQ_BT at its
> source pad.
> The IDMAC supports "interlaced scan" of SEQ_TB into INTERLACED_TB and
> SEQ_BT into INTERLACED_BT when writing to memory. It can't change the
> field timing order (BT <-> TB) as that was already decided at the CSI.
> 
> So for capture of interlaced material, the video device currently allows
> either SEQ_TB and INTERLACED_TB or SEQ_BT and INTERLACED_BT, depending
> on which field order is configured at the CSI source pad.
> 
> See d969291d8479 ("media: imx: Fix field negotiation") for details.

Thanks for the explanation.

With the MC-based API, and unless I'm mistaken, userspace can determine
what interlacing options are supported as follows. Sakari, please feel
free to confirm, or infirm.

- The video node would report support for V4L2_FIELD_NONE,
  V4L2_FIELD_SEQ_(TB|BT) and V4L2_FIELD_INTERLACED_(TB|BT).

- The CSI subdev's source pad would report V4L2_FIELD_NONE for
  progressive sources, and V4L2_FIELD_ALTERNATE for interlaced sources.
  At the bus level top and bottom frames alternate, so
  V4L2_FIELD_SEQ_(TB|BT) isn't valid as it's defined based on buffers.
  V4L2_FIELD_INTERLACED_(TB|BT) isn't valid either in this case when
  frames alternate between top and bottom (they're not interleaved on
  the bus).

- When starting the video stream, the driver would reject a mismatch
  between the source pad and the video node (V4L2_FIELD_NONE on the
  source pad and V4L2_FIELD_SEQ_* or V4L2_FIELD_INTERLACED_* on the
  video node, or the other way around).

- From a userspace point of view, the fact that both V4L2_FIELD_SEQ_*
  and V4L2_FIELD_INTERLACED_* are supported on the video node (which can
  be queried using VIDIOC_S_FMT or VIDIOC_TRY_FMT) means that the DMA
  engine can interleave interlaced content. If the IDMAC wasn't able to
  interleave lines, but was only able to capture the two fields
  sequentially in the same buffer, it would only report
  V4L2_FIELD_SEQ_*, not V4L2_FIELD_INTERLACED_*.

Does this make sense ?

-- 
Regards,

Laurent Pinchart
