Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA1C7D0DE7
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 12:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377066AbjJTKtH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 06:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377067AbjJTKtF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 06:49:05 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CDF69F
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 03:49:03 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so107879566b.3
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 03:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697798941; x=1698403741; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5OuJV7mYcmw4DKveMwwJ1EPIB6UO+8Km7YhJhZRwKxQ=;
        b=WPt6qFZdoGrFZDFSf2feFX7CFFPDtuqarW9JM66yjUwVgJ6ny2E/4cshFYB2Q0rrjk
         E9yiHOK1U1kybhl80wKqgsNFH5m/oItkYt2I0t4jeIgUdA4pP7wulCem56ch9xVpf9hz
         Dlqvc21IARemADKvNXMitQGApWzQaC/jf+0/xTAtzKoUbz70nN7DaWcN6QbJd8RefUix
         wy/OFs+YwCdoyHbFEUnAyxrLFm1iCo80+n3DeRHV1KFQcGCxLxYWYPUzJ7ED5Qq7VwlT
         dj3WVQ+lGlMea+N1ZXz5HViQXvzR+6EEucIoE4F3b8or0L7FCf4CBjm1IwA6Ux8Qy5wC
         KNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697798941; x=1698403741;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OuJV7mYcmw4DKveMwwJ1EPIB6UO+8Km7YhJhZRwKxQ=;
        b=JrsiOxoJi/x4Bn2M8FMpWL3qfi3arU494OFqf/DgjX4FlK2Ct2Firy/xCzf3x3Fdlf
         G+PfIxGj0Jm0y9mDWm+pZWJ3t8ISEKcXMMc82HTJeNt5O+WvWW7MTQlJ9F8Yj6CGMeYs
         LPJ9Zw/v0SRZ57ZiZvptPOgQFbcFhcq71MSXwXl2uGBOj0lNU9D7qmuBh7Qct0Ad4jXa
         D7W0gIGvpfIqx2jj91E2m9xwqKZSKBrK2zC+RhfPzSlm5WB7dKcvN8vJO2TszPUKDPOQ
         nnAZ8UITnzubFPUxeJYBdpVBEcxU+T83pYi/6/vi225ggc7TRLNbvRjqNBijLtrq8wOG
         NI7g==
X-Gm-Message-State: AOJu0YxVqncUi0rl/hRaV/O4fmhIqZYXIh7j0tLqxE5v15mljQfoZyhF
        1NtavFcKQ/EAd84JjW+itDs=
X-Google-Smtp-Source: AGHT+IHtMWGi9A792gAMncmODR5b9QLfMtK2OiAPSoYBHhxVBKZeyAKPRtamcjkAQ1ujPKOWxiKByg==
X-Received: by 2002:a17:907:60cb:b0:9be:1dbd:552e with SMTP id hv11-20020a17090760cb00b009be1dbd552emr946035ejc.68.1697798941318;
        Fri, 20 Oct 2023 03:49:01 -0700 (PDT)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id w26-20020a17090652da00b009a5f7fb51dcsm1227157ejn.42.2023.10.20.03.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:49:00 -0700 (PDT)
Message-ID: <cfb6866789490142465293b9bdc70406430805ee.camel@gmail.com>
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
Date:   Fri, 20 Oct 2023 12:48:59 +0200
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
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
