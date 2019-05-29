Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A36602D41F
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 05:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbfE2DMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 23:12:07 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37775 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfE2DMH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 23:12:07 -0400
Received: by mail-io1-f67.google.com with SMTP id e5so568100iok.4
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 20:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uGkt6LVKTTk0hG+81AVIH3dJXFGMsVuNPu6Rn+P4vpE=;
        b=eNDsudjuERIajkgVmIZ/6sZhuepoI9c5wE2NPZZ3tufFXfPHwg2YVtr9f9Q5Kn5Bi0
         Vu4a5p7G+eJZXToXF/tQ6UDmwkp8KT1hO8+uc0Ervzh4tl1vF7b7mVGfMmHcUZmiHYUa
         wxDQ/b8uf6AfK5gSfmLUtuDv3u2FW3X+vY+U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uGkt6LVKTTk0hG+81AVIH3dJXFGMsVuNPu6Rn+P4vpE=;
        b=TcIiHnPMWsTmjmVvMRcF89XLwnb1grczBeMxsjsw80x7MadccOWaBY4iboFBnVejGs
         n/Dmfis0cIjZSYMQGepVpKvY14gaqXRQ3tDSBTu0IlDuA1D86zrmcvHMX+ntKkk3mDDi
         oSBkEbEVVSihO9m4uJAHOIUbiewKJYESR1iCrns5oxpWFnma/XdY6+KvG6oI2Woe8IJP
         xzRINryb4cNdnyWMsL261lcmDvU1wnhZXkHXxUi7XUik+2zuiV/9AZwSTR8w5OB5PZDU
         jSg6jnbMk6rZSmAhRQks+xO6UmE75d0xV3/yzGRpL1kB4bmdMBvcuyfqBVlXEP2cwdpS
         IMEA==
X-Gm-Message-State: APjAAAWhcyiLMaWr9nQBwFyx6TYwVcOZPuPMauTC1xCtM/H7OuoJheP8
        /E4mzPKw7Yp1QU+SIjbzctkR6VqU0wg=
X-Google-Smtp-Source: APXvYqz9wegVRapWssIFUBeWQ+LD1QafM23xAqTF+Gdxo0DFJvpkBTazC9Ol1dkKgvBDm1oGDakfhg==
X-Received: by 2002:a6b:6d07:: with SMTP id a7mr14710255iod.254.1559099526369;
        Tue, 28 May 2019 20:12:06 -0700 (PDT)
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id 1sm493905itx.40.2019.05.28.20.12.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 20:12:05 -0700 (PDT)
Received: by mail-it1-f169.google.com with SMTP id t184so1283223itf.2
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 20:12:05 -0700 (PDT)
X-Received: by 2002:a24:2249:: with SMTP id o70mr5499718ito.101.1559099525004;
 Tue, 28 May 2019 20:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190528083437.103215-1-hverkuil-cisco@xs4all.nl> <20190528083437.103215-2-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190528083437.103215-2-hverkuil-cisco@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 29 May 2019 12:11:53 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CaiNfpvopRYAL-r=6JN9Peat0nciqh=K8h53P4_=umXg@mail.gmail.com>
Message-ID: <CAAFQd5CaiNfpvopRYAL-r=6JN9Peat0nciqh=K8h53P4_=umXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] v4l2-mem2mem: add try_en/decoder_cmd ioctl helpers
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

Hi Hans,

On Tue, May 28, 2019 at 5:34 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Most if not all codecs will need to implement these ioctls and
> it is expected to be the same for all codecs. So add this to
> the core v4l2-mem2mem framework so that this code can easily be
> reused.
>

Thanks for the patch. Please see my comments inline.

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 32 ++++++++++++++++++++++++++
>  include/media/v4l2-mem2mem.h           |  4 ++++
>  2 files changed, 36 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index 3392833d9541..ba799db5866a 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -1122,6 +1122,38 @@ int v4l2_m2m_ioctl_streamoff(struct file *file, void *priv,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_streamoff);
>
> +int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
> +                                  struct v4l2_encoder_cmd *ec)
> +{
> +       if (ec->cmd != V4L2_ENC_CMD_STOP && ec->cmd != V4L2_ENC_CMD_START)
> +               return -EINVAL;
> +
> +       if (ec->cmd == V4L2_ENC_CMD_START)
> +               ec->flags = 0;

Hmm, why do we allow any value for flags in case of START? Shouldn't
we also fail if it's non-zero?

Best regards,
Tomasz

> +       return ec->flags ? -EINVAL : 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_encoder_cmd);
> +
> +int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
> +                                  struct v4l2_decoder_cmd *dc)
> +{
> +       if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
> +               return -EINVAL;
> +
> +       if (dc->flags)
> +               return -EINVAL;
> +
> +       if (dc->cmd == V4L2_DEC_CMD_STOP && dc->stop.pts)
> +               return -EINVAL;
> +
> +       if (dc->cmd == V4L2_DEC_CMD_START) {
> +               dc->start.speed = 0;
> +               dc->start.format = V4L2_DEC_START_FMT_NONE;
> +       }
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
> +
>  /*
>   * v4l2_file_operations helpers. It is assumed here same lock is used
>   * for the output and the capture buffer queue.
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index bb3e63d6bd1a..2e0c989266a7 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -672,6 +672,10 @@ int v4l2_m2m_ioctl_streamon(struct file *file, void *fh,
>                                 enum v4l2_buf_type type);
>  int v4l2_m2m_ioctl_streamoff(struct file *file, void *fh,
>                                 enum v4l2_buf_type type);
> +int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
> +                                  struct v4l2_encoder_cmd *ec);
> +int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
> +                                  struct v4l2_decoder_cmd *dc);
>  int v4l2_m2m_fop_mmap(struct file *file, struct vm_area_struct *vma);
>  __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait);
>
> --
> 2.20.1
>
