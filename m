Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC2351C809
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 13:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfENLyn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 07:54:43 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:58709 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725893AbfENLyn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 07:54:43 -0400
Received: from [IPv6:2001:420:44c1:2579:859d:cefd:f7a7:d8be] ([IPv6:2001:420:44c1:2579:859d:cefd:f7a7:d8be])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QW0yhvBC73qlsQW12h3N9G; Tue, 14 May 2019 13:54:41 +0200
Subject: Re: [PATCH v5 2/4] media: v4l2-subdev: WARN_ON invalid
 v4l2_subdev_call() arguments
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190512201551.18724-1-jmkrzyszt@gmail.com>
 <20190512201551.18724-3-jmkrzyszt@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c9f6b614-2f60-9f54-cfbd-ec218e582f33@xs4all.nl>
Date:   Tue, 14 May 2019 13:54:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190512201551.18724-3-jmkrzyszt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJCUGcGL8OLdNUZD0A+2tPClpy1zuFRnFPQFW2y4AokvQ3T7JKgjyeA6zdHAP6DPM51DUY/5D0ZrEE7nzJxa8i24TKg3P6y74Xw3XNBCNo0jjFZENEuQ
 i/HNp0UjS+JeJf03135cveDxZMIPDekiKRdoBp0QESAi4iJaiQEhEboFROTb2E9uwjPZO3BjhNXFba7Qty4fmlpozWiv53U2TfTyYEyWtSD3Qt3g2XEiGjBQ
 DRntVmO8ZUPXtvMDj+lKXzL9WOpqpBZTOziNO03wO+Cc11wbTszWazcyqVyUGj9xogiAnGTvS5PnM9ewvbBDynxKRKz+rNC3v4F3CGzbU9Azc0wgAVjb5h1K
 cAUf+lmi7p0vyCsmMH4q9i9B7AjDbwWG0ArZ9R9/vrumzPJJ7F5EAMvA2SCXF496HfzCuhb2ZhYq6mBbWAfYyLpZRNuKfQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/12/19 10:15 PM, Janusz Krzysztofik wrote:
> Invalid arguments passed to v4l2_subdev_call generally mean bugs.  Be
> noisy if that happens.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 890916674d42..5f2264575cd7 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -122,8 +122,8 @@ static int subdev_close(struct file *file)
>  
>  static int check_which(__u32 which)
>  {
> -	if (which != V4L2_SUBDEV_FORMAT_TRY &&
> -	    which != V4L2_SUBDEV_FORMAT_ACTIVE)
> +	if (WARN_ON(which != V4L2_SUBDEV_FORMAT_TRY &&
> +		    which != V4L2_SUBDEV_FORMAT_ACTIVE))
>  		return -EINVAL;

But this is now also called when the user calls an ioctl. And in that
case there should be no warning. It's perfectly legal for userspace to
specify a random value for which, and in that case it is just a regular
userspace bug. Same for the other checks below.

Regards,

	Hans

>  
>  	return 0;
> @@ -132,7 +132,7 @@ static int check_which(__u32 which)
>  static int check_pad(struct v4l2_subdev *sd, __u32 pad)
>  {
>  #if defined(CONFIG_MEDIA_CONTROLLER)
> -	if (sd->entity.num_pads && pad >= sd->entity.num_pads)
> +	if (WARN_ON(sd->entity.num_pads && pad >= sd->entity.num_pads))
>  		return -EINVAL;
>  #endif
>  	return 0;
> @@ -228,7 +228,7 @@ static int check_set_selection(struct v4l2_subdev *sd,
>  
>  static int check_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
>  {
> -	if (edid->blocks && edid->edid == NULL)
> +	if (WARN_ON(edid->blocks && edid->edid == NULL))
>  		return -EINVAL;
>  
>  	return check_pad(sd, edid->pad);
> 

