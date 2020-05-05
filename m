Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BB71C5797
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 15:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgEEN4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 09:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729220AbgEEN4R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 09:56:17 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59128C061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 06:56:17 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id t12so1922732edw.3
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kByI+w+1r3yVREOJZ6z093OJKNl72Y1CH8ahM0Q63XY=;
        b=ipNtgkcPwQaCd/KFAKKCzEcUcKFCfb7x3z4NEVWMwUh94Bu54C4AbN3A72Y5hKnJ+n
         oiStdLca3s0SQIKFEVG/KxqF9OkQx3cbrCDG4u9U3+xQz/xE655gmDYg1+OJeblGE2Iu
         Y38P1mTpYn7m6tr5ZZYBBkCmxVOIAJ/Cck6YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kByI+w+1r3yVREOJZ6z093OJKNl72Y1CH8ahM0Q63XY=;
        b=djGevUxUYqZROacET9Gvz3xZZqMbPHoJj+kB5bcY+S2TX0stqCDXfpFwGIUWIT4OmJ
         RywVuOAGVUzALVvrOl+yIQLGhIS9HHeBC8SeBUMUsMU17cWLxPnReOb7HxbOjLk2Mi5S
         zpVd4z7/oRptPk7raoQyF5mDUD2KROTAUlFcarAbw4RASqyMdEkXw1yDufd/c2FeJfEO
         FmFumOlDJFp7xzRH5xG2XFMVwl9+odELSYPUDYfNdBHdWXai+co0OmPy0zVSY6nCSJ57
         DMwBFc9pX49k6W8RHY/vyBfGfwsfFrrY41q90rkBKLi3CHGlJiSM2wEImeBYLsoZmljT
         eh+w==
X-Gm-Message-State: AGi0PuYh+Qwe0ot5YFNKoFSyBuTCxgMm/f33QaOEBh46HX+jNPtamoRy
        K+ijeBZl+fqNQgwfvFS8g+q7XTExir0Ilg==
X-Google-Smtp-Source: APiQypIoeLR7kmETBPiQ1CEybmuPKWyqe6eSRexa0/Ao4HKD45hbW1MaDRQTFhxYd+cCpzFsZLhavg==
X-Received: by 2002:a50:d79d:: with SMTP id w29mr1660898edi.187.1588686975637;
        Tue, 05 May 2020 06:56:15 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id v8sm326970eje.48.2020.05.05.06.56.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 06:56:14 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id s8so2838390wrt.9
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 06:56:14 -0700 (PDT)
X-Received: by 2002:adf:d0d1:: with SMTP id z17mr3809161wrh.295.1588686973780;
 Tue, 05 May 2020 06:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200505134110.3435-1-ezequiel@collabora.com> <20200505134110.3435-2-ezequiel@collabora.com>
In-Reply-To: <20200505134110.3435-2-ezequiel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 5 May 2020 15:56:02 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AWZFoPk2YTp2k8M7LvJshxw46-z+wK2VoM9EzB2CqiFA@mail.gmail.com>
Message-ID: <CAAFQd5AWZFoPk2YTp2k8M7LvJshxw46-z+wK2VoM9EzB2CqiFA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] media: rkvdec: Fix .buf_prepare
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Tue, May 5, 2020 at 3:41 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> The driver should only set the payload on .buf_prepare
> if the buffer is CAPTURE type, or if an OUTPUT buffer
> has a zeroed payload.

Thanks for the patch. Just one question below.

Where does the requirement to set OUTPUT buffer bytesused to sizeimage
if the original bytesused is 0 come from?

Best regards,
Tomasz

>
> Fix it.
>
> Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 225eeca73356..4df2a248ab96 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -456,7 +456,15 @@ static int rkvdec_buf_prepare(struct vb2_buffer *vb)
>                 if (vb2_plane_size(vb, i) < sizeimage)
>                         return -EINVAL;
>         }
> -       vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
> +
> +       /*
> +        * Buffer's bytesused is written by the driver for CAPTURE buffers,
> +        * or if the application passed zero bytesused on an OUTPUT buffer.
> +        */
> +       if (!V4L2_TYPE_IS_OUTPUT(vq->type) ||
> +           (V4L2_TYPE_IS_OUTPUT(vq->type) && !vb2_get_plane_payload(vb, 0)))
> +               vb2_set_plane_payload(vb, 0,
> +                                     f->fmt.pix_mp.plane_fmt[0].sizeimage);
>         return 0;
>  }
>
> --
> 2.26.0.rc2
>
