Return-Path: <linux-media+bounces-1409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 906CD7FF063
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 14:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B62131C20ACB
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 13:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61FC482D6;
	Thu, 30 Nov 2023 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JAQvg8Cg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9BAD1;
	Thu, 30 Nov 2023 05:42:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B72E66B8;
	Thu, 30 Nov 2023 14:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701351694;
	bh=7INR0+gFODzPUFe4WJ243a21nyiEELUis2SpyZE8Dug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAQvg8CgVT6KsM5GEL3pkty93Ksbno5+bWEMSvuHLaatGlA3HOItUg5OJcAL/4X9a
	 6+1wDPQWsPhcAdvLcxrmRGTJKKUCqTnQBv1L7f8eWP6a4zLciQEe6wDwX3Cx50jojP
	 hY+DkT0uUrds/IuvPMLE7XcWH/hSLPXjrdH1YpLk=
Date: Thu, 30 Nov 2023 15:42:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	kieran.bingham@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: rkisp1: debug: Add register dump for IS
Message-ID: <20231130134216.GM8402@pendragon.ideasonboard.com>
References: <20231129092956.250129-1-paul.elder@ideasonboard.com>
 <20231129092956.250129-3-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231129092956.250129-3-paul.elder@ideasonboard.com>

Hi Paul,

Thank you for the patch.

On Wed, Nov 29, 2023 at 06:29:55PM +0900, Paul Elder wrote:
> Add register dump for the image stabilizer module to debugfs.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-debug.c    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> index 71df3dc95e6f..f66b9754472e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -139,6 +139,21 @@ static int rkisp1_debug_dump_mi_mp_show(struct seq_file *m, void *p)
>  }
>  DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_mi_mp);
>  
> +static int rkisp1_debug_dump_is_show(struct seq_file *m, void *p)
> +{
> +	static const struct rkisp1_debug_register registers[] = {
> +		RKISP1_DEBUG_SHD_REG(ISP_IS_H_OFFS),
> +		RKISP1_DEBUG_SHD_REG(ISP_IS_V_OFFS),
> +		RKISP1_DEBUG_SHD_REG(ISP_IS_H_SIZE),
> +		RKISP1_DEBUG_SHD_REG(ISP_IS_V_SIZE),

As these are ISP registers, how about adding them to the list of ISP
registers ?

    media: rkisp1: debug: Add register dump for IS

    Add register dump for the ISP image stabilizer module to debugfs. This
    helps debugging issues related to digital zoom.

    Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
    Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index 71df3dc95e6f..d2fbed42164e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -92,6 +92,10 @@ static int rkisp1_debug_dump_isp_regs_show(struct seq_file *m, void *p)
 		RKISP1_DEBUG_REG(ISP_FLAGS_SHD),
 		RKISP1_DEBUG_REG(ISP_RIS),
 		RKISP1_DEBUG_REG(ISP_ERR),
+		RKISP1_DEBUG_SHD_REG(ISP_IS_H_OFFS),
+		RKISP1_DEBUG_SHD_REG(ISP_IS_V_OFFS),
+		RKISP1_DEBUG_SHD_REG(ISP_IS_H_SIZE),
+		RKISP1_DEBUG_SHD_REG(ISP_IS_V_SIZE),
 		{ /* Sentinel */ },
 	};
 	struct rkisp1_device *rkisp1 = m->private;


> +		{ /* Sentinel */ },
> +	};
> +	struct rkisp1_device *rkisp1 = m->private;
> +
> +	return rkisp1_debug_dump_regs(rkisp1, m, 0, registers);
> +}
> +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_is);
> +
>  #define RKISP1_DEBUG_DATA_COUNT_BINS	32
>  #define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
>  
> @@ -235,6 +250,9 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  
>  	debugfs_create_file("mi_mp", 0444, regs_dir, rkisp1,
>  			    &rkisp1_debug_dump_mi_mp_fops);
> +
> +	debugfs_create_file("is", 0444, regs_dir, rkisp1,
> +			    &rkisp1_debug_dump_is_fops);
>  }
>  
>  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)

-- 
Regards,

Laurent Pinchart

