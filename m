Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4192C6B70CC
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 09:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjCMIFm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 04:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjCMIFQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 04:05:16 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF565679C
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 01:02:16 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pbd7O-00Fq0X-Nl; Mon, 13 Mar 2023 08:01:18 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pbd7M-00BX65-6Q; Mon, 13 Mar 2023 08:01:16 +0000
Date:   Mon, 13 Mar 2023 08:01:15 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1884722164.0.1678694475531@builder.linuxtv.org>
In-Reply-To: <287817430.0.1678449673767@builder.linuxtv.org>
References: <287817430.0.1678449673767@builder.linuxtv.org>
Subject: Build failed in Jenkins: v4l-utils #454
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: v4l-utils
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

See <https://builder.linuxtv.org/job/v4l-utils/454/display/redirect?page=changes>

Changes:

[gjasny] build: conditionally retrieve Git repo information

[gjasny] build: do not fall back to libbpf header lookup


------------------------------------------
Started by an SCM change
Running as SYSTEM
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
Checking out Revision cb77676c3a25db34180f76541f0ab353327e94be (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f cb77676c3a25db34180f76541f0ab353327e94be # timeout=10
Commit message: "build: do not fall back to libbpf header lookup"
 > git rev-list --no-walk 0a195181d771090f3c99d4a6ddb8151352509061 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse cb77676c3a25db34180f76541f0ab353327e94be^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/v4l-utils.git'
[GitCheckoutListener] Found previous build 'v4l-utils #453' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '0a19518'
[GitCheckoutListener] -> Using head commit 'cb77676' as starting point
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@544095b9'
[GitCheckoutListener] -> Recorded 2 new commits
[v4l-utils] $ /bin/sh -xe /tmp/jenkins14435795406618595451.sh
+ ./bootstrap.sh
/tmp/jenkins14435795406618595451.sh: 2: ./bootstrap.sh: not found
Build step 'Execute shell' marked build as failure
