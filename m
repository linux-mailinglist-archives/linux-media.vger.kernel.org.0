Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E5C34B5B5
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 10:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhC0Jou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 05:44:50 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43785 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230415AbhC0Jon (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 05:44:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Q5UjlwhA0MxedQ5UnlVhXw; Sat, 27 Mar 2021 10:44:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616838281; bh=Kf3Q422iCX47gH7MjHXvEZ1BGJA778YLIqwMrByWEBI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mYopXwAlJL+t+A0RrTb6KILb3l/NIVTxefkdosee982F4tf1zMknWE3yFtCs/r4TX
         gNRZTbnZJcea2pj8e+4/Gy8cJdt94Nqf3S7yCrxDaTi0NMwGBJlUnuf5D4rVNYWfsp
         04IKvhTjqjehOY21D2uDiioDPIqKHYQBfqHQ1nKy6Xd0U6DY9c5VeR+qrBaJ7wjocL
         Br4rMxAYqIrVlgpVn3VMi/s+w0k52zVtWNyt6TcyuzQDoQu7xUPgRSY0QcYZFMgk3a
         v857qoMLTeiCU0jmXDHEnB+49CshYWTBw4Sfdly4Koinm5jK+DUexStq8xpx5ifAJf
         8Q4jcgpp2kZew==
Subject: Re: [PATCH v2] media: sq905.c: fix uninitialized variable
To:     Alaa Emad <alaaemadhossney.ae@gmail.com>
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller@googlegroups.com,
        syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
References: <20210326210252.129595-1-alaaemadhossney.ae@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6e78ccd3-8bdd-8a2e-ef4f-c9dded65caed@xs4all.nl>
Date:   Sat, 27 Mar 2021 10:44:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326210252.129595-1-alaaemadhossney.ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLILiw9hCS5iAmHXMKm1xB8QqfAuJrVoDb04+zz3F5yhW8UQc2vLNZfquHQ/kHwmmLvA1RxyCf+g5TqI7pFRTbeIqOeq0DRf8jk/jG72urP65ieUbZmQ
 GMUwyLrRLxmQinCgUek5seJ6Tbxei4UZxyS79zHR1xn2gRyNw+rD7N7oq2jksT64U9gH3tjpDZlR5Lzu+O7WapEBAGgYEvjik33i/Ft67rXD5JM7AAUPKmwI
 ACcj5uqbOERXIJhPetWGT967JqSTaxEcJVDp0b2uvmxm/59UL8jLGRrf+B6/6pe2sBRafG0K23A11/duJFSR32ZA9j64y9IGrx5lLdk1n/Ckut0ujTGrx+sQ
 ZOv0zLwH4WNtwQpNurXULAnXQOxfTGjOmEai6f4fMS4iGPSUNKkN/AXB15xyDXkfBJF/qjCfb/OEnNTfj4L4Z/5b1z/kevczReIuC/H0zBI+4dDF/uQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alaa,

FYI: this patch has already been applied to the media_tree master git repo:

https://patchwork.linuxtv.org/project/linux-media/patch/2c46832a-99a8-73bf-ec85-085052f8b4db@xs4all.nl/

That's good enough for this issue so I am marking this patch as Obsolete in
our patchwork.

On 26/03/2021 22:02, Alaa Emad wrote:
> Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
> Signed-off-by: Alaa Emad <alaaemadhossney.ae@gmail.com>
> 
> ---
> Changes in v2:
>   - Fix the error occured because of pervious fix.
> ---
>  drivers/media/usb/gspca/sq905.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/gspca/sq905.c b/drivers/media/usb/gspca/sq905.c
> index 97799cfb832e..57206dd2e1a0 100644
> --- a/drivers/media/usb/gspca/sq905.c
> +++ b/drivers/media/usb/gspca/sq905.c
> @@ -157,8 +157,8 @@ static int sq905_ack_frame(struct gspca_dev *gspca_dev)
>  static int
>  sq905_read_data(struct gspca_dev *gspca_dev, u8 *data, int size, int need_lock)
>  {
> -	int ret;
> -	int act_len;
> +	int ret;
> +	int act_len;
>  
>  	gspca_dev->usb_buf[0] = '\0';
>  	if (need_lock)
> @@ -180,8 +180,8 @@ sq905_read_data(struct gspca_dev *gspca_dev, u8 *data, int size, int need_lock)
>  			   data, size, &act_len, SQ905_DATA_TIMEOUT);
>  
>  	/* successful, it returns 0, otherwise  negative */
> -	if (ret < 0 || act_len != size) {
> -		pr_err("bulk read fail (%d) len %d/%d\n", ret, act_len, size);
> +	if (ret < 0 || act_len != size) {
> +	       pr_err("bulk read fail (%d) len %d/%d\n", ret, ret < 0 ? -1 : act_len, size);

General note: it looks like you are replacing tab characters with spaces.
Make sure you configure your editor not to do that.

Regards,

	Hans

>  		return -EIO;
>  	}
>  	return 0;
> 

