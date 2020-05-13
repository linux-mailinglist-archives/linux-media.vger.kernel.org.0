Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE7E01D1ED8
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 21:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390356AbgEMTQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 15:16:22 -0400
Received: from www.linuxtv.org ([130.149.80.248]:59884 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390336AbgEMTQU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 15:16:20 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jYwoE-007149-4F; Wed, 13 May 2020 19:12:50 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jYwtW-0004zQ-5w; Wed, 13 May 2020 19:18:18 +0000
Date:   Wed, 13 May 2020 19:18:18 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <445916266.26.1589397498172.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <1444985187.25.1589379500987.JavaMail.jenkins@builder.linuxtv.org>
References: <1444985187.25.1589379500987.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #175
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

See <https://builder.linuxtv.org/job/libcamera/175/display/redirect?page=changes>

Changes:

[laurent.pinchart] ipa: Only sign IPA modules that are being installed


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
Fetching upstream changes from git://linuxtv.org/libcamera.git
 > git --version # timeout=10
 > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 924778eb073c47a0defc7319e98029c712129ede (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 924778eb073c47a0defc7319e98029c712129ede # timeout=10
Commit message: "ipa: Only sign IPA modules that are being installed"
 > git rev-list --no-walk e8655c2161a97261971ef19621a34651980b76d6 # timeout=10
[libcamera] $ /bin/sh -xe /tmp/jenkins15356621454705572211.sh
+ meson setup --wipe build
Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/mesonbuild/mesonmain.py", line 112, in run
    return options.run_func(options)
  File "/usr/lib/python3/dist-packages/mesonbuild/msetup.py", line 229, in run
    app = MesonApp(options)
  File "/usr/lib/python3/dist-packages/mesonbuild/msetup.py", line 82, in __init__
    mesonlib.windows_proof_rmtree(l)
  File "/usr/lib/python3/dist-packages/mesonbuild/mesonlib.py", line 1116, in windows_proof_rmtree
    shutil.rmtree(f)
  File "/usr/lib/python3.7/shutil.py", line 501, in rmtree
    onerror(os.path.islink, path, sys.exc_info())
  File "/usr/lib/python3.7/shutil.py", line 499, in rmtree
    raise OSError("Cannot call rmtree on a symbolic link")
OSError: Cannot call rmtree on a symbolic link
+ true
+ meson configure build

ERROR: No such build data file as "'<https://builder.linuxtv.org/job/libcamera/ws/build/meson-private/build.dat'".>
+ meson build
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
Compiler for C supports arguments -Wno-c99-designator -Wc99-designator: NO
Configuring version.h using configuration
Program openssl found: YES (/usr/bin/openssl)
Library atomic found: YES
Library dl found: YES
Library gnutls found: YES
Found pkg-config: /usr/bin/pkg-config (0.29)
Dependency libudev found: YES 241
Dependency threads found: YES 
Dependency Boost found: NO 

src/ipa/raspberrypi/meson.build:5:0: ERROR:  Dependency "boost" not found

A full log can be found at <https://builder.linuxtv.org/job/libcamera/ws/build/meson-logs/meson-log.txt>
Build step 'Execute shell' marked build as failure
