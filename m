Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D904272381
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 14:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgIUMPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 08:15:25 -0400
Received: from www.linuxtv.org ([130.149.80.248]:43708 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgIUMPY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 08:15:24 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kKKcy-000sgd-8d; Mon, 21 Sep 2020 12:09:04 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kKKlo-0007wW-Q6; Mon, 21 Sep 2020 12:18:12 +0000
Date:   Mon, 21 Sep 2020 12:18:12 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <772924952.14.1600690692800@builder.linuxtv.org>
In-Reply-To: <365472805.13.1600687094010@builder.linuxtv.org>
References: <365472805.13.1600687094010@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #297
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

See <https://builder.linuxtv.org/job/libcamera/297/display/redirect?page=changes>

Changes:

[niklas.soderlund] libcamera: pipeline: raspberrypi: Move RPiStream into a separate file

[niklas.soderlund] libcamera: pipeline: ipa: raspberrypi: Rework drop frame signalling

[niklas.soderlund] libcamera: pipeline: raspberrypi: Add some debug logging

[niklas.soderlund] libcamera: pipeline: raspberrypi: Increase the number of RAW buffers

[niklas.soderlund] libcamera: pipeline: raspberrypi: Remove const qualifier from RPiStream

[niklas.soderlund] libcamera: pipeline: raspberrypi: Rework stream buffer logic for zero-copy

[niklas.soderlund] libcamera: pipeline: raspberrypi: Fix bug in passing configuration to IPA

[niklas.soderlund] libcamera: pipeline: raspberrypi: Add more robust stream buffer logic

[niklas.soderlund] libcamera: pipeline: ipa: raspberrypi: Remove use of FrameBuffer cookie

[niklas.soderlund] pipeline: raspberrypi: Use an unordered_map for the stream buffer list

[niklas.soderlund] pipeline: raspberrypi: Use an unordered_set to store IPA buffer ids

[niklas.soderlund] pipeline: ipa: raspberrypi: Handle any externally allocated FrameBuffer


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
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
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 39798e8777b553ed9ae9863da02e16e417d8307e (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 39798e8777b553ed9ae9863da02e16e417d8307e # timeout=10
Commit message: "pipeline: ipa: raspberrypi: Handle any externally allocated FrameBuffer"
 > git rev-list --no-walk e390f9f618ec694e5327ebe93cdfc0ba89ab5a86 # timeout=10
[Checks API] No suitable checks publisher found.
[libcamera] $ /bin/sh -xe /tmp/jenkins3819754941356252969.sh
+ rm -rf build
+ meson setup build
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
Configuring version.h using configuration
Dependency libexif skipped: feature android disabled
Dependency libjpeg skipped: feature android disabled
Program openssl found: YES (/usr/bin/openssl)
Library atomic found: YES
Library dl found: YES
Library gnutls found: YES
Found pkg-config: /usr/bin/pkg-config (0.29)
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
Did not find CMake 'cmake'
Found CMake: NO
Run-time dependency gstreamer-video-1.0 found: NO (tried pkgconfig and cmake)
Run-time dependency gstreamer-allocators-1.0 found: NO (tried pkgconfig and cmake)
Program doxygen found: YES (/usr/bin/doxygen)
Configuring Doxyfile using configuration
Program sphinx-build-3 found: NO
Program sphinx-build found: YES (/var/lib/jenkins/.local/bin/sphinx-build)
meson.build:123: WARNING: The current running kernel version 4.19.0-6-amd64 is too old to run libcamera.
meson.build:125: WARNING: If you intend to use libcamera on this machine, please upgrade to a kernel >= 5.0.0.
Configuring config.h using configuration
Message: Enabled pipelines: ipu3, raspberrypi, rkisp1, simple, uvcvideo, vimc
Build targets in project: 84
Found ninja-1.8.2 at /usr/bin/ninja
+ meson configure -Dandroid=true -Dv4l2=true build

ERROR: Value "true" for combo option is not one of the choices. Possible choices are: "enabled", "disabled", "auto".
Build step 'Execute shell' marked build as failure
