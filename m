Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1B83684A6
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 18:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236603AbhDVQTQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 12:19:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49472 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236341AbhDVQTN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 12:19:13 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D6963EE;
        Thu, 22 Apr 2021 18:18:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619108317;
        bh=IQ1QtZV1SGUqEJlqYT/sU6+SEHHNXy9EwUFqbn2IlLQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CNAnLiHubbTuRJUhqV2ELIarfmV4V+TDm3L3pQ7cMTFZrA7eTRNZSDHY3n+JINLuh
         dh/U59JVr52maXghtjuLo8SqCNXOnIC6eL6HoPvw5WN2qOxPPSSRg2k6s704qvoT+r
         WROVqpziEXxiLmkl8NZsREVXIz8a5u4Po6IT/xtU=
Date:   Thu, 22 Apr 2021 19:18:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 17/24] v4l: Add stream to frame descriptor
Message-ID: <YIGh2Krf4DeQ8CxK@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-18-tomi.valkeinen@ideasonboard.com>
 <YHyIHyJpxvwMf6rZ@pendragon.ideasonboard.com>
 <a259ee1e-10d5-3b5d-0fdc-6fc6a67dcdcd@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a259ee1e-10d5-3b5d-0fdc-6fc6a67dcdcd@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Thu, Apr 22, 2021 at 03:47:05PM +0300, Tomi Valkeinen wrote:
> On 18/04/2021 22:27, Laurent Pinchart wrote:
> > On Thu, Apr 15, 2021 at 04:04:43PM +0300, Tomi Valkeinen wrote:
> >> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>
> >> The stream field identifies the stream this frame descriptor applies to in
> >> routing configuration across a multiplexed link.
> >>
> >> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >> ---
> >>   include/media/v4l2-subdev.h | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >> index 30ec011d31e3..436d0445aafd 100644
> >> --- a/include/media/v4l2-subdev.h
> >> +++ b/include/media/v4l2-subdev.h
> >> @@ -338,6 +338,7 @@ enum v4l2_mbus_frame_desc_flags {
> >>    * struct v4l2_mbus_frame_desc_entry - media bus frame description structure
> >>    *
> >>    * @flags:	bitmask flags, as defined by &enum v4l2_mbus_frame_desc_flags.
> >> + * @stream:	stream in routing configuration
> >>    * @pixelcode:	media bus pixel code, valid if @flags
> >>    *		%FRAME_DESC_FL_BLOB is not set.
> >>    * @length:	number of octets per frame, valid if @flags
> >> @@ -347,6 +348,7 @@ enum v4l2_mbus_frame_desc_flags {
> >>    */
> >>   struct v4l2_mbus_frame_desc_entry {
> >>   	enum v4l2_mbus_frame_desc_flags flags;
> >> +	u32 stream;
> > 
> > As this isn't used in this series, I can't really tell how it will be
> > used, so it's hard to review the patch. Should we postpone it to the
> > next patch series ?
> 
> It's not used here, but it is needed allow the drivers use the features 
> introduced in this series. It is used to match routes to frame_descs.

Sure, I'm not saying it should be dropped, but it would be easier to
review it in the context of the next series, while the rest of this
series bring a self-contained feature that is already useful without
streams support.

> Its usage is quite simple: e.g. when a driver has a route 
> (v4l2_subdev_route), it can get the frame_descs from the entity behind 
> v4l2_subdev_route.source_pad, and then find the matching frame_desc by 
> searching for
> 
> v4l2_subdev_route.source_stream == v4l2_mbus_frame_desc_entry.stream

-- 
Regards,

Laurent Pinchart
