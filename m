Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430D06D19C8
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 10:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjCaI1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 04:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbjCaI1Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 04:27:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28FDB474
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 01:27:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3BB95B82D07
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 08:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C680C433D2;
        Fri, 31 Mar 2023 08:27:20 +0000 (UTC)
Message-ID: <c7249ba0-f1f4-f199-7a1b-5dde2b79c920@xs4all.nl>
Date:   Fri, 31 Mar 2023 10:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4l-utils v1] v4l2-tracer: fix 'symbol mmap64/open64 is
 already defined' compile failure
Content-Language: en-US
To:     Peter Seiderer <ps.report@gmx.net>, linux-media@vger.kernel.org
References: <20230330150606.20483-1-ps.report@gmx.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230330150606.20483-1-ps.report@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Peter,

On 30/03/2023 17:06, Peter Seiderer wrote:
> Compiling for RPi4 (64-bit) using buildroot failes with the following
> error:
> 
>   .../host/bin/aarch64-buildroot-linux-gnu-g++ -DHAVE_CONFIG_H -I. -I../.. -I../../utils/common -I.../aarch64-buildroot-linux-gnu/sysroot/usr/include/json-c -I../../lib/include -Wall -Wpointer-arith -D_GNU_SOURCE -I../../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -std=gnu++11 -c libv4l2tracer.cpp  -fPIC -DPIC -o .libs/libv4l2tracer_la-libv4l2tracer.o
>   /tmp/ccfbectY.s: Assembler messages:
>   /tmp/ccfbectY.s:208: Error: symbol `open64' is already defined
>   /tmp/ccfbectY.s:762: Error: symbol `mmap64' is already defined
> 
> The preprocessor output shows:
> 
>   [...]
>   extern "C" {
>   # 61 ".../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/mman.h" 3 4
>   extern void * mmap (void *__addr, size_t __len, int __prot, int __flags, int __fd, __off64_t __offset) noexcept (true) __asm__ ("" "mmap64");
>   [...]
>   extern void *mmap64 (void *__addr, size_t __len, int __prot,
>          int __flags, int __fd, __off64_t __offset) noexcept (true);
> 
> And host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/mman.h:
> 
>   56 #ifndef __USE_FILE_OFFSET64
>   57 extern void *mmap (void *__addr, size_t __len, int __prot,
>   58                    int __flags, int __fd, __off_t __offset) __THROW;
>   59 #else
>   60 # ifdef __REDIRECT_NTH
>   61 extern void * __REDIRECT_NTH (mmap,
>   62                               (void *__addr, size_t __len, int __prot,
>   63                                int __flags, int __fd, __off64_t __offset),
>   64                               mmap64);
>   65 # else
>   66 #  define mmap mmap64
>   67 # endif
>   68 #endif
>   69 #ifdef __USE_LARGEFILE64
>   70 extern void *mmap64 (void *__addr, size_t __len, int __prot,
>   71                      int __flags, int __fd, __off64_t __offset) __THROW;
>   72 #endif
> 
> Fix it by applying the same undef _LARGEFILE_SOURCE/_FILE_OFFSET_BITS,
> define _LARGEFILE64_SOURCE as in as in lib/libv4l1/v4l1compat.c

If I look at 'man feature_test_macros', then that man page suggests that
_LARGEFILE64_SOURCE is out of date and instead you should use
'#define _FILE_OFFSET_BITS 64'.

Can you test that? If this works, then it should be applied to v4l1compat.c
as well.

> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
> 
>   - maybe the 'defined(linux) && defined(__GLIBC__)' protection
>     present in lib/libv4l1/v4l1compat.c for open64/mmap64 is needed
>     for non glibc compiles of utils/v4l2-tracer/libv4l2tracer.cpp too?

I think we need this too. If nothing else, it is consistent.

Regards,

	Hans

> ---
>  utils/v4l2-tracer/libv4l2tracer.cpp | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
> index a9f039c7..1e3900db 100644
> --- a/utils/v4l2-tracer/libv4l2tracer.cpp
> +++ b/utils/v4l2-tracer/libv4l2tracer.cpp
> @@ -3,6 +3,11 @@
>   * Copyright 2022 Collabora Ltd.
>   */
>  
> +/* ensure we see *64 variants and they aren't transparently used */
> +#undef _LARGEFILE_SOURCE
> +#undef _FILE_OFFSET_BITS
> +#define _LARGEFILE64_SOURCE 1
> +
>  #include "trace.h"
>  #include <dlfcn.h>
>  #include <stdarg.h>

