Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC8AC89DDD
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 14:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfHLMR6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 08:17:58 -0400
Received: from www.linuxtv.org ([130.149.80.248]:36769 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727059AbfHLMR6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 08:17:58 -0400
X-Greylist: delayed 986 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Aug 2019 08:17:57 EDT
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <mchehab@linuxtv.org>)
        id 1hx910-0007Ve-Of; Mon, 12 Aug 2019 12:01:30 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1hx910-00020N-SU; Mon, 12 Aug 2019 12:01:30 +0000
Date:   Mon, 12 Aug 2019 12:01:30 +0000 (UTC)
From:   mchehab@linuxtv.org
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1682459245.14.1565611290876.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: dtv-scan-tables
X-Jenkins-Result: FAILURE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/dtv-scan-tables/1/display/redirect>

Changes:

------------------------------------------
Started by user Mauro Carvalho Chehab
Running as SYSTEM
Building on master in workspace <https://builder.linuxtv.org/job/dtv-scan-tables/ws/>
No credentials specified
Cloning the remote Git repository
Cloning repository git://linuxtv.org/dtv-scan-tables.git
 > git init <https://builder.linuxtv.org/job/dtv-scan-tables/ws/> # timeout=10
Fetching upstream changes from git://linuxtv.org/dtv-scan-tables.git
 > git --version # timeout=10
 > git fetch --tags --force --progress git://linuxtv.org/dtv-scan-tables.git +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url git://linuxtv.org/dtv-scan-tables.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git://linuxtv.org/dtv-scan-tables.git # timeout=10
Fetching upstream changes from git://linuxtv.org/dtv-scan-tables.git
 > git fetch --tags --force --progress git://linuxtv.org/dtv-scan-tables.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 1c187978d479a2f941c9c4fb10d8b2612d5fde3c (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 1c187978d479a2f941c9c4fb10d8b2612d5fde3c
Commit message: "UPC Czech Republic: added mux 538 MHz with 256 QAM"
First time build. Skipping changelog.
[dtv-scan-tables] $ /bin/sh -xe /tmp/jenkins4876228468461328378.sh
+ make
make: execvp: /bin/sh: Argument list too long
make: *** [Makefile:47: dvbv3] Error 127
Build step 'Execute shell' marked build as failure
