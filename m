Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E7A3EC4DD
	for <lists+linux-media@lfdr.de>; Sat, 14 Aug 2021 21:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhHNTzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Aug 2021 15:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhHNTzS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Aug 2021 15:55:18 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF02C061764;
        Sat, 14 Aug 2021 12:54:49 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id qe12-20020a17090b4f8c00b00179321cbae7so10455818pjb.2;
        Sat, 14 Aug 2021 12:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZwyWUeyXG8fg6irLvuiEugsOVJBFRc7EQfmplXnmw84=;
        b=VeFRMhPUpKgvC57pC96tpSIPSIgKXEpWy3CWSV73rpvmy54wdMEKxF3FFIlHD8KgDr
         2sH4nN0+W9FDh/nNvRRrfGD/eXPXrFv6tOxlylDAZfrUOCEYBG5o8qEKRRwHxVrPuVxf
         SoSPtramZaNp9b02D+a4anuHwx2p9O7XyXKNeF8Y9HAKDj6Pc2H1M49Fg81my6JXfAJQ
         fo9cvSxTR49ulvGNY7ZiqWpOcNqYnQ/jB7lOaT2xyQu1etmyPHHZAlMu0SxCc6jYTMUI
         sMJHQbO8N2G7mZALcPtriVvVF4U5TtNqTe7CrKNVfy+eCS9H+f9p8aO/84ia1mF7hF+O
         sMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZwyWUeyXG8fg6irLvuiEugsOVJBFRc7EQfmplXnmw84=;
        b=hZsqbesZhzKPjf7TNBMLqcWJ6CD64sXK5m7Xp0btSPMTlC6HFAXgYbvXoyzgmIaxbp
         MSDM7hlbxZagcbrso5LMk+74MK2K4Vh6myJ8GKTtGRMHudZsxvhHkihkJdQvrdaKMV/1
         LOz3bHaKfj4WTYbBWstlKtyHte0HcpBoho7YCVfAN7rRQuqq00XrGh1IXvRw5XAuA2rs
         F7n1zgknDyutJsfIvPFrpv0fYOwlc4O13J2hjX5XKLFU0ozgA5t/v2Ry2hTz+aV6FNRN
         g3Qr0tVezwCORfnNNb0dEm5JB8NsU5lPqMHyADgVg6oIC1RlZ/YPdSpMu0pcg8n3+USE
         jl2A==
X-Gm-Message-State: AOAM533/6hfFNyOmBD2/bwaaNb1LVQ8kYFty2hMhQANiZ6xVcI/ZYw4l
        J+dgjk/n1ghPv1ZcrLP5uhuv+1xeNHvzjvllTXA=
X-Google-Smtp-Source: ABdhPJyJ4W1qyU1Zdy8gzE429sAUaIl9BZ83fhF9zUPbekk3FlQmwv/D1UfE1VnswdUU8b17xmyrjy6EMb3AxGSwM24=
X-Received: by 2002:a17:90b:33c5:: with SMTP id lk5mr8774888pjb.129.1628970889047;
 Sat, 14 Aug 2021 12:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210814155742.11392-1-novikov@ispras.ru>
In-Reply-To: <20210814155742.11392-1-novikov@ispras.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 14 Aug 2021 22:54:12 +0300
Message-ID: <CAHp75Vdgt=HAK6Cd886AQ+BK-HAJjq0aqf_gkdcpefW5UMBnXg@mail.gmail.com>
Subject: Re: [PATCH v2] media: pt3: Switch to using functions pcim_* and devm_*
To:     Evgeny Novikov <novikov@ispras.ru>
Cc:     Akihiro Tsukada <tskd08@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kirill Shilimanov <kirill.shilimanov@huawei.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ldv-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Aug 14, 2021 at 6:57 PM Evgeny Novikov <novikov@ispras.ru> wrote:
>
> pt3_probe() did not free one of IO mappings in case when one of them was
> successful while another one failed. The patch fixed that by using
> functions pcim_*. Also, it simplifies error handling through switching
> to devm_* functions.
>
> Found by Linux Driver Verification project (linuxtesting.org).

