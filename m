Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAD9E7D4892
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 09:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbjJXHcF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 03:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbjJXHcE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 03:32:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77FFEB7
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 00:32:02 -0700 (PDT)
Received: from [192.168.88.20] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 624C8B53;
        Tue, 24 Oct 2023 09:31:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698132709;
        bh=bfiLrgFD1wdrJ9FmIo48rX0vRenaSz3Moahu9f+hcEE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VnF1H9Vx1SRseL4SiFk6unY4g6k4eCRxyCQkhv10V/NMlMrOUtmch0d//BqD4n0Hm
         6dOwcOIl0Bp8VpWHtPE/D5hyMv+yJvorfWTa8+F1tY70+DFhE815UmSTO/ZgNwwtaA
         6oZGvl1t0P2kt2eVvdCDp01eNYxR0oM/uQcPlBJs=
Message-ID: <b05efe8d-8317-4484-9f6a-f4a8535ee22f@ideasonboard.com>
Date:   Tue, 24 Oct 2023 10:31:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/4] media: v4l2-subdev: Improve frame interval
 handling
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hansg@kernel.org>
References: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/10/2023 03:51, Laurent Pinchart wrote:
> Hello,
> 
> This patch series improves frame interval handling in the V4L2 subdev
> in-kernel and userspace APIs.
> 
> Frame interval are exposed to userspace on pads and streams, but the
> frame interval handling is currently implemented through a v4l2_subdev
> video operation, without involving the subdev state. This makes frame
> intervals a second class citizen compared to formats and selection
> rectangles.
> 
> Patch 1/4 starts by addressing the first issue, namely the frame
> interval operations being video ops. This requires touching all the
> drivers using frame intervals.
> 
> Patch 2/4 then adds a 'which' field to the subdev frame interval
> userspace API, allowing frame intervals to be tried the same way formats
> and selection rectangles can. Again, the same drivers need to be touched
> to preserve their current behaviour.
> 
> Patch 3/4 adds support for storing the frame interval in the subdev
> state, alongside the formats and selection rectangles, with similar
> accessors and helper functions.
> 
> Finally, patch 4/4 demonstrates how this is used in drivers, with the
> thp7312 driver serving as an example. This driver isn't upstream yet,
> the latest version can be found on the linux-media mailing list ([1]).
> 
> Sakari, these patches conflict with your "[PATCH v3 0/8] Unify
> sub-device state access functions" series. I plan to rebase on top once
> it reaches the media tree. This shouldn't prevent reviewing this RFC in
> the meantime :-)

I think these look fine, but I'll do an official review when the non-RFC 
is posted.

Should v4l2-compliance be updated?

  Tomi

> [1] https://lore.kernel.org/linux-media/20231017132103.9914-1-laurent.pinchart@ideasonboard.com/
> 
> Laurent Pinchart (4):
>    media: v4l2-subdev: Turn .[gs]_frame_interval into pad operations
>    media: v4l2-subdev: Add which field to struct
>      v4l2_subdev_frame_interval
>    media: v4l2-subdev: Store frame interval in subdev state
>    media: i2c: thp7312: Store frame interval in subdev state
> 
>   .../media/v4l/vidioc-subdev-g-client-cap.rst  |   5 +
>   .../v4l/vidioc-subdev-g-frame-interval.rst    |  17 +-
>   drivers/media/i2c/adv7180.c                   |  10 +-
>   drivers/media/i2c/et8ek8/et8ek8_driver.c      |  12 +-
>   drivers/media/i2c/imx214.c                    |  12 +-
>   drivers/media/i2c/imx274.c                    |  54 +++----
>   drivers/media/i2c/max9286.c                   |  20 ++-
>   drivers/media/i2c/mt9m111.c                   |  20 ++-
>   drivers/media/i2c/mt9m114.c                   |  20 ++-
>   drivers/media/i2c/mt9v011.c                   |  24 +--
>   drivers/media/i2c/mt9v111.c                   |  22 ++-
>   drivers/media/i2c/ov2680.c                    |  10 +-
>   drivers/media/i2c/ov5640.c                    |  22 ++-
>   drivers/media/i2c/ov5648.c                    |  62 ++++----
>   drivers/media/i2c/ov5693.c                    |  10 +-
>   drivers/media/i2c/ov6650.c                    |  22 ++-
>   drivers/media/i2c/ov7251.c                    |  12 +-
>   drivers/media/i2c/ov7670.c                    |  22 +--
>   drivers/media/i2c/ov772x.c                    |  20 ++-
>   drivers/media/i2c/ov7740.c                    |  40 ++---
>   drivers/media/i2c/ov8865.c                    |  54 ++++---
>   drivers/media/i2c/ov9650.c                    |  20 ++-
>   drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  20 ++-
>   drivers/media/i2c/s5k5baf.c                   |  26 ++--
>   drivers/media/i2c/thp7312.c                   | 145 ++++++++++--------
>   drivers/media/i2c/tvp514x.c                   |  33 ++--
>   drivers/media/usb/em28xx/em28xx-video.c       |   6 +-
>   drivers/media/v4l2-core/v4l2-common.c         |   8 +-
>   drivers/media/v4l2-core/v4l2-subdev.c         | 120 +++++++++++----
>   .../media/atomisp/i2c/atomisp-gc0310.c        |  10 +-
>   .../media/atomisp/i2c/atomisp-gc2235.c        |  10 +-
>   .../media/atomisp/i2c/atomisp-mt9m114.c       |  10 +-
>   .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
>   .../staging/media/atomisp/pci/atomisp_cmd.c   |   4 +-
>   .../staging/media/atomisp/pci/atomisp_ioctl.c |   4 +-
>   drivers/staging/media/imx/imx-ic-prp.c        |  20 ++-
>   drivers/staging/media/imx/imx-ic-prpencvf.c   |  20 ++-
>   drivers/staging/media/imx/imx-media-capture.c |   6 +-
>   drivers/staging/media/imx/imx-media-csi.c     |  20 ++-
>   drivers/staging/media/imx/imx-media-vdic.c    |  20 ++-
>   drivers/staging/media/tegra-video/csi.c       |  12 +-
>   include/media/v4l2-common.h                   |   4 +-
>   include/media/v4l2-subdev.h                   |  79 ++++++++--
>   include/uapi/linux/v4l2-subdev.h              |  13 +-
>   44 files changed, 706 insertions(+), 404 deletions(-)
> 

