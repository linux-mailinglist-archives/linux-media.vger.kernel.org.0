Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80F325FF0BE
	for <lists+linux-media@lfdr.de>; Fri, 14 Oct 2022 17:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiJNPDU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Oct 2022 11:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJNPDS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Oct 2022 11:03:18 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236B31CFC7E
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 08:03:18 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ojMDU-00AlEr-GL; Fri, 14 Oct 2022 15:03:16 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ojMDR-00DZma-4T; Fri, 14 Oct 2022 15:03:12 +0000
Date:   Fri, 14 Oct 2022 15:03:12 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <1476292820.0.1665759792463@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #971
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/libcamera/971/display/redirect?page=changes>

Changes:

[kieran.bingham] libcamera v0.0.1


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
Checking out Revision a83aed77df1258e469c0eb42d9cb4f1938db53f2 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f a83aed77df1258e469c0eb42d9cb4f1938db53f2 # timeout=10
Commit message: "libcamera v0.0.1"
 > git rev-list --no-walk fc46d091231e22f47e2056fb854ddf4a999d606a # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse a83aed77df1258e469c0eb42d9cb4f1938db53f2^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/libcamera.git'
[GitCheckoutListener] Found previous build 'libcamera #970' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'fc46d09'
[GitCheckoutListener] -> Using head commit 'a83aed7' as starting point
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@411105d5'
[GitCheckoutListener] -> Recorded one new commit
[libcamera] $ /bin/sh -xe /tmp/jenkins11141597672901066666.sh
+ rm -rf build
+ meson setup -Dandroid=auto -Dv4l2=true build
The Meson build system
Version: 0.56.2
Source dir: <https://builder.linuxtv.org/job/libcamera/ws/>
Build dir: <https://builder.linuxtv.org/job/libcamera/ws/build>
Build type: native build
Project name: libcamera
Project version: 0.0.1
C compiler for the host machine: ccache cc (gcc 10.2.1 "cc (Debian 10.2.1-6) 10.2.1 20210110")
C linker for the host machine: cc ld.bfd 2.35.2
C++ compiler for the host machine: ccache c++ (gcc 10.2.1 "c++ (Debian 10.2.1-6) 10.2.1 20210110")
C++ linker for the host machine: c++ ld.bfd 2.35.2
Host machine cpu family: x86_64
Host machine cpu: x86_64
meson.build:33: WARNING: The sources disagree about the version: 0.0.0 != 0.0.1

meson.build:41:4: ERROR: Unknown method "replace" for a string.

A full log can be found at <https://builder.linuxtv.org/job/libcamera/ws/build/meson-logs/meson-log.txt>
Build step 'Execute shell' marked build as failure