Looks good to me, though I can't test this myself either (I have no hardware).
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
> Co-developed-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
> Signed-off-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
> ---
> v2: Use functions pcim_* and devm_* to simplify code (Andy Shevchenko)
> ---
>  drivers/media/pci/pt3/pt3.c | 58 +++++++++----------------------------
>  1 file changed, 14 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/media/pci/pt3/pt3.c b/drivers/media/pci/pt3/pt3.c
> index c0bc86793355..0d51bdf01f43 100644
> --- a/drivers/media/pci/pt3/pt3.c
> +++ b/drivers/media/pci/pt3/pt3.c
> @@ -685,12 +685,6 @@ static void pt3_remove(struct pci_dev *pdev)
>         for (i = PT3_NUM_FE - 1; i >= 0; i--)
>                 pt3_cleanup_adapter(pt3, i);
>         i2c_del_adapter(&pt3->i2c_adap);
> -       kfree(pt3->i2c_buf);
> -       pci_iounmap(pt3->pdev, pt3->regs[0]);
> -       pci_iounmap(pt3->pdev, pt3->regs[1]);
> -       pci_release_regions(pdev);
> -       pci_disable_device(pdev);
> -       kfree(pt3);
>  }
>
>  static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> @@ -704,14 +698,14 @@ static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>         if (pci_read_config_byte(pdev, PCI_REVISION_ID, &rev) || rev != 1)
>                 return -ENODEV;
>
> -       ret = pci_enable_device(pdev);
> +       ret = pcim_enable_device(pdev);
>         if (ret < 0)
>                 return -ENODEV;
>         pci_set_master(pdev);
>
> -       ret = pci_request_regions(pdev, DRV_NAME);
> +       ret = pcim_iomap_regions(pdev, BIT(0) | BIT(2), DRV_NAME);
>         if (ret < 0)
> -               goto err_disable_device;
> +               return ret;
>
>         ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
>         if (ret == 0)
> @@ -722,42 +716,32 @@ static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>                         dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
>                 else {
>                         dev_err(&pdev->dev, "Failed to set DMA mask\n");
> -                       goto err_release_regions;
> +                       return ret;
>                 }
>                 dev_info(&pdev->dev, "Use 32bit DMA\n");
>         }
>
> -       pt3 = kzalloc(sizeof(*pt3), GFP_KERNEL);
> -       if (!pt3) {
> -               ret = -ENOMEM;
> -               goto err_release_regions;
> -       }
> +       pt3 = devm_kzalloc(&pdev->dev, sizeof(*pt3), GFP_KERNEL);
> +       if (!pt3)
> +               return -ENOMEM;
>         pci_set_drvdata(pdev, pt3);
>         pt3->pdev = pdev;
>         mutex_init(&pt3->lock);
> -       pt3->regs[0] = pci_ioremap_bar(pdev, 0);
> -       pt3->regs[1] = pci_ioremap_bar(pdev, 2);
> -       if (pt3->regs[0] == NULL || pt3->regs[1] == NULL) {
> -               dev_err(&pdev->dev, "Failed to ioremap\n");
> -               ret = -ENOMEM;
> -               goto err_kfree;
> -       }
> +       pt3->regs[0] = pcim_iomap_table(pdev)[0];
> +       pt3->regs[1] = pcim_iomap_table(pdev)[2];
>
>         ver = ioread32(pt3->regs[0] + REG_VERSION);
>         if ((ver >> 16) != 0x0301) {
>                 dev_warn(&pdev->dev, "PT%d, I/F-ver.:%d not supported\n",
>                          ver >> 24, (ver & 0x00ff0000) >> 16);
> -               ret = -ENODEV;
> -               goto err_iounmap;
> +               return -ENODEV;
>         }
>
>         pt3->num_bufs = clamp_val(num_bufs, MIN_DATA_BUFS, MAX_DATA_BUFS);
>
> -       pt3->i2c_buf = kmalloc(sizeof(*pt3->i2c_buf), GFP_KERNEL);
> -       if (pt3->i2c_buf == NULL) {
> -               ret = -ENOMEM;
> -               goto err_iounmap;
> -       }
> +       pt3->i2c_buf = devm_kmalloc(&pdev->dev, sizeof(*pt3->i2c_buf), GFP_KERNEL);
> +       if (!pt3->i2c_buf)
> +               return -ENOMEM;
>         i2c = &pt3->i2c_adap;
>         i2c->owner = THIS_MODULE;
>         i2c->algo = &pt3_i2c_algo;
> @@ -767,7 +751,7 @@ static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>         i2c_set_adapdata(i2c, pt3);
>         ret = i2c_add_adapter(i2c);
>         if (ret < 0)
> -               goto err_i2cbuf;
> +               return ret;
>
>         for (i = 0; i < PT3_NUM_FE; i++) {
>                 ret = pt3_alloc_adapter(pt3, i);
> @@ -799,21 +783,7 @@ static int pt3_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>         while (i >= 0)
>                 pt3_cleanup_adapter(pt3, i--);
>         i2c_del_adapter(i2c);
> -err_i2cbuf:
> -       kfree(pt3->i2c_buf);
> -err_iounmap:
> -       if (pt3->regs[0])
> -               pci_iounmap(pdev, pt3->regs[0]);
> -       if (pt3->regs[1])
> -               pci_iounmap(pdev, pt3->regs[1]);
> -err_kfree:
> -       kfree(pt3);
> -err_release_regions:
> -       pci_release_regions(pdev);
> -err_disable_device:
> -       pci_disable_device(pdev);
>         return ret;
> -
>  }
>
>  static const struct pci_device_id pt3_id_table[] = {
> --
> 2.26.2
>


-- 
With Best Regards,
Andy Shevchenko
