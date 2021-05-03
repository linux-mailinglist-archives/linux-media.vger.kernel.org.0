Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FD1371358
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 12:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbhECKI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 06:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233095AbhECKI2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 May 2021 06:08:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89ADFC06174A;
        Mon,  3 May 2021 03:07:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C16156B;
        Mon,  3 May 2021 12:07:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620036452;
        bh=oeq5yAnxVpDTezsrEE2MxgP7UgCP5bXHGgJvz3hmt18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nkjCT3vAyk8GrJ06IjBWqx8VvXc8xoiowL22ALe7x/NgiCR6JhkRCTwbekGdRqbUO
         JvbqwS3TJwmT+CwVC84v/8YHH2nslUQwXykJlTJYA1S/W4kH9jLdgt50VQflRwOiZB
         npGK8ZJWzr8RF2ggzyeNiIZkHtWf6wvCB9zfGjCY=
Date:   Mon, 3 May 2021 13:07:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Nigel Christian <nigel.l.christian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Remove unused variable
Message-ID: <YI/LYY4LGmGEGyo1@pendragon.ideasonboard.com>
References: <YIyCJoEwdqgqkxYN@fedora>
 <20210503092924.GO1981@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210503092924.GO1981@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 03, 2021 at 12:29:24PM +0300, Dan Carpenter wrote:
> On Fri, Apr 30, 2021 at 06:18:14PM -0400, Nigel Christian wrote:
> > The variable buflen is being assigned a value that is never read,
> > which can be removed.
> > 
> > Addresses-Coverity: ("Unused value")
> > Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 9a791d8ef200..370b086c6e22 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -768,7 +768,6 @@ static int uvc_parse_format(struct uvc_device *dev,
> >  		format->xfer_func = uvc_xfer_func(buffer[4]);
> >  		format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
> >  
> > -		buflen -= buffer[0];
> >  		buffer += buffer[0];
> >  	}
> 
> This is a situation where I think that the unused assignment helps
> readability because it shows how buflen and buffer are connected.

And removing it may cause issues later if we end up adding more code
below (unlikely in practice though). I'd rather keep this line.

-- 
Regards,

Laurent Pinchart
