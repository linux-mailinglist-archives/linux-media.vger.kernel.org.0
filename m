Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8801789F26
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 15:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbfHLNFr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 09:05:47 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:59721 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726458AbfHLNFr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 09:05:47 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id xA17hR0ubur8TxA1BhiSSI; Mon, 12 Aug 2019 15:05:46 +0200
Subject: Re: [PATCH] media: video-i2c: add mlx90640 subpage data to output
To:     Matt Ranostay <matt.ranostay@konsulko.com>,
        linux-media@vger.kernel.org
References: <20190811071015.3303-1-matt.ranostay@konsulko.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0630c968-1d47-a2c7-cc47-964a08085f13@xs4all.nl>
Date:   Mon, 12 Aug 2019 15:05:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190811071015.3303-1-matt.ranostay@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMKy/u5OkSKqWUJYONsWtGaXzJtlqxyH+N9oybYx1biU/sxEXyF/gDroV8fz1a+b3nD9JfQTuj0dZXQhm7SYs54XcEF7WuETtTZLUEzvqmeXYs4gekt/
 E0aNgKdlljgekoBS7ofAHvBtwpPV0CRAO++47sLNBBFmcVg2m+bL62SKcvjMPYA+BdSJXF4v3tyyWoWGlZ1aXLkUmYki2v5yNBrLZQaDZaUidETB1vmqHe7/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Matt,

On 8/11/19 9:10 AM, Matt Ranostay wrote:
> Add current subpage data via the status register to the video
> frame in the last word of data, which seems to be unused
> undocumented reserved data.

I don't really understand from this description what is going on
here.

mlx90640_xfer() reads the buffer data from the i2c device, but
that data is split over two different addresses? Or does
0x8000 contain something else with a different meaning compared
to what is read from 0x400?

> 
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
>  drivers/media/i2c/video-i2c.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 078141712c88..8bc7b228ba40 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -168,8 +168,16 @@ static int amg88xx_xfer(struct video_i2c_data *data, char *buf)
>  
>  static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
>  {
> -	return regmap_bulk_read(data->regmap, 0x400, buf,
> -				data->chip->buffer_size);
> +	int ret = regmap_bulk_read(data->regmap, 0x400, buf,
> +				   data->chip->buffer_size);

Shouldn't this be data->chip->buffer_size - size, since the last
'size' bytes will be overwritten anyway?

> +	int size = data->chip->bpp / 8;
> +
> +	if (ret)
> +		return ret;
> +
> +	/* read status register, which contains subpage that is read */
> +	return regmap_bulk_read(data->regmap, 0x8000,
> +				&buf[data->chip->buffer_size - size], size);
>  }
>  
>  static int amg88xx_setup(struct video_i2c_data *data)
> 

Regards,

	Hans
