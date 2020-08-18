Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35958249189
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 01:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgHRXrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 19:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbgHRXrj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 19:47:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECD8C061389;
        Tue, 18 Aug 2020 16:47:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA2E129E;
        Wed, 19 Aug 2020 01:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597794457;
        bh=hxztss17bLb6KhNdLdaqC7hTZ/NDwi0IYF0CKHOOvxk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E4DYtiikJJBFhq38FSZqnQVVTJy/0ANm6inqqsOYwZl0TDnuspCw+525H53Gtw8iZ
         u/ZNVHJNlH5RZRsiuBwNcqZlueRkEs1kNesKmBnYZtDjRyCvzHvmnBPFVor3dCgw8C
         U/i/0JpQr4osGHeBYimKNNmSIogs+F3nX9hDVrec=
Date:   Wed, 19 Aug 2020 02:47:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] media: usb: uvc: no need to check return value of
 debugfs_create functions
Message-ID: <20200818234719.GD2360@pendragon.ideasonboard.com>
References: <20200818133608.462514-1-gregkh@linuxfoundation.org>
 <20200818133608.462514-7-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200818133608.462514-7-gregkh@linuxfoundation.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

Thank you for the patch.

On Tue, Aug 18, 2020 at 03:36:08PM +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.

Is there no value in warning the user that something went wrong ? Silent
failures are harder to debug.

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/media/usb/uvc/uvc_debugfs.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_debugfs.c b/drivers/media/usb/uvc/uvc_debugfs.c
> index 2b8af4b54117..1a1258d4ffca 100644
> --- a/drivers/media/usb/uvc/uvc_debugfs.c
> +++ b/drivers/media/usb/uvc/uvc_debugfs.c
> @@ -73,7 +73,6 @@ static struct dentry *uvc_debugfs_root_dir;
>  void uvc_debugfs_init_stream(struct uvc_streaming *stream)
>  {
>  	struct usb_device *udev = stream->dev->udev;
> -	struct dentry *dent;
>  	char dir_name[33];
>  
>  	if (uvc_debugfs_root_dir == NULL)
> @@ -82,22 +81,11 @@ void uvc_debugfs_init_stream(struct uvc_streaming *stream)
>  	snprintf(dir_name, sizeof(dir_name), "%u-%u-%u", udev->bus->busnum,
>  		 udev->devnum, stream->intfnum);
>  
> -	dent = debugfs_create_dir(dir_name, uvc_debugfs_root_dir);
> -	if (IS_ERR_OR_NULL(dent)) {
> -		uvc_printk(KERN_INFO, "Unable to create debugfs %s "
> -			   "directory.\n", dir_name);
> -		return;
> -	}
> -
> -	stream->debugfs_dir = dent;
> +	stream->debugfs_dir = debugfs_create_dir(dir_name,
> +						 uvc_debugfs_root_dir);
>  
> -	dent = debugfs_create_file("stats", 0444, stream->debugfs_dir,
> -				   stream, &uvc_debugfs_stats_fops);
> -	if (IS_ERR_OR_NULL(dent)) {
> -		uvc_printk(KERN_INFO, "Unable to create debugfs stats file.\n");
> -		uvc_debugfs_cleanup_stream(stream);
> -		return;
> -	}
> +	debugfs_create_file("stats", 0444, stream->debugfs_dir, stream,
> +			    &uvc_debugfs_stats_fops);
>  }
>  
>  void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream)

-- 
Regards,

Laurent Pinchart
