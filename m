Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FB11DB123
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 13:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgETLLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 07:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbgETLLq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 07:11:46 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CB6C061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 04:11:46 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id AA97F2A2B8D
Subject: Re: [PATCH 3/5] media: staging: rkisp1: stats: use spin_lock_irqsave
 for irq_lock
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
References: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
 <20200512120522.25960-4-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <2d3f52d2-73d7-1e8d-eee3-669012854491@collabora.com>
Date:   Wed, 20 May 2020 08:11:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512120522.25960-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 5/12/20 9:05 AM, Dafna Hirschfeld wrote:
> Currently 'spin_lock' is used in order to lock the 'irq_lock'.
> This should be replaced with 'spin_lock_irqsave' since it is
> used in the irq handler.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-stats.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> index 12998db955e6..5578fdeb8a18 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> @@ -403,9 +403,10 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
>  	struct rkisp1_device *rkisp1 = stats->rkisp1;
>  	struct rkisp1_isp_readout_work *work;
>  	unsigned int isp_mis_tmp = 0;
> +	unsigned long flags;
>  	u32 val;
>  
> -	spin_lock(&stats->irq_lock);
> +	spin_lock_irqsave(&stats->irq_lock, flags);

Since you are moving this function to a threaded irq handler, you won't be in interrupt context.

The spin_lock_irqsave() function disable interrupts for the critical section, are you sure this is
required?

Regards,
Helen

>  
>  	val = RKISP1_STATS_MEAS_MASK;
>  	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_ICR);
> @@ -435,7 +436,7 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
>  	}
>  
>  unlock:
> -	spin_unlock(&stats->irq_lock);
> +	spin_unlock_irqrestore(&stats->irq_lock, flags);
>  }
>  
>  static void rkisp1_init_stats(struct rkisp1_stats *stats)
> 
