Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31B320B685
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 19:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgFZRDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 13:03:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51954 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgFZRDI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 13:03:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id CF0052A5CAF
Subject: Re: [PATCH 1/3] media: staging: rkisp1: params: don't reference the
 vb2 buffer after calling vb2_buffer_done
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
 <20200625174257.22216-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <59a3687f-b372-8a6f-ba1a-6768d45da993@collabora.com>
Date:   Fri, 26 Jun 2020 14:02:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200625174257.22216-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for your patch.

On 6/25/20 2:42 PM, Dafna Hirschfeld wrote:
> The driver should not reference the buffer pointer of vb2_buffer
> after calling 'vb2_buffer_done' on that buffer since the call passes
> the buffer to userspace.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 797e79de659c..762c2259b807 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1457,9 +1457,9 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
>  		new_params = (struct rkisp1_params_cfg *)
>  			(vb2_plane_vaddr(vb, 0));
>  		vbuf->sequence = frame_sequence;
> -		vb2_buffer_done(&params_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>  		params->is_first_params = false;
>  		params->cur_params = *new_params;

Maybe we can remove this new_params variable entirely, and just copy directly to params->cur_params in the begining of the if statement, what do yo think?

With or without this change

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> +		vb2_buffer_done(&params_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>  		return;>  	}
>  
> 
