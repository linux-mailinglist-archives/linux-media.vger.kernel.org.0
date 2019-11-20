Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9969A103D21
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 15:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730935AbfKTOSq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 09:18:46 -0500
Received: from www.linuxtv.org ([130.149.80.248]:44042 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729000AbfKTOSp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 09:18:45 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iXQoh-0001S1-RR; Wed, 20 Nov 2019 14:18:47 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iXPsw-0006h5-V6; Wed, 20 Nov 2019 13:19:06 +0000
Date:   Wed, 20 Nov 2019 13:19:06 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1735325726.3.1574255946954.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #2416
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/2416/display/redirect>

Changes:


------------------------------------------
Started by timer
Running as SYSTEM
Building remotely on slave1 in workspace <https://builder.linuxtv.org/job/media-build/ws/>
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/media_build.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_build.git
 > git --version # timeout=10
 > git fetch --tags --force --progress -- git://linuxtv.org/media_build.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision efba365ba11b958a6bf6fb4b397942f9461cefca (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f efba365ba11b958a6bf6fb4b397942f9461cefca
Commit message: "VIDEO_HI556 needs probe_new"
 > git rev-list --no-walk efba365ba11b958a6bf6fb4b397942f9461cefca # timeout=10
[media-build] $ /bin/sh -xe /tmp/jenkins8368332465259138017.sh
+ ./build
Checking if the needed tools for Debian GNU/Linux 10 (buster) are available
Needed package dependencies are met.

************************************************************
* This script will download the latest tarball and build it*
* Assuming that your kernel is compatible with the latest  *
* drivers. If not, you'll need to add some extra backports,*
* ./backports/<kernel> directory.                          *
* It will also update this tree to be sure that all compat *
* bits are there, to avoid compilation failures            *
************************************************************
************************************************************
* All drivers and build system are under GPLv2 License     *
* Firmware files are under the license terms found at:     *
* http://www.linuxtv.org/downloads/firmware/               *
* Please abort in the next 5 secs if you don't agree with  *
* the license                                              *
************************************************************

Not aborted. It means that the licence was agreed. Proceeding...

****************************
Updating the building system
****************************
From git://linuxtv.org/media_build
 * branch                      master     -> FETCH_HEAD
Already up to date.
make: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
wget http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2.md5 -O linux-media.tar.bz2.md5.tmp
--2019-11-20 13:18:34--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2.md5
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... failed: Connection refused.
make: *** [Makefile:175: download] Error 4
make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Download failed at ./build line 505
Build step 'Execute shell' marked build as failure
