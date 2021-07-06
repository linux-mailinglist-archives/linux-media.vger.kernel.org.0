Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE0513BCA18
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 12:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbhGFKii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 06:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbhGFKig (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 06:38:36 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E024BC0613DE
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 03:35:56 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id a8so13800531wrp.5
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6xuYHcNFKOKQBrKUFUDH+4OX/ZzxgolWWFVCDDtB2Y0=;
        b=Yt+wwRbDrooYfJ07+RIOcvlbNAmDArbrvJ7r1S0Vf2cjg/rLU7fAYgPxXpkS/Es1c/
         LcGWWFOVsEF/0XQJw8Ic4i6Dtc59Y/PIazeWXS81o/I5/ykvg7NDoqtNhU6ZQY0qgpts
         hX13gyhgO6x+I73AAGb4ZN/+qaseZR6quq5U1fL8NFgVa2YoJXURs1gKcClPP7oowGFt
         CUO7YRn27lhbGlEADkw/xBbGzLYaM6sE1cZhR+vatbGDVqfyXQOHsgSlmcoOTDifCPOm
         ISHjTYrtj1Tj6vkK+FyowiPdLCC1ljyYKvKt5eTXHZu+z0mb6AF50iygoibOaTtpwXde
         Om/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6xuYHcNFKOKQBrKUFUDH+4OX/ZzxgolWWFVCDDtB2Y0=;
        b=glYDNJcX9Mp+QH9YjnlYfS+xl+G5gGPAIrvAI0SmNk8kw8sD50k6cHQVkxRmwCiaaD
         cqudTfwA9bETtFIZBBj0wOmnuv1lv3AbY2CXqdHknf9u0m6KlvG4HaqVO544aupKwt7p
         q7J1+QZ0x1P80lthvhxvyMfaGpDIesnI6FfnlqH31h0llwcGXIU1WJIBdUefgrAnjioB
         nRaigF9mBsjNUFa43ITRIDPrv+pR4020aEC2+lOvriS39I+dgezmCchg9Aqmh/FZGs0B
         QGvhY2g14g0nxHf3la137gO6QNRYeuQmoiotPSuH3p6qWLvEUyydZZ1tjpv0UEmMGJqy
         +ylQ==
X-Gm-Message-State: AOAM5327qzKHr/2XBWJrY+6SiE6IlXm5OlNaizJECUX9M6ZVZ4XUEBzT
        nE4ASjytoguHBnACWfJOgBm8fQ==
X-Google-Smtp-Source: ABdhPJxx+Xr4AcuLpRSkCC4EtytSRujE0SZ0zcPphvKN4FEK+8OpQKjY5aHg/Lctw2KdmVZr98nK+A==
X-Received: by 2002:a05:6000:12d0:: with SMTP id l16mr21397024wrx.189.1625567755049;
        Tue, 06 Jul 2021 03:35:55 -0700 (PDT)
Received: from dell ([109.180.115.218])
        by smtp.gmail.com with ESMTPSA id l9sm16428319wrp.14.2021.07.06.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 03:35:54 -0700 (PDT)
Date:   Tue, 6 Jul 2021 11:35:52 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Geoff Levand <geoff@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-acpi@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-cxl@vger.kernel.org,
        nvdimm@lists.linux.dev, dmaengine@vger.kernel.org,
        linux1394-devel@lists.sourceforge.net, linux-fpga@vger.kernel.org,
        linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
        industrypack-devel@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, linux-ntb@googlegroups.com,
        linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
        greybus-dev@lists.linaro.org, target-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
        virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] bus: Make remove callback return void
Message-ID: <YOQxRS8HLTYthWNn@dell>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 06 Jul 2021, Uwe Kleine-König wrote:

> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
> 
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
> 
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> this patch depends on "PCI: endpoint: Make struct pci_epf_driver::remove
> return void" that is not yet applied, see
> https://lore.kernel.org/r/20210223090757.57604-1-u.kleine-koenig@pengutronix.de.
> 
> I tested it using allmodconfig on amd64 and arm, but I wouldn't be
> surprised if I still missed to convert a driver. So it would be great to
> get this into next early after the merge window closes.
> 
> I send this mail to all people that get_maintainer.pl emits for this
> patch. I wonder how many recipents will refuse this mail because of the
> long Cc: list :-)
> 
> Best regards
> Uwe
> 
>  arch/arm/common/locomo.c                  | 3 +--
>  arch/arm/common/sa1111.c                  | 4 +---
>  arch/arm/mach-rpc/ecard.c                 | 4 +---
>  arch/mips/sgi-ip22/ip22-gio.c             | 3 +--
>  arch/parisc/kernel/drivers.c              | 5 ++---
>  arch/powerpc/platforms/ps3/system-bus.c   | 3 +--
>  arch/powerpc/platforms/pseries/ibmebus.c  | 3 +--
>  arch/powerpc/platforms/pseries/vio.c      | 3 +--
>  drivers/acpi/bus.c                        | 3 +--
>  drivers/amba/bus.c                        | 4 +---
>  drivers/base/auxiliary.c                  | 4 +---
>  drivers/base/isa.c                        | 4 +---
>  drivers/base/platform.c                   | 4 +---
>  drivers/bcma/main.c                       | 6 ++----
>  drivers/bus/sunxi-rsb.c                   | 4 +---
>  drivers/cxl/core.c                        | 3 +--
>  drivers/dax/bus.c                         | 4 +---
>  drivers/dma/idxd/sysfs.c                  | 4 +---
>  drivers/firewire/core-device.c            | 4 +---
>  drivers/firmware/arm_scmi/bus.c           | 4 +---
>  drivers/firmware/google/coreboot_table.c  | 4 +---
>  drivers/fpga/dfl.c                        | 4 +---
>  drivers/hid/hid-core.c                    | 4 +---
>  drivers/hid/intel-ish-hid/ishtp/bus.c     | 4 +---
>  drivers/hv/vmbus_drv.c                    | 5 +----
>  drivers/hwtracing/intel_th/core.c         | 4 +---
>  drivers/i2c/i2c-core-base.c               | 5 +----
>  drivers/i3c/master.c                      | 4 +---
>  drivers/input/gameport/gameport.c         | 3 +--
>  drivers/input/serio/serio.c               | 3 +--
>  drivers/ipack/ipack.c                     | 4 +---
>  drivers/macintosh/macio_asic.c            | 4 +---
>  drivers/mcb/mcb-core.c                    | 4 +---
>  drivers/media/pci/bt8xx/bttv-gpio.c       | 3 +--
>  drivers/memstick/core/memstick.c          | 3 +--

>  drivers/mfd/mcp-core.c                    | 3 +--

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
