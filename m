Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A464B7AE371
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 03:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjIZBqo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 21:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbjIZBqn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 21:46:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E2E10C
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 18:46:36 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52263C433C8
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 01:46:35 +0000 (UTC)
Date:   Tue, 26 Sep 2023 03:46:33 +0200
Message-ID: <0da9123541f8bc07d21f7e710894eff1.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Sep 26 03:00:18 CEST 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	72666b8ca7ddd9f3745a0049f0aa80785925ebfb
v4l-utils git hash:	b79e00a74fde35d0c0bb801b78b15664d3f10309
edid-decode git hash:	e59b8a2ffd690d6576639365a67e890d91ca443d
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.2
sparse repo:            git://git.kernel.org/pub/scm/devel/sparse/sparse.git
sparse version:		v0.6.4-39-gce1a6720
smatch repo:            git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8464-g7c80de6b
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: b81901f31466fd2a51e2fe28a46979d1690a01d1
host hardware:		x86_64
host os:		6.4.13-cobaltpc1

linux-git-arm: (18 string truncate warnings) OK
linux-git-powerpc64: (30 string truncate warnings) OK
linux-git-arm64: (16 string truncate warnings) OK
linux-git-i686: WARNINGS:

In file included from include/linux/string.h:254,
                 from arch/x86/include/asm/page_32.h:18,
                 from arch/x86/include/asm/page.h:14,
                 from arch/x86/include/asm/thread_info.h:12,
                 from include/linux/thread_info.h:60,
                 from arch/x86/include/asm/preempt.h:9,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/slab.h:16,
                 from drivers/staging/media/atomisp//include/hmm/hmm.h:26,
                 from drivers/staging/media/atomisp/pci/sh_css_params.c:26:
In function 'fortify_memcpy_chk',
    inlined from 'sh_css_store_sp_group_to_ddr' at drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
  592 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

linux-git-x86_64: (41 string truncate warnings) WARNINGS:

In file included from include/linux/string.h:254,
                 from include/linux/bitmap.h:11,
                 from include/linux/cpumask.h:12,
                 from arch/x86/include/asm/paravirt.h:17,
                 from arch/x86/include/asm/cpuid.h:62,
                 from arch/x86/include/asm/processor.h:19,
                 from arch/x86/include/asm/cpufeature.h:5,
                 from arch/x86/include/asm/thread_info.h:53,
                 from include/linux/thread_info.h:60,
                 from arch/x86/include/asm/preempt.h:9,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/slab.h:16,
                 from drivers/staging/media/atomisp//include/hmm/hmm.h:26,
                 from drivers/staging/media/atomisp/pci/sh_css_params.c:26:
In function 'fortify_memcpy_chk',
    inlined from 'sh_css_store_sp_group_to_ddr' at drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
  592 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

no-acpi.config: (38 string truncate warnings) OK
no-of.config: (39 string truncate warnings) WARNINGS:

In file included from include/linux/string.h:254,
                 from include/linux/bitmap.h:11,
                 from include/linux/cpumask.h:12,
                 from arch/x86/include/asm/paravirt.h:17,
                 from arch/x86/include/asm/cpuid.h:62,
                 from arch/x86/include/asm/processor.h:19,
                 from arch/x86/include/asm/cpufeature.h:5,
                 from arch/x86/include/asm/thread_info.h:53,
                 from include/linux/thread_info.h:60,
                 from arch/x86/include/asm/preempt.h:9,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/slab.h:16,
                 from drivers/staging/media/atomisp//include/hmm/hmm.h:26,
                 from drivers/staging/media/atomisp/pci/sh_css_params.c:26:
In function 'fortify_memcpy_chk',
    inlined from 'sh_css_store_sp_group_to_ddr' at drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
  592 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

no-pm.config: (41 string truncate warnings) WARNINGS:

In file included from include/linux/string.h:254,
                 from include/linux/bitmap.h:11,
                 from include/linux/cpumask.h:12,
                 from arch/x86/include/asm/cpumask.h:5,
                 from arch/x86/include/asm/msr.h:11,
                 from arch/x86/include/asm/processor.h:23,
                 from arch/x86/include/asm/cpufeature.h:5,
                 from arch/x86/include/asm/thread_info.h:53,
                 from include/linux/thread_info.h:60,
                 from arch/x86/include/asm/preempt.h:9,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/slab.h:16,
                 from drivers/staging/media/atomisp//include/hmm/hmm.h:26,
                 from drivers/staging/media/atomisp/pci/sh_css_params.c:26:
