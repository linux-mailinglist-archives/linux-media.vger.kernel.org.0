Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9E719CAA3
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 21:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388126AbgDBTx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 15:53:56 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46486 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731579AbgDBTx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 15:53:56 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id E0FF22913F2
Subject: Re: [PATCH v2 2/5] media: staging: rkisp1: cap: fix value written to
 uv swap register in selfpath
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org
References: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
 <20200402190419.15155-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <54055cf0-7f0c-7368-4984-7f78cf5446c9@collabora.com>
Date:   Thu, 2 Apr 2020 16:53:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200402190419.15155-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/2/20 4:04 PM, Dafna Hirschfeld wrote:
> The value RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP should be
> set to the register instead of masking with ~BIT(1)
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 5700d7be2819..84a3cf565106 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -469,8 +469,8 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
>  	if (cap->pix.cfg->uv_swap) {
>  		u32 reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>  
> -		rkisp1_write(rkisp1, reg & ~BIT(1),
> -			     RKISP1_CIF_MI_XTD_FORMAT_CTRL);
> +		reg = reg | RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
> +		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>  	}
>  
>  	rkisp1_mi_config_ctrl(cap);
> 
