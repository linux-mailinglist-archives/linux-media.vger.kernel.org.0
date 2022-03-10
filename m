Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B591F4D5417
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 23:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344022AbiCJWCd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 10 Mar 2022 17:02:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbiCJWCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 17:02:32 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6F21959DB
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 14:01:28 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nSQqc-0005Wx-P7; Thu, 10 Mar 2022 22:01:27 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nSQqb-00C2TM-1H; Thu, 10 Mar 2022 22:01:24 +0000
Date:   Thu, 10 Mar 2022 22:01:24 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <853266818.0.1646949684464@builder.linuxtv.org>
In-Reply-To: <1985236927.1.1646856986817@builder.linuxtv.org>
References: <1985236927.1.1646856986817@builder.linuxtv.org>
Subject: Build failed in Jenkins: camorama #34
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

See <https://builder.linuxtv.org/job/camorama/34/display/redirect?page=changes>

Changes:

[noreply] Translated using Weblate (Ukrainian)

[noreply] Translated using Weblate (Swedish)

[noreply] Translated using Weblate (Turkish)


------------------------------------------
[...truncated 17.23 KB...]
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
checking for gdk-pixbuf-2.0 gtk+-3.0 >= 3.10 cairo... yes
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
mv -f .deps/callbacks.Tpo .deps/callbacks.Po
mv -f .deps/camorama-filter-chain.Tpo .deps/camorama-filter-chain.Po
mv -f .deps/camorama-filter-laplace.Tpo .deps/camorama-filter-laplace.Po
mv -f .deps/camorama-filter-mirror.Tpo .deps/camorama-filter-mirror.Po
mv -f .deps/camorama-filter-reichardt.Tpo .deps/camorama-filter-reichardt.Po
mv -f .deps/camorama-window.Tpo .deps/camorama-window.Po
mv -f .deps/filter.Tpo .deps/filter.Po
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT v4l.o -MD -MP -MF .deps/v4l.Tpo -c -o v4l.o v4l.c
gcc -DHAVE_CONFIG_H -I. -I..  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -g   -fno-strict-aliasing -Wnested-externs -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wno-unused-parameter -Wno-missing-field-initializers -Wformat=2 -Wcast-align -Wformat-nonliteral -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Wmissing-noreturn -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wno-error=unused-parameter -Wno-error=missing-field-initializers -DCAMORAMA_UI='"camorama-gtk3.ui"' -g -O2 -MT fileio.o -MD -MP -MF .deps/fileio.Tpo -c -o fileio.o fileio.c
mv -f .deps/main.Tpo .deps/main.Po
mv -f .deps/support.Tpo .deps/support.Po
mv -f .deps/fileio.Tpo .deps/fileio.Po
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
sed -e '/^#/d' remove-potcdate.sin > t-remove-potcdate.sed
mv t-remove-potcdate.sed remove-potcdate.sed
package_gnu=""; \
test -n "$package_gnu" || { \
  if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU >/dev/null; then \
         LC_ALL=C find -L .. -maxdepth 1 -type f -size -10000000c -exec grep -i 'GNU camorama' /dev/null '{}' ';' 2>/dev/null; \
       else \
         LC_ALL=C grep -i 'GNU camorama' ../* 2>/dev/null; \
       fi; \
     } | grep -v 'libtool:' >/dev/null; then \
     package_gnu=yes; \
   else \
     package_gnu=no; \
   fi; \
}; \
if test "$package_gnu" = "yes"; then \
  package_prefix='GNU '; \
else \
  package_prefix=''; \
fi; \
if test -n '' || test 'https://github.com/alessio/camorama' = '@'PACKAGE_BUGREPORT'@'; then \
  msgid_bugs_address=''; \
else \
  msgid_bugs_address='https://github.com/alessio/camorama'; \
fi; \
case `/usr/bin/xgettext --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
  '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].* | 0.16 | 0.16.[0-1]*) \
    /usr/bin/xgettext --default-domain=camorama --directory=.. \
      --add-comments=TRANSLATORS: \
      --files-from=./POTFILES.in \
      --copyright-holder='Camorama developers' \
      --msgid-bugs-address="$msgid_bugs_address" \
      --keyword=_ --keyword=N_  \
    ;; \
  *) \
    /usr/bin/xgettext --default-domain=camorama --directory=.. \
      --add-comments=TRANSLATORS: \
      --files-from=./POTFILES.in \
      --copyright-holder='Camorama developers' \
      --package-name="${package_prefix}camorama" \
      --package-version='0.20.7' \
      --msgid-bugs-address="$msgid_bugs_address" \
      --keyword=_ --keyword=N_  \
    ;; \
esac
/usr/bin/xgettext: warning: a fallback ITS rule file '/usr/share/gettext-0.21/its/metainfo.its' is used; it may not be in sync with the upstream
test ! -f camorama.po || { \
  if test -f ./camorama.pot-header; then \
    sed -e '1,/^#$/d' < camorama.po > camorama.1po && \
    cat ./camorama.pot-header camorama.1po > camorama.po && \
    rm -f camorama.1po \
    || exit 1; \
  fi; \
  if test -f ./camorama.pot; then \
    sed -f remove-potcdate.sed < ./camorama.pot > camorama.1po && \
    sed -f remove-potcdate.sed < camorama.po > camorama.2po && \
    if cmp camorama.1po camorama.2po >/dev/null 2>&1; then \
      rm -f camorama.1po camorama.2po camorama.po; \
    else \
      rm -f camorama.1po camorama.2po ./camorama.pot && \
      mv camorama.po ./camorama.pot; \
    fi; \
  else \
    mv camorama.po ./camorama.pot; \
  fi; \
}
make[3]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/po'>
test ! -f ./camorama.pot || \
  test -z "am.gmo ar.gmo az.gmo be.gmo bg.gmo bs.gmo ca.gmo cs.gmo da.gmo de.gmo dz.gmo en_CA.gmo en_GB.gmo es.gmo eu.gmo fa.gmo fi.gmo fr.gmo ga.gmo gl.gmo gu.gmo hi.gmo hr.gmo it.gmo ja.gmo lv.gmo mk.gmo ml.gmo ms.gmo nb.gmo ne.gmo nl.gmo pa.gmo pl.gmo pt.gmo pt_BR.gmo rw.gmo sl.gmo sq.gmo sr.gmo sr@Latn.gmo sv.gmo ta.gmo tr.gmo uk.gmo vi.gmo zh_CN.gmo zh_TW.gmo" || make am.gmo ar.gmo az.gmo be.gmo bg.gmo bs.gmo ca.gmo cs.gmo da.gmo de.gmo dz.gmo en_CA.gmo en_GB.gmo es.gmo eu.gmo fa.gmo fi.gmo fr.gmo ga.gmo gl.gmo gu.gmo hi.gmo hr.gmo it.gmo ja.gmo lv.gmo mk.gmo ml.gmo ms.gmo nb.gmo ne.gmo nl.gmo pa.gmo pl.gmo pt.gmo pt_BR.gmo rw.gmo sl.gmo sq.gmo sr.gmo sr@Latn.gmo sv.gmo ta.gmo tr.gmo uk.gmo vi.gmo zh_CN.gmo zh_TW.gmo
make[3]: Entering directory '<https://builder.linuxtv.org/job/camorama/ws/po'>
/usr/bin/msgmerge --update  --lang=am --previous am.po camorama.pot
/usr/bin/msgmerge --update  --lang=ar --previous ar.po camorama.pot
/usr/bin/msgmerge --update  --lang=az --previous az.po camorama.pot
/usr/bin/msgmerge --update  --lang=be --previous be.po camorama.pot
/usr/bin/msgmerge --update  --lang=bs --previous bs.po camorama.pot
/usr/bin/msgmerge --update  --lang=bg --previous bg.po camorama.pot
/usr/bin/msgmerge --update  --lang=da --previous da.po camorama.pot
/usr/bin/msgmerge --update  --lang=ca --previous ca.po camorama.pot
/usr/bin/msgmerge --update  --lang=cs --previous cs.po camorama.pot
.................................................................................................... done.
..... done.
. done.
. done.
. done.
..................... done.
/usr/bin/msgmerge --update  --lang=dz --previous dz.po camorama.pot
/usr/bin/msgmerge --update  --lang=de --previous de.po camorama.pot
............................................................ done.
 done.
/usr/bin/msgmerge --update  --lang=en_GB --previous en_GB.po camorama.pot
............................./usr/bin/msgmerge --update  --lang=eu --previous eu.po camorama.pot
./usr/bin/msgmerge --update  --lang=en_CA --previous en_CA.po camorama.pot
 done.
/usr/bin/msgmerge --update  --lang=es --previous es.po camorama.pot
/usr/bin/msgmerge --update  --lang=fa --previous fa.po camorama.pot
........................./usr/bin/msgmerge --update  --lang=fi --previous fi.po camorama.pot
 done.
.............................................../usr/bin/msgmerge --update  --lang=fr --previous fr.po camorama.pot
.. done.
 done.
............................. done.
............................... done.
......................./usr/bin/msgmerge --update  --lang=gu --previous gu.po camorama.pot
..../usr/bin/msgmerge --update  --lang=gl --previous gl.po camorama.pot
.......................... done.
..................................../usr/bin/msgmerge --update  --lang=ga --previous ga.po camorama.pot
 done.
................... done.
../usr/bin/msgmerge --update  --lang=hi --previous hi.po camorama.pot
 done.
/usr/bin/msgmerge --update  --lang=hr --previous hr.po camorama.pot
/usr/bin/msgmerge --update  --lang=it --previous it.po camorama.pot
/usr/bin/msgmerge --update  --lang=lv --previous lv.po camorama.pot
................................................................................. done.
.. done.
.................... done.
/usr/bin/msgmerge --update  --lang=ja --previous ja.po camorama.pot
............................ done.
/usr/bin/msgmerge --update  --lang=mk --previous mk.po camorama.pot
..... done.
it.po:36:9: syntax error
/usr/bin/msgmerge --update  --lang=ms --previous ms.po camorama.pot
/usr/bin/msgmerge: found 1 fatal error
make[3]: *** [Makefile:343: it.po] Error 1
make[3]: *** Waiting for unfinished jobs....
/usr/bin/msgmerge --update  --lang=ml --previous ml.po camorama.pot
/usr/bin/msgmerge --update  --lang=nb --previous nb.po camorama.pot
/usr/bin/msgmerge --update  --lang=ne --previous ne.po camorama.pot
/usr/bin/msgmerge --update  --lang=nl --previous nl.po camorama.pot
.............................................. done.
...................................... done.
... done.
 done.
.................................................................................................. done.
 done.
. done.
 done.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/po'>
make[2]: *** [Makefile:251: stamp-po] Error 2
make[2]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/po'>
make[1]: *** [Makefile:544: all-recursive] Error 1
make[1]: Leaving directory '<https://builder.linuxtv.org/job/camorama/ws/'>
make: *** [Makefile:400: all] Error 2
Build step 'Execute shell' marked build as failure
