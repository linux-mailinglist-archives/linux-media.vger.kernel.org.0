Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACE73E02E9
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 16:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238648AbhHDOTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 10:19:03 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:49133 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238560AbhHDOTC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 10:19:02 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id BHjJmKU4B4JsbBHjKmon8m; Wed, 04 Aug 2021 16:18:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628086727; bh=MbAiBFZoPAuYbPOa72UikJ/SjTdADlf2bma3bgSbStk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PlTI8sEdPaClBAyyDPqGa5asG/7qk9y15KcuKcMY1xBr/L4NF43iuFbNdYVR2kkkH
         TRZ3ZSdUT4tL4Thn2AiMG/U7hH3JYI/WZbh42ooNX765uguT0BF0YA5+a9suk4Yyf+
         bHJWgIMDx23ysLSv1gF0jrQ6ara727+/t/8m8cJFz99AyStL8Houg4GBAqij+v/aM4
         MSfM2FZkh74H6/pSW0FvGlxbS1hwc5e1WAnyvb5yuHOhzMqwpBCaTBP/4vLLmtLsTh
         4fkgWsMj5r/334uBePF0dgkh2JhReG1Ni4Fzgl2jD1+zGdnrxJ0mmrSWAiCQ/v3UQJ
         caoDNtTrw5dzA==
Subject: Re: [PATCH] media: vivid: drop CONFIG_FB dependency
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        kernel test robot <lkp@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <bf74a4670438864ca2e6bde47121554490350729.1627557341.git.guillaume.tucker@collabora.com>
 <202107302145.AQPuE7DD-lkp@intel.com>
 <da7e0fe9-c476-7b79-d99d-24a6d3308188@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <72a52c6b-c06b-f1fe-dda2-f9dd458ca342@xs4all.nl>
Date:   Wed, 4 Aug 2021 16:18:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <da7e0fe9-c476-7b79-d99d-24a6d3308188@collabora.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfML1+3azk9KvujL/Iisj/sqTlcPQ4/rXenIJ3SYZQyFEDlIzR3Sf99TBDqIz3y+o3T+yaDts3kMmhjswlThy4v0uOvneIBnZi0KguB2kp3+DiakaypTF
 mNjwqZkdghqzzD2IkKaAv7z1e4we45/mtge8DW+PLSBuOn8iQu5+Ek44ThS6C3/Hvag7yeQPCoeb975beU93qpG8qyxxaJW6rnKlVh4RNY//PQeg5kjWdJYh
 W7bEpBzkgEnT5bWcFNp91A3Arq6XvM4mygao65h3tHqhqK5Tr7/HTzRFO0KZRIRMMHlEqtB5kpv3iBMAmTy4GBJCkdOH9uWtpVhnK1ozJNb4Cw66Rh2yyBIq
 KU3JBCuHUKCdyJCGtmnJGUsOGsfWUhITq5ymqs2BOrM8vTG9tQVEn6IUYHdtRQSzooYHoTzYMovkd52N6a4dYVEOKEs0smRdTWMhWh+6unQ8uH4Y5M8N40tl
 Vxv7v4U8/BpZ3nXeVugPdfhzmbXoQAUsjcydHw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guillaume,

On 30/07/2021 16:26, Guillaume Tucker wrote:
> On 30/07/2021 14:32, kernel test robot wrote:
>> Hi Guillaume,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on linuxtv-media/master]
>> [also build test ERROR on v5.14-rc3 next-20210729]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Guillaume-Tucker/media-vivid-drop-CONFIG_FB-dependency/20210729-191815
>> base:   git://linuxtv.org/media_tree.git master
>> config: m68k-allmodconfig (attached as .config)
>> compiler: m68k-linux-gcc (GCC) 10.3.0
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # https://github.com/0day-ci/linux/commit/51defc67cada10450046e4d4e7eda1a2573371cc
>>         git remote add linux-review https://github.com/0day-ci/linux
>>         git fetch --no-tags linux-review Guillaume-Tucker/media-vivid-drop-CONFIG_FB-dependency/20210729-191815
>>         git checkout 51defc67cada10450046e4d4e7eda1a2573371cc
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross ARCH=m68k 
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> ERROR: modpost: "vivid_clear_fb" [drivers/media/test-drivers/vivid/vivid.ko] undefined!
>>>> ERROR: modpost: "vivid_fb_release_buffers" [drivers/media/test-drivers/vivid/vivid.ko] undefined!
>>>> ERROR: modpost: "vivid_fb_init" [drivers/media/test-drivers/vivid/vivid.ko] undefined!
> 
> Pretty sure this is due to the conditional in the Makefile I
> mentioned in an email yesterday, where it should have been
> ifneq ($(CONFIG_FB),) for when CONFIG_FB=m.
> 
> Let me know if I should send a v2 now with this fix, I was
> waiting for Hans' feedback first.

Go ahead and send a v2.

I have just one comment: in vivid-core.c, please change this in the node_types
MODULE_PARM_DESC:

                             "\t\t    bit 12: Radio Transmitter node\n"
                             "\t\t    bit 16: Framebuffer for testing overlays\n"
                             "\t\t    bit 17: Metadata Capture node\n"

to:

                             "\t\t    bit 12: Radio Transmitter node\n"
#ifdef CONFIG_FB
                             "\t\t    bit 16: Framebuffer for testing overlays\n"
#endif
                             "\t\t    bit 17: Metadata Capture node\n"

That way it is visible with modinfo whether or not framebuffer support is
compiled in or not.

Regards,

	Hans

> 
> Thanks,
> Guillaume
> 

