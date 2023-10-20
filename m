Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43B97D0DE5
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 12:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377025AbjJTKtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 06:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377121AbjJTKss (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 06:48:48 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9313D7E
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 03:48:46 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9bf0ac97fdeso101962166b.2
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 03:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697798925; x=1698403725; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dpsoslyow4M9sQirQxhvgaOXBi28TA+DkvJ2wXUpPLQ=;
        b=Por0FzZSEiUcdy4ESJukKmtMmErmTB1M44qJQRlBnlzFegtDDVJ+LGF+fxiIOiNz/z
         RZ/2GCw6ffPnT52GcS3mtHbHvENS5bkyxoDX8yUD1gB9W+bz+5I3hbgSjc63604n/MNV
         30APlpO8R0s6BE6C9n5B4fft+/hHIwtflX4so9o4t9DYT0fvSs2JeNJgqst3lXA/PoTW
         E0MxGDMWwxxWammTbeMRwHIOzN7t6TuWMUXEQbTnud89A5TN1GiM2Y8r49FA0byKlkOs
         dCI/m0Hc+vXmZGqh5Z2hHI2MdsevYV/OUUpduzBcRGq8lPTE8EVy3vd92veTvTwZE1Qc
         wV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697798925; x=1698403725;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpsoslyow4M9sQirQxhvgaOXBi28TA+DkvJ2wXUpPLQ=;
        b=PKoHo1H4oklZEaUfrKLPWKGJkKGpJxFPSI3latgNwSl15lERI2cFNn8hm7d+Z/aDh6
         N/MXX3nyZve6pnrUGKNSnyv/+Duud1GQLN+DEZvIA3eFljKSmrkB+DTjrWsUcZ2TdUlK
         tqRNBYLQs0NnXzMzIWC+xBq/yRlpTpOFTXYeyNQYiBkn/GkL8xJpkOYql15Pddl+LVOl
         ohi3RHTdy0oqT7u9zLqYcMiLLvEIFB4u3IbvYtoqjz3Ux9zCu6krlZrXNQCavZLSn2+T
         9DYuGhMPComVXU3NKUg+LRCOmBep++JBxTjpjB1uQGFWeJOYLzAg9LThm+qVh87KlzUt
         dSag==
X-Gm-Message-State: AOJu0Yyd+RRWMIY3smn1nXl/kC/zPiTjGqZq8W12kdsIcAwAL61H2uQ8
        d4Y59eZav3lhbi8qmipGGjw=
X-Google-Smtp-Source: AGHT+IGW5ayfzZ/ullhbhAkhcMyowYJjV4KPse+R+zDIRmYdW1NBD405740s65MC/undhjIz8+ka/g==
X-Received: by 2002:a17:907:a49:b0:9c7:4d51:af26 with SMTP id be9-20020a1709070a4900b009c74d51af26mr988716ejc.65.1697798925134;
        Fri, 20 Oct 2023 03:48:45 -0700 (PDT)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id s6-20020a1709060c0600b009ad75d318ffsm1264645ejf.17.2023.10.20.03.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:48:44 -0700 (PDT)
Message-ID: <3690b4c422555fe1ace1442c90b3bb58848a5db1.camel@gmail.com>
Subject: Re: [PATCH 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Date:   Fri, 20 Oct 2023 12:48:43 +0200
In-Reply-To: <ae2ec919-913c-4a36-30b3-41e4be242a42@linux.intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <20230727071558.1148653-2-bingbu.cao@intel.com>
         <c071d5b55ac369f039c180685742560b4a5d03cf.camel@gmail.com>
         <2cbd6b6e2d9ecefae822ed7b4915b52b10c2bcd3.camel@gmail.com>
         <ae2ec919-913c-4a36-30b3-41e4be242a42@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2023-10-19 at 16:23 +0800, Bingbu Cao wrote:
> >=20
> > Andreas,
> >=20
> > On 10/16/23 5:39 PM, Andreas Helbech Kleist wrote:
> > > > On Tue, 2023-10-03 at 12:12 +0200, Andreas Helbech Kleist
> > > > wrote:
> > > > > > On Thu, 2023-07-27 at 15:15 +0800,
> > > > > > bingbu.cao@intel.com=C2=A0wrote:
> > > > > > > > From: Bingbu Cao <bingbu.cao@intel.com>
> > > > ...
> > > > > > > > +static void ipu6_pci_remove(struct pci_dev *pdev)
> > > > > > > > +{
> > > > > > ...
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ipu6_bus_del_devices(=
pdev);
> > > > > > ...
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ipu6_mmu_cleanup(isp-=
>psys->mmu);
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ipu6_mmu_cleanup(isp-=
>isys->mmu);
> > > > > >=20
> > > > > > I think ipu6_mmu_cleanup() should be done before
> > > > > > ipu6_bus_del_devices()
> > > > > > like in the ipu6_pci_probe() error path.
> > > >=20
> >=20
> > Thank you for pointing out this issue.
> >=20
> > > > Scratch that, it also causes issues (because isys_remove frees
> > > > > > stuff in
> > > > the MMU).
> >=20
> > What stuff in the mmu was freed in isys_remove()?

I don't recall exactly, but I think it might happen through the
dma_free_attrs() call.

You can reproduce the issue by using the
kernel/configs/x86_debug.config config fragment, loading the driver and
then unbinding the device with something like:

 echo -n 0000:00:03.0 > /sys/bus/pci/drivers/intel-ipu6/unbind

That should give you a use-after-free of isp->psys->mmu and isp->isys-
>mmu.

> > > > @@ -830,7 +832,7 @@ static void ipu6_pci_remove(struct pci_dev
> > > > > > *pdev)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release_firmware(isp->cp=
d_fw);
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ipu6_mmu_cleanup(isp->ps=
ys->mmu);
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ipu6_mmu_cleanup(isp->isys->m=
mu);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ipu6_mmu_cleanup(isys_mmu);


Looking at this again, the first line line above (isp->psys->mmu) is
also problematic because isp->psys has been freed by
ipu6_bus_del_devices as well.

/Andreas
