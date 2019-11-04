Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09815EDBE4
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 10:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbfKDJsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 04:48:23 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:34191 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727788AbfKDJsX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 04:48:23 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id RYy9ia8hj9P9bRYyCiVURr; Mon, 04 Nov 2019 10:48:21 +0100
Subject: Re: [PATCH v3 2/5] media: v4l2_ctrl: Add const pointer to ctrl_ptr
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191101112358.29538-1-ribalda@kernel.org>
 <20191101112358.29538-2-ribalda@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d08df115-f87d-947d-ca17-e9d82a077c9c@xs4all.nl>
Date:   Mon, 4 Nov 2019 10:48:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191101112358.29538-2-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJha0gJ1KEmyVTk2Jm6QFvRIitQcWYdXEW0+MMsdBZum6JAlJJoDqy1IvYJglMseOLcrPFNbZFsSlPGDuI62eaCPQE2o3YKIUsjonAggUULEAF4Lxny6
 cOqTU+yoKJmEbWjZfH//y0msGWnxD/NCSyJiyw0zNAIHAI56pIXvI/Iuk6sPRVXvAIKv9UaDxjSG5o5lOtOC4jDQkB9FhBzTKYjqQRcmK4XdRHmrQ4ovbEhD
 OmAhDYazfOTHOfTqFSk1qg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On 11/1/19 12:23 PM, Ricardo Ribalda Delgado wrote:
> This pointer is used to point to data that is constant. Thanks to this
> we can avoid a lot of casting and we make more clear when the data is
> constant or variable.
> 
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  include/media/v4l2-ctrls.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 78a97b10c89e..7db9e719a583 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -56,6 +56,7 @@ struct poll_table_struct;
>   * @p_hevc_slice_params:	Pointer to an HEVC slice parameters structure.
>   * @p_area:			Pointer to an area.
>   * @p:				Pointer to a compound value.
> + * @p_const:			Pointer to a constant compound value.
>   */
>  union v4l2_ctrl_ptr {
>  	s32 *p_s32;
> @@ -78,6 +79,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>  	struct v4l2_area *p_area;
>  	void *p;
> +	const void *p_const;
>  };
>  
>  /**
> 

This addition makes it possible to use const void pointers elsewhere in
the control framework.

E.g. in std_equal you can use p_const in the memcmp at the end.

Can you go through the v4l2-ctrls.c source and replace .p by .p_const
where it makes sense?

Obviously this would be a separate patch.

Regards,

	Hans
