Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFE4C2177
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 15:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730411AbfI3NHf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 09:07:35 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:59311 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726314AbfI3NHf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 09:07:35 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id EvOjilaOfz6EAEvOniNh6y; Mon, 30 Sep 2019 15:07:33 +0200
Subject: Re: [PATCH v8 7/8] media: v4l2-ctrl: Add new helper
 v4l2_ctrl_ptr_from_void
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
References: <20190930101841.19630-1-ribalda@kernel.org>
 <20190930101841.19630-8-ribalda@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <aa6ace11-9697-d3d9-907c-83b3398d8f5e@xs4all.nl>
Date:   Mon, 30 Sep 2019 15:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930101841.19630-8-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKQ8x4ojUnlXF2/Q+sXcJYMxCA+/yK479ijRvP8Qwq/cIEvO6xGdSfj1I3K7LnmRTlBDZ8rjaQdIHjI8k2v6XXupI0RkeHRROFWnFOUI37zEOWiI1fDT
 l8409lsY1Rno+7mnnSyl2xaefoqmeVfVPBFYxO6tYbWdH48eZNjAdJKk6x+9iWkxT9aEMrm/DPdU0Tf0Z1cGKyzoM7Q8D0w2h87B12tedTm4YDdEws6Zn7Z6
 KjK/BhRc7vJwha3Uj9p6mELYURhxESvw8AWbOyFj1v5xPlVAIfzz50S6sImuI/8L8tQdc1aQE54NUGu43twL/s814Y2An/OyxEbztZB+lKdePSBwJa72lKsx
 ciIbSFbE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/30/19 12:18 PM, Ricardo Ribalda Delgado wrote:
> This helper function simplifies the code by not needing a union
> v4l2_ctrl_ptr and an assignment every time we need to use
> a ctrl_ptr.
> 
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  include/media/v4l2-ctrls.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index c42f164e2c9e..d69cfdffd41d 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -73,6 +73,17 @@ union v4l2_ctrl_ptr {
>  	void *p;
>  };
>  
> +/**
> + * v4l2_ctrl_ptr() - Helper function to return a v4l2_ctrl_ptr from a
> + * void pointer
> + * @ptr:	The void pointer
> + */
> +static inline union v4l2_ctrl_ptr v4l2_ctrl_ptr_from_void(void *ptr)

Mismatch between function name and the comment above.

But _from_void is not a good name, since it's from a void pointer.

How about: v4l2_ctrl_ptr_create(void *ptr)

since you create a v4l2_ctrl_ptr.

Regards,

	Hans

> +{
> +	BUILD_BUG_ON(sizeof(union v4l2_ctrl_ptr) != sizeof(void *));
> +	return (union v4l2_ctrl_ptr) ptr;
> +}
> +
>  /**
>   * struct v4l2_ctrl_ops - The control operations that the driver has to provide.
>   *
> 

