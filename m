Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5719EB371B
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 11:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731760AbfIPJ1d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 05:27:33 -0400
Received: from retiisi.org.uk ([95.216.213.190]:50904 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725850AbfIPJ1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 05:27:33 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 4BC1E634C87;
        Mon, 16 Sep 2019 12:27:00 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1i9nHh-0001Je-6I; Mon, 16 Sep 2019 12:27:01 +0300
Date:   Mon, 16 Sep 2019 12:27:01 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH 2/2] v4l2-ioctl.c: use new V4L2_FOURCC_CONV/ARGS macros
Message-ID: <20190916092700.GN843@valkosipuli.retiisi.org.uk>
References: <20190916090047.122078-1-hverkuil-cisco@xs4all.nl>
 <20190916090047.122078-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916090047.122078-3-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 16, 2019 at 11:00:47AM +0200, Hans Verkuil wrote:
> Use these new standard macros to log the fourcc value in a
> human readable format.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 51b912743f0f..80030533e1b8 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1383,12 +1383,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  				return;
>  			WARN(1, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
>  			flags = 0;
> -			snprintf(fmt->description, sz, "%c%c%c%c%s",
> -					(char)(fmt->pixelformat & 0x7f),
> -					(char)((fmt->pixelformat >> 8) & 0x7f),
> -					(char)((fmt->pixelformat >> 16) & 0x7f),
> -					(char)((fmt->pixelformat >> 24) & 0x7f),
> -					(fmt->pixelformat & (1UL << 31)) ? "-BE" : "");
> +			snprintf(fmt->description, sz, V4L2_FOURCC_CONV,
> +				 V4L2_FOURCC_ARGS(fmt->pixelformat));
>  			break;
>  		}
>  	}

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
