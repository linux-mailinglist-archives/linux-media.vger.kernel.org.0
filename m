Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9948354D638
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 02:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348494AbiFPAok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 20:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348468AbiFPAoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 20:44:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5985A1FA67
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 17:44:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39195A49;
        Thu, 16 Jun 2022 02:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655340273;
        bh=QQRclXc7T0AgqCiZhG2cnCfzfDdzG0Cp+QwW/GWwZSQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JKaVfX+zFUnP5xRGzeTKiizyBT6td2b5MYRaiu3Z6LpbkyWMSNhMUsrI3PPqhB539
         /n/wL+t35aZ0rxo6HVxbTlVa+KENOb6uD1wYwHkOWrFChLDs0WGH8k00EcZ3Uge66Q
         Ni6Xtq3B7SHpoupS1JoEWoGsUjciaQVLV/0tVzdU=
Date:   Thu, 16 Jun 2022 03:44:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 03/55] media: rkisp1: debug: Add debugfs files to monitor
 MI and ISP interrupts
Message-ID: <Yqp854dMgW+deHam@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-4-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-4-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Wed, Jun 15, 2022 at 04:10:35AM +0900, Paul Elder wrote:
> Add files in debugfs to monitor some of the interrupts of the MI and
> ISP. Add the appropriate holder variables in the rkisp1_debug struct as
> well.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  9 +++++++++
>  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 20 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 4243ff5e2197..a67fe7b1dfa1 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -364,6 +364,15 @@ struct rkisp1_debug {
>  	unsigned long stats_error;
>  	unsigned long stop_timeout[2];
>  	unsigned long frame_drop[2];
> +	unsigned long mi_irq_mblk_line_count;
> +	unsigned long mi_irq_fill_mp_y_count;
> +	unsigned long mi_irq_frame_count;
> +	unsigned long mi_irq_wrap_mp_y_count;
> +	unsigned long mi_irq_wrap_mp_cb_count;
> +	unsigned long mi_irq_wrap_mp_cr_count;
> +	unsigned long isp_irq_v_start_count;
> +	unsigned long isp_irq_frame_count;
> +	unsigned long isp_irq_frame_in_count;
>  };
>  
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> index 1a59c00fabdd..02854e8ea1a4 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -220,6 +220,26 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
>  			    &rkisp1_debug_input_status_fops);
>  
> +	debugfs_create_ulong("mi_irq_mblk_line_count", 0444, debug->debugfs_dir,
> +			     &debug->mi_irq_mblk_line_count);
> +	debugfs_create_ulong("mi_irq_fill_mp_y_count", 0444, debug->debugfs_dir,
> +			     &debug->mi_irq_fill_mp_y_count);
> +	debugfs_create_ulong("mi_irq_frame_count", 0444, debug->debugfs_dir,
> +			     &debug->mi_irq_frame_count);
> +	debugfs_create_ulong("mi_irq_wrap_mp_y_count", 0444, debug->debugfs_dir,
> +			     &debug->mi_irq_wrap_mp_y_count);
> +	debugfs_create_ulong("mi_irq_wrap_mp_cb_count", 0444, debug->debugfs_dir,
> +			     &debug->mi_irq_wrap_mp_cb_count);
> +	debugfs_create_ulong("mi_irq_wrap_mp_cr_count", 0444, debug->debugfs_dir,
> +			     &debug->mi_irq_wrap_mp_cr_count);
> +
> +	debugfs_create_ulong("isp_irq_v_start_count", 0444, debug->debugfs_dir,
> +			     &debug->isp_irq_v_start_count);
> +	debugfs_create_ulong("isp_irq_frame_count", 0444, debug->debugfs_dir,
> +			     &debug->isp_irq_frame_count);
> +	debugfs_create_ulong("isp_irq_frame_in_count", 0444, debug->debugfs_dir,
> +			     &debug->isp_irq_frame_in_count);

It's nice to expose these through debugfs, but it looks like you never
actually set any of those fields :-) I think you could just drop this
patch.

> +
>  	regs_dir = debugfs_create_dir("regs", debug->debugfs_dir);
>  
>  	debugfs_create_file("core", 0444, regs_dir, rkisp1,

-- 
Regards,

Laurent Pinchart
