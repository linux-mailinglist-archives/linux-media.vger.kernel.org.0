Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D4E1B4B84
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 19:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgDVRW6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 13:22:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47398 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgDVRW6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 13:22:58 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FC8A528;
        Wed, 22 Apr 2020 19:22:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587576176;
        bh=j3EIFEGnMa+c/e4zbOKTgRmjlDh+te/LFLbzlWg9tBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uGqrLMR5blcmfKiTReXZr88pl+Kkv7DETKQFZEDSt42fUTTqLAe/eZgwCmqhwJhU8
         AqhQNsoKY/TmQB9gfQXggLq0t0o7bt/bR/XFjHhIAcAU0lDGv+7f0HKvV8RkQ1Qmtu
         DFHppZoUxH+u/E2e51wlHzrx3Wt+JbJ9FRp2ppug=
Date:   Wed, 22 Apr 2020 20:22:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8 0/6] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Message-ID: <20200422172242.GA18075@pendragon.ideasonboard.com>
References: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

(With a question for Hans below)

Thank you for the patches.

On Tue, Apr 21, 2020 at 03:57:37PM +0200, Niklas Söderlund wrote:
> Hi,
> 
> This series aims to reduce the amount of boiler plate code in video
> device drivers who's inputs and/or outputs are controlled by the Media
> Controller instead of the V4L2 API.
> 
> Patch 1/6 adds a new video device capability flag V4L2_CAP_IO_MC which
> if set provides helper implementations for the enum inputs and outputs
> ioctls freeing the video device driver from the need to implement them.
> 
> Patch 2/6 fix initialization of reserved fields in the cx18 and ivtv 
> drivers which becomes a problem in 3/6 where Laurent adds mbus filters to
> VIDIOC_ENUM_FMT.
> 
> Patch 4/6, 5/6 and 6/6 converts the R-Car VIN, Intel IPU3 and VIMC
> drivers to use the new default handlers and capability flag and delete
> the now redundant boiler plate code. I'm sure more video device drivers
> can make use of this new flag but as I can only test on these two
> platforms I have limited my changes to those.
> 
> A separate patch to v4l-utils have been posted as [1] to add a
> test for this feature in v4l2-compliance.
> 
> This version have been rebased to latest media-tree to account for the 
> large shuffles of files. It has also replaced patch 2/6 with a different 
> version that addresses both cx18 and ivtv instead of only ivtv.

It looks like everything has been reviewed. Hans, do you see any
remaining blocker, or will you take it in your tree and send a pull
request ?

> 1. [PATCH 0/2] v4l2-compliance: add tests for V4L2_CAP_IO_MC
> 
> Laurent Pinchart (2):
>   media: pci: Fill v4l2_fmtdesc with designated initializers
>   media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices
> 
> Niklas Söderlund (4):
>   v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
>   rcar-vin: Make use of V4L2_CAP_IO_MC
>   staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
>   vimc: Make use of V4L2_CAP_IO_MC
> 
>  .../media/v4l/vidioc-enum-fmt.rst             | 16 ++++-
>  .../media/v4l/vidioc-querycap.rst             |  6 ++
>  .../media/videodev2.h.rst.exceptions          |  1 +
>  drivers/media/pci/cx18/cx18-ioctl.c           | 22 ++++--
>  drivers/media/pci/ivtv/ivtv-ioctl.c           | 26 +++----
>  drivers/media/platform/rcar-vin/rcar-v4l2.c   | 40 ++++++-----
>  .../media/test-drivers/vimc/vimc-capture.c    | 14 +++-
>  drivers/media/v4l2-core/v4l2-dev.c            | 25 +++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 70 +++++++++++++++++--
>  drivers/staging/media/ipu3/ipu3-v4l2.c        | 64 ++---------------
>  include/uapi/linux/videodev2.h                |  5 +-
>  11 files changed, 180 insertions(+), 109 deletions(-)
> 

-- 
Regards,

Laurent Pinchart
