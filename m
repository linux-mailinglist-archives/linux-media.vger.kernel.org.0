Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B920222C8E4
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 17:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgGXPV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 11:21:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35208 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgGXPVZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 11:21:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id B7DE129925A
Subject: Re: [PATCH 1/4] media: staging: rkisp1: remove two unused fields in
 uapi struct
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200625185017.16493-1-dafna.hirschfeld@collabora.com>
 <20200625185017.16493-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <183bc35a-e3ad-1558-c132-245192d94d35@collabora.com>
Date:   Fri, 24 Jul 2020 12:21:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200625185017.16493-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,


On 6/25/20 3:50 PM, Dafna Hirschfeld wrote:
> The fields 'config_width', 'config_height' in struct
> 'rkisp1_cif_isp_lsc_config' are not used by the driver and
> therefore are not needed. This patch removes them.
> In later patch, documentation of the fields in struct
> 'rkisp1_cif_isp_lsc_config' will be added.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> index ca0d031b14ac..7331bacf7dfd 100644
> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> @@ -285,8 +285,6 @@ struct rkisp1_cif_isp_lsc_config {
>  
>  	__u32 x_size_tbl[RKISP1_CIF_ISP_LSC_SIZE_TBL_SIZE];
>  	__u32 y_size_tbl[RKISP1_CIF_ISP_LSC_SIZE_TBL_SIZE];
> -	__u16 config_width;
> -	__u16 config_height;
>  } __packed;
>  
>  /**
> 


I was checking the Rockchip 3A library API, and they use these fields on:

https://github.com/rockchip-linux/camera_engine_rkisp/blob/master/rkisp/ia-engine/include/ia/rk_aiq_types.h#L409

Which I'm not sure what it means tbh, so I would rather leave these fields (with a comment to say it is not used
by the driver) just in case it is useful in the future.
Ideally we should try to understand what this field does to make a decision.

Regards,
Helen
