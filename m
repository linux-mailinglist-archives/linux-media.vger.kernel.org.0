Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533E12678DE
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 10:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgILIfp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 04:35:45 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:49427 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725813AbgILIfn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 04:35:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id H10Tkm8DoPTBMH10VkWMMx; Sat, 12 Sep 2020 10:35:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599899739; bh=J8A6qyz3+qtGDeQeyqIVGeh/R46Fs0TvDvxlpF8MkdU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aw+eqkPzQ3S3/nvT0zFg8WC3xcc83Co7vgAVtoShtEFAkb1fWlRtlHYxZcPBRDt07
         Mx9apgtAnc8kljptcn53l7T1B8kQWOoHFdpFsjxvz6OAuD1ge7MeTzCmD/r9nhN56p
         EH5qb2FacXVFAml+vS+mkW0bjL9bTPREllv+dCNsDNOpPTidczfvTf9WDrM746QqN1
         IG6jxzo/9Yvz8nwM4WFQF6cSBIGaWYyjZC3YQi0d+yuNIVoAS/037JMySVLG/j79xU
         tR9hOG9JW14U1bh6qCeJdepEdQNCaejPk0E2tKltguh6Db+xIGbwjsmK8rfQp3rFhx
         RGdXLl7S4+IQg==
Subject: Re: [v10 0/4] media: vidtv: Implement a virtual DVB driver
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
References: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e614351c-215c-c048-52af-7c200b164f41@xs4all.nl>
Date:   Sat, 12 Sep 2020 10:35:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF5RrNmC8xmYBEV3hdxQ7swnhTxBgTgTf5RUzbCBPahdURmJ/XpdzHelwsuLuImaubt4D3zJ232zRZZL1zQUDK/sK+IwgfuhTOgzULyU7m0s9izapdWA
 xWkN64eOPxopOn1byc6Nba/nTKn/hjA65mqgcjLJikJBqNxjvJ8qTP2FKJgsexUKr6BiNiaRsHUPppB/XZ5LskX2eeuICBVE1fW+BeSIxl6AIAi+oh+r2xVi
 JVXG0kutbmyMC1F9l0GyGpZ5cNcsMvj5uOdFBy2x7g27pZTspJlraOLPXS/zeIsFeufkSsjOFOWwM0Ex3qJwN7mXX95r8WRcynZTYJwoStxK+pr+vosih9Ln
 HuEc8vKjJVdd4dRKmS739YT8Nf6zqapcUNXzJZbzzaG78LWwJXuWcwDqBz8tg7EERMCjY8Kf4DS/mgMjufAV5R9V9fK5eu8oVTKB9RCPPvYK6nbLZL7PgniQ
 qk131g0JutodV8Vg3gzKMRHG7Hx0Jb3AC+e7W+tT1zGJKvZtJLK0LPvZe+g5lWW9v6uFLhjf9aRizmgAzvQATEOIfRYmX5q3pZKryw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/08/2020 14:58, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> This series is work in progress. It represents the current work done on a
> virtual DVB driver for the Linux media subsystem. I am new to the media
> subsystem and to kernel development in general.
> 
> This driver aims to:
> 	- Serve as template for new DVB driver writers
> 	- Help userspace application writers in general
> 	- Push fake audio/video to userspace for testing
> 	purposes
> 	- Push debug information to userspace via debugfs
> 
> Current state for this driver:
> 	- Driver generates PSI information (PAT, PMT, SDT)
> 	- Driver generates PCR packets
> 	- Driver generates NULL packets for padding
> 	- PCM audio stream is decoded by ffmpeg, but no audio is heard yet.
> 
> 
> changes in v10:
> 	s302m encoder got reworked

Hi Daniel, Mauro,

When compiling for a 32 bit system I get these warnings:

linux-5.9-rc1-i686: WARNINGS

In file included from ./include/linux/kernel.h:15,
                 from ./include/asm-generic/bug.h:20,
                 from ./arch/x86/include/asm/bug.h:93,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from /home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/config-compat.h:12,
                 from /home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/compat.h:10,
                 from <command-line>:
/home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/vidtv_common.c: In function 'vidtv_memcpy':
./include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
      |                  ^~~~~~
./include/linux/printk.h:508:10: note: in definition of macro 'printk_ratelimited'
  508 |   printk(fmt, ##__VA_ARGS__);    \
      |          ^~~
./include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
   11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
      |                  ^~~~~~~~
./include/linux/printk.h:522:21: note: in expansion of macro 'KERN_ERR'
  522 |  printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |                     ^~~~~~~~
/home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/vidtv_common.c:46:3: note: in expansion of macro 'pr_err_ratelimited'
   46 |   pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size. Needed %lu, had %zu\n",
      |   ^~~~~~~~~~~~~~~~~~
/home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/vidtv_common.c: In function 'vidtv_memset':
./include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
      |                  ^~~~~~
./include/linux/printk.h:508:10: note: in definition of macro 'printk_ratelimited'
  508 |   printk(fmt, ##__VA_ARGS__);    \
      |          ^~~
./include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
   11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
      |                  ^~~~~~~~
./include/linux/printk.h:522:21: note: in expansion of macro 'KERN_ERR'
  522 |  printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |                     ^~~~~~~~
/home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/vidtv_common.c:82:3: note: in expansion of macro 'pr_err_ratelimited'
   82 |   pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size. Needed %lu, had %zu\n",
      |   ^~~~~~~~~~~~~~~~~~
In file included from ./include/linux/kernel.h:15,
                 from ./include/asm-generic/bug.h:20,
                 from ./arch/x86/include/asm/bug.h:93,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from /home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/config-compat.h:12,
                 from /home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/compat.h:10,
                 from <command-line>:
/home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/vidtv_s302m.c: In function 'vidtv_s302m_write_frames':
./include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32' {aka 'unsigned int'} [-Wformat=]
    5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
      |                  ^~~~~~
./include/linux/printk.h:508:10: note: in definition of macro 'printk_ratelimited'
  508 |   printk(fmt, ##__VA_ARGS__);    \
      |          ^~~
./include/linux/kern_levels.h:12:22: note: in expansion of macro 'KERN_SOH'
   12 | #define KERN_WARNING KERN_SOH "4" /* warning conditions */
      |                      ^~~~~~~~
./include/linux/printk.h:524:21: note: in expansion of macro 'KERN_WARNING'
  524 |  printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
      |                     ^~~~~~~~~~~~
/home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/vidtv_s302m.c:426:4: note: in expansion of macro 'pr_warn_ratelimited'
  426 |    pr_warn_ratelimited("write size was %d, expected %lu\n",
      |    ^~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/bitops.h:5,
                 from ./include/linux/kernel.h:12,
                 from ./include/asm-generic/bug.h:20,
                 from ./arch/x86/include/asm/bug.h:93,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from /home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/config-compat.h:12,
                 from /home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/compat.h:10,
                 from <command-line>:
/home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/vidtv_pes.c: In function 'vidtv_pes_write_pts_dts':
./include/linux/bits.h:36:11: warning: right shift count is negative [-Wshift-count-negative]
   36 |   (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
      |           ^~
./include/linux/bits.h:38:31: note: in expansion of macro '__GENMASK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |                               ^~~~~~~~~
/home/hans/work/build/trees/i686/linux-5.9-rc1/media_build/v4l/vidtv_pes.c:99:10: note: in expansion of macro 'GENMASK'
   99 |  mask1 = GENMASK(32, 30);
      |          ^~~~~~~

Please take a look at this.

Regards,

	Hans
