Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC0F28E7F1
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 22:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387591AbgJNUka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 16:40:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52130 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbgJNUka (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 16:40:30 -0400
Received: from [IPv6:2804:14c:483:7f66::1004] (unknown [IPv6:2804:14c:483:7f66::1004])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B937C1F4582E;
        Wed, 14 Oct 2020 21:40:26 +0100 (BST)
Subject: Re: [PATCH 1/2] meida: uapi: add MEDIA_BUS_FMT_METADATA_FIXED media
 bus format.
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200922165813.19378-1-dafna.hirschfeld@collabora.com>
 <20200922165813.19378-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <efddfad8-1908-745e-5b7f-7acb42b531ca@collabora.com>
Date:   Wed, 14 Oct 2020 17:40:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20200922165813.19378-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/22/20 1:58 PM, Dafna Hirschfeld wrote:
> MEDIA_BUS_FMT_METADATA_FIXED should be used when
> the same driver handles both sides of the link and
> the bus format is a fixed metadata format that is
> not configurable from userspace.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  include/uapi/linux/media-bus-format.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 84fa53ffb13f..847b45fb546b 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -156,4 +156,12 @@
>  /* HSV - next is	0x6002 */
>  #define MEDIA_BUS_FMT_AHSV8888_1X32		0x6001
>  
> +/*
> + * This format should be used when the same driver handles
> + * both sides of the link and the bus format is a fixed
> + * metadata format that is not configurable from userspace.
> + * This format may have 0 height and width.
> + */
> +#define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> 
