Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7848B3E1756
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 16:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236035AbhHEOzf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 10:55:35 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:38784 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhHEOze (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 10:55:34 -0400
Received: from hillosipuli.retiisi.eu (dbd1vftgng281pd4yskly-3.rev.dnainternet.fi [IPv6:2001:14ba:8eb:1240:ab2d:b956:f00:7a12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 06A371B000A5;
        Thu,  5 Aug 2021 17:55:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1628175317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uQ09uRRxaHTUhsu1a7IMRCmI7VEGoHJFhAZrItLWqto=;
        b=OOgyuncchr7xF1eSWOsVZrA42fWqd9W4X0BTvsGPatUxS75De6O+Vu9PN2lVpl/dOpf370
        j2Q/acFfXU0icEDRHTCguxtK7DIlqCef+XHmFcDcAT9ryQiQPzc/hhmbxhLu3gIG+V4YPe
        uXkP84lamPhBHVsx0kCpBZV2fNY8mef135q5r+m61Ce9fnGyiLqjya49Jl5q4/fMbJW+xg
        us+jp9VuA1uXTg5S/K4nLqfz0o9Bxpgh+rWxk2A7mrg5CazJZrdxZn6zdN1BXyOARiAdbN
        aTpfCeCkXpV9t+SHtFHkTk7e2+QgF0AwlCxkdHlIHYAQ/LgaXZwdl3EQpLmCLw==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5202D634C89;
        Thu,  5 Aug 2021 17:53:58 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1mBem1-00032R-9Z; Thu, 05 Aug 2021 17:55:05 +0300
Date:   Thu, 5 Aug 2021 17:55:05 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Seongyong Park <euphoriccatface@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        hverkuil@valkosipuli.retiisi.eu
Subject: Re: [PATCH v3 2/2] media: video-i2c: append register data on
 MLX90640's frame
Message-ID: <20210805145504.GC3@valkosipuli.retiisi.eu>
References: <20210608152451.14730-1-euphoriccatface@gmail.com>
 <20210608152451.14730-3-euphoriccatface@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608152451.14730-3-euphoriccatface@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1628175317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uQ09uRRxaHTUhsu1a7IMRCmI7VEGoHJFhAZrItLWqto=;
        b=d6pUE4X/54b5INHUJS+amPmYu5XshUpiNBGbQ0ZRak9672q+cYB1ydAwNckC4I1lmo/J8b
        yYfzHLK6/bfGs95cFAQNJUb8T1ZyQWRi6quLHJkxQPZssaXdRARpzsEt8BY2RXNly285Ez
        +XeWNS4z4xuYYWPehVqw6Yqo+Izs1k20pVnPSbGSBbgKWRa9Ohp/9a/5UPidjU0V5Awnw4
        OANPh61INLUDJzkxxqttL8PHxFdKAnmUFfuBWcyfynjhTYmqFr279tF/rEOc9sHyBDeRAL
        bqMwvnXdsn18uXavO5uDvttWCOf4mzOeXwE6ngTNl8N7gmZLGVYPSEVfCIwUOg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1628175317; a=rsa-sha256;
        cv=none;
        b=BqccXBisf/7jk6FPFOmZg2UbUv1NJ2LxXMUaDtCYw5CACn9uOa+iiShyv9Fd91VdKvmJ44
        MKqGJolea3WTihxWST4L0U8sd/22QZsZrg1aej6mkvq8wK+bV1VBT+iV42zvIKadpfqNwN
        abHKZt1We+9Xlo4hmLb/HLyHmX1Rtx6IcQ/DhZt+8lgAwfUDsrFOsru+IbySdVSrUVKUYx
        N/jrvHeeA4Tn826Kqj9wsYqBWAkD4ch7XauMYHHGndZingngMx6qAGspwwnYU1hH8Z36l7
        f0quZ506Yptu84V/WRrIZ4H5/CMavBmPbNtfjiQZkuBRfJGg7sPnBWDhYYJGPA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Seongyong,

On Wed, Jun 09, 2021 at 12:24:51AM +0900, Seongyong Park wrote:
> On MLX90640, Each measurement step updates half of the pixels in the frame
> (every other pixel in default "chess mode", and every other row
> in "interleave mode"), while additional coefficient data (25th & 26th row)
> updates every step. The compensational coefficient data only corresponds
> with the pixels updated in the same step.
> 
> Only way to know which "subpage" was updated on the last step is to read
> "status register" on address 0x8000. Without this data,
> compensation calculation may be able to detect which sets of pixels have
> been updated, but it will have to make assumptions when frame skip happens,
> and there is no way to do it correctly when the host simply cannot
> keep up with refresh rate.
> 
> Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
> ---
>  drivers/media/i2c/video-i2c.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 64ba96329..2b50a76f3 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -74,7 +74,8 @@ static const struct v4l2_fmtdesc mlx90640_format = {
>  
>  static const struct v4l2_frmsize_discrete mlx90640_size = {
>  	.width = 32,
> -	.height = 26, /* 24 lines of pixel data + 2 lines of processing data */
> +	.height = 27,
> +	/* 24 lines of pixel data + 2 lines of processing data + 1 line of registers */

This device should actually use a multi-plane format as the data isn't
Y16_BE as the driver declares. That said, the format would be device
specific and using one would require specific support from applications.

I might just declare it produces fewer lines while an application that
knows the device could access the extra data close to the end of the
buffer.

An alternative would be to use that multi-plane format and keep driver
support for the plain Y16_BE as well. But I think this would be a bit
heavy-weight solution.

I wonder what Hans thinks.

>  };
>  
>  static const struct regmap_config amg88xx_regmap_config = {
> @@ -168,8 +169,12 @@ static int amg88xx_xfer(struct video_i2c_data *data, char *buf)
>  
>  static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
>  {
> -	return regmap_bulk_read(data->regmap, 0x400, buf,
> -				data->chip->buffer_size);
> +	int ret = regmap_bulk_read(data->regmap, 0x400, buf,
> +				   data->chip->buffer_size - 64);
> +	if (ret)
> +		return ret;
> +	return regmap_bulk_read(data->regmap, 0x8000, buf + (data->chip->buffer_size - 64),

Please wrap before 80 (unless there's a reason to do otherwise).

> +				64);
>  }
>  

-- 
Kind regards,

Sakari Ailus
