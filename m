Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B10521D486
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729492AbgGMLHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:07:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36948 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729318AbgGMLHQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:07:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 49DE32A0D5F
Subject: Re: [PATCH 1/4] media: staging: rkisp1: remove unused field
 ctrl_handler from struct rkisp1_device
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200629065754.26621-1-dafna.hirschfeld@collabora.com>
 <20200629065754.26621-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <b2651b90-a514-1b9c-7d07-944e3b24dbdb@collabora.com>
Date:   Mon, 13 Jul 2020 08:07:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200629065754.26621-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/29/20 3:57 AM, Dafna Hirschfeld wrote:
> The field ctrl_handler in struct rkisp1_device is not used.
> This patch removes it.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks

> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 45e554169224..eb0dbc42d09c 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -250,7 +250,6 @@ struct rkisp1_device {
>  	unsigned int clk_size;
>  	struct clk_bulk_data clks[RKISP1_MAX_BUS_CLK];
>  	struct v4l2_device v4l2_dev;
> -	struct v4l2_ctrl_handler ctrl_handler;
>  	struct media_device media_dev;
>  	struct v4l2_async_notifier notifier;
>  	struct rkisp1_sensor_async *active_sensor;
> 
