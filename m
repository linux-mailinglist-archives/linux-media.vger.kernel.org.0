Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179454956ED
	for <lists+linux-media@lfdr.de>; Fri, 21 Jan 2022 00:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244278AbiATXWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 18:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244267AbiATXWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 18:22:40 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146ABC06173F
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 15:22:40 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id d12-20020a17090a628c00b001b4f47e2f51so8885073pjj.3
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 15:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=imN5PvVtPTz2YcP5NQPt/W/LDan5J3d7+b7lwRKpENs=;
        b=AN6zfpw2dGiH7CaaVqKo/sucWFrKdxQ/1YfXRrsCEBa4kx4FvfZZeOFgMoiQM90Vbz
         bk7WWPVYlxjtIEC1Jmvt0lu5xh0R9aft0AcZGQ81jlCGvAz1/evPqoJ6kncr9XSNoxGg
         DZveYAmqzk+c+1wi7JZYxvblHWFiaO9yw72eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=imN5PvVtPTz2YcP5NQPt/W/LDan5J3d7+b7lwRKpENs=;
        b=44j1ZuZ79vsWHZGzRbvQ4k2hMme72ZdBjm+3ZBsBJZFYeKZYVVRiCGXTr1FLh9SINo
         Abo7XvX+zhynkz7a3QKOka3mnmxYQVmwArkG8VVLnYlR+fUQldsuov+iNqI8i5ujU7aO
         G+a4gm/vLox1QBAvpcIF99QQvrRnEBjNVeO/3SCZ+GaBS63sJFiz/QSpSgchqk/HroWJ
         jTndXfQDwg9JiaV9qAbzKa+9+xPSdQ8OGl8XVHsbnTqXQG2y8BH0xKMV0jEaCEGSSTEa
         /7hygsbjPb9eEwNTLdD2bWkd+vTXT1pJw9szQwmY+KzK9uFed59bHtSC5jhmZkVKfE19
         WoCg==
X-Gm-Message-State: AOAM531kNwwAS/i8UebKrQl3tOBd/kP7VdoCnee53Pq3sqxiTo5AWmnQ
        bkqEEyiNaOcFDVLHsg3OFuOHxw==
X-Google-Smtp-Source: ABdhPJxFUkCilitPM/r52/bO/XBRSO8oRJNM0M+icyWtgSsISI2hz/KfSO+jmh2S9hRYUi1cvSV2pQ==
X-Received: by 2002:a17:90b:1806:: with SMTP id lw6mr13495356pjb.210.1642720959577;
        Thu, 20 Jan 2022 15:22:39 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g19sm4655451pfv.11.2022.01.20.15.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 15:22:39 -0800 (PST)
Date:   Thu, 20 Jan 2022 15:22:38 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] media: usb: pwc-uncompress: Use struct_size()
 helper in pwc_decompress()
Message-ID: <202201201522.7BEEF4E@keescook>
References: <20220120212434.GA30630@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120212434.GA30630@embeddedor>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 20, 2022 at 03:24:34PM -0600, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worst scenario, could lead to heap overflows.
> 
> Also, address the following sparse warnings:
> drivers/media/usb/pwc/pwc-uncompress.c:44:44: warning: using sizeof on a flexible structure
> 
> Link: https://github.com/KSPP/linux/issues/174
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Yup, happy to see these getting changed.

Reviewed-by: Kees Cook <keescook@chromium.org>

> ---
>  drivers/media/usb/pwc/pwc-uncompress.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/pwc/pwc-uncompress.c b/drivers/media/usb/pwc/pwc-uncompress.c
> index 68bc3829c6b3..faf44cdeb268 100644
> --- a/drivers/media/usb/pwc/pwc-uncompress.c
> +++ b/drivers/media/usb/pwc/pwc-uncompress.c
> @@ -41,7 +41,7 @@ int pwc_decompress(struct pwc_device *pdev, struct pwc_frame_buf *fbuf)
>  		memcpy(raw_frame->cmd, pdev->cmd_buf, 4);
>  		memcpy(raw_frame+1, yuv, pdev->frame_size);
>  		vb2_set_plane_payload(&fbuf->vb.vb2_buf, 0,
> -			pdev->frame_size + sizeof(struct pwc_raw_frame));
> +			struct_size(raw_frame, rawframe, pdev->frame_size));
>  		return 0;
>  	}
>  
> -- 
> 2.27.0
> 

-- 
Kees Cook
