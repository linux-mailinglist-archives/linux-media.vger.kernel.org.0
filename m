Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9633EAEA8
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 04:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238357AbhHMCnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 22:43:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42156 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238396AbhHMCnB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 22:43:01 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B904EE;
        Fri, 13 Aug 2021 04:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628822553;
        bh=f2p8CERp95jSIPt+OCmvG4RJ+BFbg3txXjhb5K/mPWE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=clYejeDDS7OjYwcl7wgVxHIDz4JsMCfdKdmf88cuCnaeEaZxfUtUWwEp//cdahl/o
         ZT5bvibDycmukn5Vg/OEcaaFCCkTL99iQ6bU83Vqczx02r2vluA+fImrnCuY3yTSof
         k2OTEwVXpoW0oR29Emo15EOj/VWhKQ7eGQUaJkck=
Date:   Fri, 13 Aug 2021 05:42:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     David Plowman <david.plowman@raspberrypi.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, sakari.ailus@iki.fi,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v5 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS
 control
Message-ID: <YRXcFRLrw+HZGTUV@pendragon.ideasonboard.com>
References: <20210810093811.7205-1-david.plowman@raspberrypi.com>
 <20210810093811.7205-3-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210810093811.7205-3-david.plowman@raspberrypi.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

Thank you for the patch.

On Tue, Aug 10, 2021 at 10:38:11AM +0100, David Plowman wrote:
> Add documentation for the V4L2_CID_NOTIFY_GAINS control.
> 
> This control is required by sensors that need to know what colour
> gains will be applied to pixels by downstream processing (such as by
> an ISP), though the sensor does not apply these gains itself.
> 
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> ---
>  .../media/v4l/ext-ctrls-image-source.rst      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index de43f5c8486d..ba83cc0867d2 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -72,3 +72,23 @@ Image Source Control IDs
>      * - __u32
>        - ``height``
>        - Height of the area.
> +
> +``V4L2_CID_NOTIFY_GAINS (integer array)``
> +    The sensor is notified what gains will be applied to the different
> +    colour channels by subsequent processing (such as by an ISP). The
> +    sensor is merely informed of these values in case it performs
> +    processing that requires them, but it does not apply them itself to
> +    the output pixels.
> +
> +    The use of an array allows this control to be extended to sensors
> +    with, for example, non-Bayer CFAs (colour filter arrays).
> +
> +    Currently it is defined only for Bayer sensors, and is an array
> +    control taking 4 gain values, being the gains for each of the
> +    Bayer channels. The gains are always in the order B, Gb, Gr and R,
> +    irrespective of the exact Bayer order of the sensor itself.

I'd swap the above two paragraphs.

> +
> +    The units for the gain values are linear, with the default value
> +    representing a gain of exactly 1. For example, if this default value
> +    is reported as being (say) 128, then a value of 256 would represent
> +    a gain of exactly 2.

Maybe 1.0 and 2.0 instead of 1 and 2 to show that the gains values
themselves can be fractional ?

With those two minor issues addressed if deemed to be worth it,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
