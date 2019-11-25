Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25AFC10860A
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 01:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfKYArU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 19:47:20 -0500
Received: from mga03.intel.com ([134.134.136.65]:57059 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726865AbfKYArT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 19:47:19 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Nov 2019 16:47:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,239,1571727600"; 
   d="scan'208";a="205947547"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.6]) ([10.239.13.6])
  by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2019 16:47:16 -0800
Subject: Re: [kbuild-all] Re: [PATCH 15/15] dma-buf: Remove kernel map/unmap
 hooks
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
References: <20191118103536.17675-16-daniel.vetter@ffwll.ch>
 <201911182322.FMpIgsJE%lkp@intel.com>
 <CAKMK7uHDOyKgDO2UgNJtYdLjAn78L9rNKZs-nbEZDJFQvhW0mg@mail.gmail.com>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <426e8fe1-dff2-9632-2837-23f4af7b0937@intel.com>
Date:   Mon, 25 Nov 2019 08:46:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHDOyKgDO2UgNJtYdLjAn78L9rNKZs-nbEZDJFQvhW0mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/19/19 12:43 AM, Daniel Vetter wrote:
> On Mon, Nov 18, 2019 at 4:23 PM kbuild test robot <lkp@intel.com> wrote:
>> Hi Daniel,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on drm-intel/for-linux-next]
>> [also build test ERROR on v5.4-rc8 next-20191115]
>> [if your patch is applied to the wrong git tree, please drop us a note to help
>> improve the system. BTW, we also suggest to use '--base' option to specify the
>> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> Too old tree, on latest drm-tip this compiles since udl has lots its
> own dma-buf implementation. Also, the patch set will start to compile
> once linux-next is open for 5.6.
>
> Cheers, Daniel

Hi Daniel,

Thanks for clarifying, we'll take a look at the wrong base.

Best Regards,
Rong Chen

>
>> url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/Retire-dma_buf_k-un-map/20191118-184537
>> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
>> config: m68k-allmodconfig (attached as .config)
>> compiler: m68k-linux-gcc (GCC) 7.4.0
>> reproduce:
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # save the attached .config to linux build tree
>>          GCC_VERSION=7.4.0 make.cross ARCH=m68k
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/dma-buf/udmabuf.c:114:3: error: 'const struct dma_buf_ops' has no member named 'map'; did you mean 'mmap'?
>>       .map    = kmap_udmabuf,
>>        ^~~
>>        mmap
>>>> drivers/dma-buf/udmabuf.c:114:12: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>>       .map    = kmap_udmabuf,
>>                 ^~~~~~~~~~~~
>>     drivers/dma-buf/udmabuf.c:114:12: note: (near initialization for 'udmabuf_ops.begin_cpu_access')
>>>> drivers/dma-buf/udmabuf.c:115:3: error: 'const struct dma_buf_ops' has no member named 'unmap'; did you mean 'vunmap'?
>>       .unmap    = kunmap_udmabuf,
>>        ^~~~~
>>        vunmap
>>     drivers/dma-buf/udmabuf.c:115:14: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>>       .unmap    = kunmap_udmabuf,
>>                   ^~~~~~~~~~~~~~
>>     drivers/dma-buf/udmabuf.c:115:14: note: (near initialization for 'udmabuf_ops.end_cpu_access')
>>     cc1: some warnings being treated as errors
>> --
>>>> drivers/gpu/drm/udl/udl_dmabuf.c:169:3: error: 'const struct dma_buf_ops' has no member named 'map'; did you mean 'mmap'?
>>       .map   = udl_dmabuf_kmap,
>>        ^~~
>>        mmap
>>>> drivers/gpu/drm/udl/udl_dmabuf.c:169:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>>       .map   = udl_dmabuf_kmap,
>>                ^~~~~~~~~~~~~~~
>>     drivers/gpu/drm/udl/udl_dmabuf.c:169:11: note: (near initialization for 'udl_dmabuf_ops.release')
>>>> drivers/gpu/drm/udl/udl_dmabuf.c:170:3: error: 'const struct dma_buf_ops' has no member named 'unmap'; did you mean 'vunmap'?
>>       .unmap   = udl_dmabuf_kunmap,
>>        ^~~~~
>>        vunmap
>>     drivers/gpu/drm/udl/udl_dmabuf.c:170:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>>       .unmap   = udl_dmabuf_kunmap,
>>                  ^~~~~~~~~~~~~~~~~
>>     drivers/gpu/drm/udl/udl_dmabuf.c:170:13: note: (near initialization for 'udl_dmabuf_ops.begin_cpu_access')
>>     cc1: some warnings being treated as errors
>>
>> vim +114 drivers/dma-buf/udmabuf.c
>>
>> fbb0de79507819 Gerd Hoffmann 2018-08-27  109
>> a34852891ba45d Gerd Hoffmann 2018-09-11  110  static const struct dma_buf_ops udmabuf_ops = {
>> fbb0de79507819 Gerd Hoffmann 2018-08-27  111    .map_dma_buf      = map_udmabuf,
>> fbb0de79507819 Gerd Hoffmann 2018-08-27  112    .unmap_dma_buf    = unmap_udmabuf,
>> fbb0de79507819 Gerd Hoffmann 2018-08-27  113    .release          = release_udmabuf,
>> fbb0de79507819 Gerd Hoffmann 2018-08-27 @114    .map              = kmap_udmabuf,
>> fbb0de79507819 Gerd Hoffmann 2018-08-27 @115    .unmap            = kunmap_udmabuf,
>> fbb0de79507819 Gerd Hoffmann 2018-08-27  116    .mmap             = mmap_udmabuf,
>> fbb0de79507819 Gerd Hoffmann 2018-08-27  117  };
>> fbb0de79507819 Gerd Hoffmann 2018-08-27  118
>>
>> :::::: The code at line 114 was first introduced by commit
>> :::::: fbb0de795078190a9834b3409e4b009cfb18a6d4 Add udmabuf misc device
>>
>> :::::: TO: Gerd Hoffmann <kraxel@redhat.com>
>> :::::: CC: Gerd Hoffmann <kraxel@redhat.com>
>>
>> ---
>> 0-DAY kernel test infrastructure                 Open Source Technology Center
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
>
>

