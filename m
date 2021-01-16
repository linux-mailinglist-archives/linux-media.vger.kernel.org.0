Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286882F8FD6
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 00:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbhAPXXH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 18:23:07 -0500
Received: from retiisi.eu ([95.216.213.190]:51232 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727520AbhAPXXE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 18:23:04 -0500
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 671AA634C89;
        Sun, 17 Jan 2021 01:21:19 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1l0ush-0002pA-8H; Sun, 17 Jan 2021 01:21:19 +0200
Date:   Sun, 17 Jan 2021 01:21:19 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        mchehab@kernel.org, hans.verkuil@cisco.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org
Subject: Re: [PATCH 2/3] media: videodev2.h: clarify
 v4l2_pix_format_mplane.sizeimage docs when to set to zero
Message-ID: <20210116232119.GU850@valkosipuli.retiisi.org.uk>
References: <20210114180149.1755892-1-helen.koike@collabora.com>
 <20210114180149.1755892-3-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114180149.1755892-3-helen.koike@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for the patch.

On Thu, Jan 14, 2021 at 03:01:48PM -0300, Helen Koike wrote:
> sizeimage field should be set to zero for unused planes, even when
> v4l2_pix_format_mplane.num_planes is smaller then the index of planes.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> I caught this with v4l2-compliance, which throws an error if we dirty
> planes, even if invalid, so I would like to make it clear in the docs.

Would it be possible to do this in the framework instead?

> ---
>  include/uapi/linux/videodev2.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 79dbde3bcf8d..d9b7c9177605 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2227,6 +2227,7 @@ struct v4l2_mpeg_vbi_fmt_ivtv {
>   * struct v4l2_plane_pix_format - additional, per-plane format definition
>   * @sizeimage:		maximum size in bytes required for data, for which
>   *			this plane will be used
> + *			Drivers should be set it zero for unused planes.
>   * @bytesperline:	distance in bytes between the leftmost pixels in two
>   *			adjacent lines
>   */

-- 
Kind regards,

Sakari Ailus
