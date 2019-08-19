Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7D6991C99
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 07:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbfHSFhV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 01:37:21 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37167 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbfHSFhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 01:37:21 -0400
Received: by mail-ed1-f67.google.com with SMTP id f22so493174edt.4
        for <linux-media@vger.kernel.org>; Sun, 18 Aug 2019 22:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tkgy/RtaOxWbG5u4lLMlFkZIvQ0rkxar1VeBKATm3SI=;
        b=IO31bsaf+8QzsQ7wFRtOuOoVPprRFJLgAg2WAfn/J44S6GxMrqKjUza1v3VWLeQFd9
         bolRK0pgTtyVxldle2tMZobb/J7niEQjZNeBWFgL4l21/NTPNjtTxxmlF6RTcu6EZ9PV
         P6G/WBbN8+csywTqTUaRZ9Xit7YYTv8wr0OrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tkgy/RtaOxWbG5u4lLMlFkZIvQ0rkxar1VeBKATm3SI=;
        b=PQL+oqUdvjTNGozHN+SkqV/82XLpxzjyX56YfYBfDqjJiFlY+FU9Qfc4BlykunvTKp
         XF69nGoLWRtfHSe/h28bzOfQq0eL/eLcaUFEiG9ybK3TRV7JjrO0o0Xj0pjBAnQE+q9d
         n8pP2x7dpQAJRFsCV7eZy8eBPI23+3qVjiWoLHR9hQf6mvom/kwQ6TK6Teir3/8QgnmX
         JxJi875P2HFza0OeNpJEDZvfE7WalkYt2BY0Nzy7LFZfv4pKi0dhwEawpIQq8nGmW6Tk
         HAzT1iEs2ZfLM7qK1NYkKO6nT7mD+6Ltxk1lSrTLMcLbXohbGbmR23PexdfYNibOvd5d
         VUlg==
X-Gm-Message-State: APjAAAVHz2bN7PooihQSnIYGZfUtNgQj3Ts4R7faJmkPey/IcnmwmXBk
        frlwl0E5sa0kCbdBKP+VnIu+6bBbRYdO/g==
X-Google-Smtp-Source: APXvYqxgzvFIItKwkOVlIbBRO7FDO6Ty63kIrctNRe7aUGdnu4U+QQnvtLstqxgyOX2BQwbwqoiw4g==
X-Received: by 2002:a50:a6c8:: with SMTP id f8mr23279217edc.60.1566193038649;
        Sun, 18 Aug 2019 22:37:18 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id h10sm2584405edh.64.2019.08.18.22.37.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2019 22:37:18 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id p17so7281348wrf.11
        for <linux-media@vger.kernel.org>; Sun, 18 Aug 2019 22:37:17 -0700 (PDT)
X-Received: by 2002:adf:f851:: with SMTP id d17mr24806537wrq.77.1566193037200;
 Sun, 18 Aug 2019 22:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <1565950848-10076-1-git-send-email-bingbu.cao@intel.com>
In-Reply-To: <1565950848-10076-1-git-send-email-bingbu.cao@intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 19 Aug 2019 14:37:05 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CEq8tpDJb2tKHuXuYJSOweLpvKzcT9AsAoOqr_BbcaxQ@mail.gmail.com>
Message-ID: <CAAFQd5CEq8tpDJb2tKHuXuYJSOweLpvKzcT9AsAoOqr_BbcaxQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: staging: imgu: make imgu work on low frequency
 for low input
