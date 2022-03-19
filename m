Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605544DEA2F
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 19:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243929AbiCSSr4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 19 Mar 2022 14:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239382AbiCSSrw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 14:47:52 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7AE1D9169
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 11:46:28 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nVe5q-00Epsn-1K; Sat, 19 Mar 2022 18:46:26 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nVe5o-005Lw0-Mm; Sat, 19 Mar 2022 18:46:24 +0000
Date:   Sat, 19 Mar 2022 18:46:24 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <2000083279.5.1647715584152@builder.linuxtv.org>
Subject: Build failed in Jenkins: camorama #39
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: camorama
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/camorama/39/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] Embed mutexes inside struct camera

[Mauro Carvalho Chehab] drop gtk2 and legacy gtk3 support


------------------------------------------
[...truncated 11.10 KB...]
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
+ ./configure
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
checking 32-bit host C ABI... no
checking how to run the C preprocessor... gcc -E
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ELF binary format... yes
checking for the common suffixes of directories in the library search path... lib,lib,lib64
checking for CFPreferencesCopyAppValue... no
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
checking whether C compiler accepts -Wnested-externs... yes
checking whether C compiler accepts -Wmissing-prototypes... yes
checking whether C compiler accepts -Wstrict-prototypes... yes
checking whether C compiler accepts -Wdeclaration-after-statement... yes
checking whether C compiler accepts -Wimplicit-function-declaration... yes
checking whether C compiler accepts -Wold-style-definition... yes
checking whether C compiler accepts -Wjump-misses-init... yes
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
checking for gdk-pixbuf-2.0 gtk+-3.0 >= 3.22 cairo... yes
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
+ make clean
Making clean in src
make[1]: Entering directory '<https://builder.linuxtv.org/job/camorama/ws/src'>
test -z "camorama" || rm -f camorama
rm -f *.o
make[1]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/src'>
Making clean in data
make[1]: Entering directory '<https://builder.linuxtv.org/job/camorama/ws/data'>
rm -f org.gnome.camorama.gschema.valid 
make[1]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/data'>
Making clean in po
make[1]: Entering directory '<https://builder.linuxtv.org/job/camorama/ws/po'>
rm -f *.insert-header
rm -f remove-potcdate.sed
rm -f ./stamp-poT
rm -f core core.* camorama.po camorama.1po camorama.2po *.new.po
rm -fr *.o
make[1]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/po'>
make[1]: Entering directory '<https://builder.linuxtv.org/job/camorama/ws/'>
test -z "camorama.desktop camorama.appdata.xml po/camorama.pot" || rm -f camorama.desktop camorama.appdata.xml po/camorama.pot
make[1]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/'>
+ make
make  all-recursive
make[1]: Entering directory '<https://builder.linuxtv.org/job/camorama/ws/'>
Making all in src
make[2]: Entering directory '<https://builder.linuxtv.org/job/camorama/ws/src'>
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT callbacks.o -MD -MP -MF .deps/callbacks.Tpo -c -o callbacks.o callbacks.c
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT camorama-filter-chain.o -MD -MP -MF .deps/camorama-filter-chain.Tpo -c -o camorama-filter-chain.o camorama-filter-chain.c
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT camorama-filter-laplace.o -MD -MP -MF .deps/camorama-filter-laplace.Tpo -c -o camorama-filter-laplace.o camorama-filter-laplace.c
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT camorama-filter-mirror.o -MD -MP -MF .deps/camorama-filter-mirror.Tpo -c -o camorama-filter-mirror.o camorama-filter-mirror.c
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT camorama-filter-reichardt.o -MD -MP -MF .deps/camorama-filter-reichardt.Tpo -c -o camorama-filter-reichardt.o camorama-filter-reichardt.c
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT camorama-window.o -MD -MP -MF .deps/camorama-window.Tpo -c -o camorama-window.o camorama-window.c
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT filter.o -MD -MP -MF .deps/filter.Tpo -c -o filter.o filter.c
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT main.o -MD -MP -MF .deps/main.Tpo -c -o main.o main.c
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT support.o -MD -MP -MF .deps/support.Tpo -c -o support.o support.c
mv -f .deps/camorama-filter-laplace.Tpo .deps/camorama-filter-laplace.Po
mv -f .deps/camorama-filter-mirror.Tpo .deps/camorama-filter-mirror.Po
mv -f .deps/camorama-filter-reichardt.Tpo .deps/camorama-filter-reichardt.Po
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT v4l.o -MD -MP -MF .deps/v4l.Tpo -c -o v4l.o v4l.c
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT fileio.o -MD -MP -MF .deps/fileio.Tpo -c -o fileio.o fileio.c
mv -f .deps/support.Tpo .deps/support.Po
mv -f .deps/camorama-filter-chain.Tpo .deps/camorama-filter-chain.Po
mv -f .deps/main.Tpo .deps/main.Po
mv -f .deps/camorama-window.Tpo .deps/camorama-window.Po
mv -f .deps/fileio.Tpo .deps/fileio.Po
mv -f .deps/filter.Tpo .deps/filter.Po
mv -f .deps/callbacks.Tpo .deps/callbacks.Po
mv -f .deps/v4l.Tpo .deps/v4l.Po
gcc -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -Wl,--no-as-needed  -o camorama callbacks.o camorama-filter-chain.o camorama-filter-laplace.o camorama-filter-mirror.o camorama-filter-reichardt.o camorama-window.o filter.o main.o support.o v4l.o fileio.o  -lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lcairo -lv4l2 -lm 
make[2]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/src'>
Making all in data
make[2]: Entering directory '<https://builder.linuxtv.org/job/camorama/ws/data'>
/usr/bin/glib-compile-schemas --strict --dry-run  --schema-file=org.gnome.camorama.gschema.xml && mkdir -p . && touch org.gnome.camorama.gschema.valid
make[2]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/data'>
Making all in po
make[2]: Entering directory '<https://builder.linuxtv.org/job/camorama/ws/po'>
make camorama.pot-update
make[3]: Entering directory '<https://builder.linuxtv.org/job/camorama/ws/po'>
make[3]: *** No rule to make target '../data/camorama-gtk2.ui', needed by 'camorama.pot-update'.  Stop.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/po'>
make[2]: *** [Makefile:337: camorama.pot] Error 2
make[2]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/po'>
make[1]: *** [Makefile:544: all-recursive] Error 1
make[1]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/'>
make: *** [Makefile:400: all] Error 2
Build step 'Execute shell' marked build as failure
