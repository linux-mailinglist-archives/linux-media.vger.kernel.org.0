Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE76A3B1D5D
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 17:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbhFWPQt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 11:16:49 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38785 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWPQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 11:16:48 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 894072000C;
        Wed, 23 Jun 2021 15:14:29 +0000 (UTC)
Date:   Wed, 23 Jun 2021 17:15:18 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: Re: [PATCH 6/6] Documentation: v4l: Fix V4L2_CID_PIXEL_RATE
 documentation
Message-ID: <20210623151518.zgjsu6qiuubsc7y6@uno.localdomain>
References: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
 <20210622112200.13914-7-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210622112200.13914-7-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Jun 22, 2021 at 02:22:00PM +0300, Sakari Ailus wrote:
> The V4L2_CID_PIXEL_RATE is nowadays used to tell pixel sampling rate in
> the sub-device's pixel array, not the pixel rate over a link (for which it
> also becomes unfit with the addition of multiplexed streams later on). Fix
> this.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 37dad2f4df8c..6d681af95624 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -38,7 +38,7 @@ Image Process Control IDs
>      of this control is Hz.
>
>  ``V4L2_CID_PIXEL_RATE (64-bit integer)``
> -    Pixel rate in the source pads of the subdev. This control is
> +    Pixel sampling rate in the device's pixel array. This control is
>      read-only and its unit is pixels / second.
>
>  ``V4L2_CID_TEST_PATTERN (menu)``
> --
> 2.30.2
>
