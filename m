Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5B82B17B2
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 10:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgKMJAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 04:00:14 -0500
Received: from www.linuxtv.org ([130.149.80.248]:54386 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgKMJAM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 04:00:12 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kdUwE-00A674-6b; Fri, 13 Nov 2020 09:00:10 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kdUzG-0007t1-DE; Fri, 13 Nov 2020 09:03:18 +0000
Date:   Fri, 13 Nov 2020 09:03:18 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <759461501.39.1605258198400@builder.linuxtv.org>
In-Reply-To: <799677390.37.1605090798120@builder.linuxtv.org>
References: <799677390.37.1605090798120@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #358
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/libcamera/358/display/redirect?page=changes>

Changes:

[paul.elder] qcam: Clear the pool of free requests upon stopCapture()


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building on master in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
Fetching upstream changes from git://linuxtv.org/libcamera.git
 > git --version # timeout=10
 > git --version # 'git version 2.20.1'
 > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 2d50b1664508e86e4d27b8620e74f8e82dfe1d57 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 2d50b1664508e86e4d27b8620e74f8e82dfe1d57 # timeout=10
Commit message: "qcam: Clear the pool of free requests upon stopCapture()"
 > git rev-list --no-walk abf56416410d6b1e00b1628e3dd9444cd6828797 # timeout=10
[Checks API] No suitable checks publisher found.
[libcamera] $ /bin/sh -xe /tmp/jenkins15256864081915210137.sh
+ rm -rf build
+ meson setup -Dandroid=auto -Dv4l2=true build
The Meson build system
Version: 0.52.1
Source dir: <https://builder.linuxtv.org/job/libcamera/ws/>
Build dir: <https://builder.linuxtv.org/job/libcamera/ws/build>
Build type: native build
Project name: libcamera
Project version: 0.0.0
C compiler for the host machine: ccache cc (gcc 8.3.0 "cc (Debian 8.3.0-6) 8.3.0")
C linker for the host machine: GNU ld.bfd 2.31.1
C++ compiler for the host machine: ccache c++ (gcc 8.3.0 "c++ (Debian 8.3.0-6) 8.3.0")
C++ linker for the host machine: GNU ld.bfd 2.31.1
Host machine cpu family: x86_64
Host machine cpu: x86_64
Header <execinfo.h> has symbol "backtrace" : YES 
Header <stdlib.h> has symbol "secure_getenv" : YES 
Compiler for C supports arguments -Wno-c99-designator -Wc99-designator: NO 
Library lttng-ust found: NO
Program ./gen-tp-header.py found: YES (/usr/bin/python3 <https://builder.linuxtv.org/job/libcamera/ws/utils/tracepoints/./gen-tp-header.py)>
Configuring version.h using configuration
Found pkg-config: /usr/bin/pkg-config (0.29)
Run-time dependency libexif found: YES 0.6.21
Run-time dependency libjpeg found: YES 1.5.2
Program openssl found: YES (/usr/bin/openssl)
Library atomic found: YES
Library dl found: YES
Library gnutls found: YES
Run-time dependency libudev found: YES 241
Run-time dependency threads found: YES 
Run-time dependency Boost found: YES 1.67
Program ipa-sign-install.sh found: YES (<https://builder.linuxtv.org/job/libcamera/ws/src/ipa/ipa-sign-install.sh)>
WARNING: rcc dependencies will not work reliably until this upstream issue is fixed: https://bugreports.qt.io/browse/QTBUG-45460
Run-time dependency qt5 (modules: Core, Gui, Widgets) found: YES 5.11.3 (pkg-config)
Run-time dependency libtiff-4 found: YES 4.1.0
Header <QOpenGLWidget> has symbol "QOpenGLWidget" with dependency qt5: YES 
Detecting Qt5 tools
 moc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/moc, 5.11.3)
 uic: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/uic, 5.11.3)
 rcc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/rcc, 5.11.3)
 lrelease: NO
Run-time dependency glib-2.0 found: YES 2.58.3
Run-time dependency gstreamer-video-1.0 found: YES 1.14.4
Run-time dependency gstreamer-allocators-1.0 found: YES 1.14.4
Program doxygen found: YES (/usr/bin/doxygen)
Program dot found: YES (/usr/bin/dot)
Configuring Doxyfile using configuration
Program sphinx-build-3 found: NO
Program sphinx-build found: YES (/var/lib/jenkins/.local/bin/sphinx-build)
Program v4l2_compat_test.py found: YES (<https://builder.linuxtv.org/job/libcamera/ws/test/v4l2_compat/v4l2_compat_test.py)>
meson.build:133: WARNING: The current running kernel version 4.19.0-12-amd64 is too old to run libcamera.
meson.build:135: WARNING: If you intend to use libcamera on this machine, please upgrade to a kernel >= 5.0.0.
Configuring config.h using configuration
Program python3 (jinja2, ply, jinja2, yaml) found: NO modules: jinja2, jinja2, yaml

meson.build:158:7: ERROR: python3 is missing modules: ply

A full log can be found at <https://builder.linuxtv.org/job/libcamera/ws/build/meson-logs/meson-log.txt>
Build step 'Execute shell' marked build as failure
