Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1AE19FCB8
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 20:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgDFSLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 14:11:44 -0400
Received: from www.linuxtv.org ([130.149.80.248]:56824 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbgDFSLo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 14:11:44 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jLWB6-0093qS-K9; Mon, 06 Apr 2020 18:08:56 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jLWFT-0003SP-5E; Mon, 06 Apr 2020 18:13:27 +0000
Date:   Mon, 6 Apr 2020 18:13:27 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <1782545045.7.1586196807156.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <1175403098.1.1585951395075.JavaMail.jenkins@builder.linuxtv.org>
References: <1175403098.1.1585951395075.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #132
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

See <https://builder.linuxtv.org/job/libcamera/132/display/redirect>

Changes:


------------------------------------------
Started by user Mauro Carvalho Chehab
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
Checking out Revision 72278369b30af757c8ab756cc6c9cadcf15684d5 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 72278369b30af757c8ab756cc6c9cadcf15684d5 # timeout=10
Commit message: "libcamera: pixelformats: Replace set of modifiers with single value"
 > git rev-list --no-walk 72278369b30af757c8ab756cc6c9cadcf15684d5 # timeout=10
[libcamera] $ /bin/sh -xe /tmp/jenkins17746181194013845494.sh
+ meson setup --wipe build
Directory does not contain a valid build tree:
<https://builder.linuxtv.org/job/libcamera/ws/build>
+ true
+ meson configure build
Meson configurator encountered an error:

ERROR: Directory <https://builder.linuxtv.org/job/libcamera/ws/build> does not seem to be a Meson build directory.
Build step 'Execute shell' marked build as failure
