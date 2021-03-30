Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A73A34ECF9
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 17:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbhC3P5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 11:57:13 -0400
Received: from www.linuxtv.org ([130.149.80.248]:36440 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231951AbhC3P5K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 11:57:10 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lRGjt-004jny-2m; Tue, 30 Mar 2021 15:57:09 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lRGnp-0007c2-NS; Tue, 30 Mar 2021 16:01:13 +0000
Date:   Tue, 30 Mar 2021 16:01:13 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <582341887.2.1617120073715@builder.linuxtv.org>
Subject: Build failed in Jenkins: camorama #18
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: camorama
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/camorama/18/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] callbacks: move get_geometry and fix it

[Mauro Carvalho Chehab] callbacks: fix scale with gtk3

[Mauro Carvalho Chehab] Allow expanding the window with Gtk3

[Mauro Carvalho Chehab] gtk2: remove a non-existing gtk2 property

[Mauro Carvalho Chehab] callbacks: Give more scale flexibility with Gtk3


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave1 in workspace <https://builder.linuxtv.org/job/camorama/ws/>
The recommended git tool is: NONE
No credentials specified
Cloning the remote Git repository
Cloning repository https://github.com/alessio/camorama
 > git init <https://builder.linuxtv.org/job/camorama/ws/> # timeout=10
Fetching upstream changes from https://github.com/alessio/camorama
 > git --version # timeout=10
 > git --version # 'git version 2.20.1'
 > git fetch --tags --force --progress -- https://github.com/alessio/camorama +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url https://github.com/alessio/camorama # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 02e4aba56ff86e95482c27866e68c9b7f4fc8d1e (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 02e4aba56ff86e95482c27866e68c9b7f4fc8d1e # timeout=10
Commit message: "callbacks: Give more scale flexibility with Gtk3"
 > git rev-list --no-walk 1cee98a662b8864790db2a3dbe638d122d2d595d # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 02e4aba56ff86e95482c27866e68c9b7f4fc8d1e^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git https://github.com/alessio/camorama'
[GitCheckoutListener] Found no previous build with recorded Git commits
[GitCheckoutListener] -> Starting initial recording of commits
[GitCheckoutListener] -> Git commit decorator successfully obtained 'hudson.plugins.git.browser.GithubWeb@4c5a9da' to render commit links
[GitCheckoutListener] -> Recorded 174 new commits
[camorama] $ /bin/sh -xe /tmp/jenkins3488128884756305940.sh
+ ./autogen.sh
You need to install the gnome-common module and make
sure the gnome-autogen.sh script is in your $PATH.
Build step 'Execute shell' marked build as failure
