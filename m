Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367B51AC8EE
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 17:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503993AbgDPPQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 11:16:45 -0400
Received: from www.linuxtv.org ([130.149.80.248]:45382 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395033AbgDPPQf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 11:16:35 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jP6Ct-004CBQ-5z; Thu, 16 Apr 2020 15:13:35 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jP6HV-0004wa-3v; Thu, 16 Apr 2020 15:18:21 +0000
Date:   Thu, 16 Apr 2020 15:18:21 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <2003781861.13.1587050301111.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #138
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

See <https://builder.linuxtv.org/job/libcamera/138/display/redirect?page=changes>

Changes:

[laurent.pinchart] libcamera: Make IPA module signing optional

[laurent.pinchart] libcamera: Document dependencies for IPA module signing

[laurent.pinchart] libcamera: Make IPA module signing mandatory for the meantime

[laurent.pinchart] libcamera: gen-ipa-pub-key.py: Wrap lines in generated file


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
Checking out Revision 8defb069eb4a68d62ebf312ec5a76eee162ad970 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 8defb069eb4a68d62ebf312ec5a76eee162ad970 # timeout=10
Commit message: "libcamera: gen-ipa-pub-key.py: Wrap lines in generated file"
 > git rev-list --no-walk 2155a9b74ea3cc3bc0295c5709749520ffacdf6b # timeout=10
[libcamera] $ /bin/sh -xe /tmp/jenkins4021614560821016703.sh
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
Compiler for C supports arguments -Wno-c99-designator -Wc99-designator: NO
Configuring version.h using configuration
Program openssl found: YES (/usr/bin/openssl)
Program ipa/gen-ipa-priv-key.sh found: YES (<https://builder.linuxtv.org/job/libcamera/ws/src/ipa/gen-ipa-priv-key.sh)>
Library atomic found: YES
Library dl found: YES

src/libcamera/meson.build:65:0: ERROR:  C library 'gnutls' not found

A full log can be found at <https://builder.linuxtv.org/job/libcamera/ws/build/meson-logs/meson-log.txt>
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
Program ipa/gen-ipa-priv-key.sh found: YES (<https://builder.linuxtv.org/job/libcamera/ws/src/ipa/gen-ipa-priv-key.sh)>
Library atomic found: YES
Library dl found: YES

src/libcamera/meson.build:65:0: ERROR:  C library 'gnutls' not found

A full log can be found at <https://builder.linuxtv.org/job/libcamera/ws/build/meson-logs/meson-log.txt>
Build step 'Execute shell' marked build as failure
