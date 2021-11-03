Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA4D44448F
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 16:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbhKCPXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 11:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhKCPXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 11:23:43 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97EEC061714;
        Wed,  3 Nov 2021 08:21:05 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iI4UmXUEB030KiI4VmUuQk; Wed, 03 Nov 2021 16:21:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635952863; bh=lnc+Z3B1xwnHwfUVEktMwFnDu5c5iQo3KkPktwgGScw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SQuJGTxJtv0/TrVwsQntTQZ6GzEoz6Tz/b2NngM+HJMNL/YyVdie7oyFoiAzy94BR
         MZeT4/hahnGK1OQQpbes6FMTaMWoofLgf4OwJMktQjtTkMScaIBwyfCYNgteG8rR1P
         UKB9ziYRh1MEGRxZkaGHsZUxTA33vE0FR8UPs0qLo/1awwIeHYHxPq6W636yBnbyC4
         D42fse1RzGxOy3n4lIMBoKjhJUeW23uMEeks6j6Y0dLX/c5a9bhVPYMZbEQtboUic7
         9BKBt7bg9S6q6e/5HPbpeYEXccQIwfsJUywhXmYmdLAjbRKDetwd9rrVEwdBqzZseC
         WAYMSOVJVS6Gw==
Subject: Re: [PATCH v3 00/14] staging: media: zoran: fusion in one module
To:     Corentin Labbe <clabbe@baylibre.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
References: <20211026193416.1176797-1-clabbe@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a85c93db-e118-274f-d86a-d127c7399926@xs4all.nl>
Date:   Wed, 3 Nov 2021 16:21:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAYBF5iuKYzq6bTEbQifCIMKSGYUbDDi6NeAPNI8NyUqweNskuDPISythn3jsDYOgKG7A7WinzwchzWV8fLmS7rNM5Kgdi0xgCpiHpV1nkZCJ/eFGNnQ
 s4VS0gW7AU4CQ1F3KWRT9G5MPyYgoOtC/NF/u4n5p3LZyWUNKXjLwQnKb6Fjx60uT6bPeRSzKxMcNtdIbNQApfU67ve8yw/p0KzSs3kS2C26ighy2GhJ7ZQZ
 z5mUrQR65YTtmzaNeHlmAqmRJrKfXA9wrH1rYsILIzTe0OzCDXdfTFv3tcdBIiGS3Eq0WI1mJWBBbfMr8086TaWfqqqIwKfjOsYW8IK7+1KcdMOCqv1/zLKm
 UeIbZSaaIxLy0QZHnkuMb+4XQeX6lNA8X3zZqcEDY/0FyUzQK/ZcaPldrsxDCV47zT/+SJtKEaGaz6Gli/MV13ZC3rHQKK7aCRqpmr6zzvAgJUokREykgBte
 YCYDTRz9chnPWKOUUwWtfc8ZfiFnlTvKR5HxKOUBrzXEkKuqwSAeROmsEnw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Corentin,

On 26/10/2021 21:34, Corentin Labbe wrote:
> Hello
> 
> The main change of this serie is to fusion all zoran related modules in
> one.
> This fixes the load order problem when everything is built-in.

I've been testing this series, and while the module load/unload is now working,
I'm running into a lot of other v4l2 compliance issues.

I've fixed various issues in some follow-up patches available in my tree:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=zoran

At least some of the worst offenders are now resolved. Note that the patch
dropping read/write support relies on this patch:

https://patchwork.linuxtv.org/project/linux-media/patch/4f89b139-13b7-eee6-9662-996626b778b0@xs4all.nl/

But there is one really major bug that makes me hesitant to merge this:

This works:

v4l2-ctl -v pixelformat=MJPG,width=768,height=576
v4l2-ctl --stream-mmap

This fails:

v4l2-ctl -v pixelformat=MJPG,width=768,height=288
v4l2-ctl --stream-mmap

It's an immediate lock up with nothing to indicate what is wrong.
As soon as the height is 288 or less, this happens.

Both with my DC30 and DC30D.

Do you see the same? Any idea what is going on? I would feel much happier
if this is fixed.

Note that the same problem is present without this patch series, so it's
been there for some time.

Regards,

	Hans

> 
> Regards
> 
> Changes since v2:
> - added the 4 latest patchs
> - removed DEBUGFS kconfig option
> - fixed Dan Carpenter's reported codec issues
> - fixed kernel test robot's reported issues on vb2_dma_contig_set_max_seg_size()
> 
> Changes since v1:
> - add missing debugfs cleaning
> - clean some remaining module_get/put functions which made impossible to
>   remove the zoran module
> - added the two latest patchs
> 
> Corentin Labbe (14):
>   staging: media: zoran: move module parameter checks to zoran_probe
>   staging: media: zoran: use module_pci_driver
>   staging: media: zoran: rename debug module parameter
>   staging: media: zoran: add debugfs
>   staging: media: zoran: videocode: remove procfs
>   staging: media: zoran: fusion all modules
>   staging: media: zoran: remove vidmem
>   staging: media: zoran: move videodev alloc
>   staging: media: zoran: move config select on primary kconfig
>   staging: media: zoran: introduce zoran_i2c_init
>   staging: media: zoran: fix usage of vb2_dma_contig_set_max_seg_size
>   staging: media: zoran: clean unused code
>   staging: media: zoran: fix counting buffer in reserve
>   staging: media: zoran: DC30 encoder is not adv7175
> 
>  drivers/staging/media/zoran/Kconfig        |  38 +-
>  drivers/staging/media/zoran/Makefile       |   8 +-
>  drivers/staging/media/zoran/videocodec.c   |  68 +---
>  drivers/staging/media/zoran/videocodec.h   |   4 +-
>  drivers/staging/media/zoran/zoran.h        |  18 +-
>  drivers/staging/media/zoran/zoran_card.c   | 400 +++++++++++++--------
>  drivers/staging/media/zoran/zoran_device.h |   2 -
>  drivers/staging/media/zoran/zoran_driver.c |   8 +-
>  drivers/staging/media/zoran/zr36016.c      |  25 +-
>  drivers/staging/media/zoran/zr36016.h      |   2 +
>  drivers/staging/media/zoran/zr36050.c      |  24 +-
>  drivers/staging/media/zoran/zr36050.h      |   2 +
>  drivers/staging/media/zoran/zr36060.c      |  23 +-
>  drivers/staging/media/zoran/zr36060.h      |   2 +
>  14 files changed, 317 insertions(+), 307 deletions(-)
> 

