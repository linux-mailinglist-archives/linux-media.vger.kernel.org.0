Return-Path: <linux-media+bounces-1412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A17B7FF0F3
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 14:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 073A92822E3
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 13:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DC5482FC;
	Thu, 30 Nov 2023 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a1JPu9C+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429D41FDB;
	Thu, 30 Nov 2023 05:53:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8F1655;
	Thu, 30 Nov 2023 14:53:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701352399;
	bh=nXRXZ31BrZI5b7Gjgomlhj9LuAT4oxERvzq3b7IxzSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a1JPu9C++7p6NBJwdtkrlWuFIwEjLdlNBjpWG4hqe0iC1jhjX1kPFxeQFEjZr2BxD
	 2/9ST/OvNvSTtZVbQOtH5AYI4KPl19tBojU6MXDP6mxBbBzvIUI30o+Vqa4we0/Jbb
	 66RtDNjNoTaFLWsont/wFY76SjEfQn7CM+axDRDI=
Date: Thu, 30 Nov 2023 15:54:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	kieran.bingham@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] media: rkisp1: debug: Count completed frame
 interrupts
Message-ID: <20231130135401.GO8402@pendragon.ideasonboard.com>
References: <20231129092956.250129-1-paul.elder@ideasonboard.com>
 <20231129092956.250129-4-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231129092956.250129-4-paul.elder@ideasonboard.com>

Hi Paul,

Thank you for the patch.

On Wed, Nov 29, 2023 at 06:29:56PM +0900, Paul Elder wrote:
> Add a counter to debugfs to count the number of frame-end interrupts.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 1 +
>  drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c  | 2 ++
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c    | 2 ++
>  3 files changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 1e7cea1bea5e..be69173958a4 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -417,6 +417,7 @@ struct rkisp1_debug {
>  	unsigned long stats_error;
>  	unsigned long stop_timeout[2];
>  	unsigned long frame_drop[2];
> +	unsigned long complete_frames;
>  };
>  
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> index f66b9754472e..1b1edfd3ab6c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -232,6 +232,8 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  			     &debug->frame_drop[RKISP1_MAINPATH]);
>  	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
>  			     &debug->frame_drop[RKISP1_SELFPATH]);
> +	debugfs_create_ulong("complete_frames", 0444, debug->debugfs_dir,
> +			     &debug->complete_frames);

I think tt would be nice to consolidate all counters in a single file.

I also wonder if we should reset the counters when we start streaming,
that would make it easier to interpret the values in userspace.

None of these are new issues so they can be addressed on top. Would you
be able to write a few short patches ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
>  			    &rkisp1_debug_input_status_fops);
>  
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 64a956b9f2d0..06cdb4edf19c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -991,6 +991,8 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>  	if (status & RKISP1_CIF_ISP_FRAME) {
>  		u32 isp_ris;
>  
> +		rkisp1->debug.complete_frames++;
> +
>  		/* New frame from the sensor received */
>  		isp_ris = rkisp1_read(rkisp1, RKISP1_CIF_ISP_RIS);
>  		if (isp_ris & RKISP1_STATS_MEAS_MASK)

-- 
Regards,

Laurent Pinchart

