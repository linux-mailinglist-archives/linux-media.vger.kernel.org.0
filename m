Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014E84011DC
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 00:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238374AbhIEVnF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Sep 2021 17:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235179AbhIEVnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Sep 2021 17:43:04 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3996C061575;
        Sun,  5 Sep 2021 14:42:00 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id j195so9703930ybg.6;
        Sun, 05 Sep 2021 14:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fLPDiE8CZvkoCrImaKutyqrEpwa9EFeafz6QJChKxx0=;
        b=W7wdmAgPGrUp9rWIL9HyeQum+z9sjOUqay0sTDDXzSoM+/8wbn0843i3WN0kFpD0dL
         PpUdtMZfkyWtg2sLsmHIO9OPRWajg1Bo9u9FIBODbP+n01Eg1sCsjFPoF00EksoEvRms
         LXI1pK5fAkJO85AmENJdJA8ebZlZ0f4rPpD2LO2vqO7v/KW+J/qpHHWjHGx2Vr54hXS4
         JrYmdvOBksq5Th3CLWILYFpUdgV78gVofh8H61CNM49jgGSOArNfzr5DE4kktcI35B/o
         8O7jJyoSt/wdvtbEgTlq0gmlxp+iRmJIjwjR8R5oXv233IUMl8ED6hN3sf+88doVf7vE
         35kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fLPDiE8CZvkoCrImaKutyqrEpwa9EFeafz6QJChKxx0=;
        b=lRkl3DpI84hzKg+2OFmFt8CqQaWeiNNdXir2OU9UY/EFfzYhA955BwTLOCAQ/mZIL5
         bXIi9IS970ABesLasECZeEV3uzXKmv1Q/u1E/dpsXnwSMFyt3YXnbzpH3Wkih+2hPOqb
         Mlpkq/FTChQLDXsHT1toBAYb+TLN2ngpZzsKaiA2TC69AeW/JG7dplVuQb9/i3HpDn/D
         Rh1Dw6mWrQFRNhu4MNaaQT9J/FtfLKYUcmO8K4nwB13VEaAZc38NDUU+XfxaBaa8IdWc
         BJPUtfQGl/BZfgxGMldnKIrqMld8zdFr5Lj8rzqeZ4n8LDSvJGdVgR6n2U63I49okOi9
         /2VA==
X-Gm-Message-State: AOAM532d4qeC8JIx/GE8nbz8JdTCLOF0WyvQTnpADmpzcyIo3loCfAqx
        nEhGKoaXqipT9UyTvrDPWT9hkBQG6Raa449tc0OEMJYL1XGmlQ==
X-Google-Smtp-Source: ABdhPJwml1Bv0RknX+GLd6OGBvDW05FHDc9dZ5cOxR1+LSqRMp7d4+T9itE82gq7xAyTm8kiv9xGA4Cor2c2EgyYh2M=
X-Received: by 2002:a25:38ce:: with SMTP id f197mr12348099yba.254.1630878120239;
 Sun, 05 Sep 2021 14:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210904232808.25638-1-rdunlap@infradead.org>
In-Reply-To: <20210904232808.25638-1-rdunlap@infradead.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 5 Sep 2021 22:41:34 +0100
Message-ID: <CA+V-a8u7NC5+2k051EP_V_HLn638X5Fzwj_UcM83ZV24qES0uQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ths8200 needs V4L2_ASYNC
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,

Thank you for the patch.

On Sun, Sep 5, 2021 at 12:28 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix the build errors reported by the kernel test robot by
> selecting V4L2_ASYNC:
>
> mips-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_remove':
> ths8200.c:(.text+0x1ec): undefined reference to `v4l2_async_unregister_subdev'
> mips-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_probe':
> ths8200.c:(.text+0x404): undefined reference to `v4l2_async_register_subdev'
>
> Fixes: ed29f89497006 ("media: i2c: ths8200: support asynchronous probing")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> ---
>  drivers/media/i2c/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> --- linux-next-20210903.orig/drivers/media/i2c/Kconfig
> +++ linux-next-20210903/drivers/media/i2c/Kconfig
> @@ -597,6 +597,7 @@ config VIDEO_AK881X
>  config VIDEO_THS8200
>         tristate "Texas Instruments THS8200 video encoder"
>         depends on VIDEO_V4L2 && I2C
> +       select V4L2_ASYNC
>         help
>           Support for the Texas Instruments THS8200 video encoder.
>
