Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1603724C07D
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 16:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgHTOVg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 10:21:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725916AbgHTOVe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 10:21:34 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE15620738;
        Thu, 20 Aug 2020 14:21:32 +0000 (UTC)
Date:   Thu, 20 Aug 2020 10:21:31 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3, RESEND] media: camss: vfe: Use trace_printk for
 debugging only
Message-ID: <20200820102131.3cd3c08e@oasis.local.home>
In-Reply-To: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 20 Aug 2020 17:14:10 +0800
Nicolas Boichat <drinkcat@chromium.org> wrote:

> trace_printk should not be used in production code. Since
> tracing interrupts is presumably latency sensitive, pr_dbg is
> not appropriate, so guard the call with a preprocessor symbol
> that can be defined for debugging purpose.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> 
> (resending this patch as part of the whole series, since we need a new
> patch 3/3 now).
> 
>  drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 2 ++
>  drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> index 174a36be6f5d866..0c57171fae4f9e9 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> @@ -936,8 +936,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>  
>  	vfe->ops->isr_read(vfe, &value0, &value1);
>  
> +#ifdef CAMSS_VFE_TRACE_IRQ
>  	trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
>  		     value0, value1);

Why are these not trace events?

The reason I have that ugly banner is to keep people from doing EXACTLY THIS!

trace_printk() is really easy to add, but it also is not configurable.
When a trace_printk() is in the code, it is always enabled (well, you
can turn trace_printk off, but that's an all or nothing. That is, by
turning trace_printk off, you turn off *all* trace_printks).

Instead, people should add trace events. This here is a perfect place
to have a trace event. You don't need to add #ifdef around trace events
because when not enabled, they are simply a nop. When enabled, the nop
is turned into a jump to the tracing code. It should not affect
performance. And as a trace event, you get a bunch of features with it
(filtering, histograms, etc).

-- Steve


> +#endif
>  
>  	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
>  		vfe->isr_ops.reset_ack(vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> index 0dca8bf9281e774..307675925e5c779 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> @@ -1058,8 +1058,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>  
>  	vfe->ops->isr_read(vfe, &value0, &value1);
>  
> +#ifdef CAMSS_VFE_TRACE_IRQ
>  	trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
>  		     value0, value1);
> +#endif
>  
>  	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
>  		vfe->isr_ops.reset_ack(vfe);

