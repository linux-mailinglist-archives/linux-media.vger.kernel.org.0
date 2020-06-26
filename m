Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB54920ACBB
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 09:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgFZHEu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 03:04:50 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42549 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725801AbgFZHEu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 03:04:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id oiPkjZs2zxmkVoiPnjgcOX; Fri, 26 Jun 2020 09:04:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593155088; bh=ceiS8X0a/T8n2G9HxSQDEohcZdRIaL0oajOjS5qQDmE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kLEN7hSsUo47oYT2bPdkUyNB4miZEUOG5lWvIw+FufiSXmpS6tgfHk1p27tw/YVBD
         zFzTDM4NOjDVun+K0BMx4LkowhBfZrJDYPIq9fh6PY2mRjoVVl1aGTSBsI13es9GYq
         tYHJKRpVQQV+bzkiKNR2yTj3GLasxCEpKqERN1/khcnUlNkevdiUnbvcgzUf0yfCHC
         zv/j4HREjaoY+Ud+uKuPkp4OdBFE8nm9szCWtWPgJ9qR3ocFuNsw6dZNh3ArIYYmzq
         JD0nvdgZ7Kz7GpRA9tzmjmxvVNDrl7Z1Jr2p8kAEdEWrcW8U8r93MxKmOaE2O1a71K
         OWTDHU2uwXMHg==
Subject: Re: [PATCH 1/1] staging: media: soc_camera: Adding parentheses to
 macro defination at line 241, Clearing alignment issues at lines 410 and
 1270, fixing return values at EPOLLERR
To:     B K Karthik <bkkarthik@pesu.pes.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20200625153516.fibpfsodnogrimlh@pesu-pes-edu>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <22595721-02ef-5a18-a8d1-4ff13e475556@xs4all.nl>
Date:   Fri, 26 Jun 2020 09:04:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625153516.fibpfsodnogrimlh@pesu-pes-edu>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHr6XR8BFES7dxrSAz95dmhJGUMH2r1/dTccd2dOBbncwo52cfqgjPoNLB0Fe6MbTeaDcJdK2Nw5mlQ+vFtRsK8yPV34nIpWD0kJqYb2nXY56xcU43A3
 B7dBreZ9yhTUn/Qf1cZsWZxSybS6xRehVDt9czUF5oA5JdMryuW0KN2w3F3ha1wYDSxoR9mva0m1zrcK12mvAENwhZQVxb3c/XRGQSM4Jcp/IJRsImY6UMNS
 QPM/cBbJSfCkfEHMrM1P1flCFMoW1p2HDmIx8iiMJ7ZjcGJaT+prWUnI7W8dArrsekC0MRJSnENqFLv4yIMzWGus3vHzeeK1caFW8r7eXW5zQ2TMBjroLQXJ
 m2WIiB/yREEzmjuvFEnOjNoK3W9c3rhy7WgenWHulABJJViK6Ljo+eHUTma6CiGT5Pg954h6
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The soc_camera driver obsolete and depends on BROKEN. And in fact, I'm
working on removing it. So I'll drop this patch for those reasons.

Regards,

	Hans

On 25/06/2020 17:35, B K Karthik wrote:
> staging: media: soc_camera: soc_camera.c: Clearing coding-style problem
> "Macros with complex values should be enclosed in parentheses" in line 241 by adding parentheses.
> staging: media: soc_camera: soc_camera.c: Clearing coding-style problem
> "Alignment should match open parenthesis" by adding tab spaces in line 410.
> staging: media: soc_camera: soc_camera.c: Clearing coding-style problem
> "return of an errno should typically be negative" by adding a "-" in front of EPOLLER in line 812.
> staging: media: soc_camera: soc_camera.c: Clearing coding-style problem
> "Alignment should match open parenthesis" by adding tab spaces in line 1270.
> 
> Signed-off-by: B K Karthik <karthik.bk2000@live.com>
> ---
>  drivers/staging/media/soc_camera/soc_camera.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/soc_camera/soc_camera.c b/drivers/staging/media/soc_camera/soc_camera.c
> index 39f513f69b89..66a14ebd8093 100644
> --- a/drivers/staging/media/soc_camera/soc_camera.c
> +++ b/drivers/staging/media/soc_camera/soc_camera.c
> @@ -238,8 +238,8 @@ unsigned long soc_camera_apply_board_flags(struct soc_camera_subdev_desc *ssdd,
>  }
>  EXPORT_SYMBOL(soc_camera_apply_board_flags);
>  
> -#define pixfmtstr(x) (x) & 0xff, ((x) >> 8) & 0xff, ((x) >> 16) & 0xff, \
> -	((x) >> 24) & 0xff
> +#define pixfmtstr(x) ((x) & 0xff, ((x) >> 8) & 0xff, ((x) >> 16) & 0xff, \
> +	((x) >> 24) & 0xff)
>  
>  static int soc_camera_try_fmt(struct soc_camera_device *icd,
>  			      struct v4l2_format *f)
> @@ -407,7 +407,7 @@ static int soc_camera_dqbuf(struct file *file, void *priv,
>  }
>  
>  static int soc_camera_create_bufs(struct file *file, void *priv,
> -			    struct v4l2_create_buffers *create)
> +			    		struct v4l2_create_buffers *create)
>  {
>  	struct soc_camera_device *icd = file->private_data;
>  	int ret;
> @@ -806,10 +806,10 @@ static __poll_t soc_camera_poll(struct file *file, poll_table *pt)
>  {
>  	struct soc_camera_device *icd = file->private_data;
>  	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
> -	__poll_t res = EPOLLERR;
> +	__poll_t res = -EPOLLERR;
>  
>  	if (icd->streamer != file)
> -		return EPOLLERR;
> +		return -EPOLLERR;
>  
>  	mutex_lock(&ici->host_lock);
>  	res = ici->ops->poll(file, pt);
> @@ -1267,7 +1267,7 @@ static int soc_camera_i2c_init(struct soc_camera_device *icd,
>  	}
>  
>  	subdev = v4l2_i2c_new_subdev_board(&ici->v4l2_dev, adap,
> -				shd->board_info, NULL);
> +						shd->board_info, NULL);
>  	if (!subdev) {
>  		ret = -ENODEV;
>  		goto ei2cnd;
> 

