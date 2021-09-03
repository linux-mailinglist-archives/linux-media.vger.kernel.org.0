Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2FA4000DA
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 15:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235407AbhICN7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 09:59:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:57824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235169AbhICN7F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Sep 2021 09:59:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3777C61059;
        Fri,  3 Sep 2021 13:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630677486;
        bh=Ie27Yl3ZTx6LojNklmkouDamASPvjv+y/SLNj2SNiKA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eQa+aMbGZ9fylpbX4qNtCUG2QCRPEWjwC4IjhFwqEws9TjSpepeC977bwHGMNMXTc
         WRYC/J7TjUwYrJoi9h5iZuSdX227XyXfxr20A7cMdYWctToz2b6RImV8pLWSpBaUpL
         OqeHxaGzpd5YlpHkJ+Xu7UR2goWxNOcEMFpNXv8gCAnCRm61P9WcX+k2s6QR3i8e8u
         hsdj2qgINF1mDb/kHFf2oi8aTK58xMdpnIjxz0//U585+pItchRWnrkpBmZ7j1efOy
         ZB+o8A2ayyK8dhdJeAiOikwA4197VNS0ClvZdXEFF/R9BFBn+PFFc7ElhH1A5DQXA2
         KdJPRi/CeUUbQ==
Date:   Fri, 3 Sep 2021 15:58:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>
Subject: Re: [GIT PULL FOR v5.16] v2: Various fixes
Message-ID: <20210903155757.4fc280f3@coco.lan>
In-Reply-To: <127b030c-97ac-ef34-db13-60b1bfc49916@xs4all.nl>
References: <127b030c-97ac-ef34-db13-60b1bfc49916@xs4all.nl>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 3 Sep 2021 10:24:24 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> This supersedes the v1 pull request:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/7151eb26-7cea-aff8-24e5-587266b700c0@xs4all.nl/
> 
> Only change: dropped one patch:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20210802065924.1163-1-caihuoqing@baidu.com/
> 
> due to a kernel test robot report for that patch.
> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit d62cd4d277cc711f781a7bdec4109c6148529b25:
> 
>   media: uvcvideo: Remove unused including <linux/version.h> (2021-08-21 09:11:04 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16c
> 
> for you to fetch changes up to 318afc9d4da02bbf31b14e1d3459f25812f91469:
> 
>   gspca: Limit frame size to sizeimage. (2021-09-03 10:20:16 +0200)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Cai Huoqing (2):
>       media: videobuf2: Convert to SPDX identifier

Didn't apply this one, as the license tag seems wrong.

>       media: vim2m: Remove repeated verbose license text
> 
> Chad Fraleigh (1):
>       gspca: Limit frame size to sizeimage.
> 
> Christophe JAILLET (4):
>       media: mtk-vpu: Fix a resource leak in the error handling path of 'mtk_vpu_probe()'
>       media: imx-jpeg: Fix the error handling path of 'mxc_jpeg_probe()'
>       media: pci/ivtv: switch from 'pci_' to 'dma_' API
>       media: switch from 'pci_' to 'dma_' API
> 
> Dafna Hirschfeld (1):
>       media: mtk-vcodec: venc: fix return value when start_streaming fails
> 
> Dan Carpenter (1):
>       media: firewire: firedtv-avc: fix a buffer overflow in avc_ca_pmt()
> 
> Deborah Brouwer (1):
>       media: vivid: add signal-free time for cec message xfer
> 
> Evgeny Novikov (1):
>       media: vidtv: Fix memory leak in remove
> 
> Ezequiel Garcia (1):
>       media: Request API is no longer experimental
> 
> Fabio Estevam (2):
>       media: imx7.rst: Provide an example for imx6ull-evk capture
>       media: imx: TODO: Remove items that are already supported
> 
> Hans Verkuil (1):
>       cec-pin: fix off-by-one SFT check
> 
> Liu Shixin (1):
>       media: pvrusb2: Replaced simple_strtol() with kstrtoint()
> 
> Nadezda Lutovinova (1):
>       media: s5p-mfc: Add checking to s5p_mfc_probe().
> 
> Nil Yi (1):
>       media: usb: airspy: clean the freed pointer and counter
> 
> Tom Rix (2):
>       media: TDA1997x: handle short reads of hdmi info frame.
>       media: camss: vfe: simplify vfe_get_wm_sizes()
> 
> Tuo Li (1):
>       media: s5p-mfc: fix possible null-pointer dereference in s5p_mfc_probe()
> 
> Zev Weiss (1):
>       media: aspeed-video: ignore interrupts that aren't enabled
> 
> lijian (1):
>       media: via-camera: deleted these redundant semicolons

All other patches applied.

Regards,
Mauro


Thanks,
Mauro
