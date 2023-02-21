Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E85A69DFE4
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 13:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234240AbjBUMFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 07:05:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234683AbjBUMEu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 07:04:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214E430D2
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 04:04:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DB26519;
        Tue, 21 Feb 2023 13:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676980963;
        bh=HO7MLuSisWJ9pYHHmgvfkPyJw/HnZmD9703Z0DRboLU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pKeT0Q51k3XrewxxwT/Ha++Gwb5mL6yuF6WGpFdtxMyuCZY73P4ohwgDFTT+M2bLv
         O9oZkcc3Aqyk2kXG1H1qJjlOqZHxMAUnbeViSFyArddCq/uIm7fMNzU4xpq/6pHL7Y
         H3uP443rNQuGRBMg3+zsjZOlOda1efBR4McPA928=
Date:   Tue, 21 Feb 2023 14:02:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, ezequiel@collabora.com,
        gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com
Subject: Re: [v4l-utils] [PATCH v8 0/6] Switch build system to meson
Message-ID: <Y/Sy4Wf214M46TtX@pendragon.ideasonboard.com>
References: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
 <2fedb527-6faf-7d9b-592c-32862c18bcfa@ideasonboard.com>
 <Y/PfKEYpZwMMi0wt@pendragon.ideasonboard.com>
 <f0e27b25-dfd8-8e3d-0d27-8c9d8d30bc16@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0e27b25-dfd8-8e3d-0d27-8c9d8d30bc16@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Feb 21, 2023 at 11:55:42AM +0200, Tomi Valkeinen wrote:
> On 20/02/2023 22:59, Laurent Pinchart wrote:
> > On Mon, Feb 20, 2023 at 01:13:09PM +0200, Tomi Valkeinen wrote:
> >> On 12/02/2023 02:51, Laurent Pinchart wrote:
> >>> Hello everybody,
> >>>
> >>> This series is the latest (and greatest) attempt to switch v4l-utils
> >>> from autotools to meson.
> >>>
> >>> Compared to v7, the series has been rebased on top of the latest master
> >>> branch, and lots of fixes have been added. All review comments should
> >>> have been addressed. Detailed changelogs are included in individual
> >>> patches, in particular in patch 3/6.
> >>>
> >>> The rebase was a bit painful due to the new v4l2-tracer tool and its
> >>> code generation script. While meson handles code generation fine, it
> >>> required fixes to the script to be able to specify the output directory
> >>> and to generate the trace and retrace sources separately. Many thanks to
> >>> Sakari for his help with this, which I've included in this series as
> >>> patch 1/6.
> >>>
> >>> Gregor, I haven't included the Tested-by tag you gave on v7 as v8
> >>> contains many small changes. Sorry about that.
> >>>
> >>> The patches are based on 3 pending patches for v4l-utils that have been
> >>> posted to the list in the last couple of days:
> >>>
> >>> - libv4lconvert: Don't ignore return value of ftruncate()
> >>> - keytable: Add -fno-stack-protector compilation option
> >>> - configure.ac: Add option to disable compilation of v4l2-tracer
> >>>
> >>> None are strictly required, but I've included the equivalent of the
> >>> second and third patches in the meson support, so I wanted to base the
> >>> patches on top of the autotools' equivalent. I expect those three
> >>> patches to be merged soon.
> >>>
> >>> As far as I can tell, meson support is now ready. I can address review
> >>> comments in a v9 if there are any, but I'd like to merge it soon to
> >>> avoid another painful rebase. I'll be available to fix issues on top if
> >>> any problem is encountered later.
> >>>
> >>> A tag that includes this series can be found at
> >>>
> >>>           git://linuxtv.org/pinchartl/v4l-utils.git tags/meson-v8
> >>
> >> If I build this for x86 or arm64 with default options, it builds fine. If I build for arm32 (against my buildroot rootfs), the build fails:
> >>
> >> [197/254] Compiling C object contrib/test/v4l2gl.p/v4l2gl.c.o
> >> FAILED: contrib/test/v4l2gl.p/v4l2gl.c.o
> >> ccache /home/tomba/work/buildroot/output32/host/bin/arm-buildroot-linux-gnueabihf-gcc -Icontrib/test/v4l2gl.p -Icontrib/test -I../contrib/test -I../lib/include -I../include -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libdrm -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/valgrind -I. -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=gnu99 -O2 -g -Wpointer-arith -D_GNU_SOURCE -DPROMOTED_MODE_T=int -DENABLE_NLS -MD -MQ contrib/test/v4l2gl.p/v4l2gl.c.o -MF contrib/test/v4l2gl.p/v4l2gl.c.o.d -o contrib/test/v4l2gl.p/v4l2gl.c.o -c ../contrib/test/v4l2gl.c
> >> ../contrib/test/v4l2gl.c:268:60: error: expected ‘,’ or ‘;’ before ‘V4L_UTILS_VERSION’
> >>     268 | const char *argp_program_version = "V4L2 grabber version " V4L_UTILS_VERSION;
> >>         |                                                            ^~~~~~~~~~~~~~~~~
> > 
> > Thank you for the report. I've test-compiled for arm32, but my build
> > environment may not have the features needed by v4l2gl.c, so it may have
> > been skipped. Would you be able to check what goes wrong ? v4l2gl.c
> > includes config.h, so V4L_UTILS_VERSION should be defined. Does your
> > config.h (generated in the build directory) define V4L_UTILS_VERSION ?
> > Does your buildroot environment provide a config.h that is being picked
> > instead ?
> 
> Here's my attempt fixing this. Works for me for x86, arm32 and arm64 builds:
> 
>  From 1c6df0f68e46ad56e527d4696d3c40a173b9f505 Mon Sep 17 00:00:00 2001
> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Date: Tue, 21 Feb 2023 11:43:11 +0200
> Subject: [PATCH] meson: use -include to include config.h instead of -I.
> 
> Use -include to get config.h included, instead of -I. and having the
> source files include the config.h. The issue with the latter is that -I.
> is rather late in the command line, and there may be config.h lurking in
> some other project include dir (e.g. valgrind's).
> 
> Note that this doesn't handle including the android-config.h (I think
> the meson build files break that anyway, as they don't have the project
> root in include path). I believe this would be best handled by somehow
> detecting android in the main meson.build file, and adding
> android-config.h with -include instead of the config.h

