Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16CB8100961
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 17:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfKRQnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 11:43:35 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45735 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfKRQne (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 11:43:34 -0500
Received: by mail-oi1-f196.google.com with SMTP id 14so15873336oir.12
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2019 08:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FZILDQSV0tew8AObzihNeZvhlGxeVr+6wW5CLwLnCuc=;
        b=jraa3NNqgaDBY8IlCxj6gU+rNWzF6m0PMfJJR8RSJIeb/VcC1q6f3XAZrrQDwQHTow
         YiGV6jps0LM8wXFC9jQgKfjUCIG0mk3TXKiGjq2gHbIZ1Z+I8fDO2gfTd9HtpZCYsB+I
         pf2PWx/tR+3vqcHVp/6RxC99q1jKIxfA0Oeik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FZILDQSV0tew8AObzihNeZvhlGxeVr+6wW5CLwLnCuc=;
        b=aN/KeNIrDtluYLGoH8o5cY2Msgtx29mLLC2ugYna5wbDkljYq4vraEOl/w9nanz5Tb
         jp0WeRlcg0RgoRYWQ3BM4BbUZrMxgBneUg3mmS0KNAEC7p59KJuGFBtpxaVvdY+k3Hzy
         /Ev06VdRxWpueWYXV0uw/3uwbertgRbWJNVAwwwTuTgw6B/DEC9sxQJD5IQ9ZwgZPRsK
         h1rA8HcYcFbCQJ+LxOx0LsLwnDqmX3rCtpq9W0EdMx9oTPqcKWgZB6MqGWjQcKjNQ7M2
         lUdGot2g+JBV//pe8Ie2x2OMlaGkhJ3m3jw0VaQCxop3r++Sozq/XHtdPKEG5i8bykaT
         Wtog==
X-Gm-Message-State: APjAAAV0BtDq0RxtahuaH3WZzuDRnjHQjrj7WsgO0c4JOIV+KUMySSfM
        nI99aYqtI5O2psikyR4n2V8p0TswuL99qgh7XFpNog==
X-Google-Smtp-Source: APXvYqwKF/WYageec8u6JKj3YHnGR8X6uFo4OD4ZS8dTCYL2+195u8KDVUoII+Swn8sKvcTvVKg6kK2prURn6khc4DQ=
X-Received: by 2002:aca:39d7:: with SMTP id g206mr19842166oia.101.1574095413276;
 Mon, 18 Nov 2019 08:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20191118103536.17675-16-daniel.vetter@ffwll.ch> <201911182322.FMpIgsJE%lkp@intel.com>
In-Reply-To: <201911182322.FMpIgsJE%lkp@intel.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 18 Nov 2019 17:43:22 +0100
Message-ID: <CAKMK7uHDOyKgDO2UgNJtYdLjAn78L9rNKZs-nbEZDJFQvhW0mg@mail.gmail.com>
Subject: Re: [PATCH 15/15] dma-buf: Remove kernel map/unmap hooks
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 18, 2019 at 4:23 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Daniel,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on drm-intel/for-linux-next]
> [also build test ERROR on v5.4-rc8 next-20191115]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

Too old tree, on latest drm-tip this compiles since udl has lots its
own dma-buf implementation. Also, the patch set will start to compile
once linux-next is open for 5.6.

Cheers, Daniel

>
> url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/Retire-dma_buf_k-un-map/20191118-184537
> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=m68k
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/dma-buf/udmabuf.c:114:3: error: 'const struct dma_buf_ops' has no member named 'map'; did you mean 'mmap'?
>      .map    = kmap_udmabuf,
>       ^~~
>       mmap
> >> drivers/dma-buf/udmabuf.c:114:12: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>      .map    = kmap_udmabuf,
>                ^~~~~~~~~~~~
>    drivers/dma-buf/udmabuf.c:114:12: note: (near initialization for 'udmabuf_ops.begin_cpu_access')
> >> drivers/dma-buf/udmabuf.c:115:3: error: 'const struct dma_buf_ops' has no member named 'unmap'; did you mean 'vunmap'?
>      .unmap    = kunmap_udmabuf,
>       ^~~~~
>       vunmap
>    drivers/dma-buf/udmabuf.c:115:14: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>      .unmap    = kunmap_udmabuf,
>                  ^~~~~~~~~~~~~~
>    drivers/dma-buf/udmabuf.c:115:14: note: (near initialization for 'udmabuf_ops.end_cpu_access')
>    cc1: some warnings being treated as errors
> --
> >> drivers/gpu/drm/udl/udl_dmabuf.c:169:3: error: 'const struct dma_buf_ops' has no member named 'map'; did you mean 'mmap'?
>      .map   = udl_dmabuf_kmap,
>       ^~~
>       mmap
> >> drivers/gpu/drm/udl/udl_dmabuf.c:169:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>      .map   = udl_dmabuf_kmap,
>               ^~~~~~~~~~~~~~~
>    drivers/gpu/drm/udl/udl_dmabuf.c:169:11: note: (near initialization for 'udl_dmabuf_ops.release')
> >> drivers/gpu/drm/udl/udl_dmabuf.c:170:3: error: 'const struct dma_buf_ops' has no member named 'unmap'; did you mean 'vunmap'?
>      .unmap   = udl_dmabuf_kunmap,
>       ^~~~~
>       vunmap
>    drivers/gpu/drm/udl/udl_dmabuf.c:170:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>      .unmap   = udl_dmabuf_kunmap,
>                 ^~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/udl/udl_dmabuf.c:170:13: note: (near initialization for 'udl_dmabuf_ops.begin_cpu_access')
>    cc1: some warnings being treated as errors
>
> vim +114 drivers/dma-buf/udmabuf.c
>
> fbb0de79507819 Gerd Hoffmann 2018-08-27  109
> a34852891ba45d Gerd Hoffmann 2018-09-11  110  static const struct dma_buf_ops udmabuf_ops = {
> fbb0de79507819 Gerd Hoffmann 2018-08-27  111    .map_dma_buf      = map_udmabuf,
> fbb0de79507819 Gerd Hoffmann 2018-08-27  112    .unmap_dma_buf    = unmap_udmabuf,
> fbb0de79507819 Gerd Hoffmann 2018-08-27  113    .release          = release_udmabuf,
> fbb0de79507819 Gerd Hoffmann 2018-08-27 @114    .map              = kmap_udmabuf,
> fbb0de79507819 Gerd Hoffmann 2018-08-27 @115    .unmap            = kunmap_udmabuf,
> fbb0de79507819 Gerd Hoffmann 2018-08-27  116    .mmap             = mmap_udmabuf,
> fbb0de79507819 Gerd Hoffmann 2018-08-27  117  };
> fbb0de79507819 Gerd Hoffmann 2018-08-27  118
>
> :::::: The code at line 114 was first introduced by commit
> :::::: fbb0de795078190a9834b3409e4b009cfb18a6d4 Add udmabuf misc device
>
> :::::: TO: Gerd Hoffmann <kraxel@redhat.com>
> :::::: CC: Gerd Hoffmann <kraxel@redhat.com>
>
> ---
> 0-DAY kernel test infrastructure                 Open Source Technology Center
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
