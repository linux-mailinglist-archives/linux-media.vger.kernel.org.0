Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAFC11C3B87
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 15:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgEDNo2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 09:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728165AbgEDNo2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 09:44:28 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92237C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 06:44:26 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id g13so20972527wrb.8
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 06:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=haAz+Q/42IAvsvzMcNO5LR7OpwBiITZ9xGmd0Wx4aYE=;
        b=ljnGn+t+6Kh9tF33u03cacnWfvC6iO2T429Q5+GpW7b/MYrYn71o2GTXOb4trZgnMp
         5gK/dgYc5jl4sEV2t6MZEt+cpJp1fvi0svQ4LyL2sRfwL4L6M1WFg21haeiFHb6Zk+6v
         II+mIEd8x3wbeFMukTwL30WOIXdjf9mW1cJDpuZUk0IeATfPu7V5xlQ1rVGVjpKrLFkU
         rx2u5Gr3zKdirpPoyq+n8ht/CfiUTiBiSPVav/8wrEHzmfbSE/9uZiHALYs+9GnGOAd8
         wbueRioMV7k2H8NF9v2FYV4iTYbQoAgMWYSLQ3+ZwuZAoOSwAQQGQxrPjNrDV4+W7ex9
         OjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=haAz+Q/42IAvsvzMcNO5LR7OpwBiITZ9xGmd0Wx4aYE=;
        b=kW0DhGrFaq62kK7VXBQmP85PhrmmDiEmwZ/KeTjZGC+nLoK2t8+SOHb67SX8CLmnCj
         rkeh3ST3EZCmxNpTytfCcekXEkh0DrlH2z7cTLnK9SVR+l2yEoqPgP3iNi8Gm4X1Z3nP
         nGQqZa03X6/YK+te4GOhLFFmwLhontH3k1aqqlHqdgeLTBali/CXWUP7/JQAEFsjQ8KE
         mRPQS5TrzD6jINBCZzX/8zJefp6LbJE/nlZvHPen3oogEIHRFFcnutu+CvVZY2LPW7mO
         vdMZ2OoOo041+ZB/dZAi0BXMwZ/tjkoOB9/lRhPrnDHO4G1Ahd+G86CIs6gaCPJVpemI
         dJKA==
X-Gm-Message-State: AGi0PubepUwhEvNpk6FjxVqx7Hh2W7mk0Ai2oXeuJqXWItBwcIWPVzZ6
        QnE7CRmJnaAU8R1KozKEAV4=
X-Google-Smtp-Source: APiQypLVxpvQ5UN2D+PzzEw7BGDHejSqm5ySPeDIPEUSlBFZvRuoPzsq+Z97chOrHGu4S+JAF1dBoQ==
X-Received: by 2002:adf:ab18:: with SMTP id q24mr18898851wrc.214.1588599865071;
        Mon, 04 May 2020 06:44:25 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id j13sm18419190wro.51.2020.05.04.06.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 06:44:24 -0700 (PDT)
Date:   Mon, 4 May 2020 15:44:20 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200504154420.5dcf505f@ASUS>
In-Reply-To: <20200504140833.11dd5622@coco.lan>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
        <20200503173213.78ae6aaa@coco.lan>
        <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
        <20200503180751.0b1e29c4@ASUS>
        <20200504101628.0f632bf2@ASUS>
        <20200504104934.7873cee3@coco.lan>
        <20200504124539.77eac397@ASUS>
        <20200504140833.11dd5622@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 4 May 2020 14:08:33 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> wrote:

