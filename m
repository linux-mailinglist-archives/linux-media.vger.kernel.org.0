Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA051520800
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 00:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbiEIWwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 18:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbiEIWwR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 18:52:17 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AFE2C4F42
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 15:48:21 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1noCAt-004WMS-RG; Mon, 09 May 2022 22:48:19 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1noCAs-00FnH3-6Z; Mon, 09 May 2022 22:48:17 +0000
Date:   Mon, 9 May 2022 22:48:17 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <742172381.1.1652136497699@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #841
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
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

See <https://builder.linuxtv.org/job/libcamera/841/display/redirect?page=changes>

Changes:

[laurent.pinchart] libcamera: Introduce YamlParser as a helper to parse yaml files

[laurent.pinchart] test: Add YamlParser test

[laurent.pinchart] android: camera_hal_config: Use YamlParser to parse android HAL config


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/libcamera/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
Fetching upstream changes from git://linuxtv.org/libcamera.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 6d990f102fd829feb05e37e5f242a796fcada1b5 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 6d990f102fd829feb05e37e5f242a796fcada1b5 # timeout=10
Commit message: "android: camera_hal_config: Use YamlParser to parse android HAL config"
 > git rev-list --no-walk c70323e4941542202c34f4fde7d340d1f62d6c9c # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 6d990f102fd829feb05e37e5f242a796fcada1b5^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/libcamera.git'
[GitCheckoutListener] Found previous build 'libcamera #840' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'c70323e'
[GitCheckoutListener] -> Using head commit '6d990f1' as starting point
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@7ec23d92'
[GitCheckoutListener] -> Recorded 3 new commits
[libcamera] $ /bin/sh -xe /tmp/jenkins13672912161320613703.sh
+ rm -rf build
+ meson setup -Dandroid=auto -Dv4l2=true build
The Meson build system
Version: 0.56.2
Source dir: <https://builder.linuxtv.org/job/libcamera/ws/>
Build dir: <https://builder.linuxtv.org/job/libcamera/ws/build>
Build type: native build
Project name: libcamera
Project version: 0.0.0
C compiler for the host machine: ccache cc (gcc 10.2.1 "cc (Debian 10.2.1-6) 10.2.1 20210110")
C linker for the host machine: cc ld.bfd 2.35.2
C++ compiler for the host machine: ccache c++ (gcc 10.2.1 "c++ (Debian 10.2.1-6) 10.2.1 20210110")
C++ linker for the host machine: c++ ld.bfd 2.35.2
Host machine cpu family: x86_64
Host machine cpu: x86_64
Program utils/run-dist.sh found: YES (/bin/sh <https://builder.linuxtv.org/job/libcamera/ws/utils/run-dist.sh)>
Header <unistd.h> has symbol "issetugid" : NO 
Header <stdlib.h> has symbol "secure_getenv" : YES 
Compiler for C supports arguments -Wno-c99-designator: NO 
Library lttng-ust found: YES
Program ./parser.py found: YES (<https://builder.linuxtv.org/job/libcamera/ws/utils/ipc/./parser.py)>
Program ./generate.py found: YES (<https://builder.linuxtv.org/job/libcamera/ws/utils/ipc/./generate.py)>
Program ./extract-docs.py found: YES (<https://builder.linuxtv.org/job/libcamera/ws/utils/ipc/./extract-docs.py)>
Program ./gen-tp-header.py found: YES (<https://builder.linuxtv.org/job/libcamera/ws/utils/tracepoints/./gen-tp-header.py)>
Configuring version.h using configuration
Program openssl found: YES (/usr/bin/openssl)
Library atomic found: YES
Library libdw found: YES
Library libunwind found: YES
Header <execinfo.h> has symbol "backtrace" : YES 
Run-time dependency threads found: YES
Library dl found: YES
Library gnutls found: YES
Found pkg-config: /usr/bin/pkg-config (0.29.2)
Run-time dependency libudev found: YES 247
Found CMake: /usr/bin/cmake (3.18.4)
Run-time dependency yaml-0.1 found: NO (tried pkgconfig and cmake)

src/libcamera/meson.build:70:0: ERROR: Dependency "yaml-0.1" not found, tried pkgconfig and cmake

A full log can be found at <https://builder.linuxtv.org/job/libcamera/ws/build/meson-logs/meson-log.txt>
Build step 'Execute shell' marked build as failure