In function 'fortify_memcpy_chk',
    inlined from 'sh_css_store_sp_group_to_ddr' at drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
  592 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

no-pm-sleep.config: (41 string truncate warnings) WARNINGS:

In file included from include/linux/string.h:254,
                 from include/linux/bitmap.h:11,
                 from include/linux/cpumask.h:12,
                 from arch/x86/include/asm/cpumask.h:5,
                 from arch/x86/include/asm/msr.h:11,
                 from arch/x86/include/asm/processor.h:23,
                 from arch/x86/include/asm/cpufeature.h:5,
                 from arch/x86/include/asm/thread_info.h:53,
                 from include/linux/thread_info.h:60,
                 from arch/x86/include/asm/preempt.h:9,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/slab.h:16,
                 from drivers/staging/media/atomisp//include/hmm/hmm.h:26,
                 from drivers/staging/media/atomisp/pci/sh_css_params.c:26:
In function 'fortify_memcpy_chk',
    inlined from 'sh_css_store_sp_group_to_ddr' at drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
  592 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

no-debug-fs.config: (40 string truncate warnings) WARNINGS:

In file included from include/linux/string.h:254,
                 from include/linux/bitmap.h:11,
                 from include/linux/cpumask.h:12,
                 from arch/x86/include/asm/paravirt.h:17,
                 from arch/x86/include/asm/cpuid.h:62,
                 from arch/x86/include/asm/processor.h:19,
                 from arch/x86/include/asm/cpufeature.h:5,
                 from arch/x86/include/asm/thread_info.h:53,
                 from include/linux/thread_info.h:60,
                 from arch/x86/include/asm/preempt.h:9,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/slab.h:16,
                 from drivers/staging/media/atomisp//include/hmm/hmm.h:26,
                 from drivers/staging/media/atomisp/pci/sh_css_params.c:26:
In function 'fortify_memcpy_chk',
    inlined from 'sh_css_store_sp_group_to_ddr' at drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
  592 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sparse: WARNINGS:

In file included from include/linux/string.h:254,
                 from arch/x86/include/asm/page_32.h:18,
                 from arch/x86/include/asm/page.h:14,
                 from arch/x86/include/asm/thread_info.h:12,
                 from include/linux/thread_info.h:60,
                 from arch/x86/include/asm/preempt.h:9,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/slab.h:16,
                 from drivers/staging/media/atomisp//include/hmm/hmm.h:26,
                 from drivers/staging/media/atomisp/pci/sh_css_params.c:26:
In function 'fortify_memcpy_chk',
    inlined from 'sh_css_store_sp_group_to_ddr' at drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
  592 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: (41 string truncate warnings) WARNINGS:

In file included from include/linux/string.h:254,
                 from include/linux/bitmap.h:11,
                 from include/linux/cpumask.h:12,
                 from arch/x86/include/asm/paravirt.h:17,
                 from arch/x86/include/asm/cpuid.h:62,
                 from arch/x86/include/asm/processor.h:19,
                 from arch/x86/include/asm/cpufeature.h:5,
                 from arch/x86/include/asm/thread_info.h:53,
                 from include/linux/thread_info.h:60,
                 from arch/x86/include/asm/preempt.h:9,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/slab.h:16,
                 from drivers/staging/media/atomisp//include/hmm/hmm.h:26,
                 from drivers/staging/media/atomisp/pci/sh_css_params.c:26:
In function 'fortify_memcpy_chk',
    inlined from 'sh_css_store_sp_group_to_ddr' at drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
  592 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Tue Sep 26 03:16:55 CEST 2023
virtme: WARNINGS: Final Summary: 3080, Succeeded: 3080, Failed: 0, Warnings: 5
virtme-32: WARNINGS: Final Summary: 3193, Succeeded: 3193, Failed: 0, Warnings: 5

date:			Tue Sep 26 03:44:44 CEST 2023

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
