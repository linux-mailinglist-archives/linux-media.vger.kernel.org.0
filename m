Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4667B371A
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 11:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731724AbfIPJ1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 05:27:15 -0400
Received: from retiisi.org.uk ([95.216.213.190]:50890 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725850AbfIPJ1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 05:27:15 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id C619C634C87;
        Mon, 16 Sep 2019 12:26:41 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1i9nHO-0001JY-JT; Mon, 16 Sep 2019 12:26:42 +0300
Date:   Mon, 16 Sep 2019 12:26:42 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH 1/2] videodev2.h: add macros to print a fourcc
Message-ID: <20190916092642.GM843@valkosipuli.retiisi.org.uk>
References: <20190916090047.122078-1-hverkuil-cisco@xs4all.nl>
 <20190916090047.122078-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916090047.122078-2-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Sep 16, 2019 at 11:00:46AM +0200, Hans Verkuil wrote:
> Add new macros V4L2_FOURCC_CONV and V4L2_FOURCC_ARGS for use
> in code that prints a fourcc. These macros can be used in both
> kernel and userspace.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Suggested-by: Sakari Ailus <sakari.ailus@iki.fi>
> ---
>  include/uapi/linux/videodev2.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..7a34eb93437e 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -82,6 +82,19 @@
>  	((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
>  #define v4l2_fourcc_be(a, b, c, d)	(v4l2_fourcc(a, b, c, d) | (1U << 31))
>  
> +/*
> + * Helper macros to print a fourcc in a standard format. E.g.:
> + *
> + * printf("fourcc is " V4L2_FOURCC_CONV "\n", V4L2_FOURCC_ARGS(fourcc));
> + *
> + * Note that V4L2_FOURCC_ARGS reuses fourcc, so this can't be an
> + * expression with side-effects.
> + */
> +#define V4L2_FOURCC_CONV "%c%c%c%c%s"
> +#define V4L2_FOURCC_ARGS(fourcc) \
> +	(fourcc) & 0x7f, ((fourcc) >> 8) & 0x7f, ((fourcc) >> 16) & 0x7f, \
> +	((fourcc) >> 24) & 0x7f, ((fourcc) & (1U << 31) ? "-BE" : "")
> +
>  /*
>   *	E N U M S
>   */

KernelDoc comments would be nice. Such as in here:

<URL:https://patchwork.linuxtv.org/patch/48372/>

I'm fine with either patch though.

-- 
Sakari Ailus
