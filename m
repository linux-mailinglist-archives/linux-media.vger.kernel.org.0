Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C669EFA3D
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 10:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730633AbfKEJ5V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 04:57:21 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:33679 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730454AbfKEJ5U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Nov 2019 04:57:20 -0500
Received: from [IPv6:2001:420:44c1:2577:b458:c82c:799d:e7d8]
 ([IPv6:2001:420:44c1:2577:b458:c82c:799d:e7d8])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RvaMiG4eLTzKrRvaQirPzi; Tue, 05 Nov 2019 10:57:19 +0100
Subject: Re: [PATCH] media: v4l2-mem2mem: Fix hold buf flag check
To:     Jernej Skrabec <jernej.skrabec@siol.net>,
        mchehab+samsung@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191028185700.3634267-1-jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4fe0c972-cfd7-e04b-17dc-e739e4c8fc00@xs4all.nl>
Date:   Tue, 5 Nov 2019 10:57:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191028185700.3634267-1-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDNGXV+jojFOdl+vTll97CdnD3VKmC3VMWxlZqVv6bgLx1VamliGCMPMqpR4H209ff7D7Kc/rBrmZ08UPrluBLJf7kD3qsSV179mTzinDlnTUnbPyuKf
 YK8dwTrAALFDTASt6kW+bMzp9xkaIVMQOc/iUR0vlDkbpuyjb5+vZJc/DqIUg65qtIasnm5rNb9myvEEMWGciIlpSc/vxGcwjViwsP5FkAhZb6eIPXCSggqt
 uzC9CT5vNtQHxuUydwY+wh43nWEadaa+mDCo12xt70Q0MwFYISbIz9dV9sQCboMT7Jjuq1B0hVJjhj92JhniOOc8IMo3Q5FLZM1Ac/GJGD3b3lxt5z1SJvFM
 pt6j06aptHKNoId0AlvM9vXS59d+N6UxRW7TQ3gyq0LYbxafaHcFG9l5ZBRwI7cyC9KkNKuJ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/28/19 7:57 PM, Jernej Skrabec wrote:
> Hold buf flag is set on output queue, not capture. Fix that.
> 
> Fixes: f07602ac3887 ("media: v4l2-mem2mem: add new_frame detection")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index db07ef3bf3d0..0d2d547a84a5 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -335,7 +335,7 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
>  		}
>  	}
>  
> -	if (src && dst && (m2m_ctx->cap_q_ctx.q.subsystem_flags &
> +	if (src && dst && (m2m_ctx->out_q_ctx.q.subsystem_flags &
>  			   VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
>  		m2m_ctx->new_frame = !dst->vb2_buf.copied_timestamp ||
>  			dst->vb2_buf.timestamp != src->vb2_buf.timestamp;
> 

You are right, this should be the output queue. But there is a second
use of VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF in this source in a
WARN_ON. Can you fix that as well?

Thanks!

	Hans