> Em Mon, 4 May 2020 12:45:39 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> 
> > On Mon, 4 May 2020 10:49:34 +0200
> > Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> >   
>  [...]  
>  [...]  
>  [...]  
>  [...]  
>  [...]  
>  [...]  
>  [...]  
>  [...]  
> > 
> > There are still errors when I try to build. I've found code like the
> > one below:
> > 
> > const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
> > 	.vidioc_querycap = atomisp_querycap,
> > #ifndef CONFIG_INTEL_MID_ISP
> > 	.vidioc_g_chip_ident = atomisp_g_chip_ident,
> > #endif
> > 	.vidioc_enum_input = atomisp_enum_input,
> > 
> > Therefore I've tried with "CONFIG_INTEL_MID_ISP=y". Not sure if this is
> > a good idea function wise - but it compiles.  
> 
> Yes, that's it. You also need:
> 
> CONFIG_REGULATOR_WHISKEY_COVE=y         
> 
> and maybe some other stuff. Take a look at the Yocto's *.cfg files I pointed
> with the options (see enclosed).
> 
> 
> 
> > But the last step of the
> > module build produces some scary warnings:
> > 
> > WARNING: "cpu_tss" [drivers/media/pci/atomisp//css2401a0_v21_build/atomisp-css2401a0_v21.ko] undefined!
> > WARNING: "pv_lock_ops" [drivers/media/pci/atomisp//css2401a0_v21_build/atomisp-css2401a0_v21.ko] undefined!
> > WARNING: "__alloc_workqueue_key" [drivers/media/pci/atomisp//css2401a0_v21_build/atomisp-css2401a0_v21.ko] undefined!
> > WARNING: "v4l2_subdev_querymenu" [drivers/media/pci/atomisp//css2401a0_v21_build/atomisp-css2401a0_v21.ko] undefined!
> > WARNING: "intel_mid_msgbus_write32" [drivers/media/pci/atomisp//css2401a0_v21_build/atomisp-css2401a0_v21.ko] undefined!
> > ...
> > 
> > Maybe this is related to my partial build (only the module to test if
> > it builds). I'll now do a full build of the kernel.  
> 
> Yeah, either that or there are some config options with different values.
> 
> I was able to do a full build here without the above errors, although
> I had to turn of some CONFIG options that were otherwise failing.

Strange - I do not get it :-/ ... can you send me the .config file and
Makefile you use; probably I missed something.

> 
> 
> Thanks,
> Mauro
> 
> ~/meta-intel-aero/recipes-kernel/linux/linux-yocto $ cat *.cfg
> CONFIG_USB_ACM=y
> CONFIG_USB_WDM=y
> CONFIG_USB_USBNET=y
> CONFIG_USB_NET_CDC_MBIM=y
> CONFIG_MEDIA_PCI_SUPPORT=y
> 
> CONFIG_VIDEO_DEV=y
> CONFIG_MEDIA_SUPPORT=y
> CONFIG_VIDEO_V4L2=y
> CONFIG_INTEL_MID_ISP=y
> CONFIG_VIDEO_ATOMISP=m
> CONFIG_VIDEO_OV7251=y
> CONFIG_VIDEO_OV8858=y
> CONFIG_I2C_CHARDEV=y
> CONFIG_GPIO_SYSFS=y
> CONFIG_DYNAMIC_DEBUG=y
> CONFIG_PRINTK_TIME=y
> CONFIG_DMADEVICES=y
> CONFIG_DW_DMAC_CORE=y
> CONFIG_DW_DMAC=y
> # DRONE CODE CONFIG
> CONFIG_HAVE_INTEL_TXT=y
> CONFIG_MMU_NOTIFIER=y
> CONFIG_PCI_ATS=y
> CONFIG_PCI_PASID=y
> 
> CONFIG_VFIO_IOMMU_TYPE1=y
> CONFIG_VFIO_VIRQFD=y
> CONFIG_VFIO=y
> CONFIG_VFIO_PCI=y
> CONFIG_VFIO_PCI_MMAP=y
> CONFIG_VFIO_PCI_INTX=y
> CONFIG_IRQ_BYPASS_MANAGER=y
> 
> CONFIG_IOMMU_API=y
> CONFIG_IOMMU_IOVA=y
> CONFIG_DMAR_TABLE=y
> CONFIG_INTEL_IOMMU=y
> CONFIG_INTEL_IOMMU_SVM=y
> CONFIG_INTEL_IOMMU_DEFAULT_ON=y
> CONFIG_INTEL_IOMMU_FLOPPY_WA=y
> 
> CONFIG_X86_INTEL_LPSS=y
> CONFIG_I2C_DESIGNWARE_CORE=y
> CONFIG_I2C_DESIGNWARE_PCI=y
> CONFIG_I2C_DESIGNWARE_PLATFORM=y
> CONFIG_SERIAL_8250_DW=y
> CONFIG_MMC=y
> CONFIG_MMC_SDHCI=y
> CONFIG_MMC_SDHCI_ACPI=y
> CONFIG_NF_NAT_FTP=y
> CONFIG_NF_NAT_IPV4=y
> CONFIG_NF_NAT_IRC=y
> CONFIG_NF_NAT_NEEDED=y
> CONFIG_NF_NAT_SIP=y
> CONFIG_IP_NF_NAT=y
> CONFIG_GPIOLIB=y
> CONFIG_DEBUG_PINCTRL=y
> CONFIG_PINCTRL_CHERRYVIEW=y
> 
> #GPIO Keys
> CONFIG_KEYBOARD_GPIO=y
> CONFIG_INPUT_MISC=y
> CONFIG_INPUT_SOC_BUTTON_ARRAY=y
> CONFIG_REGULATOR=y
> CONFIG_REGULATOR_DEBUG=y
> CONFIG_REGULATOR_FIXED_VOLTAGE=y
> CONFIG_REGULATOR_GPIO=y
> CONFIG_REGULATOR_WHISKEY_COVE=y
> CONFIG_INTEL_SOC_DTS_THERMAL=y
> CONFIG_SPI=y
> CONFIG_SPI_MASTER=y
> CONFIG_SPI_SPIDEV=y
> CONFIG_SPI_PXA2XX=y
> CONFIG_SPI_PXA2XX_DMA=y
> CONFIG_SPI_PXA2XX_PCI=y
> CONFIG_USB_ETH=y
> CONFIG_USB_GADGET=y
> CONFIG_USB_DWC3=y
> CONFIG_USB_DWC3_PCI=y
> CONFIG_USB_DWC3_GADGET=y
> CONFIG_USB_OTG=y
> CONFIG_USB_OTG_FSM=y
> CONFIG_INTEL_CHT_PHY=y
> CONFIG_NOP_USB_XCEIV=y
> CONFIG_IIO=y
> CONFIG_INTEL_SOC_PMIC=y
> CONFIG_ITCO_WDT=y
> # CONFIG_ITCO_VENDOR_SUPPORT is not set
> CONFIG_LPC_ICH=y
> 

with kind regards,
Patrik

