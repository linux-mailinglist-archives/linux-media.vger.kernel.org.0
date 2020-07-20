Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B00F225CE3
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 12:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbgGTKtb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 06:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728232AbgGTKta (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 06:49:30 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65640C061794;
        Mon, 20 Jul 2020 03:49:30 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id p25so8237431vsg.4;
        Mon, 20 Jul 2020 03:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wY0dHi09vd294neiN4XqhltRnFObgHpOmPvIePnDyJM=;
        b=RrNm2gxit1WQD7b8BvDuwQffEaYmpn/vOp/taHp46yvimJgrOfz3utD5aYhN8uC4rS
         vauBkp0fwEf6gu5qAafT/vKfwzhmyO5A1y/1jsKTGP5YRpnuHom+2N78zHpetio6xwID
         Go2lex9NktC9gL78KhMmvM7rzdStaXMnL18Q6xiAI8nwkAwlFHGvFg1a7KUoHNE9gOCp
         7r8HWjaFftONV/lclo4aGwmp5jd6k7dYeBzRTsXzVjd7Lc4DkG03Cr2Pg35v7ibf9E4q
         Uc84PeelRGufa/hIMHsQ1Mp6Dn3Zw+piIbCU+aUBqgYBkmHbzqh7bUTebMNhBI0VtTds
         XPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wY0dHi09vd294neiN4XqhltRnFObgHpOmPvIePnDyJM=;
        b=jSdHEOUf/bpTKrabIVaOE2LbbW0jcnkpjZOmbe7Z0Ql2nAsQn73R+UHXI0uG9a0pD1
         SO+X8nXcYN0wJMjuXX6kwzH627E72cAkLD3ptSA9VJbf/8I8lMNXBZoskk3i/+oxrZxn
         bBUzTUMTE0NSQHheYd4AeH+79469m3r5fYOTsVWUfv/3V6fh3DsUDmbQT/v5hMwr+ZZy
         HuZVakTP0Uou3irtehyAGS/oGnzATcBPEFjTGaxmyLY1WUztQNPGTYMWqch8bD7Y4Yrh
         kznvi8CuloqmlmkHnqNSTUCuAeX7pbHDw2aF2mFl29sQECyRq3LylXzhAzaSKxqKOzK/
         UVeA==
X-Gm-Message-State: AOAM532djGNSHRTBWhiuSoYUVtX5O7gtKX8ryR+kDWh6dUGcKh3cYkU8
        04wBZtCVkwZUQhFvCW9i+o2Xh3Gc9Oj4vbHGRQi3F2kd
X-Google-Smtp-Source: ABdhPJzy6/qnz/BhMCoMM7wOU6HD05HnbnXTb2JWl5+U3NV9DvoVnpkNcjUAX5xaOI2d8kWV7iuWh2hlJ2KL3XCSKCI=
X-Received: by 2002:a67:ef1e:: with SMTP id j30mr14619614vsr.127.1595242169547;
 Mon, 20 Jul 2020 03:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200622120229.89610-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200622120229.89610-1-vaibhavgupta40@gmail.com>
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date:   Mon, 20 Jul 2020 16:17:39 +0530
Message-ID: <CAP+cEOMZsLhneqnvDwmWZ6ps8boANX_wvZXVaptDonOEoULqXA@mail.gmail.com>
Subject: Re: [PATCH v1] [media] saa7134: use generic power management
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 22, 2020 at 5:36 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> With the support of generic PM callbacks, drivers no longer need to use
> legacy .suspend() and .resume() in which they had to maintain PCI states
> changes and device's power state themselves. The required operations are
> done by PCI core.
>
> Compile-tested only.
>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/media/pci/saa7134/saa7134-core.c | 25 ++++++++----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
> index e4623ed2f831..eb01109d4f98 100644
> --- a/drivers/media/pci/saa7134/saa7134-core.c
> +++ b/drivers/media/pci/saa7134/saa7134-core.c
> @@ -1370,10 +1370,8 @@ static void saa7134_finidev(struct pci_dev *pci_dev)
>         kfree(dev);
>  }
>
> -#ifdef CONFIG_PM
> -
>  /* resends a current buffer in queue after resume */
> -static int saa7134_buffer_requeue(struct saa7134_dev *dev,
> +static int __maybe_unused saa7134_buffer_requeue(struct saa7134_dev *dev,
>                                   struct saa7134_dmaqueue *q)
>  {
>         struct saa7134_buf *buf, *next;
> @@ -1397,8 +1395,9 @@ static int saa7134_buffer_requeue(struct saa7134_dev *dev,
>         return 0;
>  }
>
> -static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
> +static int __maybe_unused saa7134_suspend(struct device *dev_d)
>  {
> +       struct pci_dev *pci_dev = to_pci_dev(dev_d);
>         struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
>         struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
>
> @@ -1428,21 +1427,15 @@ static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
>         if (dev->remote && dev->remote->dev->users)
>                 saa7134_ir_close(dev->remote->dev);
>
> -       pci_save_state(pci_dev);
> -       pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
> -
>         return 0;
>  }
>
> -static int saa7134_resume(struct pci_dev *pci_dev)
> +static int __maybe_unused saa7134_resume(struct device *dev_d)
>  {
> -       struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
> +       struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
>         struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
>         unsigned long flags;
>
> -       pci_set_power_state(pci_dev, PCI_D0);
> -       pci_restore_state(pci_dev);
> -
>         /* Do things that are done in saa7134_initdev ,
>                 except of initializing memory structures.*/
>
> @@ -1490,7 +1483,6 @@ static int saa7134_resume(struct pci_dev *pci_dev)
>
>         return 0;
>  }
> -#endif
>
>  /* ----------------------------------------------------------- */
>
> @@ -1522,15 +1514,14 @@ EXPORT_SYMBOL(saa7134_ts_unregister);
>
>  /* ----------------------------------------------------------- */
>
> +static SIMPLE_DEV_PM_OPS(saa7134_pm_ops, saa7134_suspend, saa7134_resume);
> +
>  static struct pci_driver saa7134_pci_driver = {
>         .name     = "saa7134",
>         .id_table = saa7134_pci_tbl,
>         .probe    = saa7134_initdev,
>         .remove   = saa7134_finidev,
> -#ifdef CONFIG_PM
> -       .suspend  = saa7134_suspend,
> -       .resume   = saa7134_resume
> -#endif
> +       .driver.pm = &saa7134_pm_ops,
>  };
>
>  static int __init saa7134_init(void)
> --
> 2.27.0
>
