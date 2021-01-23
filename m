Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFB5301466
	for <lists+linux-media@lfdr.de>; Sat, 23 Jan 2021 10:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbhAWJ5T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Jan 2021 04:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbhAWJ5O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Jan 2021 04:57:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A8CC06174A;
        Sat, 23 Jan 2021 01:56:33 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 866E53E;
        Sat, 23 Jan 2021 10:56:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611395790;
        bh=n7EJVx3lMyXfgyiJsOkqtGDIrkjrA1Zltz1NkLhlxg8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jhRbNSVuzTO1A0p+xl9vOtrw90Lk7Z8JSKYPdDorAnYq7DF+11h4eDxYPih8RcmCN
         XaL7YNrHUdzyXwHqh6whAKs/bxcXNtwP37kW84pSOSZAiBU30p1bBqigc19jGkCHL8
         50uTYhpjgSxp2QUncIkzPvZM5zZ/ic1AEF80lf7g=
Date:   Sat, 23 Jan 2021 11:56:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        hans.verkuil@cisco.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: doc: pixfmt-yuv: Fix 4:4:4 subsampling info
Message-ID: <YAvyu6AvEmZy6WRq@pendragon.ideasonboard.com>
References: <20210122182723.327438-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210122182723.327438-1-helen.koike@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thank you for the patch.

On Fri, Jan 22, 2021 at 03:27:23PM -0300, Helen Koike wrote:
> YUV 4:4:4 is not subsampled, fix this in the docs.
> 
> Fixes: da785536e007 ("media: doc: pixfmt-yuv: Move all semi-planar YUV formats to common file")
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 7d4d39201a3f..bcb4ef24c334 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -396,8 +396,8 @@ number of lines as the luma plane.
>  NV24 and NV42
>  -------------
>  
> -Semi-planar YUV 4:4:4 formats. The chroma plane is subsampled by 2 in the
> -horizontal direction. Chroma lines contain half the number of pixels and the
> +Semi-planar YUV 4:4:4 formats. No sub-sampling.

"The chroma plane is not subsampled." ?

> +Chroma lines contain the same number of pixels and the
>  same number of bytes as luma lines, and the chroma plane contains the same
>  number of lines as the luma plane.

That's not quite right, the chroma lines contain twice the number of
pixels and bytes, as there's one Cb and one Cr value in the chroma line
for each Y value in the luma line.


Maybe the text could be reflowed ?

-- 
Regards,

Laurent Pinchart
