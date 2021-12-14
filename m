Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5982473E46
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 09:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbhLNIfA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 03:35:00 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:41039 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbhLNIfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 03:35:00 -0500
X-Greylist: delayed 4952 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Dec 2021 03:34:59 EST
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 546A5C0013;
        Tue, 14 Dec 2021 08:34:56 +0000 (UTC)
Date:   Tue, 14 Dec 2021 09:35:50 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 24/38] media: subdev: increase
 V4L2_FRAME_DESC_ENTRY_MAX to 8
Message-ID: <20211214083550.xnavw2oyv36w56q4@uno.localdomain>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-25-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211130141536.891878-25-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Tue, Nov 30, 2021 at 04:15:22PM +0200, Tomi Valkeinen wrote:
> V4L2_FRAME_DESC_ENTRY_MAX is currently set to 4. In theory it's possible
> to have an arbitrary amount of streams in a single pad, so preferably
> there should be no hardcoded maximum number.
>
> However, I believe a reasonable max is 8, which would cover a CSI-2 pad
> with 4 streams of pixel data and 4 streams of metadata.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

If I'm not mistaken C-PHY supports up to 32 virtual channels ?

Can be increased later...

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  include/media/v4l2-subdev.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 2921885eb390..a82fc74f4646 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -360,7 +360,11 @@ struct v4l2_mbus_frame_desc_entry {
>  	} bus;
>  };
>
> -#define V4L2_FRAME_DESC_ENTRY_MAX	4
> + /*
> +  * FIXME: If this number is too small, it should be dropped altogether and the
> +  * API switched to a dynamic number of frame descriptor entries.
> +  */
> +#define V4L2_FRAME_DESC_ENTRY_MAX	8
>
>  /**
>   * enum v4l2_mbus_frame_desc_type - media bus frame description type
> --
> 2.25.1
>
