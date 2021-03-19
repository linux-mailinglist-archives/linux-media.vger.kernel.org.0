Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D700342054
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 15:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhCSO61 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 10:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhCSO6C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 10:58:02 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B616FC06174A;
        Fri, 19 Mar 2021 07:58:01 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 184so12327978ljf.9;
        Fri, 19 Mar 2021 07:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sJ2ckBr8rG842/p9pJHQAcXTu2nNfk05eIBdMt46NV4=;
        b=dExJvHBiQv5jcST0Eh+JScdKY3e0WXzCe0vIMEOkknbRHQPrkV3wedn4bgGVkp+PqK
         HLwzF135D+P7NZuvlTWmCCQZrrtzsPuKNVJwr0ONDYxdP8erAUB6t5hEVc+pJu59jHrl
         +LOcoRURACGvzBMiUMJEjSvMeysSbf+sp5uhqyIoDuejFVhsVMhfP37EEs1zgF32YZMb
         h8TlsM2oohBifwMSoPACgqtv8mhT5aJi2ctSxGHclRq5jvqjZhKlYK0WduSfSZD5jCHl
         Yl382BjpGEIx85wIaVyHyq3s59eYxxahP6K0XVRkAxNF7fovSKrFNLcv/BtaqO63Fos3
         gKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sJ2ckBr8rG842/p9pJHQAcXTu2nNfk05eIBdMt46NV4=;
        b=cn2huTPmUP2+0V/rbWN3TNF1tPx1O4Fc38RBdpGpPiP1SRHH92YvxTqEeNdumWnQbg
         uGftfl/EQvb3lb6s5dP+iDIwmD2YHO9JcUfWreP+r1z/xeohE+aQEG/vP8Wh97zKCe3i
         yWzZ+UF/an73dvVhseRONKaqNXwKABCrywzTIi8Zi+BlQ5eO194FTS2rV2/B4uQMbkF0
         qWWKGp+rDe5GZAjqoClfWqmftC8rqH7Kky1Aq8j/5v02IdJsRZHAfbCUIb9NJ/N3jUdP
         E/PI7rHTFOx1qwbwo7o5Wb6WEgvUgoxUuk3Tn5T6YVzJ950uMRc6VJipOBxbw4OhTPpD
         q/nA==
X-Gm-Message-State: AOAM531w8t4KqTE4Ddd7dYz2UP376y6bygsCDUo4DlWLRg+ahNqrVPkX
        i4hMm9D58OqmCc18MpaaW5nP/DYhio67KDSa9+lKW7P77rk=
X-Google-Smtp-Source: ABdhPJwHXUEPP6QO+XZjPd83uf3JxuPwHArbre0cdfrEbUTfh2zIbyT6R+4u8IYpemlkEDKahdi7YYbXePWqspTmZRA=
X-Received: by 2002:a2e:878c:: with SMTP id n12mr1239111lji.58.1616165880247;
 Fri, 19 Mar 2021 07:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <YFS5axzOQEJN6fHI@mwanda>
In-Reply-To: <YFS5axzOQEJN6fHI@mwanda>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Fri, 19 Mar 2021 15:57:44 +0100
Message-ID: <CAPybu_1tZgCY6NKnbH+MovHGNEUzGeN=4oF-dG407H0wQ7oSWA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix GFP_ flags in uvc_submit_urb()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan

On Fri, Mar 19, 2021 at 3:48 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The uvc_submit_urb() function is supposed to use the passed in GFP_
> flags but this code accidentally uses GFP_KERNEL instead.  Some of
> the callers are passing GFP_ATOMIC so presumably this can lead to
> sleeping in atomic context.
>
> Fixes: b20f917f84e6 ("media: uvcvideo: Use dma_alloc_noncontiguous API")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I reported the same issue just some minutes ago. Christoph has already
fixed the patch in his tree.

Where did you get the patchset? from next? from linus? or directly
from Chirstoph tree?

Thanks!

> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index cdd8eb500bb7..a777b389a66e 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1119,7 +1119,7 @@ static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
>         dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
>                                     uvc_urb->sgt,
>                                     uvc_stream_dir(uvc_urb->stream));
> -       return usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
> +       return usb_submit_urb(uvc_urb->urb, mem_flags);
>  }
>
>  /*
> --
> 2.30.2
>


-- 
Ricardo Ribalda
