Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED234180C63
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 00:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgCJX3s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 19:29:48 -0400
Received: from www.linuxtv.org ([130.149.80.248]:50076 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727695AbgCJX3s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 19:29:48 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jBoHq-00ADKm-KL; Tue, 10 Mar 2020 23:27:46 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jBoLG-0001JW-K5; Tue, 10 Mar 2020 23:31:19 +0000
Date:   Tue, 10 Mar 2020 23:31:18 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <378145227.13.1583883078615.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <1149191273.12.1583882181982.JavaMail.jenkins@builder.linuxtv.org>
References: <1149191273.12.1583882181982.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: camorama #10
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: camorama
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/camorama/10/display/redirect?page=changes>

Changes:

[noreply] Update README.md


------------------------------------------
[...truncated 5.96 KB...]
checking whether C compiler accepts -Wno-missing-field-initializers... yes
checking whether C compiler accepts -Wformat=2... yes
checking whether C compiler accepts -Wcast-align... yes
checking whether C compiler accepts -Wformat-nonliteral... yes
checking whether C compiler accepts -Wformat-security... yes
checking whether C compiler accepts -Wsign-compare... yes
checking whether C compiler accepts -Wstrict-aliasing... yes
checking whether C compiler accepts -Wshadow... yes
checking whether C compiler accepts -Winline... yes
checking whether C compiler accepts -Wpacked... yes
checking whether C compiler accepts -Wmissing-format-attribute... yes
checking whether C compiler accepts -Wmissing-noreturn... yes
checking whether C compiler accepts -Winit-self... yes
checking whether C compiler accepts -Wredundant-decls... (cached) yes
checking whether C compiler accepts -Wmissing-include-dirs... yes
checking whether C compiler accepts -Wunused-but-set-variable... yes
checking whether C compiler accepts -Warray-bounds... yes
checking whether C compiler accepts -Wreturn-type... yes
checking whether C compiler accepts -Wswitch-enum... yes
checking whether C compiler accepts -Wswitch-default... yes
checking whether C compiler accepts -Wduplicated-cond... yes
checking whether C compiler accepts -Wduplicated-branches... yes
checking whether C compiler accepts -Wlogical-op... yes
checking whether C compiler accepts -Wrestrict... yes
checking whether C compiler accepts -Wnull-dereference... yes
checking whether C compiler accepts -Wdouble-promotion... yes
checking whether C compiler accepts -Wno-error=unused-parameter... yes
checking whether C compiler accepts -Wno-error=missing-field-initializers... yes
checking whether C compiler accepts -Werror=unknown-warning-option... (cached) no
checking whether the linker accepts -Wl,--as-needed... yes
checking whether the linker accepts -Wl,--as-needed... yes
checking whether the linker accepts -Wl,-z,relro... yes
checking whether the linker accepts -Wl,-z,relro... yes
checking whether the linker accepts -Wl,-z,now... yes
checking whether the linker accepts -Wl,-z,now... yes
checking whether the linker accepts -Wl,-z,noexecstack... yes
checking whether the linker accepts -Wl,-z,noexecstack... yes
checking whether the linker accepts -Wl,--no-as-needed... yes
checking whether the linker accepts -Wl,--fatal-warnings... yes
checking whether the linker accepts -Wl,-fatal_warnings... no
checking whether the linker accepts -Wl,--no-as-needed... yes
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.16... yes
checking for PACKAGE... yes
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating src/Makefile
config.status: creating data/Makefile
config.status: creating po/Makefile.in
config.status: creating config.h
config.status: config.h is unchanged
config.status: executing po-directories commands
config.status: creating po/POTFILES
config.status: creating po/Makefile
config.status: executing depfiles commands

compile time options summary
============================

    Gtk version to use: 3
+ make
CDPATH="${ZSH_VERSION+.}:" && cd . && /bin/bash <https://builder.linuxtv.org/job/camorama/ws/missing> aclocal-1.16 -I m4
configure.ac:11: warning: gl_HOST_CPU_C_ABI_32BIT is m4_require'd but not m4_defun'd
m4/lib-prefix.m4:155: AC_LIB_PREPARE_MULTILIB is expanded from...
m4/lib-link.m4:181: AC_LIB_LINKFLAGS_BODY is expanded from...
m4/iconv.m4:10: AM_ICONV_LINKFLAGS_BODY is expanded from...
m4/gettext.m4:55: AM_GNU_GETTEXT is expanded from...
configure.ac:11: the top level
CDPATH="${ZSH_VERSION+.}:" && cd . && /bin/bash <https://builder.linuxtv.org/job/camorama/ws/missing> autoconf
 cd . && /bin/bash <https://builder.linuxtv.org/job/camorama/ws/missing> automake-1.16 --gnu
configure.ac:11: warning: gl_HOST_CPU_C_ABI_32BIT is m4_require'd but not m4_defun'd
m4/lib-prefix.m4:155: AC_LIB_PREPARE_MULTILIB is expanded from...
m4/lib-link.m4:181: AC_LIB_LINKFLAGS_BODY is expanded from...
m4/iconv.m4:10: AM_ICONV_LINKFLAGS_BODY is expanded from...
m4/gettext.m4:55: AM_GNU_GETTEXT is expanded from...
configure.ac:11: the top level
/bin/bash ./config.status --recheck
configure.ac:11: warning: gl_HOST_CPU_C_ABI_32BIT is m4_require'd but not m4_defun'd
m4/lib-prefix.m4:155: AC_LIB_PREPARE_MULTILIB is expanded from...
m4/lib-link.m4:181: AC_LIB_LINKFLAGS_BODY is expanded from...
m4/iconv.m4:10: AM_ICONV_LINKFLAGS_BODY is expanded from...
m4/gettext.m4:55: AM_GNU_GETTEXT is expanded from...
configure.ac:11: the top level
running CONFIG_SHELL=/bin/bash /bin/bash ./configure --no-create --no-recursion
Makefile.am: error: required file './README' not found
make: *** [Makefile:399: Makefile.in] Error 1
make: *** Waiting for unfinished jobs....
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking for a sed that does not truncate output... /usr/bin/sed
checking whether NLS is requested... yes
checking for msgfmt... /usr/bin/msgfmt
checking for gmsgfmt... /usr/bin/msgfmt
checking for xgettext... /usr/bin/xgettext
checking for msgmerge... /usr/bin/msgmerge
checking whether make supports the include directive... yes (GNU style)
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking whether gcc understands -c and -o together... yes
checking dependency style of gcc... gcc3
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking for ld used by gcc... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking for shared library run path origin... done
./configure: line 4474: gl_HOST_CPU_C_ABI_32BIT: command not found
checking for the common suffixes of directories in the library search path... lib,lib
checking for CFPreferencesCopyAppValue... no
checking for CFLocaleCopyCurrent... no
checking for CFLocaleCopyPreferredLanguages... no
checking for GNU gettext in libc... yes
checking whether to use NLS... yes
checking where the gettext function comes from... libc
checking prefix... /usr/local
checking for library containing strerror... none required
checking for gcc... (cached) gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for gcc option to accept ISO C89... (cached) none needed
checking whether gcc understands -c and -o together... (cached) yes
checking dependency style of gcc... (cached) gcc3
checking for gcc... (cached) gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for gcc option to accept ISO C89... (cached) none needed
checking whether gcc understands -c and -o together... (cached) yes
checking dependency style of gcc... (cached) gcc3
checking how to run the C preprocessor... gcc -E
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking whether sys/types.h defines makedev... no
checking sys/mkdev.h usability... no
checking sys/mkdev.h presence... no
checking for sys/mkdev.h... no
checking sys/sysmacros.h usability... yes
checking sys/sysmacros.h presence... yes
checking for sys/sysmacros.h... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking sys/ioctl.h usability... yes
checking sys/ioctl.h presence... yes
checking for sys/ioctl.h... yes
checking for unistd.h... (cached) yes
checking linux/videodev.h usability... no
checking linux/videodev.h presence... no
checking for linux/videodev.h... no
checking png.h usability... yes
checking png.h presence... yes
checking for png.h... yes
checking glade/glade.h usability... no
checking glade/glade.h presence... no
checking for glade/glade.h... no
checking for v4l2_open in -lv4l2... yes
checking whether C compiler accepts -Werror=unknown-warning-option... no
checking whether C compiler accepts -Wno-suggest-attribute=format... yes
checking whether C compiler accepts -fno-strict-aliasing... yes
checking whether C compiler accepts -Wall... yes
checking whether C compiler accepts -Wextra... yes
checking whether C compiler accepts -Wundef... yes
checking whether C compiler accepts -Wwrite-strings... yes
checking whether C compiler accepts -Wpointer-arith... yes
checking whether C compiler accepts -Wmissing-declarations... yes
checking whether C compiler accepts -Wredundant-decls... yes
checking whether C compiler accepts -Wno-unused-parameter... yes
checking whether C compiler accepts -Wno-missing-field-initializers... yes
checking whether C compiler accepts -Wformat=2... yes
checking whether C compiler accepts -Wcast-align... yes
checking whether C compiler accepts -Wformat-nonliteral... yes
checking whether C compiler accepts -Wformat-security... yes
checking whether C compiler accepts -Wsign-compare... yes
checking whether C compiler accepts -Wstrict-aliasing... yes
checking whether C compiler accepts -Wshadow... yes
checking whether C compiler accepts -Winline... yes
checking whether C compiler accepts -Wpacked... yes
checking whether C compiler accepts -Wmissing-format-attribute... yes
checking whether C compiler accepts -Wmissing-noreturn... yes
checking whether C compiler accepts -Winit-self... yes
checking whether C compiler accepts -Wredundant-decls... (cached) yes
checking whether C compiler accepts -Wmissing-include-dirs... yes
checking whether C compiler accepts -Wunused-but-set-variable... yes
checking whether C compiler accepts -Warray-bounds... yes
checking whether C compiler accepts -Wreturn-type... yes
checking whether C compiler accepts -Wswitch-enum... yes
checking whether C compiler accepts -Wswitch-default... yes
checking whether C compiler accepts -Wduplicated-cond... yes
checking whether C compiler accepts -Wduplicated-branches... yes
checking whether C compiler accepts -Wlogical-op... yes
checking whether C compiler accepts -Wrestrict... yes
checking whether C compiler accepts -Wnull-dereference... yes
checking whether C compiler accepts -Wdouble-promotion... yes
checking whether C compiler accepts -Wnested-externs... yes
checking whether C compiler accepts -Wmissing-prototypes... yes
checking whether C compiler accepts -Wstrict-prototypes... yes
checking whether C compiler accepts -Wdeclaration-after-statement... yes
checking whether C compiler accepts -Wimplicit-function-declaration... yes
checking whether C compiler accepts -Wold-style-definition... yes
checking whether C compiler accepts -Wjump-misses-init... yes
checking whether C compiler accepts -Wno-error=unused-parameter... yes
checking whether C compiler accepts -Wno-error=missing-field-initializers... yes
checking whether C compiler accepts -Werror=unknown-warning-option... (cached) no
checking whether the linker accepts -Wl,--as-needed... yes
checking whether the linker accepts -Wl,--as-needed... yes
checking whether the linker accepts -Wl,-z,relro... yes
checking whether the linker accepts -Wl,-z,relro... yes
checking whether the linker accepts -Wl,-z,now... yes
checking whether the linker accepts -Wl,-z,now... yes
checking whether the linker accepts -Wl,-z,noexecstack... yes
checking whether the linker accepts -Wl,-z,noexecstack... yes
checking whether the linker accepts -Wl,--no-as-needed... yes
checking whether the linker accepts -Wl,--fatal-warnings... yes
checking whether the linker accepts -Wl,-fatal_warnings... no
checking whether the linker accepts -Wl,--no-as-needed... yes
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.16... yes
checking for PACKAGE... yes
checking that generated files are newer than configure... done
configure: creating ./config.status

compile time options summary
============================

    Gtk version to use: 3
Build step 'Execute shell' marked build as failure
