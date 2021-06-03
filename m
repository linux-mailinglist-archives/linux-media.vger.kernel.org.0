Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4EB39A9EE
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 20:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhFCSX5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 14:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhFCSXu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 14:23:50 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898C0C06174A
        for <linux-media@vger.kernel.org>; Thu,  3 Jun 2021 11:22:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B1AD21F434B7
Message-ID: <12bf11088ff4a78a6ef4a576e5d8c8c8bb272a70.camel@collabora.com>
Subject: Re: [PATCH 4/5] media: v4l2-mem2mem: add v4l2_m2m_buf_done trace
 point
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Emil Velikov <emil.l.velikov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        kernel@collabora.com
Cc:     linux-media@vger.kernel.org
Date:   Thu, 03 Jun 2021 15:21:55 -0300
In-Reply-To: <20210517183801.1255496-5-emil.l.velikov@gmail.com>
References: <20210517183801.1255496-1-emil.l.velikov@gmail.com>
         <20210517183801.1255496-5-emil.l.velikov@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Emil,

On Mon, 2021-05-17 at 19:38 +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Move the function out of the header, as required by the trace API and
> add a tracepoint.
> 

Same thing here, about too short commit descriptions.
 
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c |  9 ++++++
>  drivers/media/v4l2-core/v4l2-trace.c   |  1 +
>  include/media/v4l2-mem2mem.h           | 10 +++----
>  include/trace/events/v4l2.h            | 41 ++++++++++++++++++++++++++
>  4 files changed, 56 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index bf83d1fae701..a83d3e4e7a85 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -555,6 +555,15 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
>  }
>  EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
>  
> +void
> +v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
> +{
> +       // TODO: Emil move the trace after done?
> +       trace_v4l2_m2m_buf_done(&buf->vb2_buf, state);

There's a trace already in vb2_buffer_done, is that one not enough,
or not useful?

> +       vb2_buffer_done(&buf->vb2_buf, state);
> +}
> +EXPORT_SYMBOL(v4l2_m2m_buf_done);
> +
>  void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
>  {
>         unsigned long flags;
> diff --git a/drivers/media/v4l2-core/v4l2-trace.c b/drivers/media/v4l2-core/v4l2-trace.c
> index cde408d06fdc..b70208101f3c 100644
> --- a/drivers/media/v4l2-core/v4l2-trace.c
> +++ b/drivers/media/v4l2-core/v4l2-trace.c
> @@ -11,6 +11,7 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_buf_queue);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_dqbuf);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_qbuf);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ioctl_s_fmt);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_buf_done);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_schedule);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_schedule_failed);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_m2m_queue_job);
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 82bf54254bd8..013fd355ff82 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -229,11 +229,11 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
>                                       struct v4l2_m2m_ctx *m2m_ctx,
>                                       enum vb2_buffer_state state);
>  
> -static inline void
> -v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
> -{
> -       vb2_buffer_done(&buf->vb2_buf, state);
> -}
> +/**
> + * Something something

Something needs documented :)

Thanks,
Ezequiel

