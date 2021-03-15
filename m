Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C435E33A906
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 01:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhCOAJN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 20:09:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55894 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhCOAJG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 20:09:06 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A73D2908;
        Mon, 15 Mar 2021 01:09:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615766944;
        bh=pVzRftpwGYAPLLYB2ifeEyOgzz4gkjTy3DjSxY8RsC8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k57kurFgHawfgWIgLww2G2OVPZ9CjemPXcttHXNEu5SlOyOi5mh93Z5x4mo5T5WWw
         EVTMUe6ZzEi8hr9/WZ1LwDGbfSe64DBy8BWLNHZgqVf8TJbzjlHVcBhRNaAQ4Pk4XK
         BcZK77FUtedSKpy9rGOqXX1DfGgkeG3x4r7mxKzo=
Date:   Mon, 15 Mar 2021 02:08:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH] media: docs: Fix data organization of
 MEDIA_BUS_FMT_RGB101010_1X30
Message-ID: <YE6lfXOxksekzd0c@pendragon.ideasonboard.com>
References: <1615442027-16010-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1615442027-16010-1-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Liu,

Thank you for the patch.

On Thu, Mar 11, 2021 at 01:53:47PM +0800, Liu Ying wrote:
> The media bus bit width of MEDIA_BUS_FMT_RGB101010_1X30 is 30.
> So, 'Bit31' and 'Bit30' cells for the 'MEDIA_BUS_FMT_RGB101010_1X30'
> row should be spaces instead of '0's.
> 
> Fixes: 54f38fcae536 ("media: docs: move uAPI book to userspace-api/media")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/userspace-api/media/v4l/subdev-formats.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 7f16cbe..e6a9faa 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -1567,8 +1567,8 @@ The following tables list existing packed RGB formats.
>        - MEDIA_BUS_FMT_RGB101010_1X30
>        - 0x1018
>        -
> -      - 0
> -      - 0
> +      -
> +      -
>        - r\ :sub:`9`
>        - r\ :sub:`8`
>        - r\ :sub:`7`

-- 
Regards,

Laurent Pinchart
