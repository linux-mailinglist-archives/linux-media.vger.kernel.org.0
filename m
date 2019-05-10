Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB46A19F1E
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 16:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbfEJO0U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 10:26:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38382 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727921AbfEJO0U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 10:26:20 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 467412DF;
        Fri, 10 May 2019 16:26:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557498379;
        bh=EGT8HldCL4VJIZ2o5HGuQtE4cFuJAgNtqmQ2I3BiooU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gr+O1R9gqELw5lZcQTjsn6KLTMT/d2y+p3iXoPj9wNS7zkUOw+CgEdJQOhILqzs86
         vrCOcfNB0ImoFG4COgVpJ9heouwLAqFdy2xT7oWkUk/qBAn1oKpivRqZmLbDt/0Rz2
         JQ2XYeifBOF1v7mId0VMueJpyCizTuDMBrSl1h04=
Date:   Fri, 10 May 2019 17:26:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Edgar Thier <info@edgarthier.net>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Patch v2] uvcvideo: Add simple packed bayer 12-bit formats
Message-ID: <20190510142603.GD4972@pendragon.ideasonboard.com>
References: <b9dc4c99-5aaa-db43-f6cb-f829da9fd654@edgarthier.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b9dc4c99-5aaa-db43-f6cb-f829da9fd654@edgarthier.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Edgar,

Thank you for the patch.

On Thu, Jan 10, 2019 at 08:55:31AM +0100, Edgar Thier wrote:
> 
> These formats are compressed 12-bit raw bayer formats with four different
> pixel orders. They are similar to 10-bit bayer formats 'IPU3'.

If you want to compare them to other formats, I think they're more
similar to the SBGGR12P family.

> Signed-off-by: Edgar Thier <info@edgarthier.net>
> ---
> drivers/media/usb/uvc/uvcvideo.h | 14 +++++++++++++-
> 1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index e5f5d84f1d1d..3cf4a6d17dc1 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -108,7 +108,19 @@
> #define UVC_GUID_FORMAT_RGGB \
> { 'R',  'G',  'G',  'B', 0x00, 0x00, 0x10, 0x00, \
> 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> -#define UVC_GUID_FORMAT_BG16 \
> +#define UVC_GUID_FORMAT_BG12SP \
> +	{ 'B',  'G',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_GB12SP \
> +	{ 'G',  'B',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_RG12SP \
> +	{ 'R',  'G',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_GR12SP \
> +	{ 'G',  'R',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_BG16                         \

No need to move the \ on this line.

> { 'B',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
> 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> #define UVC_GUID_FORMAT_GB16 \

This has been corrupted by your mailer as well :-(


-- 
Regards,

Laurent Pinchart
