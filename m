Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE868A594
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 20:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfHLSVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 14:21:39 -0400
Received: from www.linuxtv.org ([130.149.80.248]:56333 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbfHLSVj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 14:21:39 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <mchehab@linuxtv.org>)
        id 1hxEwq-0003ST-Gm; Mon, 12 Aug 2019 18:21:36 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1hxEwq-0008W1-Co; Mon, 12 Aug 2019 18:21:36 +0000
Date:   Mon, 12 Aug 2019 18:21:36 +0000 (UTC)
From:   mchehab@linuxtv.org
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <2053679003.20.1565634096344.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: camorama #1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: camorama
X-Jenkins-Result: FAILURE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/camorama/1/display/redirect>

Changes:

------------------------------------------
Started by user Mauro Carvalho Chehab
Running as SYSTEM
Building remotely on slave1 in workspace <https://builder.linuxtv.org/job/camorama/ws/>
No credentials specified
Cloning the remote Git repository
Cloning repository https://github.com/alessio/camorama
 > git init <https://builder.linuxtv.org/job/camorama/ws/> # timeout=10
Fetching upstream changes from https://github.com/alessio/camorama
 > git --version # timeout=10
 > git fetch --tags --force --progress https://github.com/alessio/camorama +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url https://github.com/alessio/camorama # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url https://github.com/alessio/camorama # timeout=10
Fetching upstream changes from https://github.com/alessio/camorama
 > git fetch --tags --force --progress https://github.com/alessio/camorama +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision c6aee27aff8e966e40440163dd12b2d18ffd0994 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f c6aee27aff8e966e40440163dd12b2d18ffd0994
Commit message: "Bump version number to 0.20.7"
First time build. Skipping changelog.
[camorama] $ /bin/sh -xe /tmp/jenkins15859781107416313140.sh
+ ./autogen.sh
You need to install the gnome-common module and make
sure the gnome-autogen.sh script is in your $PATH.
Build step 'Execute shell' marked build as failure
