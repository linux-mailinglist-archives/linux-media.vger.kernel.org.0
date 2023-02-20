Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4778C69C954
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 12:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjBTLNU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 06:13:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjBTLNS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 06:13:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A982E12BF0
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 03:13:16 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5360A49;
        Mon, 20 Feb 2023 12:13:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676891593;
        bh=Bab2RzRidKBpYklZEI0RKiQvSn7UUPYa/jHXQdirYDI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=k9IgZmNG+XUap9T2FQ6P3OVAgY2f3fDyeH5B5XybEOszYGkIl4f/68gvdyBN4v1jw
         gDVnpgJEereDLOzWhQAtIQmy6jJIK5PeE7B6HJhqA7igh8lTlCoBLL5u5lQh1Jy4HC
         tQJiP2OKEKpDqAS8ETWx3VlFJlsrXY76fsLKRhSM=
Message-ID: <2fedb527-6faf-7d9b-592c-32862c18bcfa@ideasonboard.com>
Date:   Mon, 20 Feb 2023 13:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [v4l-utils] [PATCH v8 0/6] Switch build system to meson
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com
References: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 12/02/2023 02:51, Laurent Pinchart wrote:
> Hello everybody,
> 
> This series is the latest (and greatest) attempt to switch v4l-utils
> from autotools to meson.
> 
> Compared to v7, the series has been rebased on top of the latest master
> branch, and lots of fixes have been added. All review comments should
> have been addressed. Detailed changelogs are included in individual
> patches, in particular in patch 3/6.
> 
> The rebase was a bit painful due to the new v4l2-tracer tool and its
> code generation script. While meson handles code generation fine, it
> required fixes to the script to be able to specify the output directory
> and to generate the trace and retrace sources separately. Many thanks to
> Sakari for his help with this, which I've included in this series as
> patch 1/6.
> 
> Gregor, I haven't included the Tested-by tag you gave on v7 as v8
> contains many small changes. Sorry about that.
> 
> The patches are based on 3 pending patches for v4l-utils that have been
> posted to the list in the last couple of days:
> 
> - libv4lconvert: Don't ignore return value of ftruncate()
> - keytable: Add -fno-stack-protector compilation option
> - configure.ac: Add option to disable compilation of v4l2-tracer
> 
> None are strictly required, but I've included the equivalent of the
> second and third patches in the meson support, so I wanted to base the
> patches on top of the autotools' equivalent. I expect those three
> patches to be merged soon.
> 
> As far as I can tell, meson support is now ready. I can address review
> comments in a v9 if there are any, but I'd like to merge it soon to
> avoid another painful rebase. I'll be available to fix issues on top if
> any problem is encountered later.
> 
> A tag that includes this series can be found at
> 
>          git://linuxtv.org/pinchartl/v4l-utils.git tags/meson-v8

If I build this for x86 or arm64 with default options, it builds fine. If I build for arm32 (against my buildroot rootfs), the build fails:

[197/254] Compiling C object contrib/test/v4l2gl.p/v4l2gl.c.o
FAILED: contrib/test/v4l2gl.p/v4l2gl.c.o
ccache /home/tomba/work/buildroot/output32/host/bin/arm-buildroot-linux-gnueabihf-gcc -Icontrib/test/v4l2gl.p -Icontrib/test -I../contrib/test -I../lib/include -I../include -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libdrm -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/valgrind -I. -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=gnu99 -O2 -g -Wpointer-arith -D_GNU_SOURCE -DPROMOTED_MODE_T=int -DENABLE_NLS -MD -MQ contrib/test/v4l2gl.p/v4l2gl.c.o -MF contrib/test/v4l2gl.p/v4l2gl.c.o.d -o contrib/test/v4l2gl.p/v4l2gl.c.o -c ../contrib/test/v4l2gl.c
../contrib/test/v4l2gl.c:268:60: error: expected ‘,’ or ‘;’ before ‘V4L_UTILS_VERSION’
   268 | const char *argp_program_version = "V4L2 grabber version " V4L_UTILS_VERSION;
       |                                                            ^~~~~~~~~~~~~~~~~

I also see some warnings, which are possibly not related to this seris, like:

[207/254] Compiling C++ object utils/cec-ctl/cec-ctl.p/cec-ctl.cpp.o
In file included from /home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/vector:72,
                  from ../utils/cec-ctl/cec-ctl.cpp:13:
/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/bits/vector.tcc: In member function ‘void std::vector<_Tp, _Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&& ...) [with _Args = {const cec_msg&}; _Tp = cec_msg; _Alloc = std::allocator<cec_msg>]’:
/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/bits/vector.tcc:426:7: note: parameter passing for argument of type ‘std::vector<cec_msg>::iterator’ changed in GCC 7.1
   426 |       vector<_Tp, _Alloc>::
       |       ^~~~~~~~~~~~~~~~~~~
In file included from /home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/vector:67,
                  from ../utils/cec-ctl/cec-ctl.cpp:13:
/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/bits/stl_vector.h: In member function ‘void std::vector<_Tp, _Alloc>::push_back(const value_type&) [with _Tp = cec_msg; _Alloc = std::allocator<cec_msg>]’:
/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/bits/stl_vector.h:1198:28: note: parameter passing for argument of type ‘__gnu_cxx::__normal_iterator<cec_msg*, std::vector<cec_msg> >’ changed in GCC 7.1
  1198 |           _M_realloc_insert(end(), __x);
       |           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~

  Tomi

