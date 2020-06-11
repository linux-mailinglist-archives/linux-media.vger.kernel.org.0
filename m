Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343AE1F67EA
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 14:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgFKMfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 08:35:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48872 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgFKMfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 08:35:20 -0400
Received: from [IPv6:2804:14c:483:73a8::1000] (unknown [IPv6:2804:14c:483:73a8::1000])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 334322A4705;
        Thu, 11 Jun 2020 13:35:17 +0100 (BST)
Subject: Re: [PATCH] v4l2-core: Print control name in VIDIOC_S/G_(EXT)_CTRL(S)
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com
References: <20200609121514.9414-1-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <c47394e6-4f47-f212-1996-1960663ecfb6@collabora.com>
Date:   Thu, 11 Jun 2020 09:35:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200609121514.9414-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/9/20 9:15 AM, Ezequiel Garcia wrote:
> While debugging, it's currently really hard to identify controls
> by their ID. Print the control name making the print more helpful.
> 
> With this change, the print changes from:
> 
> video1: VIDIOC_S_EXT_CTRLS: which=0xf010000, count=5, error_idx=4, request_fd=45, id/size=0x990ce8/1048, id/size=0x990ce9/12, id/size=0x990cea/480, id/size=0x990ceb/896, id/size=0x990cec/400
> 
> to:
> 
> video1: VIDIOC_S_EXT_CTRLS: which=0xf010000, count=5, error_idx=4, request_fd=42, name=H264 Sequence Parameter Set, id/size=0x990ce8/1048, name=H264 Picture Parameter Set, id/size=0x990ce9/12, name=H264 Scaling Matrix, id/size=0x990cea/480, name=H264 Slice Parameters, id/size=0x990ceb/896, name=H264 Decode Parameters, id/size=0x990cec/400
> 
> For instance, this is specially helpful when the ioctl fails. Consider
> the following example:
> 
> v4l2-ctrls: prepare_ext_ctrls: video1: pointer control id 0x990cec size too small, 400 bytes but 784 bytes needed
> v4l2-ctrls: try_set_ext_ctrls: video1: video1: try_set_ext_ctrls_common failed (-14)
> video1: VIDIOC_S_EXT_CTRLS: error -14: which=0xf010000, count=5, error_idx=5, request_fd=39, name=H264 Sequence Parameter Set, id/size=0x990ce8/1048, name=H264 Picture Parameter Set, id/size=0x990ce9/12, name=H264 Scaling Matrix, id/size=0x990cea/480, name=H264 Slice Parameters, id/size=0x990ceb/896, name=H264 Decode Parameters, id/size=0x990cec/400
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks Ezequiel,

I'll include this in the next RFC.

Regards,
Helen

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 2322f08a98be..4264ac44c48b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -582,8 +582,10 @@ static void v4l_print_querymenu(const void *arg, bool write_only)
>  static void v4l_print_control(const void *arg, bool write_only)
>  {
>  	const struct v4l2_control *p = arg;
> +	const char *name = v4l2_ctrl_get_name(p->id);
>  
> -	pr_cont("id=0x%x, value=%d\n", p->id, p->value);
> +	pr_cont("name=%s, id=0x%x, value=%d\n",
> +		name ? name : "unknown", p->id, p->value);
>  }
>  
>  static void v4l_print_ext_controls(const void *arg, bool write_only)
> @@ -594,12 +596,16 @@ static void v4l_print_ext_controls(const void *arg, bool write_only)
>  	pr_cont("which=0x%x, count=%d, error_idx=%d, request_fd=%d",
>  			p->which, p->count, p->error_idx, p->request_fd);
>  	for (i = 0; i < p->count; i++) {
> +		unsigned int id = p->controls[i].id;
> +		const char *name = v4l2_ctrl_get_name(id);
> +
> +		name = name ? name : "unknown";
>  		if (!p->controls[i].size)
> -			pr_cont(", id/val=0x%x/0x%x",
> -				p->controls[i].id, p->controls[i].value);
> +			pr_cont(", name=%s, id/val=0x%x/0x%x",
> +				name, id, p->controls[i].value);
>  		else
> -			pr_cont(", id/size=0x%x/%u",
> -				p->controls[i].id, p->controls[i].size);
> +			pr_cont(", name=%s, id/size=0x%x/%u",
> +				name, id, p->controls[i].size);
>  	}
>  	pr_cont("\n");
>  }
> 
