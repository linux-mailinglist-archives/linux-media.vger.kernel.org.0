Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B790744FFF4
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 09:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbhKOIWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 03:22:55 -0500
Received: from mga18.intel.com ([134.134.136.126]:38080 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229654AbhKOIWw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 03:22:52 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220288278"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="220288278"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 00:19:54 -0800
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="603763025"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 00:19:49 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id F2AD020287;
        Mon, 15 Nov 2021 10:19:46 +0200 (EET)
Date:   Mon, 15 Nov 2021 10:19:46 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jammy Huang <jammy_huang@aspeedtech.com>
Cc:     eajames@linux.ibm.com, mchehab@kernel.org, joel@jms.id.au,
        andrew@aj.id.au, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/9] media: aspeed: Support aspeed mode to reduce
 compressed data
Message-ID: <YZIYIsURV0Gv1bc6@paasikivi.fi.intel.com>
References: <20211115074437.28079-1-jammy_huang@aspeedtech.com>
 <20211115074437.28079-8-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115074437.28079-8-jammy_huang@aspeedtech.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jammy,

Thanks for the patch. A few comments below...

On Mon, Nov 15, 2021 at 03:44:35PM +0800, Jammy Huang wrote:
> @@ -969,35 +1045,70 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>  
>  static void aspeed_video_update_regs(struct aspeed_video *video)
>  {
> -	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
> -		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
> -		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
> +	u8 jpeg_hq_quality = clamp((int)video->jpeg_hq_quality - 1, 0,
> +				   ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1);
> +	u32 comp_ctrl =	FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
> +		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
> +		FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_LUM, jpeg_hq_quality) |
> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_CHR, jpeg_hq_quality |
> +			   0x10);
>  	u32 ctrl = 0;
> -	u32 seq_ctrl = VE_SEQ_CTRL_JPEG_MODE;
> +	u32 seq_ctrl = 0;
>  
> -	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
> -		 video->frame_rate);
> -	v4l2_dbg(1, debug, &video->v4l2_dev, "subsample(%s)\n",
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n", video->frame_rate);
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s) subsample(%s)\n",
> +		 format_str[video->format],
>  		 video->yuv420 ? "420" : "444");
> -	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
> -		 video->jpeg_quality);
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d) hq(%s) hq_quality(%d)\n",
> +		 video->jpeg_quality, video->hq_mode ? "on" : "off",
> +		 video->jpeg_hq_quality);
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "compression mode(%s)\n",
> +		 compress_mode_str[video->compression_mode]);
> +
> +	if (video->format == VIDEO_FMT_ASPEED)
> +		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
> +	else
> +		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD, 0);
>  
>  	if (video->frame_rate)
>  		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
>  
> +	if (video->format == VIDEO_FMT_STANDARD) {
> +		comp_ctrl &= ~FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode);
> +		seq_ctrl |= VE_SEQ_CTRL_JPEG_MODE;
> +	}
> +
>  	if (video->yuv420)
>  		seq_ctrl |= VE_SEQ_CTRL_YUV420;
>  
>  	if (video->jpeg.virt)
>  		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
>  
> +#ifdef CONFIG_MACH_ASPEED_G4

This would be better done based on the device recognised, not the selected
compile target. The same goes for the rest of the conditional pre-processor
bits.

> +	switch (video->compression_mode) {
> +	case 0:	//DCT only
> +		comp_ctrl |= VE_COMP_CTRL_VQ_DCT_ONLY;
> +		break;
> +	case 1:	//DCT VQ mix 2-color
> +		comp_ctrl &= ~(VE_COMP_CTRL_VQ_4COLOR | VE_COMP_CTRL_VQ_DCT_ONLY);
> +		break;
> +	case 2:	//DCT VQ mix 4-color
> +		comp_ctrl |= VE_COMP_CTRL_VQ_4COLOR;
> +		break;
> +	}
> +#endif
> +

-- 
Kind regards,

Sakari Ailus
