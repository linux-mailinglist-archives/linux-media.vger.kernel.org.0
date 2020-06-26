Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED2120AA80
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 04:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbgFZCwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 22:52:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47574 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728092AbgFZCwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 22:52:14 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54C3A72E;
        Fri, 26 Jun 2020 04:52:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593139932;
        bh=pLPiGK32i9S/WgqxebyEuTDQ6+h/C1q6kiKNEQ7LQxk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wHCNSxsdtrCIIfoR+T/5jxEzHDQ7sG/hOJNbP9iS2M9Zl2EuTqBws4dVrPZFcsJkw
         bDWMliIM8NcYVXXHj2d1i1HA3NeJyd0nBROww1i1+JDa2QKxswwFYEAGdPyddH6YEg
         KH6Os7VE7SLZAGW9QUTGGocbnMgzfAVPlY/NfHtI=
Date:   Fri, 26 Jun 2020 05:52:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     B K Karthik <bkkarthik@pesu.pes.edu>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fixing ERROR: Macros with complex values must be
 enclosed within parentheses.
Message-ID: <20200626025209.GA5865@pendragon.ideasonboard.com>
References: <20200626021723.len2cts3ffq4wimq@pesu-pes-edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200626021723.len2cts3ffq4wimq@pesu-pes-edu>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Karthik,

Thank you for the patch.

On Thu, Jun 25, 2020 at 10:17:23PM -0400, B K Karthik wrote:
> soc_camera.c:
> 
> fixing ERROR: Macros with complex values must be enclused within parentheses.
> 
> Signed-off-by: B K Karthik <karthik.bk2000@live.com>
> ---
>  drivers/staging/media/soc_camera/soc_camera.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/soc_camera/soc_camera.c b/drivers/staging/media/soc_camera/soc_camera.c
> index 39f513f69b89..f609ecf6691c 100644
> --- a/drivers/staging/media/soc_camera/soc_camera.c
> +++ b/drivers/staging/media/soc_camera/soc_camera.c
> @@ -238,8 +238,7 @@ unsigned long soc_camera_apply_board_flags(struct soc_camera_subdev_desc *ssdd,
>  }
>  EXPORT_SYMBOL(soc_camera_apply_board_flags);
>  
> -#define pixfmtstr(x) (x) & 0xff, ((x) >> 8) & 0xff, ((x) >> 16) & 0xff, \
> -	((x) >> 24) & 0xff
> +#define pixfmtstr(x) ((x) & 0xff, ((x) >> 8) & 0xff, ((x) >> 16) & 0xff, ((x) >> 24) & 0xff)

This won't work. Try to compile this driver with CONFIG_DYNAMIC_DEBUG
and the compiler will tell you why.

Regardless, drivers/staging/media/soc_camera/soc_camera.c is in staging
because it will be removed from the kernel, cleanups for this file won't
be accepted.

>  static int soc_camera_try_fmt(struct soc_camera_device *icd,
>  			      struct v4l2_format *f)

-- 
Regards,

Laurent Pinchart
