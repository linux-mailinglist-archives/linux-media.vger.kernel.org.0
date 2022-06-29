Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234FA5604BB
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 17:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbiF2Pgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 11:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiF2Pgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 11:36:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10DFB393FF
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 08:36:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C51C2B81DDF
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 15:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A32C341C8;
        Wed, 29 Jun 2022 15:36:33 +0000 (UTC)
Message-ID: <ff27a9a8-47b6-9a09-4409-8fcc9cd2a314@xs4all.nl>
Date:   Wed, 29 Jun 2022 17:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v9 0/6] staging: media: wave5: add wave5 codec driver
Content-Language: en-US
To:     Nas Chung <nas.chung@chipsnmedia.com>, linux-media@vger.kernel.org
Cc:     linux-staging@lists.linux.dev, mchehab@kernel.org
References: <20220628110821.716-1-nas.chung@chipsnmedia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220628110821.716-1-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nas,

On 28/06/2022 13:08, Nas Chung wrote:
> The Wave5 codec driver is a stateful encoder/decoder.
> It is found on the J721S2 SoC, JH7100 SoC, ssd202d SoC. Etc.
> But current test report is based on J721S2 SoC and pre-silicon FPGA.
> 
> The driver currently supports V4L2_PIX_FMT_HEVC, V4L2_PIX_FMT_H264.
> 
> This driver has so far been tested on J721S2 EVM board and pre-silicon
> FPGA.
> 
> Testing on J721S2 EVM board shows it working fine both decoder and
> encoder.
> The driver is successfully working with gstreamer v4l2 good-plugin
> without any modification.
> 
> Testing on FPGA also shows it working fine, though the FPGA uses polled
> interrupts and copied buffers between the host and it's on board RAM.

I wanted to merge this series, but I got several compile/smatch
errors/warnings:

There are several compile errors under i686 (i.e. a 32 bit architecture):

linux-git-i686: WARNINGS

/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-dec.c: In function 'wave5_vpu_open_dec':
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-dec.c:1358:16: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
 1358 |         return ret;
      |                ^~~
In file included from /home/hans/work/build/media-git/include/linux/device.h:15,
                 from /home/hans/work/build/media-git/include/linux/platform_device.h:13,
                 from /home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu.c:9:
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu.c: In function 'wave5_vpu_probe':
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu.c:232:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka
'unsigned int'} [-Wformat=]
  232 |         dev_err(&pdev->dev, "sram daddr: 0x%llx, size: 0x%lx\n",
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/hans/work/build/media-git/include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                              ^~~
/home/hans/work/build/media-git/include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
  144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                        ^~~~~~~
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu.c:232:9: note: in expansion of macro 'dev_err'
  232 |         dev_err(&pdev->dev, "sram daddr: 0x%llx, size: 0x%lx\n",
      |         ^~~~~~~
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu.c:232:47: note: format string is defined here
  232 |         dev_err(&pdev->dev, "sram daddr: 0x%llx, size: 0x%lx\n",
      |                                            ~~~^
      |                                               |
      |                                               long long unsigned int
      |                                            %x
In file included from /home/hans/work/build/media-git/include/linux/device.h:15,
                 from /home/hans/work/build/media-git/include/linux/platform_device.h:13,
                 from /home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu.c:9:
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu.c:232:29: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned
int'} [-Wformat=]
  232 |         dev_err(&pdev->dev, "sram daddr: 0x%llx, size: 0x%lx\n",
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/hans/work/build/media-git/include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                              ^~~
/home/hans/work/build/media-git/include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
  144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                        ^~~~~~~
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu.c:232:9: note: in expansion of macro 'dev_err'
  232 |         dev_err(&pdev->dev, "sram daddr: 0x%llx, size: 0x%lx\n",
      |         ^~~~~~~
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu.c:232:60: note: format string is defined here
  232 |         dev_err(&pdev->dev, "sram daddr: 0x%llx, size: 0x%lx\n",
      |                                                          ~~^
      |                                                            |
      |                                                            long unsigned int
      |                                                          %x
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-enc.c: In function 'wave5_vpu_open_enc':
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-enc.c:1479:16: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
 1479 |         return ret;
      |                ^~~

linux-git-x86_64: WARNINGS

/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-dec.c: In function 'wave5_vpu_open_dec':
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-dec.c:1358:16: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
 1358 |         return ret;
      |                ^~~
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-enc.c: In function 'wave5_vpu_open_enc':
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-enc.c:1479:16: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
 1479 |         return ret;
      |                ^~~

And smatch gives this:

/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-dec.c:1143:21: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-dec.c:1358:16: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-enc.c:1247:21: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-enc.c:1479:16: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpuapi.c: /home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpuapi.c:93 wave5_check_dec_open_param() warn: maybe use
&& instead of &
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpuapi.c: /home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpuapi.c:505 wave5_vpu_dec_get_output_info() warn:
inconsistent indenting
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-dec.c: /home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-dec.c:1357 wave5_vpu_open_dec() warn: '&inst->list'
not removed from list
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-dec.c: /home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-dec.c:1358 wave5_vpu_open_dec() error: uninitialized
symbol 'ret'.
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-enc.c: /home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-enc.c:1478 wave5_vpu_open_enc() warn: '&inst->list'
not removed from list
/home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-enc.c: /home/hans/work/build/media-git/drivers/staging/media/wave5/wave5-vpu-enc.c:1479 wave5_vpu_open_enc() error: uninitialized
symbol 'ret'.

Also two kerneldoc issues:

kerneldoc: WARNINGS
drivers/staging/media/wave5/wave5-vpuapi.h:144: warning: Cannot understand  * \brief parameters of DEC_SET_SEQ_CHANGE_MASK
drivers/staging/media/wave5/wave5-vdi.h:68: warning: Cannot understand  * @brief make clock stable before changing clock frequency

And finally: quite a lot of the new sources have an empty line at the end. Please remove that.

It's all small stuff, but I'd appreciate it if you can fix it and post a v7.

Regards,

	Hans
