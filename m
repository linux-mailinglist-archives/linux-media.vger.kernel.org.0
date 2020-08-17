Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15291245E3C
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 09:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgHQHoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 03:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHQHoG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 03:44:06 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A05FC061388;
        Mon, 17 Aug 2020 00:44:06 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j21so7712254pgi.9;
        Mon, 17 Aug 2020 00:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dyqpdq5z1tV4VGcNVcGfrr6ZWrqS+ezelgjUrIGuMOY=;
        b=cVPgV/X2Wys5BSUaCqslmYpTyAJtSfcqQjAtJ25PxE1bfi6QFMip/+YUNsGYJVlT+0
         fXDpLXtueD0UY8a3VnYymeANd2d7ULnAldZ/eXoIt9hN/eQ5zHJzohxOoJATmYTOPZz0
         bMG7Js45uAPDKsG2z3UE/v7pBolErl8xOmBoWIQMrQV0CvHDSKISsjS6OYbXTV7w5A3i
         ZMMF0wU6IPdqazs+Cr4qE+i4IsIOGUDgzgHBmYOZAu2lVJVohKmQdNtRuQo0p4bNmgNI
         4qAaXddUlKfFUvKHnbH1vP1t58TcAqD8BOAGMTs0QphZN7Elrj43DFQs4ZO4bCE5ljwQ
         f6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dyqpdq5z1tV4VGcNVcGfrr6ZWrqS+ezelgjUrIGuMOY=;
        b=GXqPgbcj+kA4fACZt0z5cvqkbNcbF4xCc2tPMzt+kYTGt1JKwvIZ7Sn8PXsNvmhD2z
         IvrEZ9zBW7ehMBBq8onZ79mNg3xoTEDP1fkq4SlW8QhiQtxTVPoDsza5b9tBoqc/2sli
         90eW5Nsjx5hX63a139ePfEBNtMlSSczHbK29LZnXTYqIHFhCuvG7KyUGZ1tpcekpoL+R
         0zJH9d3uuWwtUu+vSIUA7BRv4e3sflrtGrtm6EDdioddt6TOYK7AjT1+XrxUKmqrDz2X
         XY6fVKfEiapGxjviM2ZKdRAGxjvehYsZUzTLoCTFt2etUMQ72/5JhXZdD1qz6T9QOMdT
         AUNA==
X-Gm-Message-State: AOAM530E/05IZPsR1s7kv5b0X04cJy0XF9U77Xjoamr/HR46kOpDbKNh
        rA67oNdgDVXuMe/rpYL/VwsOBVqlPylmHA==
X-Google-Smtp-Source: ABdhPJzbfbQ/uiCg2uwPwKHRn+2dYffKumh3NKqwFNqCskJdyyJPr79StlzHRuaoRMXJeVgxADokSA==
X-Received: by 2002:a63:541e:: with SMTP id i30mr9448058pgb.416.1597650245662;
        Mon, 17 Aug 2020 00:44:05 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
        by smtp.gmail.com with ESMTPSA id y135sm18998916pfg.148.2020.08.17.00.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 00:44:05 -0700 (PDT)
Date:   Mon, 17 Aug 2020 13:12:29 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, bjorn@helgaas.com,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
Subject: Re: [PATCH v1] [media] saa7134: use generic power management
Message-ID: <20200817074229.GB5869@gmail.com>
References: <20200622120229.89610-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200622120229.89610-1-vaibhavgupta40@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 22, 2020 at 05:32:30PM +0530, Vaibhav Gupta wrote:
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
>  	kfree(dev);
>  }
>  
> -#ifdef CONFIG_PM
> -
>  /* resends a current buffer in queue after resume */
> -static int saa7134_buffer_requeue(struct saa7134_dev *dev,
> +static int __maybe_unused saa7134_buffer_requeue(struct saa7134_dev *dev,
>  				  struct saa7134_dmaqueue *q)
>  {
>  	struct saa7134_buf *buf, *next;
> @@ -1397,8 +1395,9 @@ static int saa7134_buffer_requeue(struct saa7134_dev *dev,
>  	return 0;
>  }
>  
> -static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
> +static int __maybe_unused saa7134_suspend(struct device *dev_d)
>  {
> +	struct pci_dev *pci_dev = to_pci_dev(dev_d);
>  	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
>  	struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
>  
> @@ -1428,21 +1427,15 @@ static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
>  	if (dev->remote && dev->remote->dev->users)
>  		saa7134_ir_close(dev->remote->dev);
>  
> -	pci_save_state(pci_dev);
> -	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
> -
>  	return 0;
>  }
>  
> -static int saa7134_resume(struct pci_dev *pci_dev)
> +static int __maybe_unused saa7134_resume(struct device *dev_d)
>  {
> -	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
> +	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
>  	struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
>  	unsigned long flags;
>  
> -	pci_set_power_state(pci_dev, PCI_D0);
> -	pci_restore_state(pci_dev);
> -
>  	/* Do things that are done in saa7134_initdev ,
>  		except of initializing memory structures.*/
>  
> @@ -1490,7 +1483,6 @@ static int saa7134_resume(struct pci_dev *pci_dev)
>  
>  	return 0;
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
>  	.name     = "saa7134",
>  	.id_table = saa7134_pci_tbl,
>  	.probe    = saa7134_initdev,
>  	.remove   = saa7134_finidev,
> -#ifdef CONFIG_PM
> -	.suspend  = saa7134_suspend,
> -	.resume   = saa7134_resume
> -#endif
> +	.driver.pm = &saa7134_pm_ops,
>  };
>  
>  static int __init saa7134_init(void)
> -- 
> 2.27.0
> 
