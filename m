Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A376520B1B0
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgFZMs3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgFZMs3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:48:29 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5487BC08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 05:48:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C6AEF2A5AD8
Message-ID: <164269d27b1d5bd1a70adb0b53acbda0baa903aa.camel@collabora.com>
Subject: Re: [PATCH 1/4] media: staging: rkisp1: remove two unused fields in
 uapi struct
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Date:   Fri, 26 Jun 2020 09:47:50 -0300
In-Reply-To: <20200625185017.16493-2-dafna.hirschfeld@collabora.com>
References: <20200625185017.16493-1-dafna.hirschfeld@collabora.com>
         <20200625185017.16493-2-dafna.hirschfeld@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for all the rkisp1 patches, I hope we can get
the driver out of staging soon.

On Thu, 2020-06-25 at 20:50 +0200, Dafna Hirschfeld wrote:
> The fields 'config_width', 'config_height' in struct
> 'rkisp1_cif_isp_lsc_config' are not used by the driver and
> therefore are not needed. This patch removes them.
> In later patch, documentation of the fields in struct
> 'rkisp1_cif_isp_lsc_config' will be added.
> 

If I understand correctly, you are affecting the uAPI here.

The fact that the driver doesn't use it now, doesn't mean
it won't need it at some later point.

I'm not saying the change is wrong, but that the "not currently
in use" reason might be insufficient for a uAPI. If you
want to remove this field, I suggest you make sure
the field is inappropriate for this interface.

Also, it would be better if you could add a cover letter
on all the series, there are a bunch of rkisp1 patches now
and having a cover letter helps by adding some context.

Thanks,
Ezequiel

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


