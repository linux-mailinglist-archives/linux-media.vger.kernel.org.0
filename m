Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234767CA461
	for <lists+linux-media@lfdr.de>; Mon, 16 Oct 2023 11:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbjJPJjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Oct 2023 05:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjJPJjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Oct 2023 05:39:54 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B4697
        for <linux-media@vger.kernel.org>; Mon, 16 Oct 2023 02:39:51 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo7217234a12.3
        for <linux-media@vger.kernel.org>; Mon, 16 Oct 2023 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697449189; x=1698053989; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kybSKlG/0oacD/q1txbiY/sE74DSfCpeT4GLjagSgZU=;
        b=JfpIe9842ybIxKNYllCx/xNngTnCiPqD51+K2++pbN8wN2zxnoc5od+Xsi9tR8XKSG
         xK9j+7ku24Sn4jJpDdnzQWCR8v3T+O7ZRLo0oJUMhwS3adc+hm/jjy+oQP96QDFh7jyM
         4UgCxv/tWt3p67IfxBZFxc3KTXNTdhY1FV7TKr3A7ACezHNMMIkREOuK+MGhZJ++jQnv
         wcqylQD5dywyQ6mw0gGJQZesRcJGRLyF+VocR6Qv0ZKQ0YrBUsdKbXKPJGMB8PYpX2rZ
         hwxsI2JndJhCT2CKAoA03l6LRvILazarPIg8EzWYzD7LkvSQX0g7roqhE0xx4HBW6z9f
         uMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697449189; x=1698053989;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kybSKlG/0oacD/q1txbiY/sE74DSfCpeT4GLjagSgZU=;
        b=gdwc3IP1ub0mwES1FKzMiZEr2JOmx8pmHZDiop4O6mG+ktjeQ5eeojXqFXFTc6MsvU
         VVzyer/7vN17U24fzr2JiFkKWR4Z8hwEo7WGHEizVzH2tizV9cqvPRBpRUSEm5+8nUz/
         LaBXDcGmfqGqtq+VfCLenViVRQff+gAsV2SeguBgI5V4A3zxTNs59sVxQ6JteqYpozMA
         SDmf2Fz6PsprUsUM6HCIP9jNXMCLArP5pPXnFrByhjmbam1F/bleBML224vPtnTsKdDp
         U/vIt+I/3JBH65udTodLPxBsl5rtUvEfEiL9GnxrpYrKuE4essBxPhSlctK41u96FYPA
         /QYQ==
X-Gm-Message-State: AOJu0YxYpLCoS1DypTr3pThDlEAcB9tSb44StgWW2kUQFKAgbPJgu/Z/
        +5KylYWG2M/rtfnqHBzIsXQ=
X-Google-Smtp-Source: AGHT+IETbpNCSJf4sYd3EiL+2w5PigiskDtXHqEq8q4+YUlEECZnsM8VgH5kyQP0vZ01dewPPY/FXg==
X-Received: by 2002:a17:906:478a:b0:9be:7de2:927a with SMTP id cw10-20020a170906478a00b009be7de2927amr5430625ejc.74.1697449189423;
        Mon, 16 Oct 2023 02:39:49 -0700 (PDT)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id lu9-20020a170906fac900b0099bcf9c2ec6sm3678226ejb.75.2023.10.16.02.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 02:39:48 -0700 (PDT)
Message-ID: <2cbd6b6e2d9ecefae822ed7b4915b52b10c2bcd3.camel@gmail.com>
Subject: Re: [PATCH 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Date:   Mon, 16 Oct 2023 11:39:47 +0200
In-Reply-To: <c071d5b55ac369f039c180685742560b4a5d03cf.camel@gmail.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <20230727071558.1148653-2-bingbu.cao@intel.com>
         <c071d5b55ac369f039c180685742560b4a5d03cf.camel@gmail.com>
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

On Tue, 2023-10-03 at 12:12 +0200, Andreas Helbech Kleist wrote:
> On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com=C2=A0wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
...
> > +static void ipu6_pci_remove(struct pci_dev *pdev)
> > +{
> ...
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ipu6_bus_del_devices(pdev);
> ...
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ipu6_mmu_cleanup(isp->psys->=
mmu);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ipu6_mmu_cleanup(isp->isys->=
mmu);
>=20
> I think ipu6_mmu_cleanup() should be done before
> ipu6_bus_del_devices()
> like in the ipu6_pci_probe() error path.

Scratch that, it also causes issues (because isys_remove frees stuff in
the MMU).

A fix that seems to work for me is to save the isp->isys->mmu pointer
before calling ipu6_bus_del_devices, and then use that pointer when
calling ipu6_mmu_cleanup.

diff --git
a/drivers/media/pci/intel/ipu6/ipu6.cqb/drivers/media/pci/intel/ipu6/ip
u6.c
index 59ecefbcb56c..6333a4674d33 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -812,11 +812,13 @@ static int ipu6_pci_probe(struct pci_dev *pdev,
const struct pci_device_id *id)
 static void ipu6_pci_remove(struct pci_dev *pdev)
 {
        struct ipu6_device *isp =3D pci_get_drvdata(pdev);
+       struct ipu6_mmu *isys_mmu =3D isp->isys->mmu;
=20
        ipu6_cpd_free_pkg_dir(isp->psys);
=20
        ipu6_buttress_unmap_fw_image(isp->psys, &isp->psys->fw_sgt);
=20
+
        ipu6_bus_del_devices(pdev);
=20
        pm_runtime_forbid(&pdev->dev);
@@ -830,7 +832,7 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
        release_firmware(isp->cpd_fw);
=20
        ipu6_mmu_cleanup(isp->psys->mmu);
-       ipu6_mmu_cleanup(isp->isys->mmu);
+       ipu6_mmu_cleanup(isys_mmu);
 }
=20
 static void ipu6_pci_reset_prepare(struct pci_dev *pdev)

--=20

/Andreas

