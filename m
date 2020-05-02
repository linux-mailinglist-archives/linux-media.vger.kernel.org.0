Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A842C1C2325
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 06:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgEBE6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 00:58:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:33948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726058AbgEBE6J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 00:58:09 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B207A208DB;
        Sat,  2 May 2020 04:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588395488;
        bh=Z+otAQneYfqHhtTr/kcWGv2dvBqsPgkDZ6RhF2u47sk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fZ5iGBxYMQtFy2pi/3pWB6Gftl+GybrebqQ+MXe7RPq3FiyZbU0njTCEMmhBpUJSl
         CdZRi0kiZyvDez7u8LtIJU4PW+2Q3S1SES492RdLxsw1Hi3xIcukpGU8MbhDwV1Q/c
         wNsKhOZaTi+/+ssuS6x8ITq1bIqCFXGbgfDA5B9Q=
Date:   Sat, 2 May 2020 06:58:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     sean@mess.org, kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC, WIP, v4 01/11] media: vidtv: add Kconfig entry
Message-ID: <20200502065803.37d40feb@coco.lan>
In-Reply-To: <20200502032216.197977-2-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
        <20200502032216.197977-2-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat,  2 May 2020 00:22:06 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Add the necessary Kconfig entries and a dummy Makefile to compile the new
> virtual DVB test driver (vidtv).

Patch looks good. Please notice that this should be the last patch at the 
series, as otherwise it would break git bisect.

> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/Kconfig        | 10 ++++++++++
>  drivers/media/test-drivers/Makefile       |  1 +
>  drivers/media/test-drivers/vidtv/Kconfig  | 11 +++++++++++
>  drivers/media/test-drivers/vidtv/Makefile |  2 ++
>  4 files changed, 24 insertions(+)
>  create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
>  create mode 100644 drivers/media/test-drivers/vidtv/Makefile
> 
> diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
> index 188381c855939..7d273a8a7acc2 100644
> --- a/drivers/media/test-drivers/Kconfig
> +++ b/drivers/media/test-drivers/Kconfig
> @@ -4,6 +4,10 @@ menuconfig V4L_TEST_DRIVERS
>  	bool "V4L test drivers"
>  	depends on VIDEO_DEV
>  
> +menuconfig DVB_TEST_DRIVERS
> +	bool "DVB test drivers"
> +	depends on DVB_CORE && MEDIA_SUPPORT && I2C
> +
>  if V4L_TEST_DRIVERS
>  
>  source "drivers/media/test-drivers/vimc/Kconfig"
> @@ -24,3 +28,9 @@ config VIDEO_VIM2M
>  source "drivers/media/test-drivers/vicodec/Kconfig"
>  
>  endif #V4L_TEST_DRIVERS
> +
> +if DVB_TEST_DRIVERS
> +
> +source "drivers/media/test-drivers/vidtv/Kconfig"
> +
> +endif #DVB_TEST_DRIVERS
> diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-drivers/Makefile
> index 74410d3a9f2d2..9f0e4ebb2efe7 100644
> --- a/drivers/media/test-drivers/Makefile
> +++ b/drivers/media/test-drivers/Makefile
> @@ -7,3 +7,4 @@ obj-$(CONFIG_VIDEO_VIMC)		+= vimc/
>  obj-$(CONFIG_VIDEO_VIVID)		+= vivid/
>  obj-$(CONFIG_VIDEO_VIM2M)		+= vim2m.o
>  obj-$(CONFIG_VIDEO_VICODEC)		+= vicodec/
> +obj-$(CONFIG_DVB_VIDTV)			+= vidtv/
> diff --git a/drivers/media/test-drivers/vidtv/Kconfig b/drivers/media/test-drivers/vidtv/Kconfig
> new file mode 100644
> index 0000000000000..22c4fd39461f1
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config DVB_VIDTV
> +	tristate "Virtual DVB Driver (vidtv)"
> +	depends on DVB_CORE && MEDIA_SUPPORT && I2C
> +	help
> +	  The virtual DVB test driver serves as a reference DVB driver and helps
> +	  validate the existing APIs in the media subsystem. It can also aid developers
> +	  working on userspace applications.
> +
> +
> +	  When in doubt, say N.
> diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
> new file mode 100644
> index 0000000000000..d1558d84eeaed
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +



Thanks,
Mauro
