Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB7617B661C
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 12:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239858AbjJCKNZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 06:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbjJCKNY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 06:13:24 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFB3A3
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 03:13:20 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99357737980so126243866b.2
        for <linux-media@vger.kernel.org>; Tue, 03 Oct 2023 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696327998; x=1696932798; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fWLtro2SUdPDWFW4xz0kwpbzpSYWcrJyQJgzLGk5aoI=;
        b=BlYZnVXqt2QaPTYYO0aZGbCDGx+Me5VzXo49WKEeSPZOAu5V6/vbJvg2hA9ilsHryn
         Sm7WrLkAWlUv8FPvAuYM5yEeResNk8s7BhhktB13cPah170sECttbCSKdILm4UVcOueE
         aa89Ewr+RFv+H9xefgj7TenKMoIl98uNtAIMHbM8WI4Ks2fWQCKAzjljEQY4b6NXc6vb
         jP3sS7V86Gt6RwORGO5DoGOmMf0ecFYllc0VzkAtUjKd1jfSBljsRRfzWGp75h72tmeY
         X2XwNRrgAT9GyiWzn9U7uqH7iRj4EQhI0EcTvePXxegWaU00Lb7eF6DkBZlBqaYMb7Bh
         hKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696327998; x=1696932798;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fWLtro2SUdPDWFW4xz0kwpbzpSYWcrJyQJgzLGk5aoI=;
        b=R9KaQxUv4AbbbV6LN1cq3hGDWq1YiiTKJH2M/8DQtPqpClSzD6XizbxZ6c80WAAzAx
         TAG4FvV4FcRtaElNxGAfRpGEclBF7yyR/lIEFcvNLqhXt1+CDzhY7ppBBwAD6THPMo5c
         Q0LfozaXEwkowrMSXdnNNTTp4F3OUDOb43l0mXwZGQT2DOu3avD4kK1YcrvVq0pXDPSj
         xWdGOiLVbVkYwQiGxB/tMVjY+jVhUIYDwXvMLiJHD4aW6qPmbEN0/ERaQ1ZnRvynRbGz
         TYDdYqiu7RCWeuIoxgKmhNK+dfE1Mubyh0eaC3pU8vDhVhKmrUr4YV/TscS3NfX0KxBt
         xKPQ==
X-Gm-Message-State: AOJu0YxmgjCu10RnWcxVOcqY8g9ijBmeWsnWiR6UFsxb0SaffgltMZ1x
        aIC+6mpnUbWujiZoONvLeR0=
X-Google-Smtp-Source: AGHT+IH93ff43GCgFLONw96XOTR/v8pA1LDvnQR+DPPZHgrdfwf4M/K+S0YFDHex2fH2V+Z1NSYTMQ==
X-Received: by 2002:a17:907:d13:b0:9b2:6c37:22ee with SMTP id gn19-20020a1709070d1300b009b26c3722eemr13876566ejc.21.1696327998492;
        Tue, 03 Oct 2023 03:13:18 -0700 (PDT)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id gr5-20020a170906e2c500b0099315454e76sm786742ejb.211.2023.10.03.03.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 03:13:18 -0700 (PDT)
Message-ID: <069207da98e6445f0c70c74ba1e1bdb7c46ba25a.camel@gmail.com>
Subject: Re: [PATCH 12/15] media: add Kconfig and Makefile for IPU6
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Date:   Tue, 03 Oct 2023 12:13:17 +0200
In-Reply-To: <20230727071558.1148653-13-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <20230727071558.1148653-13-bingbu.cao@intel.com>
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

Hi,

On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Add IPU6 support in Kconfig and Makefile, with this patch you can
> build the Intel IPU6 and input system modules by select the
> CONFIG_VIDEO_INTEL_IPU6 in config.

> +++ b/drivers/media/pci/intel/ipu6/Kconfig
> @@ -0,0 +1,15 @@
> +config VIDEO_INTEL_IPU6
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "Intel IPU6 driver"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on ACPI || COMPILE_TES=
T
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on MEDIA_SUPPORT
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on MEDIA_PCI_SUPPORT
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on X86 && X86_64
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select IOMMU_IOVA
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select VIDEOBUF2_DMA_CONTIG
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select V4L2_FWNODE

This is still missing VIDEO_V4L2_SUBDEV_API as mentioned in the RFC
series:
https://lore.kernel.org/all/20230706085736.1915096-1-andreaskleist@gmail.co=
m/

Best regards,
Andreas
