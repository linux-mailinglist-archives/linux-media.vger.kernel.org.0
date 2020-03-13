Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F814184239
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 09:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgCMII5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 04:08:57 -0400
Received: from www.linuxtv.org ([130.149.80.248]:57402 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbgCMII5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 04:08:57 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jCfLJ-00Cwgk-C4; Fri, 13 Mar 2020 08:06:53 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jCfOn-0005AM-Ox; Fri, 13 Mar 2020 08:10:29 +0000
Date:   Fri, 13 Mar 2020 08:10:29 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1413117120.2.1584087029767.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <917811098.0.1584083855357.JavaMail.jenkins@builder.linuxtv.org>
References: <917811098.0.1584083855357.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: camorama #13
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: camorama
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/camorama/13/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] Remove the gettext version

[Mauro Carvalho Chehab] Update the po files

[Mauro Carvalho Chehab] Remove auto-tools generated files


------------------------------------------
Started by user Mauro Carvalho Chehab
Running as SYSTEM
Building on master in workspace <https://builder.linuxtv.org/job/camorama/ws/>
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/alessio/camorama # timeout=10
Fetching upstream changes from https://github.com/alessio/camorama
 > git --version # timeout=10
 > git fetch --tags --force --progress -- https://github.com/alessio/camorama +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 6837a851a2ceb12575f8bc0fb0f26addc74cba68 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 6837a851a2ceb12575f8bc0fb0f26addc74cba68 # timeout=10
Commit message: "Remove auto-tools generated files"
 > git rev-list --no-walk 8c1a7e5c6178b249a1c67d7c7c2acff68d64c0bc # timeout=10
[camorama] $ /bin/sh -xe /tmp/jenkins7709894106090751579.sh
+ ./autogen.sh
/usr/bin/gnome-autogen.sh
checking for automake >= 1.9...
  testing automake... found 1.16.1
checking for autoreconf >= 2.53...
  testing autoreconf... found 2.69
checking for pkg-config >= 0.14.0...
  testing pkg-config... found 0.29
Checking for required M4 macros...
**Warning**: I am going to run `configure' with no arguments.
If you wish to pass any to it, please specify them on the
`./autogen.sh' command line.

Processing ./configure.ac
Running autoreconf...
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal --force --warnings=no-portability -I m4
autoreconf: configure.ac: tracing
autoreconf: configure.ac: AM_GNU_GETTEXT is used, but not AM_GNU_GETTEXT_VERSION
autoreconf: configure.ac: not using Libtool
autoreconf: running: /usr/bin/autoconf --force --warnings=no-portability
autoreconf: running: /usr/bin/autoheader --force --warnings=no-portability
autoreconf: running: automake --add-missing --copy --force-missing --warnings=no-portability
configure.ac:10: installing './compile'
configure.ac:10: installing './config.guess'
configure.ac:10: installing './config.sub'
Makefile.am: error: required file './README' not found
autoreconf: automake failed with exit status: 1
Build step 'Execute shell' marked build as failure
