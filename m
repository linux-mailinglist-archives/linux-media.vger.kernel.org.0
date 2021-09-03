Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABD144000BC
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 15:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbhICNsg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 09:48:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:56352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235096AbhICNs2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Sep 2021 09:48:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4F84610CC;
        Fri,  3 Sep 2021 13:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630676849;
        bh=4hGkSGG5SzQQLF6h5zq5Zpw9BmvJshTdI2otkQm+cZg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gq6cJryncnxviLRLy8mhJeIShtvpC0uyyD78x0vZzwNEnd1dH6yP8SF3+K0GoHrcA
         0deJLvUjNTa41ApZAssYsSqXKkQ3fZerDv5R29T4pzvh/FIhZP0Ywciruv/m2MwU/v
         Zwg88CVGIi2rYOO15AV8jt64jPagbY+3+b9u38PWVFuaRuxFcrH+zqOy3jGKK38Ved
         po6GfwtWoTFKURCJQxt8Hssg+9AjYq/gI2TkJEoSJzRYfEJ20JVO+geWOtOFDV5jJk
         oZd96rQc9vAHc1QH5VRM77LRrXSdBR0JDM+EnaHT54We0KveWNSrLruOed3fvz3p9S
         N3w8GR1yJ0E1Q==
Date:   Fri, 3 Sep 2021 15:47:25 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     <tfiga@chromium.org>, <m.szyprowski@samsung.com>,
        <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: videobuf2: Convert to SPDX identifier
Message-ID: <20210903154707.48e26478@coco.lan>
In-Reply-To: <20210822042730.1360-1-caihuoqing@baidu.com>
References: <20210822042730.1360-1-caihuoqing@baidu.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 22 Aug 2021 12:27:30 +0800
Cai Huoqing <caihuoqing@baidu.com> escreveu:

> +// SPDX-License-Identifier: GPL-1.0+
>  /*
>   * videobuf2-vmalloc.c - vmalloc memory allocator for videobuf2
>   *
>   * Copyright (C) 2010 Samsung Electronics
>   *
>   * Author: Pawel Osciak <pawel@osciak.com>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation.
>   */

That doesn't sound right.

See, all code at the Kernel is under GPLv2, as stated at the global
Kernel licensing files. Btw, a driver with just:

	MODULE_LICENSE("GPL")

is actually under GPLv2 (eventually: or later and/or dual-licensed).

There's nothing in the text implying GPLv2 or later. So, using a
GPL-x.x+ doesn't fit here.

Ok, one might argue that the code is GPL 1.0 to 2.0, but VB2 is
a derivative work from VB1, which was originally written with
GPL v2 or later:

	https://linuxtv.org/cgi-bin/viewvc.cgi/video4linux/video-buf.h?view=markup&revision=1.9&root=v4l

So, the only license that fits here is GPLv2.

On other words, except if all VB2 authors explicitly send their
SoB to change the licensing terms (with should likely include
also VB1 authors) to allow dual-licensing it or to extend it
to other GPL versions, the right license here is, instead, just
GPLv2, e. g.:

	SPDX-License-Identifier: GPL-2.0

Thanks,
Mauro
