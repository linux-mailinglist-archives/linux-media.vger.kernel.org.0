Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF997B427
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 22:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbfG3UPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 16:15:21 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33573 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfG3UPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 16:15:05 -0400
Received: by mail-ot1-f66.google.com with SMTP id q20so67607273otl.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jul 2019 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5RzApq6XFoztBnIqNk8vSnTrtbUfODyGJJfunMohfoM=;
        b=Zwx0RQpMg/Mqj/9z5S89A3ZEJVMpYC9h+xxOXAaZcuU5PCAM8m9Gqaz//RnKDBGDqW
         9liyDLB1BwWzU+ZNcxIkUlAhEM4dwaxEWMetA5zngGXxvLUm9KzmX8yqMCHjIc+8qA1I
         4Kz3jT1Z/FAcCfiuMTNuiLT9z2kiwc9S0x8YZz6OVlR8h69bqZIY4y5U2CziwyfAHt6S
         8CcPZTmDK53Mwk0qwS3iX6X/MjsfAEfTAQNYo9qJOCNeLP9BFCn9fMgZ4bp/B5yi3zOB
         uh6pK4X9QLjcA5W2PzdnflMG8qYA3C40MW87vpeyNAEv23qLtzsWi1Ofnp3dkIf+XH59
         Buzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5RzApq6XFoztBnIqNk8vSnTrtbUfODyGJJfunMohfoM=;
        b=eRGYNU5TDBq28iRbnUHGzz4WLTszMROvR2qcbsfc9H8QQgjk5CJG0BPZ9qJq5ttopq
         K4inEXAf/She77I4c+AMSaxHEl2Htj6aEL3OJoMCOBfnXZg3qkCVQnbw2sktYoO19eam
         g0s0UUL7Otb7ErxSlhAw+9ERoIaTqz5E1RvCh0ov9Lrd8CkccaAjWbMMqnVP8IJM3c8t
         2B0Wln49BNHhEg6m6aVt/QelIdNi2Uv6tf8CdIkC92Urc39aXzSooMuxECSIb3YLzGDv
         pS5h8zGvaI9wxSc1a+XFa1cu23BOOlkbLRVeZu/n9JnO+kdRqrXfCkVg9Qy/U8BJ5cED
         TLPQ==
X-Gm-Message-State: APjAAAV4g4IwkXS8m3n5UdEMrTaWiRItFY7EVyH5ahK3PmSPjgcRdo9y
        vFe2OCxv54mKqYpCOOxTnxzEp6xr2RFMAuiOiFRuFw==
X-Google-Smtp-Source: APXvYqw9ObVuL9+XuGR4o0J2QBLrDkVcN3aYitNJvsGPbv5ZPcYvxRI6eCPCNx+pUD4yOvd0Fq+ICTQ9s+BKXhNpUpI=
X-Received: by 2002:a9d:7248:: with SMTP id a8mr23671169otk.363.1564517704838;
 Tue, 30 Jul 2019 13:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190730192552.4014288-1-arnd@arndb.de> <20190730195819.901457-1-arnd@arndb.de>
In-Reply-To: <20190730195819.901457-1-arnd@arndb.de>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 30 Jul 2019 13:14:52 -0700
Message-ID: <CAPcyv4i_nHzV155RcgnAQ189aq2Lfd2g8pA1D5NbZqo9E_u+Dw@mail.gmail.com>
Subject: Re: [PATCH v5 13/29] compat_ioctl: move more drivers to compat_ptr_ioctl
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-iio@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-pci@vger.kernel.org, linux-nvme@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sparclinux@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-rdma <linux-rdma@vger.kernel.org>, qat-linux@intel.com,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Jason Gunthorpe <jgg@mellanox.com>,
        linux-input@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        David Sterba <dsterba@suse.com>,
        platform-driver-x86@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Wireless List <linux-wireless@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tee-dev@lists.linaro.org,
        linux-crypto <linux-crypto@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 30, 2019 at 12:59 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> The .ioctl and .compat_ioctl file operations have the same prototype so
> they can both point to the same function, which works great almost all
> the time when all the commands are compatible.
>
> One exception is the s390 architecture, where a compat pointer is only
> 31 bit wide, and converting it into a 64-bit pointer requires calling
> compat_ptr(). Most drivers here will never run in s390, but since we now
> have a generic helper for it, it's easy enough to use it consistently.
>
> I double-checked all these drivers to ensure that all ioctl arguments
> are used as pointers or are ignored, but are not interpreted as integer
> values.
>
> Acked-by: Jason Gunthorpe <jgg@mellanox.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: David Sterba <dsterba@suse.com>
> Acked-by: Darren Hart (VMware) <dvhart@infradead.org>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/nvdimm/bus.c                        | 4 ++--
[..]
> diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
> index 798c5c4aea9c..6ca142d833ab 100644
> --- a/drivers/nvdimm/bus.c
> +++ b/drivers/nvdimm/bus.c
> @@ -1229,7 +1229,7 @@ static const struct file_operations nvdimm_bus_fops = {
>         .owner = THIS_MODULE,
>         .open = nd_open,
>         .unlocked_ioctl = bus_ioctl,
> -       .compat_ioctl = bus_ioctl,
> +       .compat_ioctl = compat_ptr_ioctl,
>         .llseek = noop_llseek,
>  };
>
> @@ -1237,7 +1237,7 @@ static const struct file_operations nvdimm_fops = {
>         .owner = THIS_MODULE,
>         .open = nd_open,
>         .unlocked_ioctl = dimm_ioctl,
> -       .compat_ioctl = dimm_ioctl,
> +       .compat_ioctl = compat_ptr_ioctl,
>         .llseek = noop_llseek,
>  };

Acked-by: Dan Williams <dan.j.williams@intel.com>
