Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47883DBA8E
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 16:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239153AbhG3O1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 10:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbhG3O1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 10:27:04 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7CCC06175F;
        Fri, 30 Jul 2021 07:26:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 53CCA1F44A18
Subject: Re: [PATCH] media: vivid: drop CONFIG_FB dependency
To:     kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <bf74a4670438864ca2e6bde47121554490350729.1627557341.git.guillaume.tucker@collabora.com>
 <202107302145.AQPuE7DD-lkp@intel.com>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <da7e0fe9-c476-7b79-d99d-24a6d3308188@collabora.com>
Date:   Fri, 30 Jul 2021 15:26:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <202107302145.AQPuE7DD-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/07/2021 14:32, kernel test robot wrote:
> Hi Guillaume,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on linuxtv-media/master]
> [also build test ERROR on v5.14-rc3 next-20210729]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Guillaume-Tucker/media-vivid-drop-CONFIG_FB-dependency/20210729-191815
> base:   git://linuxtv.org/media_tree.git master
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 10.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/51defc67cada10450046e4d4e7eda1a2573371cc
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Guillaume-Tucker/media-vivid-drop-CONFIG_FB-dependency/20210729-191815
>         git checkout 51defc67cada10450046e4d4e7eda1a2573371cc
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross ARCH=m68k 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
>>> ERROR: modpost: "vivid_clear_fb" [drivers/media/test-drivers/vivid/vivid.ko] undefined!
>>> ERROR: modpost: "vivid_fb_release_buffers" [drivers/media/test-drivers/vivid/vivid.ko] undefined!
>>> ERROR: modpost: "vivid_fb_init" [drivers/media/test-drivers/vivid/vivid.ko] undefined!

Pretty sure this is due to the conditional in the Makefile I
mentioned in an email yesterday, where it should have been
ifneq ($(CONFIG_FB),) for when CONFIG_FB=m.

Let me know if I should send a v2 now with this fix, I was
waiting for Hans' feedback first.

Thanks,
Guillaume
