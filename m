Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C94E6BFC0E
	for <lists+linux-media@lfdr.de>; Sat, 18 Mar 2023 18:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjCRRzv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Mar 2023 13:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjCRRzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Mar 2023 13:55:49 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFBB21A36
        for <linux-media@vger.kernel.org>; Sat, 18 Mar 2023 10:55:47 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pdamQ-002Xwj-8k; Sat, 18 Mar 2023 17:55:46 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pdamO-006UyE-L1; Sat, 18 Mar 2023 17:55:44 +0000
Date:   Sat, 18 Mar 2023 17:55:43 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <2125344722.0.1679162143810@builder.linuxtv.org>
In-Reply-To: <1228044006.0.1678903274635@builder.linuxtv.org>
References: <1228044006.0.1678903274635@builder.linuxtv.org>
Subject: Build failed in Jenkins: v4l-utils #456
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: v4l-utils
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/v4l-utils/456/display/redirect>

Changes:


------------------------------------------
Started by user Mauro Carvalho Chehab
Running as Mauro Carvalho Chehab
Building remotely on slave0 in workspace <https://builder.linuxtv.org/job/v4l-utils/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/v4l-utils/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/v4l-utils.git # timeout=10
Fetching upstream changes from git://linuxtv.org/v4l-utils.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/v4l-utils.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision d04dab77fcd32b440f008d2ec37bb5d0c7a7d41f (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f d04dab77fcd32b440f008d2ec37bb5d0c7a7d41f # timeout=10
Commit message: "v4l2-ctl: improve --stream-sleep"
 > git rev-list --no-walk d04dab77fcd32b440f008d2ec37bb5d0c7a7d41f # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse d04dab77fcd32b440f008d2ec37bb5d0c7a7d41f^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/v4l-utils.git'
[GitCheckoutListener] Found previous build 'v4l-utils #455' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'd04dab7'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit 'd04dab7' as starting point
[GitCheckoutListener] -> No new commits found
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@6f578ac'
[v4l-utils] $ /bin/sh -xe /tmp/jenkins5644973279629281587.sh
+ rm -rf build
+ meson setup build
The Meson build system
Version: 0.56.2
Source dir: <https://builder.linuxtv.org/job/v4l-utils/ws/>
Build dir: <https://builder.linuxtv.org/job/v4l-utils/ws/build>
Build type: native build

meson.build:1:0: ERROR: Meson version is 0.56.2 but project requires >= 0.57

A full log can be found at <https://builder.linuxtv.org/job/v4l-utils/ws/build/meson-logs/meson-log.txt>
Build step 'Execute shell' marked build as failure