To:     Cao Bing Bu <bingbu.cao@intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Yeh, Andy" <andy.yeh@intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Fri, Aug 16, 2019 at 7:12 PM <bingbu.cao@intel.com> wrote:
>
> From: Bingbu Cao <bingbu.cao@intel.com>
>
> Currently, imgu is working on 450MHz for all cases, however
> in some cases (input frame less than 2048x1152), the imgu
> did not need work in high frequency.
> This patch make imgu work on 200MHz if the imgu input
> frame is less than 2048x1152 to save power.
>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css.c |  6 +++---
>  drivers/staging/media/ipu3/ipu3-css.h |  3 ++-
>  drivers/staging/media/ipu3/ipu3.c     | 16 ++++++++++++++--
>  3 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
> index fd1ed84c400c..a0002ccadbfc 100644
> --- a/drivers/staging/media/ipu3/ipu3-css.c
> +++ b/drivers/staging/media/ipu3/ipu3-css.c
> @@ -210,12 +210,12 @@ static int imgu_hw_wait(void __iomem *base, int reg, u32 mask, u32 cmp)
>
>  /* Initialize the IPU3 CSS hardware and associated h/w blocks */
>
> -int imgu_css_set_powerup(struct device *dev, void __iomem *base)
> +int imgu_css_set_powerup(struct device *dev, void __iomem *base,
> +                        unsigned int freq)
>  {
> -       static const unsigned int freq = 450;
>         u32 pm_ctrl, state, val;
>
> -       dev_dbg(dev, "%s\n", __func__);
> +       dev_dbg(dev, "%s with freq %u\n", __func__, freq);
>         /* Clear the CSS busy signal */
>         readl(base + IMGU_REG_GP_BUSY);
>         writel(0, base + IMGU_REG_GP_BUSY);
> diff --git a/drivers/staging/media/ipu3/ipu3-css.h b/drivers/staging/media/ipu3/ipu3-css.h
> index 6b8bab27ab1f..6108a068b228 100644
> --- a/drivers/staging/media/ipu3/ipu3-css.h
> +++ b/drivers/staging/media/ipu3/ipu3-css.h
> @@ -187,7 +187,8 @@ bool imgu_css_is_streaming(struct imgu_css *css);
>  bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe);
>
>  /******************* css hw *******************/
> -int imgu_css_set_powerup(struct device *dev, void __iomem *base);
> +int imgu_css_set_powerup(struct device *dev, void __iomem *base,
> +                        unsigned int freq);
>  void imgu_css_set_powerdown(struct device *dev, void __iomem *base);
>  int imgu_css_irq_ack(struct imgu_css *css);
>
> diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> index 06a61f31ca50..4d53aad31483 100644
> --- a/drivers/staging/media/ipu3/ipu3.c
> +++ b/drivers/staging/media/ipu3/ipu3.c
> @@ -345,8 +345,20 @@ int imgu_queue_buffers(struct imgu_device *imgu, bool initial, unsigned int pipe
>  static int imgu_powerup(struct imgu_device *imgu)
>  {
>         int r;
> +       unsigned int pipe;
> +       unsigned int freq = 200;
> +       struct v4l2_mbus_framefmt *fmt;
> +
> +       /* input larger than 2048*1152, ask imgu to work on high freq */
> +       for_each_set_bit(pipe, imgu->css.enabled_pipes, IMGU_MAX_PIPE_NUM) {
> +               fmt = &imgu->imgu_pipe[pipe].nodes[IMGU_NODE_IN].pad_fmt;
> +               dev_dbg(&imgu->pci_dev->dev, "pipe %u input format = %ux%u",
> +                       pipe, fmt->width, fmt->height);
> +               if ((fmt->width * fmt->height) >= (2048 * 1152))
> +                       freq = 450;
> +       }
>
> -       r = imgu_css_set_powerup(&imgu->pci_dev->dev, imgu->base);
> +       r = imgu_css_set_powerup(&imgu->pci_dev->dev, imgu->base, freq);
>         if (r)
>                 return r;
>
> @@ -666,7 +678,7 @@ static int imgu_pci_probe(struct pci_dev *pci_dev,
>         atomic_set(&imgu->qbuf_barrier, 0);
>         init_waitqueue_head(&imgu->buf_drain_wq);
>
> -       r = imgu_css_set_powerup(&pci_dev->dev, imgu->base);
> +       r = imgu_css_set_powerup(&pci_dev->dev, imgu->base, 200);
>         if (r) {
>                 dev_err(&pci_dev->dev,
>                         "failed to power up CSS (%d)\n", r);
> --
> 2.7.4
>

Thanks for addressing my comments.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
