Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BB21DC2F3
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 01:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgETX2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 19:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728552AbgETX2E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 19:28:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DADC061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 16:28:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECAAE24D;
        Thu, 21 May 2020 01:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590017281;
        bh=3KzURu1H6T78EA0JFMmcYL5LccKtwxRWYXiuDXkWL54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nk6opcGdlNWfK07MPcqugj4W6D3JEqlCAPp/nW9R3WiB+hIVhWcSrkmtZAwed4ttT
         Ax2vbO59/e6sxTLRij54TaJ6aej9AEiOdTJZ/HMpbmSy4q9pEHtOaCCqUZI+hNE/Ql
         jvOk1zQjZJOKuqJGk2SlvrzkDXuTYhe09zMlnAJo=
Date:   Thu, 21 May 2020 02:27:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: Re: [PATCH 2/5] media: staging: rkisp1: use a macro for the
 statistics flags mask
Message-ID: <20200520232749.GB25474@pendragon.ideasonboard.com>
References: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
 <20200512120522.25960-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200512120522.25960-3-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Tue, May 12, 2020 at 02:05:19PM +0200, Dafna Hirschfeld wrote:
> The mask of the ready statistics flags is used in
> several places in the code using bitwise-or.
> Use a macro for that to make the code more readable.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h |  4 ++++
>  drivers/staging/media/rkisp1/rkisp1-isp.c    |  5 +----
>  drivers/staging/media/rkisp1/rkisp1-stats.c  | 12 +++---------
>  3 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 33dffe21c769..c0ab16c6b3db 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -42,6 +42,10 @@
>  
>  #define RKISP1_MAX_BUS_CLK	8
>  
> +#define RKISP1_STATS_MEAS_MASK		(RKISP1_CIF_ISP_AWB_DONE |	\
> +					 RKISP1_CIF_ISP_AFM_FIN |	\
> +					 RKISP1_CIF_ISP_EXP_END |	\
> +					 RKISP1_CIF_ISP_HIST_MEASURE_RDY)
>  enum rkisp1_rsz_pad {
>  	RKISP1_RSZ_PAD_SINK,
>  	RKISP1_RSZ_PAD_SRC,
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index 19ab0ed323aa..49b47e1734b0 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -1137,10 +1137,7 @@ irqreturn_t rkisp1_isp_isr(struct rkisp1_device *rkisp1)
>  
>  		/* New frame from the sensor received */
>  		isp_ris = rkisp1_read(rkisp1, RKISP1_CIF_ISP_RIS);
> -		if (isp_ris & (RKISP1_CIF_ISP_AWB_DONE |
> -			       RKISP1_CIF_ISP_AFM_FIN |
> -			       RKISP1_CIF_ISP_EXP_END |
> -			       RKISP1_CIF_ISP_HIST_MEASURE_RDY))
> +		if (isp_ris & RKISP1_STATS_MEAS_MASK)
>  			rkisp1_stats_isr(&rkisp1->stats, isp_ris);
>  	}
>  
> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> index 6dfcbdc3deb8..12998db955e6 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> @@ -407,22 +407,16 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
>  
>  	spin_lock(&stats->irq_lock);
>  
> -	val = RKISP1_CIF_ISP_AWB_DONE | RKISP1_CIF_ISP_AFM_FIN |
> -	      RKISP1_CIF_ISP_EXP_END | RKISP1_CIF_ISP_HIST_MEASURE_RDY;
> +	val = RKISP1_STATS_MEAS_MASK;
>  	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_ICR);

This could become

 	rkisp1_write(rkisp1, RKISP1_STATS_MEAS_MASK, RKISP1_CIF_ISP_ICR);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	isp_mis_tmp = rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
> -	if (isp_mis_tmp &
> -	    (RKISP1_CIF_ISP_AWB_DONE | RKISP1_CIF_ISP_AFM_FIN |
> -	     RKISP1_CIF_ISP_EXP_END | RKISP1_CIF_ISP_HIST_MEASURE_RDY))
> +	if (isp_mis_tmp & RKISP1_STATS_MEAS_MASK)
>  		rkisp1->debug.stats_error++;
>  
>  	if (!stats->is_streaming)
>  		goto unlock;
> -	if (isp_ris & (RKISP1_CIF_ISP_AWB_DONE |
> -		       RKISP1_CIF_ISP_AFM_FIN |
> -		       RKISP1_CIF_ISP_EXP_END |
> -		       RKISP1_CIF_ISP_HIST_MEASURE_RDY)) {
> +	if (isp_ris & RKISP1_STATS_MEAS_MASK) {
>  		work = kzalloc(sizeof(*work), GFP_ATOMIC);
>  		if (work) {
>  			INIT_WORK(&work->work,

-- 
Regards,

Laurent Pinchart
