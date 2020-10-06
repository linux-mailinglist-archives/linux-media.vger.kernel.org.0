Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61B63284BD5
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 14:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgJFMma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 08:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgJFMm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 08:42:29 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95ACBC061755;
        Tue,  6 Oct 2020 05:42:29 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DD3A0634C87;
        Tue,  6 Oct 2020 15:41:48 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kPmHs-0001eV-OW; Tue, 06 Oct 2020 15:41:48 +0300
Date:   Tue, 6 Oct 2020 15:41:48 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     trix@redhat.com
Cc:     corbet@lwn.net, mchehab@kernel.org, natechancellor@gmail.com,
        ndesaulniers@google.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ov7670: check status of ov7670_read
Message-ID: <20201006124148.GC5682@valkosipuli.retiisi.org.uk>
References: <20200828145518.26324-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828145518.26324-1-trix@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tom,

On Fri, Aug 28, 2020 at 07:55:18AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis flags this representative problem
> 
> drivers/media/i2c/ov7670.c:1463:9: warning: Assigned
>   value is garbage or undefined
>         *value = gain;
>                ^ ~~~~
> 
> gain is set by a successful call to ov7670_read()
> 
> So check that ov7670_read() is successful.
> 
> The remaining static analysis problems are false positives.
> There appears to be a limitation with checking the
> aggregated returns.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/media/i2c/ov7670.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
> index b42b289faaef..001d4b09db72 100644
> --- a/drivers/media/i2c/ov7670.c
> +++ b/drivers/media/i2c/ov7670.c
> @@ -929,6 +929,8 @@ static int ov7670_set_hw(struct v4l2_subdev *sd, int hstart, int hstop,
>  	ret =  ov7670_write(sd, REG_HSTART, (hstart >> 3) & 0xff);
>  	ret += ov7670_write(sd, REG_HSTOP, (hstop >> 3) & 0xff);
>  	ret += ov7670_read(sd, REG_HREF, &v);
> +	if (ret)
> +		return ret;

Thanks for the patch.

While the patch fixes a bug, could you also fix adding the return values?
These are valid error codes to begin with, but it makes no sense to add
them together.

>  	v = (v & 0xc0) | ((hstop & 0x7) << 3) | (hstart & 0x7);
>  	msleep(10);
>  	ret += ov7670_write(sd, REG_HREF, v);
> @@ -938,6 +940,8 @@ static int ov7670_set_hw(struct v4l2_subdev *sd, int hstart, int hstop,
>  	ret += ov7670_write(sd, REG_VSTART, (vstart >> 2) & 0xff);
>  	ret += ov7670_write(sd, REG_VSTOP, (vstop >> 2) & 0xff);
>  	ret += ov7670_read(sd, REG_VREF, &v);
> +	if (ret)
> +		return ret;
>  	v = (v & 0xf0) | ((vstop & 0x3) << 2) | (vstart & 0x3);
>  	msleep(10);
>  	ret += ov7670_write(sd, REG_VREF, v);
> @@ -1460,6 +1464,8 @@ static int ov7670_g_gain(struct v4l2_subdev *sd, __s32 *value)
>  	unsigned char gain;
>  
>  	ret = ov7670_read(sd, REG_GAIN, &gain);
> +	if (ret)
> +		return ret;
>  	*value = gain;
>  	return ret;
>  }
> @@ -1470,11 +1476,14 @@ static int ov7670_s_gain(struct v4l2_subdev *sd, int value)
>  	unsigned char com8;
>  
>  	ret = ov7670_write(sd, REG_GAIN, value & 0xff);
> +	if (ret)
> +		return ret;
>  	/* Have to turn off AGC as well */
> -	if (ret == 0) {
> -		ret = ov7670_read(sd, REG_COM8, &com8);
> -		ret = ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
> -	}
> +	ret = ov7670_read(sd, REG_COM8, &com8);
> +	if (ret)
> +		return ret;
> +	ret = ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
> +
>  	return ret;
>  }
>  

-- 
Regards,

Sakari Ailus
