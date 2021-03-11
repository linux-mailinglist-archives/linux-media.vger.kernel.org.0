Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04263337554
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 15:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233507AbhCKOUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 09:20:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233272AbhCKOTj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 09:19:39 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511B0C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 06:19:39 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6CFEC1F44AF7
Message-ID: <380ad070b1b6904f2b607b2ff5d4725124c336c2.camel@collabora.com>
Subject: Re: [PATCH 07/13] staging: media: hantro: fix kernel-doc formatting
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Date:   Thu, 11 Mar 2021 11:19:31 -0300
In-Reply-To: <20210311102022.96954-8-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
         <20210311102022.96954-8-hverkuil-cisco@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the fix.

On Thu, 2021-03-11 at 11:20 +0100, Hans Verkuil wrote:
> - @h264_dec was not documented, add that trivial change
> - it is not possible to document a global variable in kernel-doc,
>   change to use 'DOC:' instead
> - fix mismatched struct name (hantro_vp8d_hw_ctx -> hantro_vp8_dec_hw_ctx)
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel
 
> ---
>  drivers/staging/media/hantro/hantro.h    | 3 ++-
>  drivers/staging/media/hantro/hantro_hw.h | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 65f9f7ea7dcf..6c1b888abe75 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -214,6 +214,7 @@ struct hantro_dev {
>   *
>   * @codec_ops:         Set of operations related to codec mode.
>   * @postproc:          Post-processing context.
> + * @h264_dec:          H.264-decoding context.
>   * @jpeg_enc:          JPEG-encoding context.
>   * @mpeg2_dec:         MPEG-2-decoding context.
>   * @vp8_dec:           VP8-decoding context.
> @@ -293,7 +294,7 @@ struct hantro_postproc_regs {
>  /* Logging helpers */
>  
>  /**
> - * debug - Module parameter to control level of debugging messages.
> + * DOC: hantro_debug: Module parameter to control level of debugging messages.
>   *
>   * Level of debugging messages can be controlled by bits of
>   * module parameter called "debug". Meaning of particular
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 34c9e4649a25..65a9eaf5bb18 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -99,7 +99,7 @@ struct hantro_mpeg2_dec_hw_ctx {
>  };
>  
>  /**
> - * struct hantro_vp8d_hw_ctx
> + * struct hantro_vp8_dec_hw_ctx
>   * @segment_map:       Segment map buffer.
>   * @prob_tbl:          Probability table buffer.
>   */


