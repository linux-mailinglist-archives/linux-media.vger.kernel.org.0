Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38FF524DED
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 13:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfEULcf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 07:32:35 -0400
Received: from casper.infradead.org ([85.118.1.10]:50164 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfEULcf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 07:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Mvxkzx+yx7+DsQVK/GzfO9p5kzqyPTChQxBAUg/ko6E=; b=T7xcC5m5pb8h33VkKBa1qwOq8U
        tANPWnu9qCBjx6fSsJHhqbyhg0AIbOVudI5d41XA/SkLrcca2v4LQfs1GXxHDJvUomi56n4sxWvRg
        4zIB6BIuTBdNTNb2qWQwnMdGgQN+S/8yg33V7ZCgQBDqsmm7RpTUNPApTopwbi9ElROW+/rqqDdSy
        SBdk5qo1jzYKuPHEJvdW0idGRGomlL1MRDTI/feAboL47Hy+E364QH2Ui1k5H606T6MzokWFWtAAp
        mxh2POttQVRYsiS4zo1xDYUWAv+hZtf9CWm9BgMeo18i1YbjrcNejHbwnUMsnqhsP+OsLKzi9t6CZ
        8oP3h5Xw==;
Received: from 189.27.21.94.dynamic.adsl.gvt.net.br ([189.27.21.94] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hT30T-0007ed-Ac; Tue, 21 May 2019 11:32:33 +0000
Date:   Tue, 21 May 2019 08:32:29 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "eugen.hristev@microchip.com" <eugen.hristev@microchip.com>
Subject: Re: [GIT PULL FOR v5.3] atmel-isc and coda enhancements
Message-ID: <20190521083229.66b4afbe@coco.lan>
In-Reply-To: <1fc4f310-aa97-fa5f-ed1b-1253caabb003@xs4all.nl>
References: <1fc4f310-aa97-fa5f-ed1b-1253caabb003@xs4all.nl>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 2 May 2019 15:13:58 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> This previous PR https://patchwork.linuxtv.org/patch/55818/ is now split
> in two, one with patches for 5.2 and one with stuff that can go into 5.3.
> 
> This PR contains the patches with new features for 5.3.
> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit 7afa8db323e37b9174cf78a1c9ab0ae7a9f5e7dd:
> 
>   media: vsp1: Add support for missing 16-bit RGB555 formats (2019-04-25 11:07:05 -0400)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3a
> 
> for you to fetch changes up to 73d1351fb7d7dafd88d15848bfacfe9f16b13351:
> 
>   media: coda: use v4l2_m2m_buf_copy_metadata (2019-05-02 15:04:53 +0200)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Eugen Hristev (4):
>       media: atmel: atmel-isc: reworked white balance feature
>       media: v4l2-ctrl: fix flags for DO_WHITE_BALANCE
>       media: atmel: atmel-isc: add support for DO_WHITE_BALANCE
>       media: atmel: atmel-isc: make try_fmt error less verbose
> 
> Philipp Zabel (12):
>       media: coda: move register debugging to coda_debug level 3
>       media: coda: move job ready message to coda_debug level 2
>       media: coda: add coda_frame_type_char helper
>       media: coda: improve decoder job finished debug message
>       media: coda: demote s_ctrl debug messages to level 2
>       media: coda: add menu strings to s_ctrl debug output
>       media: coda: update profile and level controls after sequence initialization

Patches up to here applied fine.

>       media: coda: add decoder MPEG-4 profile and level controls

This one caused build to break. I'm stopping merging here.

Regards,
Mauro

>       media: v4l2-ctrl: add MPEG-2 profile and level controls
>       media: coda: add decoder MPEG-2 profile and level controls
>       media: coda: add lockdep asserts
>       media: coda: use v4l2_m2m_buf_copy_metadata
> 
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst |  56 +++++++++++++++++++
>  drivers/media/platform/atmel/atmel-isc-regs.h    |   6 ++-
>  drivers/media/platform/atmel/atmel-isc.c         | 263 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
>  drivers/media/platform/coda/Makefile             |   2 +-
>  drivers/media/platform/coda/coda-bit.c           |  69 +++++++++++++++++++-----
>  drivers/media/platform/coda/coda-common.c        | 129 +++++++++++++++++++++++++++++++++-----------
>  drivers/media/platform/coda/coda-mpeg2.c         |  44 +++++++++++++++
>  drivers/media/platform/coda/coda-mpeg4.c         |  48 +++++++++++++++++
>  drivers/media/platform/coda/coda.h               |  14 +++++
>  drivers/media/platform/coda/coda_regs.h          |   2 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c             |  24 +++++++++
>  include/uapi/linux/v4l2-controls.h               |  18 +++++++
>  12 files changed, 597 insertions(+), 78 deletions(-)
>  create mode 100644 drivers/media/platform/coda/coda-mpeg2.c
>  create mode 100644 drivers/media/platform/coda/coda-mpeg4.c



Thanks,
Mauro
