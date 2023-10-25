Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035DB7D6C19
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 14:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344023AbjJYMjW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 08:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234862AbjJYMjV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 08:39:21 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F3ACC
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 05:39:19 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso818048666b.0
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 05:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698237558; x=1698842358; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u7P0qxWuKZSlIG8Fd3hEDUtkDY0lRhDmCAgW6Ls27R8=;
        b=UPwJv+DTRpXOxoHts0vAsnT9J9DMSUom/5zdC9kdInacAvJprTRuKsbcvIs2GPDMoZ
         aNmvZywrSwjS9aEQ9o6DNSgK0L2K/Z2bRz0xzat2l9yp8A2WDIxFSQfLm5RJKx5s4EJv
         oHnAzkAMvaqxOX7gXZtV/d9WKL5C35Euocq49oKDcOz1ATzBlI2CJIBDmBfbjvbexTUj
         O9kr67HBcGSD64K3qfMrIFL3duQpuC4wVG5HaSbgxmtFqavKeoygSwsP/kTt02O2Le1j
         rntZP9f6DAKfbV3G2qqNUiBMJGs3s4zImyGvnC9iQEYkYB0/lhmp9K08vsYrM1PR+/wA
         u18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698237558; x=1698842358;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u7P0qxWuKZSlIG8Fd3hEDUtkDY0lRhDmCAgW6Ls27R8=;
        b=MByP7tAM1ElbrU1poiEeRE+mfA0vfNexCztK8uZWe5JZliVaygIOPbdUDUZ97GBiry
         KDAzqpki6L++eNiA2TqyaAv8k4kv59ULUTA8IURUfLMhP5N2WyY8NMceD5i8I+XCdnoU
         4ua8U1wdfhzso5PHVagMEKmea9zdP6N29TtOC3Lyb3arl4dYfmWt6MQFrKP0o3QVNQu4
         PXBgETAnuapbEnENjIIJsy2gg/oFNZntrqWAXxTgcfrDkb8HGEmUaSK506tU+/CYPDsV
         PgvidgWr52RDlvobXeq8TAUD7ztDuIt3gq5XMsidmtVa2dl5vwfRLjSjKTbNcHU+LERA
         0M3A==
X-Gm-Message-State: AOJu0YybDIh96NSSFymF6XohRD2WYt9lfAuEE12gH1BZ9Hnbd/mLTGU0
        8tysm27Uc7njq21OJU0EjQ8=
X-Google-Smtp-Source: AGHT+IEIT+iHYBnEQB71lz2xeRQFg+1FB/VT8KJ0eiw3hWJE9R7qfN/Po5RKUmFz04JExf7W8loiVQ==
X-Received: by 2002:a17:907:3e1f:b0:9bd:a65e:b594 with SMTP id hp31-20020a1709073e1f00b009bda65eb594mr13889893ejc.3.1698237558109;
        Wed, 25 Oct 2023 05:39:18 -0700 (PDT)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id la5-20020a170906ad8500b009adce1c97ccsm9738737ejb.53.2023.10.25.05.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 05:39:17 -0700 (PDT)
Message-ID: <ec4d1e9530ec2f5bf90822edbe3130ec88410cf5.camel@gmail.com>
Subject: Re: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Date:   Wed, 25 Oct 2023 14:39:16 +0200
In-Reply-To: <20231024112924.3934228-2-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
         <20231024112924.3934228-2-bingbu.cao@intel.com>
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

Thanks for the updated series. I've rebased my work on this series, and
ran into the following issue.

On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
> +static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
...
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pci_alloc_irq_vectors(=
dev, 1, 1, PCI_IRQ_MSI);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0dev_err_probe(&dev->dev, ret, "Request msi failed");
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> +}

pci_alloc_irq_vectors returns number of irqs, so I think it should be
something like this instead:

       ret =3D pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
       if (ret<0) {
               dev_err_probe(&dev->dev, ret, "Request msi failed");
               return ret;
       }
      =20
       return 0;

/Andreas
