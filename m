Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C15274F00EA
	for <lists+linux-media@lfdr.de>; Sat,  2 Apr 2022 13:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354718AbiDBLED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Apr 2022 07:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354744AbiDBLD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Apr 2022 07:03:57 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A6718C0C4
        for <linux-media@vger.kernel.org>; Sat,  2 Apr 2022 04:02:00 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id e4so5258318oif.2
        for <linux-media@vger.kernel.org>; Sat, 02 Apr 2022 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pBkijb7QXoDzZniUJ2hFokcd2stad4oEnT5kRTcgzjA=;
        b=uK4akDp91FjPETNKtN0+UonuyfiHZs+xLXXDltX1PLA7ySb3RMu0cAsYTm0Owlg4ML
         4vd9jHByPAwqR2ncySGLs8hgf1lROVCPmmk4tx4jd8dzp4Fc0a1j37AruakkAmQs6a6c
         pgUUrghBpPlhqKU80rdPHcjt08cC7XJGQPN7q2aVYMAPia2dJq+UEh6p47C4jvH2PaIl
         qoiNsGEz2Q+qcF7uMS2LsrSuDiDelO306K53R72v3VCOu04OYk07VnhcDaF5Dlh05gjE
         W4biFBZ3K5B+bj8H7HF/MGI1EFFTw+2BJ6umDip3EZOHM/rEfdkHS1W3DHkiiXJKRXt7
         PSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pBkijb7QXoDzZniUJ2hFokcd2stad4oEnT5kRTcgzjA=;
        b=OUaauuRcnThuub8NUaLhgvygxvTiHBRyomIjGUf3LBwWEaWJVVXhAZIV2KqR63SSgd
         /IXZV+/hB43KB/YoB1YUZYuEvUgIBXydQ4teXoFBn2oW+M8RvlXYCvKa66vNV06H+CnV
         vaMw2Vy+8Eg5Lpc1XwmDHmR7Ahvob16REZEnxL49o8dGRCwiBQJMMLoWEWqi3jWHysj3
         04hznbUY4gfeajtxox0Qg/TBvrzCp0nYvKXxvTUvcHMSeQnAZc5B4vZly4nu8STjQXHy
         Qvlk7+r4lgmpwZG7c/WLrfW0v/Ibks0bZ5/+KqdZtHjzeu2/qmEGuRXyZjDscs3l+h+K
         SoYg==
X-Gm-Message-State: AOAM531cVdx0hnVgdmxv2NN/pAzAyrR9b6id98dq+YuKal2NaL2HUF2i
        S/KKJb8UvuNryhKaMFgkeBQCLQ==
X-Google-Smtp-Source: ABdhPJzLzIG0sQ5R0nVxmR6BnRqxDBhUcZ6RlOAEXSq4wzjgjF4yTIeFWuF2ONkmKZorNq2hWb9Vsw==
X-Received: by 2002:a05:6808:f07:b0:2da:4916:578c with SMTP id m7-20020a0568080f0700b002da4916578cmr6839883oiw.239.1648897319801;
        Sat, 02 Apr 2022 04:01:59 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id g8-20020a9d2d88000000b005b238f7551csm2161667otb.53.2022.04.02.04.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:01:59 -0700 (PDT)
Date:   Sat, 2 Apr 2022 08:01:54 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@collabora.com,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/23] media: h264: Avoid wrapping long_term_frame_idx
Message-ID: <YkgtIgCoY78oI902@eze-laptop>
References: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
 <20220331193726.289559-5-nicolas.dufresne@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331193726.289559-5-nicolas.dufresne@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 31, 2022 at 03:37:06PM -0400, Nicolas Dufresne wrote:
> For long term references, frame_num is set to long_term_frame_idx which
> does not require wrapping. This is fixed by observation, no directly
> related issue have been found yet.
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/media/v4l2-core/v4l2-h264.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
> index 5633a242520a..ac47519a9fbe 100644
> --- a/drivers/media/v4l2-core/v4l2-h264.c
> +++ b/drivers/media/v4l2-core/v4l2-h264.c
> @@ -57,8 +57,10 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
>  		 * '8.2.4.1 Decoding process for picture numbers' of the spec.
>  		 * TODO: This logic will have to be adjusted when we start
>  		 * supporting interlaced content.
> +		 * For long term references, frame_num is set to
> +		 * long_term_frame_idx which requires no wrapping.
>  		 */
> -		if (dpb[i].frame_num > cur_frame_num)
> +		if (!b->refs[i].longterm && dpb[i].frame_num > cur_frame_num)
>  			b->refs[i].frame_num = (int)dpb[i].frame_num -
>  					       max_frame_num;
>  		else
> -- 
> 2.34.1
> 
