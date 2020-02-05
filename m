Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03265153236
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 14:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbgBENsk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 08:48:40 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54014 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgBENsk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Feb 2020 08:48:40 -0500
Received: from [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae] (unknown [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2EE4D2947E6;
        Wed,  5 Feb 2020 13:48:35 +0000 (GMT)
Subject: Re: [PATCH] media: staging: rkisp1: improve inner documentation in
 rkisp1-isp.c
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
References: <20200204214446.20381-1-dafna.hirschfeld@collabora.com>
 <20200204214446.20381-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <2889763e-e3a8-50e3-180c-7dd1be8b2e1b@collabora.com>
Date:   Wed, 5 Feb 2020 10:48:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204214446.20381-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/4/20 7:44 PM, Dafna Hirschfeld wrote:
> Improve the documentation in the beginning of the file
> rkisp1-isp1.c
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-isp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index 2b0513e826fe..844556389b0b 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -28,9 +28,9 @@
>  #define RKISP1_DIR_SINK_SRC (RKISP1_DIR_SINK | RKISP1_DIR_SRC)
>  
>  /*
> - * NOTE: MIPI controller and input MUX are also configured in this file,
> - * because ISP Subdev is not only describe ISP submodule(input size,format,
> - * output size, format), but also a virtual route device.
> + * NOTE: MIPI controller and input MUX are also configured in this file.
> + * This is because ISP Subdev describes not only ISP submodule (input size,
> + * format, output size, format), but also a virtual route device.
>   */
>  
>  /*
> 
