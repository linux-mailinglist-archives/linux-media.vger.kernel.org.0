Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F2821B5AA
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 14:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgGJM7N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 08:59:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41736 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgGJM7N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 08:59:13 -0400
Received: from [IPv6:2804:14c:483:73a8::1002] (unknown [IPv6:2804:14c:483:73a8::1002])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0084E2A69A6;
        Fri, 10 Jul 2020 13:59:08 +0100 (BST)
Subject: Re: [PATCH] media: staging: rkisp1: remove duplicate macro definition
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200707181053.24134-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <66d18b0a-6528-9a67-ab4a-864141b0e459@collabora.com>
Date:   Fri, 10 Jul 2020 09:59:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200707181053.24134-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/7/20 3:10 PM, Dafna Hirschfeld wrote:
> The macro RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN is defined twice.
> Remove the second define.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-regs.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-regs.h b/drivers/staging/media/rkisp1/rkisp1-regs.h
> index 46018f435b6f..9b8e616ea24c 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-regs.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-regs.h
> @@ -398,7 +398,6 @@
>  #define RKISP1_CIF_ISP_AWB_YMAX_READ(x)			(((x) >> 2) & 1)
>  #define RKISP1_CIF_ISP_AWB_MODE_RGB_EN			((1 << 31) | (0x2 << 0))
>  #define RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN		((0 << 31) | (0x2 << 0))
> -#define RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN		((0 << 31) | (0x2 << 0))
>  #define RKISP1_CIF_ISP_AWB_MODE_MASK_NONE		0xFFFFFFFC
>  #define RKISP1_CIF_ISP_AWB_MODE_READ(x)			((x) & 3)
>  /* ISP_AWB_GAIN_RB, ISP_AWB_GAIN_G  */
> 
