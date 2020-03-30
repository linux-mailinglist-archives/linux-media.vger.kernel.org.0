Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3DD41983FB
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 21:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgC3TMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 15:12:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35628 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgC3TMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 15:12:31 -0400
Received: from [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d] (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2EEAB28D7FC;
        Mon, 30 Mar 2020 20:12:26 +0100 (BST)
Subject: Re: [PATCH 2/4] media: staging: rkisp1: cap: support uv swap only for
 semiplanar formats
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200326201610.31762-1-dafna.hirschfeld@collabora.com>
 <20200326201610.31762-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <bf6628db-efda-cb12-8f44-372e53d72778@collabora.com>
Date:   Mon, 30 Mar 2020 16:12:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200326201610.31762-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/26/20 5:16 PM, Dafna Hirschfeld wrote:
> The register RKISP1_CIF_MI_XTD_FORMAT_CTRL is relevant only
> for semiplanar formats, therefore the uv swap can be supported
> through this register only for semiplanar formats.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 84a3cf565106..fa2849209433 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -37,6 +37,10 @@
>  
>  #define RKISP1_MIN_BUFFERS_NEEDED 3
>  
> +#define RKISP1_IS_SEMI_PLANAR(write_format)				\
> +	(((write_format) == RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA) ||	\
> +	 ((write_format) == RKISP1_MI_CTRL_SP_WRITE_SPLA))
> +
>  enum rkisp1_plane {
>  	RKISP1_PLANE_Y	= 0,
>  	RKISP1_PLANE_CB	= 1,
> @@ -429,7 +433,8 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
>  		     cap->config->mi.cr_size_init);
>  
>  	rkisp1_irq_frame_end_enable(cap);
> -	if (cap->pix.cfg->uv_swap) {
> +	if (RKISP1_IS_SEMI_PLANAR(cap->pix.cfg->write_format) &&
> +	    cap->pix.cfg->uv_swap) {
>  		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>  
>  		reg = reg | RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
> @@ -466,7 +471,8 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
>  	rkisp1_write(rkisp1, cap->sp_y_stride, RKISP1_CIF_MI_SP_Y_LLENGTH);
>  
>  	rkisp1_irq_frame_end_enable(cap);
> -	if (cap->pix.cfg->uv_swap) {
> +	if (RKISP1_IS_SEMI_PLANAR(cap->pix.cfg->write_format) &&
> +	    cap->pix.cfg->uv_swap) {
>  		u32 reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>  
>  		reg = reg | RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
> 
