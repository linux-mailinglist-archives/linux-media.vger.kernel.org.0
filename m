Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A981E8D4B
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 04:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgE3C5j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 22:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbgE3C5j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 22:57:39 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118E0C03E969;
        Fri, 29 May 2020 19:57:39 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t7so1960138plr.0;
        Fri, 29 May 2020 19:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=if6Kiedn+UJmCI3/EUhY4zmCmyfoaJuGcUVlUj9uKZs=;
        b=nRo1FWr6/J08csd5YTfXQi7muv6m3m8HaqiPrcRSRleWkrnixq+NlKd1iFJYv/5FIm
         ZV/GjVFWp7hsJK9OqQ2siN6e1OsCHll0+dTRnz2QJ1V5Vam8p1Ez69xy/XtGWltYLqC2
         kZA0SlkmB6g6uYIQ6ShNZY6L56H/3G0iXcTb2sipjpkrKTqbnKHCm7O4/dL5+Vw4jUI6
         URRW91r7HGhn3zrY3malFPE4BnyoWy59M+3vstpq/jJ9IKaGFN+l2WQwV3HovVcBlaN3
         Zb74l/18YwnZDC95U2+Wk/FmTnOVTOPv7A0PKPXqPF5EyEjedECoNWjUc9zKx9JFbW7M
         H5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=if6Kiedn+UJmCI3/EUhY4zmCmyfoaJuGcUVlUj9uKZs=;
        b=tNpxag4F2xUrXwu0j2O42aM4njcY9gxq790Ys6fnRGQPZpKAJxXeXVvNQgnGBQLgI/
         Oltb6y3rJn/WecNhDk/u6DCbeYPQ78zSbrxJ6J1l6GD3xZUOjNMm9uuDBORr2BBdgXgJ
         7b+8KLy9DtZCKZgHQ174yxzNFxeKwTh1SVV7ot+gRAXWlUoEyWwDtfAIvBcKyqbwZ+Dg
         31KpcYtFI5Vf0du1aXTXNsAwN4wMTb73iMcrK9OSPDbhhyIms14m9w5M514y9DLEuHcg
         MDeM9pFVN0vdV+WETQTqgnHmnckcL31Zj5ibHhDChjWlXNzrvMNiGGZLaXxjg/lqze7p
         TaFw==
X-Gm-Message-State: AOAM532Ovw9m/M53nRDvb4jUCUcOMmBwPVQi884/YTshcKx3jhkNmoyd
        tdoWYCkuiDe/0GV0goU6bqE=
X-Google-Smtp-Source: ABdhPJws4M1VtYgZQKyx750y6ALke8WHGLS3lix0xK9zPan/4iWuiY8FwmB51H/WRIbkr8vGyX9S/A==
X-Received: by 2002:a17:902:b40e:: with SMTP id x14mr1160203plr.285.1590807458510;
        Fri, 29 May 2020 19:57:38 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id q145sm8359604pfq.128.2020.05.29.19.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 19:57:38 -0700 (PDT)
Date:   Fri, 29 May 2020 19:57:35 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 5/9] staging: media: atomisp: fix stack overflow in
 init_pipe_defaults()
Message-ID: <20200530025735.GC1367069@ubuntu-s3-xlarge-x86>
References: <20200529200031.4117841-1-arnd@arndb.de>
 <20200529200031.4117841-5-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529200031.4117841-5-arnd@arndb.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 10:00:27PM +0200, Arnd Bergmann wrote:
> When building with clang, multiple copies of the structures to be
> initialized are passed around on the stack and copied locally, using an
> insane amount of stack space:
> 
> drivers/staging/media/atomisp/pci/sh_css.c:2371:1: error: stack frame size of 26864 bytes in function 'create_pipe' [-Werror,-Wframe-larger-than=]
> 
> Use constantly-allocated variables plus an explicit memcpy()
> to avoid that.
> 
> Fixes: 6dc9a2568f84 ("media: atomisp: convert default struct values to use compound-literals with designated initializers")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index e91c6029c651..1e8b9d637116 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -2264,6 +2264,12 @@ static enum ia_css_err
>  init_pipe_defaults(enum ia_css_pipe_mode mode,
>  		   struct ia_css_pipe *pipe,
>  		   bool copy_pipe) {
> +	static const struct ia_css_pipe default_pipe = IA_CSS_DEFAULT_PIPE;
> +	static const struct ia_css_preview_settings preview = IA_CSS_DEFAULT_PREVIEW_SETTINGS;
> +	static const struct ia_css_capture_settings capture = IA_CSS_DEFAULT_CAPTURE_SETTINGS;
> +	static const struct ia_css_video_settings video = IA_CSS_DEFAULT_VIDEO_SETTINGS;
> +	static const struct ia_css_yuvpp_settings yuvpp = IA_CSS_DEFAULT_YUVPP_SETTINGS;
> +
>  	if (!pipe)
>  	{
>  		IA_CSS_ERROR("NULL pipe parameter");
> @@ -2271,14 +2277,14 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
>  	}
>  
>  	/* Initialize pipe to pre-defined defaults */
> -	*pipe = IA_CSS_DEFAULT_PIPE;
> +	memcpy(pipe, &default_pipe, sizeof(default_pipe));
>  
>  	/* TODO: JB should not be needed, but temporary backward reference */
>  	switch (mode)
>  	{
>  	case IA_CSS_PIPE_MODE_PREVIEW:
>  		pipe->mode = IA_CSS_PIPE_ID_PREVIEW;
> -		pipe->pipe_settings.preview = IA_CSS_DEFAULT_PREVIEW_SETTINGS;
> +		memcpy(&pipe->pipe_settings.preview, &preview, sizeof(preview));
>  		break;
>  	case IA_CSS_PIPE_MODE_CAPTURE:
>  		if (copy_pipe) {
> @@ -2286,11 +2292,11 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
>  		} else {
>  			pipe->mode = IA_CSS_PIPE_ID_CAPTURE;
>  		}
> -		pipe->pipe_settings.capture = IA_CSS_DEFAULT_CAPTURE_SETTINGS;
> +		memcpy(&pipe->pipe_settings.capture, &capture, sizeof(capture));
>  		break;
>  	case IA_CSS_PIPE_MODE_VIDEO:
>  		pipe->mode = IA_CSS_PIPE_ID_VIDEO;
> -		pipe->pipe_settings.video = IA_CSS_DEFAULT_VIDEO_SETTINGS;
> +		memcpy(&pipe->pipe_settings.video, &video, sizeof(video));
>  		break;
>  	case IA_CSS_PIPE_MODE_ACC:
>  		pipe->mode = IA_CSS_PIPE_ID_ACC;
> @@ -2300,7 +2306,7 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
>  		break;
>  	case IA_CSS_PIPE_MODE_YUVPP:
>  		pipe->mode = IA_CSS_PIPE_ID_YUVPP;
> -		pipe->pipe_settings.yuvpp = IA_CSS_DEFAULT_YUVPP_SETTINGS;
> +		memcpy(&pipe->pipe_settings.yuvpp, &yuvpp, sizeof(yuvpp));
>  		break;
>  	default:
>  		return IA_CSS_ERR_INVALID_ARGUMENTS;
> -- 
> 2.26.2
> 
