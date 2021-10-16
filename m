Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BD642FF5E
	for <lists+linux-media@lfdr.de>; Sat, 16 Oct 2021 02:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236295AbhJPAMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 20:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbhJPAMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 20:12:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB79C061570
        for <linux-media@vger.kernel.org>; Fri, 15 Oct 2021 17:10:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 171D229B;
        Sat, 16 Oct 2021 02:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634343025;
        bh=8g/65NzrsRrdPUMhb+LnTguqWVJ2qf3IrMyU1RLjZcI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aoJf7fm/EuYSKMshI5/y4EX6Hjt64s/xp4DjvWYBgsxr/uL7MseddL7jUcx+UZCEQ
         7VVBpgxBj+JEzYXopidVdt1kqnk2nMfiEfZ9Iat11QKg8aCs8kTOgpP7VTj8DH3TA0
         ZGva+F8rW9EUQod42a+uIY+0FjEW44qmxiF1Bfqk=
Date:   Sat, 16 Oct 2021 03:10:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        tfiga@chromium.org, bingbu.cao@linux.intel.com,
        jeanmichel.hautbois@ideasonboard.com
Subject: Re: [PATCH] media: staging: ipu3-imgu: clarify the limitation of
 grid config
Message-ID: <YWoYYchfGh+oNnNq@pendragon.ideasonboard.com>
References: <1634208977-22278-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1634208977-22278-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

Thank you for the patch.

On Thu, Oct 14, 2021 at 06:56:17PM +0800, Bingbu Cao wrote:
> There are some grid configuration limitations for ImgU, which was
> not described clearly in current uAPI header file, add the description
> to help user to set the grid configuration correctly.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Reported-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> ---
>  drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> index fa3d6ee5adf2..65290c1b1892 100644
> --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> @@ -34,11 +34,21 @@
>   * struct ipu3_uapi_grid_config - Grid plane config
>   *
>   * @width:	Grid horizontal dimensions, in number of grid blocks(cells).
> + *		For AWB, the range is (16, 80),
> + *		for AF/AE, the range is (16, 32).
>   * @height:	Grid vertical dimensions, in number of grid cells.
> + *		For AWB, the range is (16, 60),
> + *		For AF/AE, the range is (16, 24).
>   * @block_width_log2:	Log2 of the width of each cell in pixels.
> - *			for (2^3, 2^4, 2^5, 2^6, 2^7), values [3, 7].
> + *			For AWB, the range is (2^3, 2^4, 2^5, 2^6),
> + *			values [3, 6].

I would have written

 *			For AWB, the range is [3, 6].

(and similarly below) as I don't think enumerating all the power of two
values brings any additional clarity. This predates this patch though,
so with or without that change,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + *			For AF/AE, the range is (2^3, 2^4, 2^5, 2^6, 2^7),
> + *			values [3, 7].
>   * @block_height_log2:	Log2 of the height of each cell in pixels.
> - *			for (2^3, 2^4, 2^5, 2^6, 2^7), values [3, 7].
> + *			For AWB, the range is (2^3, 2^4, 2^5, 2^6),
> + *			values [3, 6].
> + *			For AF/AE, the range is (2^3, 2^4, 2^5, 2^6, 2^7),
> + *			values [3, 7].
>   * @height_per_slice:	The number of blocks in vertical axis per slice.
>   *			Default 2.
>   * @x_start: X value of top left corner of Region of Interest(ROI).

-- 
Regards,

Laurent Pinchart
