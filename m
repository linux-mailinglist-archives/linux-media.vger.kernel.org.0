Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 719B8515E7F
	for <lists+linux-media@lfdr.de>; Sat, 30 Apr 2022 16:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382562AbiD3PCt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Apr 2022 11:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382915AbiD3PCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Apr 2022 11:02:45 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EDB6339A
        for <linux-media@vger.kernel.org>; Sat, 30 Apr 2022 07:59:22 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nkoZ7-009QOT-05; Sat, 30 Apr 2022 14:59:21 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nkoZ5-0019CY-1N; Sat, 30 Apr 2022 14:59:18 +0000
Date:   Sat, 30 Apr 2022 14:59:18 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1691786247.0.1651330758264@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #23
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: dtv-scan-tables
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

See <https://builder.linuxtv.org/job/dtv-scan-tables/23/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] pt-All: Update Portugal channels


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave1 in workspace <https://builder.linuxtv.org/job/dtv-scan-tables/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/dtv-scan-tables/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/dtv-scan-tables.git # timeout=10
Fetching upstream changes from git://linuxtv.org/dtv-scan-tables.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/dtv-scan-tables.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 5f7b549da3c7ed1e9dfe4fcbbda742a9d7ee5aec (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 5f7b549da3c7ed1e9dfe4fcbbda742a9d7ee5aec # timeout=10
Commit message: "pt-All: Update Portugal channels"
 > git rev-list --no-walk e403f83644167e240668c0668a8de04532060683 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 5f7b549da3c7ed1e9dfe4fcbbda742a9d7ee5aec^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/dtv-scan-tables.git'
[GitCheckoutListener] Found previous build 'dtv-scan-tables #22' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'e403f83'
[GitCheckoutListener] -> Using head commit '5f7b549' as starting point
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@5cb067ce'
[GitCheckoutListener] -> Recorded one new commit
[dtv-scan-tables] $ /bin/sh -xe /tmp/jenkins6670980118375988650.sh
+ make
ERROR value AUTO is invalid for MODULATION while parsing line 9 of dvb-t/pt-All
Error reading file dvb-t/pt-All
Reading file dvb-t/pt-All
make: *** [Makefile:50: dvbv3/dvb-t/pt-All] Error 255
Build step 'Execute shell' marked build as failure
