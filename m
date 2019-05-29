Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C17082D430
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 05:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfE2DWs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 23:22:48 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:39977 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfE2DWs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 23:22:48 -0400
Received: by mail-it1-f193.google.com with SMTP id h11so1248964itf.5
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 20:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E1fmggBKAc4yv08K4z/HLewET8ECsSyJvY8Z2EAzIDA=;
        b=KPPtBj/u3ZZ3t0gt8za2zoDyoRqIEUwitrm/x7aVZwYvK5rXz3x3PZk6ykxeBqsti+
         REaUgsM+eWI/sE/MQg8RDhipFqMXIRfhN0sTSJz3efZYAvUlfCB9ryanbIFqqCmVK0zA
         aJRfuRi0bgdRyZIDaf8zqLAs/IaULqnu7Erp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E1fmggBKAc4yv08K4z/HLewET8ECsSyJvY8Z2EAzIDA=;
        b=qAikzg5nSrCblUKXmIUvK8scVihI+w/TrDyn16slnEdNACCWY56r17VSBH6lH9QmAm
         ZsmrAGsLD/mho9RNOmvUd7Xl0z698PXyoSm6aNL2UiSXnlUL3OJXWYsGkckdGrEZLSPK
         IJDKs4BQCLWAf+7vA6LDOxOhnDAGzI2NVXj/9xFvGmNUReEno3VnRk4LQaUE9UF1aC24
         HMRbSruNO+E08gtPUBBDeii4jMDtTHxEG4z/EOwbMyhRch2bFLzixodcAVg8A0eeZJIg
         slVVjIJA++pReDa+DHajCB/I0sbxp4zEUO/e/gzTruE+0G3CfltTWDrBSluoZd6J5YPH
         SvyA==
X-Gm-Message-State: APjAAAU2FPzyZcpHia1h2Hn/d1xjYIELFudBXchxn1K4pXEPUp0dathj
        cbjzvBg46czUvn2q9HZ5kUe0iTKSJf8TAiUs
X-Google-Smtp-Source: APXvYqxPDCVnBe1xZ4o8J/63DRRsYJpDc3AQGuTY0GiLH/6y4Oy6Lbt1WNH6NwUlzIUj4OzrWdIA0w==
X-Received: by 2002:a24:d28a:: with SMTP id z132mr2151435itf.48.1559100167657;
        Tue, 28 May 2019 20:22:47 -0700 (PDT)
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id f1sm5181595iop.53.2019.05.28.20.22.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 20:22:46 -0700 (PDT)
Received: by mail-it1-f182.google.com with SMTP id g24so1286572iti.5
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 20:22:46 -0700 (PDT)
X-Received: by 2002:a24:bd4:: with SMTP id 203mr5648321itd.119.1559100166450;
 Tue, 28 May 2019 20:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190528083437.103215-1-hverkuil-cisco@xs4all.nl> <20190528083437.103215-3-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190528083437.103215-3-hverkuil-cisco@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 29 May 2019 12:22:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CUpFLV4Efy6yJ1RZPuxc=s+X4irLnEcYeVq5k5XR_8dQ@mail.gmail.com>
Message-ID: <CAAFQd5CUpFLV4Efy6yJ1RZPuxc=s+X4irLnEcYeVq5k5XR_8dQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] vicodec: use new v4l2_m2m_ioctl_try_en/decoder_cmd funcs
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 28, 2019 at 5:34 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Use the new helper functions for the try_de/decoder_cmd ioctls.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/platform/vicodec/vicodec-core.c | 35 +++----------------
>  1 file changed, 4 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
> index bd01a9206aa6..71abc87b7b59 100644
> --- a/drivers/media/platform/vicodec/vicodec-core.c
> +++ b/drivers/media/platform/vicodec/vicodec-core.c
> @@ -1188,25 +1188,13 @@ static void vicodec_mark_last_buf(struct vicodec_ctx *ctx)
>         spin_unlock(ctx->lock);
>  }
>
> -static int vicodec_try_encoder_cmd(struct file *file, void *fh,
> -                               struct v4l2_encoder_cmd *ec)
> -{
> -       if (ec->cmd != V4L2_ENC_CMD_STOP)
> -               return -EINVAL;
> -
> -       if (ec->flags & V4L2_ENC_CMD_STOP_AT_GOP_END)
> -               return -EINVAL;
> -
> -       return 0;
> -}
> -
>  static int vicodec_encoder_cmd(struct file *file, void *fh,
>                             struct v4l2_encoder_cmd *ec)
>  {
>         struct vicodec_ctx *ctx = file2ctx(file);
>         int ret;
>
> -       ret = vicodec_try_encoder_cmd(file, fh, ec);
> +       ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
>         if (ret < 0)
>                 return ret;
>
> @@ -1214,28 +1202,13 @@ static int vicodec_encoder_cmd(struct file *file, void *fh,
>         return 0;
>  }
>
> -static int vicodec_try_decoder_cmd(struct file *file, void *fh,
> -                               struct v4l2_decoder_cmd *dc)
> -{
> -       if (dc->cmd != V4L2_DEC_CMD_STOP)
> -               return -EINVAL;
> -
> -       if (dc->flags & V4L2_DEC_CMD_STOP_TO_BLACK)
> -               return -EINVAL;
> -
> -       if (!(dc->flags & V4L2_DEC_CMD_STOP_IMMEDIATELY) && (dc->stop.pts != 0))
> -               return -EINVAL;
> -
> -       return 0;
> -}
> -
>  static int vicodec_decoder_cmd(struct file *file, void *fh,
>                             struct v4l2_decoder_cmd *dc)
>  {
>         struct vicodec_ctx *ctx = file2ctx(file);
>         int ret;
>
> -       ret = vicodec_try_decoder_cmd(file, fh, dc);
> +       ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
>         if (ret < 0)
>                 return ret;
>
> @@ -1326,9 +1299,9 @@ static const struct v4l2_ioctl_ops vicodec_ioctl_ops = {
>         .vidioc_g_selection     = vidioc_g_selection,
>         .vidioc_s_selection     = vidioc_s_selection,
>
> -       .vidioc_try_encoder_cmd = vicodec_try_encoder_cmd,
> +       .vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
>         .vidioc_encoder_cmd     = vicodec_encoder_cmd,
> -       .vidioc_try_decoder_cmd = vicodec_try_decoder_cmd,
> +       .vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
>         .vidioc_decoder_cmd     = vicodec_decoder_cmd,
>         .vidioc_enum_framesizes = vicodec_enum_framesizes,
>
> --
> 2.20.1
>

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
