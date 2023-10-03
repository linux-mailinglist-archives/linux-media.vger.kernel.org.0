Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1146E7B6619
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 12:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239803AbjJCKMs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 06:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjJCKMr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 06:12:47 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9D793
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 03:12:44 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-98377c5d53eso123145266b.0
        for <linux-media@vger.kernel.org>; Tue, 03 Oct 2023 03:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696327962; x=1696932762; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HOB0Hf+tiSmSSMs645g9vdl4l0WCE45Pze6Ctga1rx8=;
        b=FSfQYRmuSNJzvBJjy5qAui/6eG1ymEQLb6wLYpYSzB0MUgJzdJrZAtYsIz1FACQ1fo
         WcDabpUeZhGxExFlkTeveKn0q42W+CJkATwH0lNd5g1JQ5tF51Dk9waoH9zYTz4jPFyy
         +cCKNgbLp2Nj8TYKEm0uoFePPm05z4IDo5Aakm4t3mbpuqsHoaTfJLlqGIyZCK6CLQRC
         hzon/zZHZAyTd7Z2P5LCoS5r++O0yn3F5b1BA+/iAV8tw+oXmPBOnhxVWhk03+c6dh0x
         EfmjHw9AVMmgo28GVbxYFPAR2KKV7RTdECQQneW0XgZQYene2qG+gWSwL+HszYUIQ2dt
         21aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696327962; x=1696932762;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HOB0Hf+tiSmSSMs645g9vdl4l0WCE45Pze6Ctga1rx8=;
        b=DDZymUXCH8GDhYE19T4bSNz/JUk2enPDVzKa+ZWlBB+5P0VDeJ+PvZ0py5s92b8oLH
         78CLo2rmblOqYkb9EfBUo33XHgQm0CakRjNj1cn6OEj4t6YkL4G5Sb1kMYMCAJW6E2vm
         ou9RGN5nfzowVORzCmHGyiWccTF31N4je6ivilh7R52ua9FgR0Eu8G4+iw3QYOgz1NVz
         bGihmibXla3J8gsadalva1uO77rrN7hcxnYDL6dExJDUuy3LRmIRPef7+DKg2cbO5J0V
         qqgQCkkyx8+acQd03OA0124wUAURb2hHUjPNe6V9s371Ffq9Oi/Dx8G8Y8/sq6BQzFtw
         0aHA==
X-Gm-Message-State: AOJu0YwlR3Wz+HkZF1lyF+roqcla2r0ufzquKMEwAs0VZ99HIJr0+P5M
        CGIfQzS1MmVobqWb5XXdZjY=
X-Google-Smtp-Source: AGHT+IE5+lAANQA8YF/a9VqLazcPQuhllNBF5y5yrsyeEznNd7lm2h7oW2mSYhodkVUdJqMWgKecwA==
X-Received: by 2002:a17:906:328e:b0:9a5:b8ca:9b76 with SMTP id 14-20020a170906328e00b009a5b8ca9b76mr11858311ejw.72.1696327962321;
        Tue, 03 Oct 2023 03:12:42 -0700 (PDT)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709061c5200b009ad81554c1bsm796719ejg.55.2023.10.03.03.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 03:12:41 -0700 (PDT)
Message-ID: <c071d5b55ac369f039c180685742560b4a5d03cf.camel@gmail.com>
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
Date:   Tue, 03 Oct 2023 12:12:40 +0200
In-Reply-To: <20230727071558.1148653-2-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <20230727071558.1148653-2-bingbu.cao@intel.com>
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

Hi Bingbu,

Thank your for the patch series. I'm working on adding support for IPU4
(as Claus Stovgaard mentioned) and have run into various issues,
resulting in these comments.

On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Intel Image Processing Unit 6th Gen includes input and processing
> systems
> but the hardware presents itself as a single PCI device in system.
>=20
> IPU6 PCI device driver basically does PCI configurations and load
> the firmware binary, initialises IPU virtual bus, and sets up
> platform
> specific variants to support multiple IPU6 devices in single device
> driver.


> +extern struct ipu6_isys_internal_pdata isys_ipdata;
> +extern struct ipu6_psys_internal_pdata psys_ipdata;
> +extern const struct ipu6_buttress_ctrl isys_buttress_ctrl;
> +extern const struct ipu6_buttress_ctrl psys_buttress_ctrl;

They are only used internally in ipu6.c, so no need for extern
declarations.

> +static int ipu6_pci_probe(struct pci_dev *pdev, const struct
> pci_device_id *id)
> +{
...
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0isp->bus_ready_to_probe =3D tr=
ue;

This variable is written but never read.

> +static void ipu6_pci_remove(struct pci_dev *pdev)
> +{
...
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ipu6_bus_del_devices(pdev);
...
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ipu6_mmu_cleanup(isp->psys->mm=
u);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ipu6_mmu_cleanup(isp->isys->mm=
u);

I think ipu6_mmu_cleanup() should be done before ipu6_bus_del_devices()
like in the ipu6_pci_probe() error path.

> +struct ipu6_device {
...
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool bus_ready_to_probe;

Remove unused variable (see comment earlier).

I'm looking forward to the next version of the patch series.

Best Regards,
Andreas
