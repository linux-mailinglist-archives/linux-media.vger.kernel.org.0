Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C8035258F
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 04:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbhDBCvE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 22:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234287AbhDBCvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 22:51:04 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD5BC0613E6
        for <linux-media@vger.kernel.org>; Thu,  1 Apr 2021 19:51:00 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id e14so5655190ejz.11
        for <linux-media@vger.kernel.org>; Thu, 01 Apr 2021 19:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j6XxPke5LD1nAipEXvkY6x4mx+Z9DuUCRz1Jm7iuUKA=;
        b=XxYgKbhyLhYwcqwHk/FPfahilkQhxmrZb04CQOEcZW2g6yH/Rovv91Y1IXHYuroxMb
         eZTexywFtIq6AOm5m+eWt9EuD3vbTgAA84ftEirqTn81D9Ab3PKopF5yF2ftK8tGZAAx
         XGgdYftYeFfWbKLDq7dEPaO72JdkPur/6H+rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j6XxPke5LD1nAipEXvkY6x4mx+Z9DuUCRz1Jm7iuUKA=;
        b=sxJSTv+8wdrykIo9fNar9+oDdfd4OCSW3y57oFha1G/U6jyQy8AbFKM+8AHy+8+fxe
         FKQOiyuXhlhlKtlTZOCbqZBSBuZU6QQNszRES3y6MCDP5Li6GqaUktkGdEJK6zLBvvwf
         xxtcnxUcwl+2GVwSNojpnn1iasF4c1TWAvf+CoiA6fV8AhqSzH2iALiT5WBVFmvI69Cm
         srkyX3T5fmL6qPg83cSB1bMwJtZQ/wdU6rJNwPT99ymwZYqgNiqxLGMF+ccH4Ekp0EUS
         2iiffwKhgBE2qrHziTvjMbPBLvkPrqvLuJB7VwwCiiu40Tg4uPgoBSBMUsYm73KnqPJj
         oNuQ==
X-Gm-Message-State: AOAM53134XCzBP4kKA8GZH/+f7EDxqS3ecqJ284Z1Cnl95OmTQ3wCfZA
        vQx3XNR4pxRTM2o+uedI5a/myW7DqGs/qw==
X-Google-Smtp-Source: ABdhPJwI3wdxO1QEkpLDNngIMRtFvsdqY/U24l2ESeju8159981jkLklJsCNC/gZ90kjkxgBWs12sQ==
X-Received: by 2002:a17:906:5597:: with SMTP id y23mr12171010ejp.165.1617331858632;
        Thu, 01 Apr 2021 19:50:58 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id g25sm4456458edp.95.2021.04.01.19.50.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 19:50:57 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id j9so3550865wrx.12
        for <linux-media@vger.kernel.org>; Thu, 01 Apr 2021 19:50:57 -0700 (PDT)
X-Received: by 2002:a05:6000:1549:: with SMTP id 9mr12962467wry.192.1617331856969;
 Thu, 01 Apr 2021 19:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210326095840.364424-1-ribalda@chromium.org> <20210326095840.364424-23-ribalda@chromium.org>
In-Reply-To: <20210326095840.364424-23-ribalda@chromium.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 2 Apr 2021 11:50:44 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BCydvzYx4FGyNQSbrT9twGVcFGn2vTfsvLHKYdRhE8GQ@mail.gmail.com>
Message-ID: <CAAFQd5BCydvzYx4FGyNQSbrT9twGVcFGn2vTfsvLHKYdRhE8GQ@mail.gmail.com>
Subject: Re: [PATCH v9 22/22] uvc: use vb2 ioctl and fop helpers
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Fri, Mar 26, 2021 at 7:00 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> From: Hans Verkuil <hverkuil@xs4all.nl>
>
> When uvc was written the vb2 ioctl and file operation helpers didn't exist.
>
> This patch switches uvc over to those helpers, which removes a lot of boilerplate
> code and simplifies VIDIOC_G/S_PRIORITY handling and allows us to drop the
> 'privileges' scheme, since that's now handled inside the vb2 helpers.
>
> This makes it possible for uvc to pass the v4l2-compliance streaming tests.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks for the patch. Did you perhaps miss adding your sign-off?

Also, see my comments inline.

[snip]
> @@ -1166,11 +969,6 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
>  {
>         struct uvc_fh *handle = fh;
>         struct uvc_streaming *stream = handle->stream;
> -       int ret;
> -
> -       ret = uvc_acquire_privileges(handle);
> -       if (ret < 0)
> -               return ret;

Why is it okay not to acquire the privileges here?

>
>         return uvc_v4l2_set_streamparm(stream, parm);
>  }

Best regards,
Tomasz
