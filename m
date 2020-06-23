Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E866204FE9
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 13:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732455AbgFWLBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 07:01:20 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:33205 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732409AbgFWLBR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 07:01:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ngfvjf3mIvh6gngfyj1PBA; Tue, 23 Jun 2020 13:01:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592910075; bh=wwakqo8GZ7h4g2EbDfHX2WV8blcFcF/x3PQ/6d3j9/w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=axYEUwmXKqTlDkS/hqjfujYQx5hV7n/T6oRBv94DjDRVtjMQSoJx83kBxDD59Ll70
         9rH3WgIkDa0VZL5UfpQ7CpiwuHHC+hkW4AVKJA0Fje3LNYWit0DfCQQGhnu9ICF0zC
         aUdR/MfkiYvlhbDuIGAYfw7DLhssXwTbllQjhEi7VXMijRO7sZePM5VSG0T9QEi/ns
         VNKY1yYzWYFUqyvqyGev1vg8L34CsEoa/C7BD+qkyj96S8L5uHg701iN7rFY4rvU4G
         BiiNPWer0Qt/XiU3WjTln3FVP2wXymsYJa16ngGeJVYSF72F5OshDlN1hj10XXtZl8
         AQetuOTVG3glw==
Subject: Re: [PATCH] v4l2-core: Print control name in VIDIOC_S/G_(EXT)_CTRL(S)
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com
References: <20200609121514.9414-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d5939943-cfa2-8d39-a245-9a9ec146440d@xs4all.nl>
Date:   Tue, 23 Jun 2020 13:01:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609121514.9414-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPCpaT8wgdK4eMTeCLW7QxzID/A5PU2KYpWYDF6ab9lslIoeD/HTk5HOx8gxvRmEfb3Kpr2is79FvveRi1julOOc6kXO7/xURhLm8kfT37iWnHPwkelF
 9PD8K23i+n0P0W6gdZMyk0uLkOLQ/E242NT21+I9ia+38XcHbwUVN151DyoTyQ3h1tEpmL9tef8/3N7VMQpfu9HTZeUdeE7b4qdQyii5PGXpcg00syyiWEz9
 HZvn1trA/Vf3nrU5Q4OIdw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/06/2020 14:15, Ezequiel Garcia wrote:
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

I prefer:

	if (name)
		pr_cont("name=%s, ", name);
	pr_cont("id=0x%x, value=%d\n", p->id, p->value);

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

Same here.

Regards,

	Hans

>  	}
>  	pr_cont("\n");
>  }
> 

