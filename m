Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C31D36DBB
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 09:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbfFFHsW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 03:48:22 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:56697 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725267AbfFFHsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 03:48:22 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Yn8ChfWmysDWyYn8Fh2gxa; Thu, 06 Jun 2019 09:48:20 +0200
Subject: Re: [PATCH 2/2] media: v4l2-core: fix uninitialized variable error
To:     Shuah Khan <skhan@linuxfoundation.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se, ezequiel@collabora.com,
        paul.kocialkowski@bootlin.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1559764506.git.skhan@linuxfoundation.org>
 <d0d1cd16f3995d8c22a5a4a0d2018482cb739354.1559764506.git.skhan@linuxfoundation.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a7551661-ad6a-2d5f-fa82-dd4d0f17591d@xs4all.nl>
Date:   Thu, 6 Jun 2019 09:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d0d1cd16f3995d8c22a5a4a0d2018482cb739354.1559764506.git.skhan@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNvUXAhrvEk8Ev0LcCoo4FG25+DKVgP1YhtMiHU3dn+sVEJkTTPlieg/BCTJyUZ4aZ1/D6ZDYsTUMY6BLqGy9SQ+llRP6T2qzDkouIpdxV3uOz5Z/LCv
 mXPTbI+A8NOGbqFfpzTf+R9HwiiRsqMRbfcr61P49M5AHuah+o0uNHryfGsJwNKB85+IBpVV2wjlTsPYjppFPv7oZglT94/GCox1dY5SV0hBL45RfKvrIukM
 WKcsrWR8itR2qtHu6fPBHRszY2O/LUIjvwDOAIg1Z1zVHjNqYLjSGB2Ox3bP7LQazw3CQ6KyWJS5diIumYycCZ7xiXLGZkfLhMybmR4PmzJ8Yr+fT/SMg0ZM
 TNhDPhfkYPjBuce4bwLtwQHXwmsm9IUTUNp04iiAw8yb+uT3cO+MkRiHgwRbiPZsjsyGaISXo/WynW8dJtF0imdzBdMwiTYaDNDjPGvZkoj26bdCutI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/5/19 11:53 PM, Shuah Khan wrote:
> Fix the following cppcheck error:
> 
> Checking drivers/media/v4l2-core/v4l2-ioctl.c ...
> Checking drivers/media/v4l2-core/v4l2-ioctl.c: CONFIG_VIDEO_ADV_DEBUG...
> [drivers/media/v4l2-core/v4l2-ioctl.c:2470]: (error) Uninitialized variable: sd

This is a false report: sd is set by v4l2_device_for_each_subdev before it is used.

I'm dropping this patch.

Regards,

	Hans

> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 333e387bafeb..205addb949ce 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2445,7 +2445,7 @@ static int v4l_dbg_g_chip_info(const struct v4l2_ioctl_ops *ops,
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_dbg_chip_info *p = arg;
> -	struct v4l2_subdev *sd;
> +	struct v4l2_subdev *sd = NULL;
>  	int idx = 0;
>  
>  	switch (p->match.type) {
> 

