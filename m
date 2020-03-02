Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0551757A7
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 10:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbgCBJtv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 04:49:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:51904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726956AbgCBJtu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Mar 2020 04:49:50 -0500
Received: from coco.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8AED9246B4;
        Mon,  2 Mar 2020 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583142590;
        bh=SnxL88hZi+3+nktQ2dI3LSxBa6B9nha4JRonuz19rAo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Dzu3iwUPAM6XjSt3/M4Aj5HyI1btKM+1M+EtGeZqZ1GrUbdj7wODv6mXEhqqNWaVC
         FBzMLX5lwon68/1TwiPoYIdzBgmIBk5x9e8GzTuop/b0jbFucB6FSe2+hqB915XjOA
         mOK/4Qzw46AY38gIizdbGkmdRV9pU0VEVSar4Vz0=
Date:   Mon, 2 Mar 2020 10:49:46 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v5.7] RC & DVB
Message-ID: <20200302104946.602a0d57@coco.lan>
In-Reply-To: <20200225010451.GA22451@gofer.mess.org>
References: <20200225010451.GA22451@gofer.mess.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 25 Feb 2020 01:04:51 +0000
Sean Young <sean@mess.org> escreveu:

> Hi Mauro,
> 
> If you have the time, please have a detailed look at the 64 bit scancodes
> commit. Otherwise, nothing to exciting here.
> 
> Thanks
> Sean
> 
> The following changes since commit ef0ed05dcef8a74178a8b480cce23a377b1de2b8:
> 
>   media: staging/imx: Missing assignment in imx_media_capture_device_register() (2020-02-24 17:53:22 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/syoung/media_tree.git tags/v5.7a
> 
> for you to fetch changes up to 2d993d98c8f9643018208a6f0b945cebc0bfd8a6:
> 
>   media: rtl28xxu: add missing sleep before probing slave demod (2020-02-24 16:18:56 -0800)
> 
> ----------------------------------------------------------------
> v5.7a
> 
> ----------------------------------------------------------------
> Colin Ian King (1):
>       media: rc: fix spelling mistake "to" -> "too"
> 
> Gustavo A. R. Silva (1):
>       media: rc: iguanair: Replace zero-length array with flexible-array member
> 
> Mario Hros (1):
>       media: rtl28xxu: add missing sleep before probing slave demod
> 
> Mohammad Rasim (2):
>       dt-bindings: media: add new kii pro key map
>       arm64: dts: amlogic: add rc-videostrong-kii-pro keymap
> 

Applied, thanks!

> Sean Young (1):
>       media: rc: make scancodes 64 bit

I opted to not apply this one yet. See my comments to the patch
thread.

Regards,
Mauro

> 
>  Documentation/devicetree/bindings/media/rc.yaml    |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |  4 ++
>  drivers/media/rc/bpf-lirc.c                        |  5 --
>  drivers/media/rc/iguanair.c                        |  2 +-
>  drivers/media/rc/ir-xmp-decoder.c                  |  2 +-
>  drivers/media/rc/lirc_dev.c                        |  7 +-
>  drivers/media/rc/rc-main.c                         | 77 ++++++++++++++--------
>  drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |  3 +
>  include/media/rc-core.h                            |  8 +--
>  include/media/rc-map.h                             |  4 +-
>  10 files changed, 68 insertions(+), 45 deletions(-)


Thanks,
Mauro
