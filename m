Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E359023FF23
	for <lists+linux-media@lfdr.de>; Sun,  9 Aug 2020 17:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgHIPx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Aug 2020 11:53:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42952 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbgHIPx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Aug 2020 11:53:27 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A64DBF9;
        Sun,  9 Aug 2020 17:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596988403;
        bh=e2u53rGjAsMRYMbD5dhzidg+Nt5/Ml1ec9jDEFWoI+s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r6fCfVxmJt4vuCz26vgZOoMeJZo9wLFgebFDDA/C5xRW8VVQcmphhaFampOWAcfDo
         3CYgDJTx1wAH/n2BGwy3InhVrhGdxAD0OHK2XmrfUS4swLYb1K/r66HQ7vxzPigmWm
         B5joNuDW7DQt2DtW6mokUTYSjp3+aAME+8cgOLO8=
Date:   Sun, 9 Aug 2020 18:53:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: your mail
Message-ID: <20200809155311.GB5981@pendragon.ideasonboard.com>
References: <20200805105721.15445-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200805105721.15445-1-jacopo@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Aug 05, 2020 at 12:57:17PM +0200, Jacopo Mondi wrote:
> Subject: [PATCH 0/4] media: docs: Document pixel array properties
> 
> Hans' patch "[PATCH] imx219: selection compliance fixes" sparkled a discussion
> on how the V4L2 selection targets have to be used in order to access an
> image sensor pixel array properties.
> 
> The discussion shown how much under-specified that part was, so this is
> an attempt to provide a bit documentation for this.
> 
> My feeling is that we're hijacking the existing targets for this use case
> and we should probably define new ones, considering how few users we have in
> mainline of them at the moment.

Do you mean you think we should create new targets instead of reusing
the existing ones as you do in this series ? I don't see anything really
wrong in reusing the existing targets, provided we document them
properly, and it's not too much of a hack (that is, the documented
purpose reasonably matches the target name), but maybe I'm missing the
issue.

> On top Hans' patch with reworded commit message and minor updates.
> 
> For reference, we're using the V4L2 selection targets in libcamera to retrieve
> the sensor pixel array properties to be reported to applications for
> calibration purposes. The currently defined pixel properties for libcamera
> are available here:
> https://git.linuxtv.org/libcamera.git/tree/src/libcamera/property_ids.yaml#n390
> 
> Thanks
>    j
> 
> Hans Verkuil (1):
>   media: i2c: imx219: Selection compliance fixes
> 
> Jacopo Mondi (3):
>   media: docs: Describe pixel array properties
>   media: docs: Describe targets for sensor properties
>   media: docs: USe SUBDEV_G_SELECTION for sensor properties
> 
>  .../userspace-api/media/v4l/dev-subdev.rst    | 85 +++++++++++++++++++
>  .../media/v4l/v4l2-selection-targets.rst      | 49 +++++++++++
>  .../media/v4l/vidioc-subdev-g-selection.rst   |  4 +
>  drivers/media/i2c/imx219.c                    | 17 ++--
>  4 files changed, 147 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart
