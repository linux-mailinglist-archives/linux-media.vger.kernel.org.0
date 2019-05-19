Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 844D5227AB
	for <lists+linux-media@lfdr.de>; Sun, 19 May 2019 19:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfESR0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 May 2019 13:26:50 -0400
Received: from gofer.mess.org ([88.97.38.141]:35459 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726607AbfESR0u (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 May 2019 13:26:50 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 13CF460ADD; Sun, 19 May 2019 11:17:33 +0100 (BST)
Date:   Sun, 19 May 2019 11:17:33 +0100
From:   Sean Young <sean@mess.org>
To:     Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens@rwth-aachen.de>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Antti Palosaari <crope@iki.fi>
Subject: Re: [PATCH 1/3] media: dvb-usb-v2: Report error on all error paths
Message-ID: <20190519101733.qaef5ricdqnmlf73@gofer.mess.org>
References: <20190412011300.5468-1-stefan.bruens@rwth-aachen.de>
 <f58ff4ca-9b9e-44af-a617-cdaa9e71f15f@rwthex-w2-a.rwth-ad.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f58ff4ca-9b9e-44af-a617-cdaa9e71f15f@rwthex-w2-a.rwth-ad.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

On Fri, Apr 12, 2019 at 03:12:58AM +0200, Stefan Brüns wrote:
> actual_length != wlen is the only error path which does not generate an
> error message. Adding an error message here allows to report a more
> specific error and to remove the error reporting from the call sites.
> 
> Also clean up the error paths - in case of an error, the remaining
> code is skipped, and ret is returned. Skip setting ret and return
> immediately (no cleanup necessary).

There is no Signed-off-by: line:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html?highlight=signed%20off#sign-your-work-the-developer-s-certificate-of-origin

This is needed for merging. 

Sean

> ---
>  drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c
> index 5bafeb6486be..5b32d159f968 100644
> --- a/drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c
> +++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c
> @@ -37,14 +37,19 @@ static int dvb_usb_v2_generic_io(struct dvb_usb_device *d,
>  	ret = usb_bulk_msg(d->udev, usb_sndbulkpipe(d->udev,
>  			d->props->generic_bulk_ctrl_endpoint), wbuf, wlen,
>  			&actual_length, 2000);
> -	if (ret < 0)
> +	if (ret) {
>  		dev_err(&d->udev->dev, "%s: usb_bulk_msg() failed=%d\n",
>  				KBUILD_MODNAME, ret);
> -	else
> -		ret = actual_length != wlen ? -EIO : 0;
> +		return ret;
> +	}
> +	if (actual_length != wlen) {
> +		dev_err(&d->udev->dev, "%s: usb_bulk_msg() write length=%d, actual=%d\n",
> +				KBUILD_MODNAME, wlen, actual_length);
> +		return -EIO;
> +	}
>  
> -	/* an answer is expected, and no error before */
> -	if (!ret && rbuf && rlen) {
> +	/* an answer is expected */
> +	if (rbuf && rlen) {
>  		if (d->props->generic_bulk_ctrl_delay)
>  			usleep_range(d->props->generic_bulk_ctrl_delay,
>  					d->props->generic_bulk_ctrl_delay
> -- 
> 2.21.0
