Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B2A73A2B2
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 16:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbjFVOLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 10:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbjFVOL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 10:11:29 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C581AC
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 07:11:27 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f9c0abc8b1so19777905e9.1
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687443086; x=1690035086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GHxJuqmuhPWFpQhIFC68lKcmCkInE/kiaYAhaHcn0+Y=;
        b=gEz/PAQ1qIP5WZun0LdTuL2gGMzh3DxKsvzmJ6Q0I9nak7WYgFwIua8o4b7DyFjInu
         SH+yb8hYWg8DPwV1viEU6ZlC5W12dzJ0cpS2WhYFT+HXtgViha0pmeDj9pynoswZZOTF
         P/sVO4e/j0gRgSpCoWweryl6LRW3mzxc+ShAtTe6cVPWa+CAxgZSyLrflRN7eA/KAapm
         ub1C0L2rIcRzkgBqnTbcW75iwVmmT8HRAKNXuHDGEi4rT3fGAi2MDTpm1XQbWGrx9Gzd
         RmYbgNRvkmPX0g4ourdc60JrhU8l+mRk/wFWm+1F6nQcKJZEAzhKd8wx7xJunOOfg0nk
         9TzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687443086; x=1690035086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHxJuqmuhPWFpQhIFC68lKcmCkInE/kiaYAhaHcn0+Y=;
        b=j3hX47fDmnA6X1b0658uswOUOrmcCPXhSFsKDlUb/uLGmdS9l6egZe9AqpihsMAnlw
         0SdKFY1XpwHNHNUV6cIJV3gdSjRRh3v8mNq6W4LhrmLhDlLSJiYqyt6KMtcCzsbm/YtP
         zdmfp6D9G+yk4fMgQ/3RRHIewnKdRyhlzPRakTuQz01XwO/JAF2XyI5/MKQJAjkSeTay
         ac02tXYhfcdAUyQaImYl0ySQEdSJGGNs4KcWpo2yMiPUyPOIxChWZZYbF39FtzhtLOSS
         tb5sTayHZmhkr2MikPgt0q4uhlndH4xgsPrx2zNjHATYEZxXsZ61yB2sDUA346V9yQRN
         3uNQ==
X-Gm-Message-State: AC+VfDzscnW19lr9lJJ6LvH8CnnZ3XhfoAXTrQlAposAEJ2kJdnaJ7y4
        Q2IWJaIAXRx7Rh4XRlm7dZ6R3g==
X-Google-Smtp-Source: ACHHUZ6BmQp3My+dLgyfXTj9FadTnh4ZdU89bg6m7H4+QQzmHulg0AjgY/idmg/TybIPzxG+o/8epA==
X-Received: by 2002:a7b:c3d3:0:b0:3f9:b7cf:262f with SMTP id t19-20020a7bc3d3000000b003f9b7cf262fmr6889086wmj.4.1687443086247;
        Thu, 22 Jun 2023 07:11:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p24-20020a1c7418000000b003f9c859894esm3753202wmc.7.2023.06.22.07.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:11:24 -0700 (PDT)
Date:   Thu, 22 Jun 2023 17:11:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com
Subject: Re: [PATCH v3 03/11] media: videobuf2: Remove VB2_MAX_FRAME limit on
 buffer storage
Message-ID: <bddd6cb7-cd72-4fb5-8d4a-d02cb9c46dce@kadam.mountain>
References: <20230622131349.144160-1-benjamin.gaignard@collabora.com>
 <20230622131349.144160-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622131349.144160-4-benjamin.gaignard@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 22, 2023 at 03:13:41PM +0200, Benjamin Gaignard wrote:
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index f1ff7af34a9f..86e1e926fa45 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -455,9 +455,9 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  	struct vb2_buffer *vb;
>  	int ret;
>  
> -	/* Ensure that q->num_buffers+num_buffers is below VB2_MAX_FRAME */
> +	/* Ensure that q->num_buffers + num_buffers is UINT_MAX */
>  	num_buffers = min_t(unsigned int, num_buffers,
> -			    VB2_MAX_FRAME - q->num_buffers);
> +			    UINT_MAX - q->num_buffers);
>  
>  	for (buffer = 0; buffer < num_buffers; ++buffer) {
>  		/* Allocate vb2 buffer structures */

Ah...  Here's one of the integer overflow bugs I was talking about.  The
__vb2_queue_alloc() function returns an int so if num_buffers goes over
INT_MAX we are hosed.

regards,
dan carpenter

