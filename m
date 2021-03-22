Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D143344EA0
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 19:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhCVSf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 14:35:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46970 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbhCVSfv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 14:35:51 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C50BC3F;
        Mon, 22 Mar 2021 19:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616438150;
        bh=vKSqNTZjnr6UI2S85AXZRvNST4kvqJA9OqwPsKw9lgA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VI02d79w5mf2PNzOV0g/WQvfxpo8g4b6sEorBRjozChaWzVuOymVQxFM0mpCnur/O
         7ipDJv8Jmu5bAHaTGpJMXk1a8csNH98DDm6suVn4QMgQ5BpHbKXkDES3kd5/KgS5Vu
         KiR926J1eRAGKvAjQJRC/+ZWKel7ih5U+1EGUCUI=
Date:   Mon, 22 Mar 2021 20:35:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Edgar Thier <info@edgarthier.net>
Subject: Re: [PATCHv2 0/3] Rebased 3 uvc pix_fmt patches
Message-ID: <YFjjXATQHUm4XAGf@pendragon.ideasonboard.com>
References: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patches.

On Mon, Mar 22, 2021 at 04:46:55PM +0100, Hans Verkuil wrote:
> This small series rebases three old patches that slipped through the
> cracks, but are otherwise fine.
> 
> Two from Edgar:
> 
> https://patchwork.linuxtv.org/project/linux-media/list/?series=329
> 
> and one from me:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/6e8bde09-7b47-5dec-6f21-c5156fbc9b10@xs4all.nl/
> 
> Since my patch depends on the Edgar's patches I decided to just
> rebase the lot and repost. Hopefully it won't take two years for
> the v2 to be merged. :-)

I've had all of this in my tree already, with the order of the patches
reversed (removal of the format description at the bottom).

> Edgar Thier (2):
>   v4l: Add 12-bit raw bayer linear packed formats
>   uvc: Add 12-bit raw bayer linear packed formats
> 
> Hans Verkuil (1):
>   uvc: don't set description in ENUM_FMT
> 
>  .../userspace-api/media/v4l/pixfmt-bayer.rst  |  1 +
>  .../media/v4l/pixfmt-srggb12lp.rst            | 74 +++++++++++++++++++
>  drivers/media/usb/uvc/uvc_driver.c            | 70 ++++--------------
>  drivers/media/usb/uvc/uvc_v4l2.c              |  9 ---
>  drivers/media/usb/uvc/uvcvideo.h              | 15 +++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +
>  include/uapi/linux/videodev2.h                |  7 ++
>  7 files changed, 114 insertions(+), 66 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb12lp.rst

-- 
Regards,

Laurent Pinchart
