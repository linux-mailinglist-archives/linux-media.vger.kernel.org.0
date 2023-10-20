Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D165A7D0DDF
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 12:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377042AbjJTKrz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 06:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377089AbjJTKrr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 06:47:47 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF461FE9
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 03:47:06 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso934421a12.3
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 03:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697798824; x=1698403624; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AxYiqJ7zbyOcDAofeA1G+VFQPml+Btu9HyA4rycxrlM=;
        b=ZezF5mx4xR5L7yX27sKwizMeeWBFqOr/suRtVz2GMAW1y1M8bzuMw1+S4kexBJc0iA
         6WxpRzUxEExmEDOO9ubfS5Zshwa5kliUw4P2t/UDJzhFS6qG31H6cl2FaPnLKV6qef2f
         Jz9mqGk4LBsHtif2XiV4m/J9k0IEMGyBLdzvdZCXRD5omNF2qkoaT9emxXyDqDFlm+7I
         t5SVmNW2sEcfJpyMsBY5Mz26jIVaZQ+kMdJDlQsGwwyotEJVMpIYJUSj1nbAtaXPfdd6
         ItMZ7AwvCAkegLIwWbEfQcmOmMB6Nga+kAxTuKzx4oqN64+PvcIh7QeUWMXdluoOd2Z2
         rRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697798824; x=1698403624;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxYiqJ7zbyOcDAofeA1G+VFQPml+Btu9HyA4rycxrlM=;
        b=vMX18Q4F95EggzcscJqS+qWamTL2Pozj4PjfGrAhmCK4DhoZlnqJ/RJGzUMquCO9pS
         coLElvbqzErpdGvuEDSDjD7OaUCFO2o9RhlSsZUjOt6cIqFl+JIpM8h0NVZMo66E+zMr
         ycdJ3S1UbNm+bWDlXJAWPB7LPLYUBQR8C1QYEQMcnLKRzVj7wU9O0BT6UjToAG42nO6X
         /zKSJn3/nIM2akY53oj7MxMU3wSL8aR7GqGMOY2SUEKo7LFAEVgXfXItIBto+L81poft
         42tJo1aSIpUWr3+9eFofWmHFT1l0MCsie5ehGAZLdQqrC/xTba+VJmgYIG8pwzzsWnkZ
         h3tA==
X-Gm-Message-State: AOJu0YzqHTTL4ZISGSwFxpJDKUaxv9lUDvPGd1rWPCd1G0foJ77EHyNQ
        XA6s8EfbF/sGJ83WnXj1wbs=
X-Google-Smtp-Source: AGHT+IElyKPXBalg28lFeBtsnH/fzQEZ4Kw9TTqaXyCfF6hxuJ3hc2XIiNJoCVbQROMi+ddMWdC5TQ==
X-Received: by 2002:a17:907:608a:b0:9be:6ccb:6a8f with SMTP id ht10-20020a170907608a00b009be6ccb6a8fmr1084371ejc.48.1697798823982;
        Fri, 20 Oct 2023 03:47:03 -0700 (PDT)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id h19-20020a1709063b5300b009b9977867fbsm1234565ejf.109.2023.10.20.03.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:47:03 -0700 (PDT)
Message-ID: <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com>
Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Date:   Fri, 20 Oct 2023 12:47:02 +0200
In-Reply-To: <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <20230727071558.1148653-11-bingbu.cao@intel.com>
         <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
         <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
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

Hi Bingbu,

On Thu, 2023-10-19 at 16:28 +0800, Bingbu Cao wrote:
> On 10/3/23 6:13 PM, Andreas Helbech Kleist wrote:
> > On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com=C2=A0wrote:
> >=20
> > > +static const struct pci_device_id isys_pci_tbl[] =3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { PCI_VDEVICE(INTEL, IPU6_PCI_I=
D) },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { PCI_VDEVICE(INTEL, IPU6SE_PCI=
_ID) },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { PCI_VDEVICE(INTEL, IPU6EP_ADL=
_P_PCI_ID) },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { PCI_VDEVICE(INTEL, IPU6EP_ADL=
_N_PCI_ID) },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { PCI_VDEVICE(INTEL, IPU6EP_RPL=
_P_PCI_ID) },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { PCI_VDEVICE(INTEL, IPU6EP_MTL=
_PCI_ID) },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { }
> > > +};
> >=20
> > Unused
>=20
> Have you tried that whether isys driver can be auto-loaded w/o
> this pci id table? It cannot on my side.

I've only tried it on my WIP IPU4 hack of this driver, but I think it
is correct for IPU6 as well. The reason is that isys_driver is an
auxiliary_driver, so I don't think=C2=A0

    MODULE_DEVICE_TABLE(pci, isys_pci_tbl);

has any effect. The PCI probe happens in ipu6_pci_probe in ipu6.c
(because it has a pci_device_id table as well), and the isys_driver is
probed indirectly by ipu6-bus.c.

/Andreas
