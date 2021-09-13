Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9834087A7
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 10:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238315AbhIMI6Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 04:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238275AbhIMI6Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 04:58:24 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39A1C061574
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 01:57:08 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PhlwmXFQfpQdWPhlxm27Yg; Mon, 13 Sep 2021 10:57:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631523426; bh=e1q0iZ/zGLx8pSviNJW/K58+CMoCtTP9qUvC4xQHudM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gv4smLiPjAxIaqQykrLcM4uf0AVhsJDpJtionI28NRE0771+SZzt01XYvJUzD0RmR
         k44C/7xHnkeJnzshw7UteNcahA1bCr3MEUb9bJAZfhaH1Yedr/HrCF7JWEvI28Hmlo
         CjgJuyMcGWNnJxXbITZ1tdFAug0PUwlSEewVRP4HC+uaQjtEftL8w/eaXbP0NjZQc5
         eHhkw5O8shbrNGvLCYSe6iIEXlf/Ssp+Bd8D/UdVKsxVXbXy2vv1JlDSmaNuHJx41E
         c5aFsbC3uxUfNxzSqqw5ro+ZDcrQ8DkHEo9BeW2OIcEUz0+2mH/d04C4qwTXp2c0X3
         YN9fsvFpmA8/w==
Subject: Re: [PATCH v3 2/2] media: video-i2c: append register data on
 MLX90640's frame
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Seongyong Park <euphoriccatface@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210608152451.14730-1-euphoriccatface@gmail.com>
 <20210608152451.14730-3-euphoriccatface@gmail.com>
 <20210805145504.GC3@valkosipuli.retiisi.eu>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4f18b09b-993b-6fc7-6ee2-59e2b738d21f@xs4all.nl>
Date:   Mon, 13 Sep 2021 10:57:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210805145504.GC3@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF5ToQ+pMLtKR7mUvPAd7fXw7wALZ5zzGQEMU+5bY2ebHSMg92iovZg+vTXSQ9vlIuHaFwcP1zd5hAiOd/cbsLs1z8WnCqdUv7h9WjAvFhxwmu1JIC4f
 TL4dC53vgVtuzqPK17XFMkx9bD5YiDDhEODUpbr+ru12/rd87quhHuxZopm96ZqqyrShSV99tiU/r7rBwucSX3Ay+Jo5Lle/w7kfulQQ0YoBfmM8kn7/VlJ7
 /DP4woNiqcQRxms6TZC2oa2N7VgxperCbh5OpEMdXOH/8+kxCkx1tWeiOhgqZfLG9kvmB/XM4EpZrSWcwAdmVWjRyEewh7obF6zuw/svKmZV9O9y+L1YKuZx
 Qx4pr50AwlxdqNX51kan2b19LVbE1TUD/p4tNkmRfOzzgwWiTfI5DFhMKHyaVvE/psZXY0GW9K6OGdWFl2VUyRXsG/mvXw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/08/2021 16:55, Sakari Ailus wrote:
> Hi Seongyong,
> 
> On Wed, Jun 09, 2021 at 12:24:51AM +0900, Seongyong Park wrote:
>> On MLX90640, Each measurement step updates half of the pixels in the frame
>> (every other pixel in default "chess mode", and every other row
>> in "interleave mode"), while additional coefficient data (25th & 26th row)
>> updates every step. The compensational coefficient data only corresponds
>> with the pixels updated in the same step.
>>
>> Only way to know which "subpage" was updated on the last step is to read
>> "status register" on address 0x8000. Without this data,
>> compensation calculation may be able to detect which sets of pixels have
>> been updated, but it will have to make assumptions when frame skip happens,
>> and there is no way to do it correctly when the host simply cannot
>> keep up with refresh rate.
>>
>> Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
>> ---
>>  drivers/media/i2c/video-i2c.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
>> index 64ba96329..2b50a76f3 100644
>> --- a/drivers/media/i2c/video-i2c.c
>> +++ b/drivers/media/i2c/video-i2c.c
>> @@ -74,7 +74,8 @@ static const struct v4l2_fmtdesc mlx90640_format = {
>>  
>>  static const struct v4l2_frmsize_discrete mlx90640_size = {
>>  	.width = 32,
>> -	.height = 26, /* 24 lines of pixel data + 2 lines of processing data */
>> +	.height = 27,
>> +	/* 24 lines of pixel data + 2 lines of processing data + 1 line of registers */
> 
> This device should actually use a multi-plane format as the data isn't
> Y16_BE as the driver declares. That said, the format would be device
> specific and using one would require specific support from applications.
> 
> I might just declare it produces fewer lines while an application that
> knows the device could access the extra data close to the end of the
> buffer.
> 
> An alternative would be to use that multi-plane format and keep driver
> support for the plain Y16_BE as well. But I think this would be a bit
> heavy-weight solution.
> 
> I wonder what Hans thinks.

I think it is a bit overkill as well.

Wouldn't it be better to just add a new pixel format for this device, and
document it properly? I would keep the existing Y16_BE as it was to avoid
breaking userspace (since adding the extra line breaks the ABI IMHO), and
add a new format that properly documents how to parse the contents of the
buffer, which includes the last line with the status register.

Sorry for the late reply, it looks like an attempt was made to CC me, but
the email address was wrong, so I never received it. I only noticed this
when I started to review this patch.

Regards,

	Hans

> 
>>  };
>>  
>>  static const struct regmap_config amg88xx_regmap_config = {
>> @@ -168,8 +169,12 @@ static int amg88xx_xfer(struct video_i2c_data *data, char *buf)
>>  
>>  static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
>>  {
>> -	return regmap_bulk_read(data->regmap, 0x400, buf,
>> -				data->chip->buffer_size);
>> +	int ret = regmap_bulk_read(data->regmap, 0x400, buf,
>> +				   data->chip->buffer_size - 64);
>> +	if (ret)
>> +		return ret;
>> +	return regmap_bulk_read(data->regmap, 0x8000, buf + (data->chip->buffer_size - 64),
> 
> Please wrap before 80 (unless there's a reason to do otherwise).
> 
>> +				64);
>>  }
>>  
> 

