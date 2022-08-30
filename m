Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044955A6BE6
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 20:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbiH3SR2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 14:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiH3SR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 14:17:26 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EED53036
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 11:17:24 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-11f0fa892aeso10431363fac.7
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 11:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=/oobhOGqi42449FzVMt/oGmisZwCvSy7BW4jgCCfch0=;
        b=VpcBG8Kr9vdsWOXvnH/lxth7STxi7dPMe1S74WAQ0tsnMozC2LRIB+dqX1liq81G2Y
         yyPmtCE49iIH9Fhy/cwlPemm2EGu9uniW2KsQuiF7MX+MYVFMBaMOjvwx46TrqqqRbGl
         8XBzxZUSiHCaXKTvBxmFYuUo6Zwb1pFbLMRXsm4k7H9NogSa0vxs+LhF5EvK3e7gR2//
         bZeUNISUliBPshw1v7PEqeHOzBzk/dUbVf5KyKBqPjWgrajFewGmNDFNb7w+KbjxQWhZ
         UeDcBrELMkpX3E1DzJ9aovTWQ9WWdwofMXXyXTNFaT6J86/MkQfqpmI/54EVY9g1Ia6R
         3SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=/oobhOGqi42449FzVMt/oGmisZwCvSy7BW4jgCCfch0=;
        b=l5oZhGJUyGgSsfTD1gJXBhSfC9gqw7UqdNtCspbaPddU09yp9K4SkXKLASVpXC6e6Z
         iZ1+s2KDCpx4cRxDViFUY4SFXLxvt1kbIT+pAZRMasctm4kSYCjniqm6F9Cr28PImpKu
         hF00HsnSXqGbItD/qKc2jlDa8HAsjG4YDqLFhrOsYxvnzKrCu1giQ0+Ftjga7BXNfLgT
         eZKr2YBmugIIR9V20VfwUie/YfRxztRbpgQnQu6ZvSd+4jwvPYZk33eL5qXQRiqE724u
         1vT7hnlPB3o2mS6/OBToD1D7C8BKxuB48Kct4WhTYO1yXJ1GPwlYuszRBKwFQn463s4D
         lpoQ==
X-Gm-Message-State: ACgBeo2JOCGinAt4JWWzVr3vuumHj73QhXU5ZSpfHdVhNzVFHaadX0Mj
        ym7TIMwNOIf0EaYV5gA/O5h9gw==
X-Google-Smtp-Source: AA6agR4PjkWk+Bc8nvP17VYGP14YkKDkOOcw6aw7cjJ213TLpMFs5PvxMnyRL7Ny9EsqHgqfqYsRJg==
X-Received: by 2002:a05:6870:328d:b0:10d:ce86:ceee with SMTP id q13-20020a056870328d00b0010dce86ceeemr10941976oac.80.1661883443167;
        Tue, 30 Aug 2022 11:17:23 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id p7-20020a056830130700b006396521c804sm7532039otq.55.2022.08.30.11.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 11:17:22 -0700 (PDT)
Date:   Tue, 30 Aug 2022 15:17:16 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com
Subject: Re: [PATCH v3 1/7] media: hantro: Store HEVC bit depth in context
Message-ID: <Yw5ULOEDLWaHQav7@eze-laptop>
References: <20220829162159.881588-1-benjamin.gaignard@collabora.com>
 <20220829162159.881588-2-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829162159.881588-2-benjamin.gaignard@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, Aug 29, 2022 at 06:21:53PM +0200, Benjamin Gaignard wrote:
> Store HEVC bit depth in context.
> Bit depth is equal to hevc sps bit_depth_luma_minus8 + 8.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Looks good!

I have limited access to the hardware at the moment.

Can you make sure things look good not only for HEVC
but also for the other codecs?

Thanks!
Ezequiel

> ---
> version 3:
> - Based on top of Ezequiel's patch "media: destage Hantro VPU driver"
>  drivers/media/platform/verisilicon/hantro_drv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 2036f72eeb4a..1dd8312d824c 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -251,6 +251,11 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
>  
>  static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
> +	struct hantro_ctx *ctx;
> +
> +	ctx = container_of(ctrl->handler,
> +			   struct hantro_ctx, ctrl_handler);
> +
>  	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
>  		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
>  
> @@ -272,6 +277,8 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>  		if (sps->bit_depth_luma_minus8 != 0)
>  			/* Only 8-bit is supported */
>  			return -EINVAL;
> +
> +		ctx->bit_depth = sps->bit_depth_luma_minus8 + 8;
>  	} else if (ctrl->id == V4L2_CID_STATELESS_VP9_FRAME) {
>  		const struct v4l2_ctrl_vp9_frame *dec_params = ctrl->p_new.p_vp9_frame;
>  
> -- 
> 2.32.0
> 
