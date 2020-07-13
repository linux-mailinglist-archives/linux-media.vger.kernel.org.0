Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A636921D48E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgGMLJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:09:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36986 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbgGMLJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:09:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 345C22A0D5F
Subject: Re: [PATCH 2/4] media: staging: rkisp1: remove unused field alloc_ctx
 from struct rkisp1_device
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200629065754.26621-1-dafna.hirschfeld@collabora.com>
 <20200629065754.26621-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <a251e78a-1229-6165-f84b-92e5601f01fd@collabora.com>
Date:   Mon, 13 Jul 2020 08:09:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200629065754.26621-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/29/20 3:57 AM, Dafna Hirschfeld wrote:
> The field alloc_ctx in struct rkisp1_device is not used.
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
> index eb0dbc42d09c..b7dc523dd8f0 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -259,7 +259,6 @@ struct rkisp1_device {
>  	struct rkisp1_stats stats;
>  	struct rkisp1_params params;
>  	struct media_pipeline pipe;
> -	struct vb2_alloc_ctx *alloc_ctx;
>  	struct mutex stream_lock;
>  	struct rkisp1_debug debug;
>  };
> 