This looks good. I'll try to rebase it though, to switch to -include
before adding meson support.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   contrib/test/mc_nextgen_test.c          | 2 --
>   contrib/test/pixfmt-test.c              | 2 --
>   contrib/test/v4l2gl.c                   | 1 -
>   contrib/test/v4l2grab.c                 | 1 -
>   lib/libdvbv5/countries.c                | 1 -
>   lib/libdvbv5/dvb-dev-local.c            | 2 --
>   lib/libdvbv5/dvb-dev-remote.c           | 3 ---
>   lib/libdvbv5/dvb-dev.c                  | 2 --
>   lib/libdvbv5/dvb-fe.c                   | 2 --
>   lib/libdvbv5/dvb-file.c                 | 2 --
>   lib/libdvbv5/dvb-log.c                  | 2 --
>   lib/libdvbv5/dvb-sat.c                  | 2 --
>   lib/libdvbv5/dvb-scan.c                 | 2 --
>   lib/libdvbv5/dvb-vdr-format.c           | 2 --
>   lib/libdvbv5/parse_string.c             | 1 -
>   lib/libv4l-mplane/libv4l-mplane.c       | 1 -
>   lib/libv4l1/libv4l1.c                   | 1 -
>   lib/libv4l1/v4l1compat.c                | 1 -
>   lib/libv4l2/libv4l2.c                   | 5 -----
>   lib/libv4l2/log.c                       | 5 -----
>   lib/libv4l2/v4l2-plugin-android.c       | 5 -----
>   lib/libv4l2/v4l2-plugin.c               | 1 -
>   lib/libv4l2/v4l2convert.c               | 5 -----
>   lib/libv4l2rds/libv4l2rds.c             | 1 -
>   lib/libv4lconvert/jl2005bcd.c           | 5 -----
>   lib/libv4lconvert/jpeg.c                | 5 -----
>   lib/libv4lconvert/jpeg_memsrcdest.c     | 5 -----
>   lib/libv4lconvert/libv4lconvert-priv.h  | 5 -----
>   lib/libv4lconvert/libv4lconvert.c       | 5 -----
>   meson.build                             | 2 +-
>   utils/cec-compliance/cec-compliance.h   | 6 ------
>   utils/cec-ctl/cec-ctl.cpp               | 6 ------
>   utils/cec-ctl/cec-pin.cpp               | 6 ------
>   utils/cec-follower/cec-follower.h       | 6 ------
>   utils/cx18-ctl/cx18-ctl.c               | 1 -
>   utils/dvb/dvb-fe-tool.c                 | 1 -
>   utils/dvb/dvb-format-convert.c          | 2 --
>   utils/dvb/dvbv5-daemon.c                | 3 ---
>   utils/dvb/dvbv5-scan.c                  | 2 --
>   utils/dvb/dvbv5-zap.c                   | 2 --
>   utils/ir-ctl/ir-ctl.c                   | 2 --
>   utils/keytable/keytable.c               | 1 -
>   utils/media-ctl/libmediactl.c           | 2 --
>   utils/media-ctl/options.h               | 2 --
>   utils/qv4l2/alsa_stream.c               | 2 --
>   utils/qv4l2/capture-win-gl.h            | 2 --
>   utils/qv4l2/general-tab.h               | 2 --
>   utils/qv4l2/qv4l2.h                     | 2 --
>   utils/qvidcap/qvidcap.h                 | 2 --
>   utils/v4l2-compliance/v4l2-compliance.h | 6 ------
>   utils/v4l2-ctl/v4l2-ctl.h               | 6 ------
>   utils/v4l2-dbg/v4l2-dbg.cpp             | 6 ------
>   utils/v4l2-sysfs-path/v4l2-sysfs-path.c | 1 -
>   utils/v4l2-tracer/libv4l2tracer.cpp     | 1 -
>   utils/v4l2-tracer/v4l2-tracer-common.h  | 1 -
>   55 files changed, 1 insertion(+), 151 deletions(-)
> 
> diff --git a/contrib/test/mc_nextgen_test.c b/contrib/test/mc_nextgen_test.c
> index 6086ceb4..11254a0a 100644
> --- a/contrib/test/mc_nextgen_test.c
> +++ b/contrib/test/mc_nextgen_test.c
> @@ -19,8 +19,6 @@
>    * Or, point your browser to http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
>    * */
>   
> -#include <config.h>
> -
>   #include <linux/media.h>
>   
>   #include <argp.h>
> diff --git a/contrib/test/pixfmt-test.c b/contrib/test/pixfmt-test.c
> index 43a11c4e..1cae69aa 100644
> --- a/contrib/test/pixfmt-test.c
> +++ b/contrib/test/pixfmt-test.c
> @@ -20,8 +20,6 @@
>   
>   #define _GNU_SOURCE 1
>   
> -#include <config.h>
> -
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <stdbool.h>
> diff --git a/contrib/test/v4l2gl.c b/contrib/test/v4l2gl.c
> index 4df3910e..dc665fcc 100644
> --- a/contrib/test/v4l2gl.c
> +++ b/contrib/test/v4l2gl.c
> @@ -12,7 +12,6 @@
>    */
>   
>   #include <argp.h>
> -#include <config.h>
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
> diff --git a/contrib/test/v4l2grab.c b/contrib/test/v4l2grab.c
> index d8f2c97a..0983f918 100644
> --- a/contrib/test/v4l2grab.c
> +++ b/contrib/test/v4l2grab.c
> @@ -12,7 +12,6 @@
>    */
>   
>   #include <argp.h>
> -#include <config.h>
>   #include <errno.h>
>   #include <fcntl.h>
>   #include <linux/videodev2.h>
> diff --git a/lib/libdvbv5/countries.c b/lib/libdvbv5/countries.c
> index 609add0b..a6e5f415 100644
> --- a/lib/libdvbv5/countries.c
> +++ b/lib/libdvbv5/countries.c
> @@ -15,7 +15,6 @@
>    *
>    */
>   
> -#include <config.h>
>   #include "libdvbv5/countries.h"
>   
>   #include <ctype.h>
> diff --git a/lib/libdvbv5/dvb-dev-local.c b/lib/libdvbv5/dvb-dev-local.c
> index a5e3979f..ea511471 100644
> --- a/lib/libdvbv5/dvb-dev-local.c
> +++ b/lib/libdvbv5/dvb-dev-local.c
> @@ -27,8 +27,6 @@
>   #include <unistd.h>
>   #include <string.h>
>   
> -#include <config.h>
> -
>   #ifdef HAVE_PTHREAD
>   #  include <pthread.h>
>   #endif
> diff --git a/lib/libdvbv5/dvb-dev-remote.c b/lib/libdvbv5/dvb-dev-remote.c
> index 536f0acf..de4d11e4 100644
> --- a/lib/libdvbv5/dvb-dev-remote.c
> +++ b/lib/libdvbv5/dvb-dev-remote.c
> @@ -20,9 +20,6 @@
>   #define _LARGEFILE_SOURCE 1
>   #define _LARGEFILE64_SOURCE 1
>   
> -#include <config.h>
> -
> -
>   #ifdef HAVE_BACKTRACE
>   #include <execinfo.h>
>   #endif
> diff --git a/lib/libdvbv5/dvb-dev.c b/lib/libdvbv5/dvb-dev.c
> index c379f402..4bf87fca 100644
> --- a/lib/libdvbv5/dvb-dev.c
> +++ b/lib/libdvbv5/dvb-dev.c
> @@ -23,8 +23,6 @@
>   #include <unistd.h>
>   #include <string.h>
>   
> -#include <config.h>
> -
>   #include "dvb-fe-priv.h"
>   #include "dvb-dev-priv.h"
>   
> diff --git a/lib/libdvbv5/dvb-fe.c b/lib/libdvbv5/dvb-fe.c
> index beda5cd8..7848fcda 100644
> --- a/lib/libdvbv5/dvb-fe.c
> +++ b/lib/libdvbv5/dvb-fe.c
> @@ -30,8 +30,6 @@
>   #include <unistd.h>
>   #include <stdarg.h>
>   
> -#include <config.h>
> -
>   #ifdef ENABLE_NLS
>   # include "gettext.h"
>   # include <libintl.h>
> diff --git a/lib/libdvbv5/dvb-file.c b/lib/libdvbv5/dvb-file.c
> index 4187de9d..51e86d41 100644
> --- a/lib/libdvbv5/dvb-file.c
> +++ b/lib/libdvbv5/dvb-file.c
> @@ -50,8 +50,6 @@
>   #include <libdvbv5/desc_hierarchy.h>
>   #include <libdvbv5/countries.h>
>   
> -#include <config.h>
> -
>   #ifdef ENABLE_NLS
>   # include "gettext.h"
>   # include <libintl.h>
> diff --git a/lib/libdvbv5/dvb-log.c b/lib/libdvbv5/dvb-log.c
> index f92da5f8..5aa6906d 100644
> --- a/lib/libdvbv5/dvb-log.c
> +++ b/lib/libdvbv5/dvb-log.c
> @@ -24,8 +24,6 @@
>   #include <unistd.h>
>   #include <stdarg.h>
>   
> -#include <config.h>
> -
>   #ifdef ENABLE_NLS
>   # include "gettext.h"
>   # include <libintl.h>
> diff --git a/lib/libdvbv5/dvb-sat.c b/lib/libdvbv5/dvb-sat.c
> index 71ded425..36a42344 100644
> --- a/lib/libdvbv5/dvb-sat.c
> +++ b/lib/libdvbv5/dvb-sat.c
> @@ -25,8 +25,6 @@
>   #include "dvb-fe-priv.h"
>   #include <libdvbv5/dvb-v5-std.h>
>   
> -#include <config.h>
> -
>   #ifdef ENABLE_NLS
>   # include "gettext.h"
>   # include <libintl.h>
> diff --git a/lib/libdvbv5/dvb-scan.c b/lib/libdvbv5/dvb-scan.c
> index 5c8aca96..af4f1691 100644
> --- a/lib/libdvbv5/dvb-scan.c
> +++ b/lib/libdvbv5/dvb-scan.c
> @@ -61,8 +61,6 @@
>   #include <libdvbv5/desc_t2_delivery.h>
>   #include <libdvbv5/desc_sat.h>
>   
> -#include <config.h>
> -
>   #ifdef ENABLE_NLS
>   # include "gettext.h"
>   # include <libintl.h>
> diff --git a/lib/libdvbv5/dvb-vdr-format.c b/lib/libdvbv5/dvb-vdr-format.c
> index d2365712..9c8728c6 100644
> --- a/lib/libdvbv5/dvb-vdr-format.c
> +++ b/lib/libdvbv5/dvb-vdr-format.c
> @@ -23,8 +23,6 @@
>   #include <libdvbv5/dvb-file.h>
>   #include <libdvbv5/dvb-v5-std.h>
>   
> -#include <config.h>
> -
>   #ifdef ENABLE_NLS
>   # include "gettext.h"
>   # include <libintl.h>
> diff --git a/lib/libdvbv5/parse_string.c b/lib/libdvbv5/parse_string.c
> index d354f497..e673343c 100644
> --- a/lib/libdvbv5/parse_string.c
> +++ b/lib/libdvbv5/parse_string.c
> @@ -21,7 +21,6 @@
>    *   c.f. EN 300 468 annex A
>    */
>   
> -#include <config.h>
>   #include <iconv.h>
>   #include <stdio.h>
>   #include <stdlib.h>
> diff --git a/lib/libv4l-mplane/libv4l-mplane.c b/lib/libv4l-mplane/libv4l-mplane.c
> index 2f685a73..071e9bc7 100644
> --- a/lib/libv4l-mplane/libv4l-mplane.c
> +++ b/lib/libv4l-mplane/libv4l-mplane.c
> @@ -16,7 +16,6 @@
>    * Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
>    */
>   
> -#include <config.h>
>   #include <errno.h>
>   #include <stdint.h>
>   #include <stdio.h>
> diff --git a/lib/libv4l1/libv4l1.c b/lib/libv4l1/libv4l1.c
> index b4efa995..ec903305 100644
> --- a/lib/libv4l1/libv4l1.c
> +++ b/lib/libv4l1/libv4l1.c
> @@ -47,7 +47,6 @@
>         in turn will call v4l1_open, so therefor v4l1_open (for example) may not
>         use the regular open()!
>   */
> -#include <config.h>
>   #include <errno.h>
>   #include <stdarg.h>
>   #include <stdio.h>
> diff --git a/lib/libv4l1/v4l1compat.c b/lib/libv4l1/v4l1compat.c
> index e5c9e562..705d7d4b 100644
> --- a/lib/libv4l1/v4l1compat.c
> +++ b/lib/libv4l1/v4l1compat.c
> @@ -24,7 +24,6 @@
>   #undef _FILE_OFFSET_BITS
>   #define _LARGEFILE64_SOURCE 1
>   
> -#include <config.h>
>   #include <stdlib.h>
>   #include <stdarg.h>
>   #include <fcntl.h>
> diff --git a/lib/libv4l2/libv4l2.c b/lib/libv4l2/libv4l2.c
> index 9ebf8c18..032a4f1c 100644
> --- a/lib/libv4l2/libv4l2.c
> +++ b/lib/libv4l2/libv4l2.c
> @@ -55,11 +55,6 @@
>      When modifications are made, one should be careful that this behavior is
>      preserved.
>    */
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
>   #include <errno.h>
>   #include <stdarg.h>
>   #include <stdio.h>
> diff --git a/lib/libv4l2/log.c b/lib/libv4l2/log.c
> index 9517b86f..0e0e70b3 100644
> --- a/lib/libv4l2/log.c
> +++ b/lib/libv4l2/log.c
> @@ -18,11 +18,6 @@
>   # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
>    */
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
> diff --git a/lib/libv4l2/v4l2-plugin-android.c b/lib/libv4l2/v4l2-plugin-android.c
> index c4ebc658..1aee111c 100644
> --- a/lib/libv4l2/v4l2-plugin-android.c
> +++ b/lib/libv4l2/v4l2-plugin-android.c
> @@ -16,11 +16,6 @@
>   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>   */
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
>   #include <stdarg.h>
>   #include <dlfcn.h>
>   #include <fcntl.h>
> diff --git a/lib/libv4l2/v4l2-plugin.c b/lib/libv4l2/v4l2-plugin.c
> index ff42eed4..e2356cb6 100644
> --- a/lib/libv4l2/v4l2-plugin.c
> +++ b/lib/libv4l2/v4l2-plugin.c
> @@ -16,7 +16,6 @@
>   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>   */
>   
> -#include <config.h>
>   #include <stdarg.h>
>   #include <dlfcn.h>
>   #include <fcntl.h>
> diff --git a/lib/libv4l2/v4l2convert.c b/lib/libv4l2/v4l2convert.c
> index 13ca4cfb..97bed9a9 100644
> --- a/lib/libv4l2/v4l2convert.c
> +++ b/lib/libv4l2/v4l2convert.c
> @@ -28,11 +28,6 @@
>   #undef _FILE_OFFSET_BITS
>   #define _LARGEFILE64_SOURCE 1
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
>   #include <stdarg.h>
>   #include <stdlib.h>
>   #include <fcntl.h>
> diff --git a/lib/libv4l2rds/libv4l2rds.c b/lib/libv4l2rds/libv4l2rds.c
> index 2e67d060..4bc01721 100644
> --- a/lib/libv4l2rds/libv4l2rds.c
> +++ b/lib/libv4l2rds/libv4l2rds.c
> @@ -10,7 +10,6 @@
>   #include <stdlib.h>
>   #include <string.h>
>   #include <time.h>
> -#include <config.h>
>   #include <sys/types.h>
>   #include <sys/mman.h>
>   
> diff --git a/lib/libv4lconvert/jl2005bcd.c b/lib/libv4lconvert/jl2005bcd.c
> index ec7103d5..707c3205 100644
> --- a/lib/libv4lconvert/jl2005bcd.c
> +++ b/lib/libv4lconvert/jl2005bcd.c
> @@ -23,11 +23,6 @@
>    * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>    */
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
>   #include <stdlib.h>
>   #include <string.h>
>   
> diff --git a/lib/libv4lconvert/jpeg.c b/lib/libv4lconvert/jpeg.c
> index 15f8dec7..ebfc8149 100644
> --- a/lib/libv4lconvert/jpeg.c
> +++ b/lib/libv4lconvert/jpeg.c
> @@ -16,11 +16,6 @@
>   # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
>    */
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
>   #include <errno.h>
>   #include <stdlib.h>
>   #include "libv4lconvert-priv.h"
> diff --git a/lib/libv4lconvert/jpeg_memsrcdest.c b/lib/libv4lconvert/jpeg_memsrcdest.c
> index 0540470f..6c09efe9 100644
> --- a/lib/libv4lconvert/jpeg_memsrcdest.c
> +++ b/lib/libv4lconvert/jpeg_memsrcdest.c
> @@ -16,11 +16,6 @@
>   
>   /* this is not a core library module, so it doesn't define JPEG_INTERNALS */
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
>   #include <stdlib.h>
>   #include <stdio.h>
>   
> diff --git a/lib/libv4lconvert/libv4lconvert-priv.h b/lib/libv4lconvert/libv4lconvert-priv.h
> index 0fd6a102..ff2f4a75 100644
> --- a/lib/libv4lconvert/libv4lconvert-priv.h
> +++ b/lib/libv4lconvert/libv4lconvert-priv.h
> @@ -19,11 +19,6 @@
>   #ifndef __LIBV4LCONVERT_PRIV_H
>   #define __LIBV4LCONVERT_PRIV_H
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
>   #include <stdio.h>
>   #include <stdint.h>
>   #include <sys/types.h>
> diff --git a/lib/libv4lconvert/libv4lconvert.c b/lib/libv4lconvert/libv4lconvert.c
> index 201dcf45..80f39dc4 100644
> --- a/lib/libv4lconvert/libv4lconvert.c
> +++ b/lib/libv4lconvert/libv4lconvert.c
> @@ -16,11 +16,6 @@
>   # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
>    */
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
>   #include <errno.h>
>   #include <string.h>
>   #include <stdlib.h>
> diff --git a/meson.build b/meson.build
> index 8c933908..f8f1bb97 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -39,7 +39,7 @@ conf.set('PATCH', as_patch_version)
>   common_arguments = [
>       '-Wpointer-arith',
>       '-D_GNU_SOURCE',
> -    '-I.', # Needed for config.h
> +    '-include', meson.current_build_dir() / 'config.h',
>       '-DPROMOTED_MODE_T=int',
>       '-DENABLE_NLS',
>   ]
> diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
> index 34ed9a81..44f8643d 100644
> --- a/utils/cec-compliance/cec-compliance.h
> +++ b/utils/cec-compliance/cec-compliance.h
> @@ -11,12 +11,6 @@
>   #include <linux/cec-funcs.h>
>   #include "cec-htng-funcs.h"
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
> -
>   #include <cec-info.h>
>   
>   #include <vector>
> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> index 015d2763..11fb7e7e 100644
> --- a/utils/cec-ctl/cec-ctl.cpp
> +++ b/utils/cec-ctl/cec-ctl.cpp
> @@ -25,12 +25,6 @@
>   #include "cec-log.h"
>   #include "cec-parse.h"
>   
> -#ifdef __ANDROID__
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
> -
>   #include "cec-ctl.h"
>   #include "compiler.h"
>   
> diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
> index cf4b6d34..f3500555 100644
> --- a/utils/cec-ctl/cec-pin.cpp
> +++ b/utils/cec-ctl/cec-pin.cpp
> @@ -8,12 +8,6 @@
>   #include <linux/cec.h>
>   #include "cec-htng.h"
>   
> -#ifdef __ANDROID__
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
> -
>   #include "cec-ctl.h"
>   #include "cec-log.h"
>   
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index 54f4df52..dc0a5530 100644
> --- a/utils/cec-follower/cec-follower.h
> +++ b/utils/cec-follower/cec-follower.h
> @@ -11,12 +11,6 @@
>   #include <linux/cec-funcs.h>
>   #include "cec-htng-funcs.h"
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
> -
>   #include <cec-info.h>
>   #include <cec-log.h>
>   #include <set>
> diff --git a/utils/cx18-ctl/cx18-ctl.c b/utils/cx18-ctl/cx18-ctl.c
> index 16a2c82f..8586f72d 100644
> --- a/utils/cx18-ctl/cx18-ctl.c
> +++ b/utils/cx18-ctl/cx18-ctl.c
> @@ -19,7 +19,6 @@
>       Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
>    */
>   
> -#include <config.h>
>   #include <unistd.h>
>   #include <stdlib.h>
>   #include <stdio.h>
> diff --git a/utils/dvb/dvb-fe-tool.c b/utils/dvb/dvb-fe-tool.c
> index 92b90905..994fa4e8 100644
> --- a/utils/dvb/dvb-fe-tool.c
> +++ b/utils/dvb/dvb-fe-tool.c
> @@ -20,7 +20,6 @@
>   
>   #include "libdvbv5/dvb-file.h"
>   #include "libdvbv5/dvb-dev.h"
> -#include <config.h>
>   #include <argp.h>
>   #include <signal.h>
>   #include <stdlib.h>
> diff --git a/utils/dvb/dvb-format-convert.c b/utils/dvb/dvb-format-convert.c
> index d9019e50..e4bd95df 100644
> --- a/utils/dvb/dvb-format-convert.c
> +++ b/utils/dvb/dvb-format-convert.c
> @@ -29,8 +29,6 @@
>   #include <sys/time.h>
>   #include <argp.h>
>   
> -#include <config.h>
> -
>   #ifdef ENABLE_NLS
>   # define _(string) gettext(string)
>   # include "gettext.h"
> diff --git a/utils/dvb/dvbv5-daemon.c b/utils/dvb/dvbv5-daemon.c
> index d9b70181..669b3321 100644
> --- a/utils/dvb/dvbv5-daemon.c
> +++ b/utils/dvb/dvbv5-daemon.c
> @@ -24,14 +24,11 @@
>   #define _LARGEFILE_SOURCE 1
>   #define _LARGEFILE64_SOURCE 1
>   
> -#include <config.h>
> -
>   #ifdef HAVE_BACKTRACE
>   #include <execinfo.h>
>   #endif
>   
>   #include <argp.h>
> -#include <config.h>
>   #include <endian.h>
>   #include <netinet/in.h>
>   #include <poll.h>
> diff --git a/utils/dvb/dvbv5-scan.c b/utils/dvb/dvbv5-scan.c
> index 0a522433..9f47ead7 100644
> --- a/utils/dvb/dvbv5-scan.c
> +++ b/utils/dvb/dvbv5-scan.c
> @@ -30,8 +30,6 @@
>   #include <sys/time.h>
>   #include <argp.h>
>   
> -#include <config.h>
> -
>   #ifdef ENABLE_NLS
>   # define _(string) gettext(string)
>   # include "gettext.h"
> diff --git a/utils/dvb/dvbv5-zap.c b/utils/dvb/dvbv5-zap.c
> index 1cd6989f..5f84e101 100644
> --- a/utils/dvb/dvbv5-zap.c
> +++ b/utils/dvb/dvbv5-zap.c
> @@ -49,8 +49,6 @@
>   #include <sys/time.h>
>   #include <time.h>
>   
> -#include <config.h>
> -
>   #ifdef ENABLE_NLS
>   # define _(string) gettext(string)
>   # include "gettext.h"
> diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
> index 240a3752..3c389bd9 100644
> --- a/utils/ir-ctl/ir-ctl.c
> +++ b/utils/ir-ctl/ir-ctl.c
> @@ -26,8 +26,6 @@
>   #include <argp.h>
>   #include <sysexits.h>
>   
> -#include <config.h>
> -
>   #include <linux/lirc.h>
>   
>   #include "ir-encode.h"
> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> index 6cd1244f..c47211fa 100644
> --- a/utils/keytable/keytable.c
> +++ b/utils/keytable/keytable.c
> @@ -12,7 +12,6 @@
>      GNU General Public License for more details.
>    */
>   
> -#include <config.h>
>   #include <ctype.h>
>   #include <errno.h>
>   #include <fcntl.h>
> diff --git a/utils/media-ctl/libmediactl.c b/utils/media-ctl/libmediactl.c
> index 1fd6525b..a18b063e 100644
> --- a/utils/media-ctl/libmediactl.c
> +++ b/utils/media-ctl/libmediactl.c
> @@ -19,8 +19,6 @@
>    * along with this program. If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> -#include "config.h"
> -
>   #include <sys/ioctl.h>
>   #include <sys/stat.h>
>   #include <sys/types.h>
> diff --git a/utils/media-ctl/options.h b/utils/media-ctl/options.h
> index b1751f56..7e0556fc 100644
> --- a/utils/media-ctl/options.h
> +++ b/utils/media-ctl/options.h
> @@ -22,8 +22,6 @@
>   #ifndef __OPTIONS_H
>   #define __OPTIONS_H
>   
> -#include <config.h>
> -
>   struct media_options
>   {
>   	const char *devname;
> diff --git a/utils/qv4l2/alsa_stream.c b/utils/qv4l2/alsa_stream.c
> index 2dca283b..8f5246db 100644
> --- a/utils/qv4l2/alsa_stream.c
> +++ b/utils/qv4l2/alsa_stream.c
> @@ -26,8 +26,6 @@
>    *
>    */
>   
> -#include <config.h>
> -
>   #ifdef HAVE_ALSA
>   #include "alsa_stream.h"
>   
> diff --git a/utils/qv4l2/capture-win-gl.h b/utils/qv4l2/capture-win-gl.h
> index 35235d7a..e27b2b3f 100644
> --- a/utils/qv4l2/capture-win-gl.h
> +++ b/utils/qv4l2/capture-win-gl.h
> @@ -6,8 +6,6 @@
>   #ifndef CAPTURE_WIN_GL_H
>   #define CAPTURE_WIN_GL_H
>   
> -#include <config.h>
> -
>   #ifdef HAVE_QTGL
>   #define GL_GLEXT_PROTOTYPES
>   #define QT_NO_OPENGL_ES_2
> diff --git a/utils/qv4l2/general-tab.h b/utils/qv4l2/general-tab.h
> index 9b4b5bcd..f5ec73e5 100644
> --- a/utils/qv4l2/general-tab.h
> +++ b/utils/qv4l2/general-tab.h
> @@ -21,8 +21,6 @@
>   #ifndef GENERAL_TAB_H
>   #define GENERAL_TAB_H
>   
> -#include <config.h>
> -
>   #include <QSpinBox>
>   #include <QCheckBox>
>   #include <QDoubleSpinBox>
> diff --git a/utils/qv4l2/qv4l2.h b/utils/qv4l2/qv4l2.h
> index aaba74d0..99d1f30b 100644
> --- a/utils/qv4l2/qv4l2.h
> +++ b/utils/qv4l2/qv4l2.h
> @@ -20,8 +20,6 @@
>   #ifndef QV4L2_H
>   #define QV4L2_H
>   
> -#include <config.h>
> -
>   #include <QMainWindow>
>   #include <QTabWidget>
>   #include <QSignalMapper>
> diff --git a/utils/qvidcap/qvidcap.h b/utils/qvidcap/qvidcap.h
> index 7292d8e7..40b1b4e6 100644
> --- a/utils/qvidcap/qvidcap.h
> +++ b/utils/qvidcap/qvidcap.h
> @@ -8,8 +8,6 @@
>   #ifndef QVIDCAP_H
>   #define QVIDCAP_H
>   
> -#include <config.h>
> -
>   // Must come before cv4l-helpers.h
>   #include <libv4l2.h>
>   
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index e574c06c..020e56a9 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -29,12 +29,6 @@
>   #include <linux/v4l2-subdev.h>
>   #include <linux/media.h>
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
> -
>   #ifndef NO_LIBV4L2
>   #include <libv4l2.h>
>   #endif
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index 70a80ade..8f2726ea 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -1,12 +1,6 @@
>   #ifndef _V4L2_CTL_H
>   #define _V4L2_CTL_H
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
> -
>   #include <linux/videodev2.h>
>   #include <linux/v4l2-subdev.h>
>   #include <v4l-getsubopt.h>
> diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
> index f6a9f433..bd08b4cf 100644
> --- a/utils/v4l2-dbg/v4l2-dbg.cpp
> +++ b/utils/v4l2-dbg/v4l2-dbg.cpp
> @@ -27,12 +27,6 @@
>   #include <sys/ioctl.h>
>   #include <unistd.h>
>   
> -#ifdef ANDROID
> -#include <android-config.h>
> -#else
> -#include <config.h>
> -#endif
> -
>   #ifdef HAVE_SYS_KLOG_H
>   #include <sys/klog.h>
>   #endif
> diff --git a/utils/v4l2-sysfs-path/v4l2-sysfs-path.c b/utils/v4l2-sysfs-path/v4l2-sysfs-path.c
> index c440b24f..d1ad7edb 100644
> --- a/utils/v4l2-sysfs-path/v4l2-sysfs-path.c
> +++ b/utils/v4l2-sysfs-path/v4l2-sysfs-path.c
> @@ -24,7 +24,6 @@
>    *	Mauro Carvalho Chehab
>    */
>   
> -#include <config.h>
>   #include "../libmedia_dev/get_media_devices.h"
>   #include <stdio.h>
>   #include <argp.h>
> diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
> index 6b438628..c5b0e9c0 100644
> --- a/utils/v4l2-tracer/libv4l2tracer.cpp
> +++ b/utils/v4l2-tracer/libv4l2tracer.cpp
> @@ -4,7 +4,6 @@
>    */
>   
>   #include "trace.h"
> -#include <config.h> /* For PROMOTED_MODE_T */
>   #include <dlfcn.h>
>   #include <stdarg.h>
>   
> diff --git a/utils/v4l2-tracer/v4l2-tracer-common.h b/utils/v4l2-tracer/v4l2-tracer-common.h
> index 0bdb125d..10362acb 100644
> --- a/utils/v4l2-tracer/v4l2-tracer-common.h
> +++ b/utils/v4l2-tracer/v4l2-tracer-common.h
> @@ -8,7 +8,6 @@
>   
>   #include "v4l2-info.h"
>   #include "codec-fwht.h"
> -#include "config.h"
>   #include "media-info.h"
>   #include <algorithm>
>   #include <dirent.h>

-- 
Regards,

Laurent Pinchart
