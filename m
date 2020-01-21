Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76408143E23
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 14:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgAUNjd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 08:39:33 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36552 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726968AbgAUNjd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 08:39:33 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ittjf-000Uxe-1B; Tue, 21 Jan 2020 13:38:27 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ittlq-00027y-Rh; Tue, 21 Jan 2020 13:40:42 +0000
Date:   Tue, 21 Jan 2020 13:40:42 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <1451039710.2.1579614042852.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #80
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/libcamera/80/display/redirect>

Changes:


------------------------------------------
Started by user Mauro Carvalho Chehab
Running as SYSTEM
Building remotely on slave1 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
Fetching upstream changes from git://linuxtv.org/libcamera.git
 > git --version # timeout=10
 > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 9977fc3fcbfa0a6aaab04118fc67f0b9b9627570 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 9977fc3fcbfa0a6aaab04118fc67f0b9b9627570 # timeout=10
Commit message: "qcam: Support scaling of the viewfinder"
 > git rev-list --no-walk 9977fc3fcbfa0a6aaab04118fc67f0b9b9627570 # timeout=10
[libcamera] $ /bin/sh -xe /tmp/jenkins8218803920890772055.sh
+ meson setup --wipe build
The Meson build system
Version: 0.49.2
Source dir: <https://builder.linuxtv.org/job/libcamera/ws/>
Build dir: <https://builder.linuxtv.org/job/libcamera/ws/build>
Build type: native build
Project name: libcamera
Project version: 0.0.0
Native C compiler: ccache cc (gcc 8.3.0 "cc (Debian 8.3.0-6) 8.3.0")
Native C++ compiler: ccache c++ (gcc 8.3.0 "c++ (Debian 8.3.0-6) 8.3.0")
Build machine cpu family: x86_64
Build machine cpu: x86_64
Header <execinfo.h> has symbol "backtrace" : YES
Header <stdlib.h> has symbol "secure_getenv" : YES
Configuring version.h using configuration
Found pkg-config: /usr/bin/pkg-config (0.29)
Dependency libudev found: YES 241
Library atomic found: YES
Library dl found: YES
Dependency threads found: YES 
WARNING: rcc dependencies will not work reliably until this upstream issue is fixed: https://bugreports.qt.io/browse/QTBUG-45460
Dependency qt5 (modules: Core, Gui, Widgets) found: YES 5.11.3 (pkg-config)
Detecting Qt5 tools
 moc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/moc, 5.11.3)
 uic: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/uic, 5.11.3)
 rcc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/rcc, 5.11.3)
 lrelease: NO
Program doxygen found: YES (/usr/bin/doxygen)
Configuring Doxyfile using configuration
Program sphinx-build-3 found: NO
Program sphinx-build found: YES (/usr/bin/sphinx-build)
Configuring config.h using configuration
Build targets in project: 69
Option werror is: True [default: true]
Found ninja-1.8.2 at /usr/bin/ninja
+ meson configure
Meson configurator encountered an error:

ERROR: Directory <https://builder.linuxtv.org/job/libcamera/ws/> does not seem to be a Meson build directory.
Build step 'Execute shell' marked build as failure
