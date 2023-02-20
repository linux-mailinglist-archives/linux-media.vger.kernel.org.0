Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C877269D577
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 21:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbjBTU72 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 15:59:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjBTU70 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 15:59:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4147159C5
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 12:59:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00B4B2F5;
        Mon, 20 Feb 2023 21:59:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676926762;
        bh=b2ld4NIwFjp4yAzmvQRQTJrST8F1DQ4UUE6JOsqRn+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e68pfN3pjXFBDcQf418hRTRvoGwM+2th0Yz1ara4O+mEIt5OyqZ3UqtQQ/Cv9iAu2
         s8coy885Gh8AQEqeeLZ5RYDI3TxgYqctWMjzFbWC3d+R9SCe5qBQMQGqjW9MqTS6+z
         OVMtyc1rGxrMFD+wgoStB4DoNvhlL8xyghM216w8=
Date:   Mon, 20 Feb 2023 22:59:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, ezequiel@collabora.com,
        gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com
Subject: Re: [v4l-utils] [PATCH v8 0/6] Switch build system to meson
Message-ID: <Y/PfKEYpZwMMi0wt@pendragon.ideasonboard.com>
References: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
 <2fedb527-6faf-7d9b-592c-32862c18bcfa@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fedb527-6faf-7d9b-592c-32862c18bcfa@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Feb 20, 2023 at 01:13:09PM +0200, Tomi Valkeinen wrote:
> On 12/02/2023 02:51, Laurent Pinchart wrote:
> > Hello everybody,
> > 
> > This series is the latest (and greatest) attempt to switch v4l-utils
> > from autotools to meson.
> > 
> > Compared to v7, the series has been rebased on top of the latest master
> > branch, and lots of fixes have been added. All review comments should
> > have been addressed. Detailed changelogs are included in individual
> > patches, in particular in patch 3/6.
> > 
> > The rebase was a bit painful due to the new v4l2-tracer tool and its
> > code generation script. While meson handles code generation fine, it
> > required fixes to the script to be able to specify the output directory
> > and to generate the trace and retrace sources separately. Many thanks to
> > Sakari for his help with this, which I've included in this series as
> > patch 1/6.
> > 
> > Gregor, I haven't included the Tested-by tag you gave on v7 as v8
> > contains many small changes. Sorry about that.
> > 
> > The patches are based on 3 pending patches for v4l-utils that have been
> > posted to the list in the last couple of days:
> > 
> > - libv4lconvert: Don't ignore return value of ftruncate()
> > - keytable: Add -fno-stack-protector compilation option
> > - configure.ac: Add option to disable compilation of v4l2-tracer
> > 
> > None are strictly required, but I've included the equivalent of the
> > second and third patches in the meson support, so I wanted to base the
> > patches on top of the autotools' equivalent. I expect those three
> > patches to be merged soon.
> > 
> > As far as I can tell, meson support is now ready. I can address review
> > comments in a v9 if there are any, but I'd like to merge it soon to
> > avoid another painful rebase. I'll be available to fix issues on top if
> > any problem is encountered later.
> > 
> > A tag that includes this series can be found at
> > 
> >          git://linuxtv.org/pinchartl/v4l-utils.git tags/meson-v8
> 
> If I build this for x86 or arm64 with default options, it builds fine. If I build for arm32 (against my buildroot rootfs), the build fails:
> 
> [197/254] Compiling C object contrib/test/v4l2gl.p/v4l2gl.c.o
> FAILED: contrib/test/v4l2gl.p/v4l2gl.c.o
> ccache /home/tomba/work/buildroot/output32/host/bin/arm-buildroot-linux-gnueabihf-gcc -Icontrib/test/v4l2gl.p -Icontrib/test -I../contrib/test -I../lib/include -I../include -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libdrm -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/valgrind -I. -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=gnu99 -O2 -g -Wpointer-arith -D_GNU_SOURCE -DPROMOTED_MODE_T=int -DENABLE_NLS -MD -MQ contrib/test/v4l2gl.p/v4l2gl.c.o -MF contrib/test/v4l2gl.p/v4l2gl.c.o.d -o contrib/test/v4l2gl.p/v4l2gl.c.o -c ../contrib/test/v4l2gl.c
> ../contrib/test/v4l2gl.c:268:60: error: expected ‘,’ or ‘;’ before ‘V4L_UTILS_VERSION’
>    268 | const char *argp_program_version = "V4L2 grabber version " V4L_UTILS_VERSION;
>        |                                                            ^~~~~~~~~~~~~~~~~

Thank you for the report. I've test-compiled for arm32, but my build
environment may not have the features needed by v4l2gl.c, so it may have
been skipped. Would you be able to check what goes wrong ? v4l2gl.c
includes config.h, so V4L_UTILS_VERSION should be defined. Does your
config.h (generated in the build directory) define V4L_UTILS_VERSION ?
Does your buildroot environment provide a config.h that is being picked
instead ?

> I also see some warnings, which are possibly not related to this seris, like:

That's not related as far as I can tell.

> [207/254] Compiling C++ object utils/cec-ctl/cec-ctl.p/cec-ctl.cpp.o
> In file included from /home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/vector:72,
>                   from ../utils/cec-ctl/cec-ctl.cpp:13:
> /home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/bits/vector.tcc: In member function ‘void std::vector<_Tp, _Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&& ...) [with _Args = {const cec_msg&}; _Tp = cec_msg; _Alloc = std::allocator<cec_msg>]’:
> /home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/bits/vector.tcc:426:7: note: parameter passing for argument of type ‘std::vector<cec_msg>::iterator’ changed in GCC 7.1
>    426 |       vector<_Tp, _Alloc>::
>        |       ^~~~~~~~~~~~~~~~~~~
> In file included from /home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/vector:67,
>                   from ../utils/cec-ctl/cec-ctl.cpp:13:
> /home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/bits/stl_vector.h: In member function ‘void std::vector<_Tp, _Alloc>::push_back(const value_type&) [with _Tp = cec_msg; _Alloc = std::allocator<cec_msg>]’:
> /home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/include/c++/11.3.0/bits/stl_vector.h:1198:28: note: parameter passing for argument of type ‘__gnu_cxx::__normal_iterator<cec_msg*, std::vector<cec_msg> >’ changed in GCC 7.1
>   1198 |           _M_realloc_insert(end(), __x);
>        |           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
> 

-- 
Regards,

Laurent Pinchart
