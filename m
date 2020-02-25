Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D22B516F3EB
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 00:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbgBYXxL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 18:53:11 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39140 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729182AbgBYXxL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 18:53:11 -0500
Received: by mail-qk1-f196.google.com with SMTP id e16so971554qkl.6
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2020 15:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V7uFpys0vvnGKgKU6TWcXA9gEqQEyPhW2p18eYUU23g=;
        b=dPFxnnCnNtyMs/buEAMu24zTzQfWWxcXLo5aG4w0AuWf7OdkEL+4JqRnDLeROGGc3b
         4nNBtR7AgRCkWaZTdT/uwfMRP416LuLwC2/4FR4v9hfGHxU5T47HcjiyDkc8h/WSKR+y
         TNU2hudIY73DXkfZCTCUKbOZ7Mt50kbLiAuYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V7uFpys0vvnGKgKU6TWcXA9gEqQEyPhW2p18eYUU23g=;
        b=eBrY2OFWRi2Xqvphw+2ZR2J1plbjwapy0XQrtillDkOySdJpMNhkK8sicQ5J9rX4l4
         0xyu1+pZKSYVwsxsjWKiM+Wy8NClzmJuXvK9rGQIsr213UTLrVmT0puJp6mIwfGucfwB
         xTk9yRDdoj4AO71oHpdp8gBaNKwcbeB4xtIjehVt/8sbMSmFsvItXvvuPU0mUyFP8+yO
         EPhZaQiXaJYGGINqPUZfET82IIRzTcHIldf7OwvoEbBovVXuymeI5C8pyWDXThTc+U8H
         EPRjXm45iVOmUtc7rJM7E9rj0x6xz2hhdaNGaLhrhORYZ+EostD1Uz07bux8w54m6mVi
         x6dQ==
X-Gm-Message-State: APjAAAVjppMH3MSrErjd9rOW8eSOjIqqRRGTsA7z+mJ/Ls5QzyuWZtfg
        hAfR6DlYL3nQgsXSDPjZxJzDUG04wFKHGziUQyo=
X-Google-Smtp-Source: APXvYqz7krStiObclOwtZxgwPBr2nD3Jgb+LtwoxHEffLcks+uXl3itV433NONuRJbKJt/KbWqq69/l0vwv8kIRhO1Q=
X-Received: by 2002:a37:67c2:: with SMTP id b185mr1824063qkc.292.1582674789849;
 Tue, 25 Feb 2020 15:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20200225195853.17480-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200225195853.17480-1-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 25 Feb 2020 23:52:57 +0000
Message-ID: <CACPK8XeiH1iLQbmP+3yJninJtK7rQv=HMVnHzqjPH04V4xW+zg@mail.gmail.com>
Subject: Re: [PATCH -next] media: aspeed: add AST2600 support
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 25 Feb 2020 at 19:56, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Video engine in AST2600 has the exactly same register set with
> AST2500 except VR084 register which provides more precise JPEG
> size read back. This commit adds support for the difference and
> adds 'aspeed,ast2600-video-engine' compatible OF string.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Did you post an update to the device tree bindings too?

> ---
>  drivers/media/platform/aspeed-video.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 47444a336ebb..7d98db1d9b52 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  // Copyright 2020 IBM Corp.
> -// Copyright (c) 2019 Intel Corporation
> +// Copyright (c) 2019-2020 Intel Corporation
>
>  #include <linux/atomic.h>
>  #include <linux/bitfield.h>
> @@ -132,7 +132,8 @@
>  #define  VE_COMP_CTRL_HQ_DCT_CHR       GENMASK(26, 22)
>  #define  VE_COMP_CTRL_HQ_DCT_LUM       GENMASK(31, 27)
>
> -#define VE_OFFSET_COMP_STREAM          0x078
> +#define AST2400_VE_COMP_SIZE_READ_BACK 0x078
> +#define AST2600_VE_COMP_SIZE_READ_BACK 0x084
>
>  #define VE_SRC_LR_EDGE_DET             0x090
>  #define  VE_SRC_LR_EDGE_DET_LEFT       GENMASK(11, 0)
> @@ -252,12 +253,17 @@ struct aspeed_video_config {
>
>  static const struct aspeed_video_config ast2400_config = {
>         .jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
> -       .comp_size_read = VE_OFFSET_COMP_STREAM,
> +       .comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
>  };
>
>  static const struct aspeed_video_config ast2500_config = {
>         .jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
> -       .comp_size_read = VE_OFFSET_COMP_STREAM,
> +       .comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
> +};
> +
> +static const struct aspeed_video_config ast2600_config = {
> +       .jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
> +       .comp_size_read = AST2600_VE_COMP_SIZE_READ_BACK,
>  };
>
>  static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
> @@ -1673,6 +1679,7 @@ static int aspeed_video_init(struct aspeed_video *video)
>  static const struct of_device_id aspeed_video_of_match[] = {
>         { .compatible = "aspeed,ast2400-video-engine", .data = &ast2400_config },
>         { .compatible = "aspeed,ast2500-video-engine", .data = &ast2500_config },
> +       { .compatible = "aspeed,ast2600-video-engine", .data = &ast2600_config },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
> --
> 2.17.1
>
