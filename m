Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E501389F9F
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 15:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbfHLNZo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 09:25:44 -0400
Received: from www.linuxtv.org ([130.149.80.248]:39989 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728705AbfHLNZn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 09:25:43 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <mchehab@linuxtv.org>)
        id 1hxAKT-0004Pc-J8; Mon, 12 Aug 2019 13:25:41 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1hxAKT-0008Qb-Nw; Mon, 12 Aug 2019 13:25:41 +0000
Date:   Mon, 12 Aug 2019 13:25:41 +0000 (UTC)
From:   mchehab@linuxtv.org
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1045441849.16.1565616341734.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: xawtv4 #1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: xawtv4
X-Jenkins-Result: FAILURE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/xawtv4/1/display/redirect>

Changes:

------------------------------------------
Started by user Mauro Carvalho Chehab
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/xawtv4/ws/>
No credentials specified
Cloning the remote Git repository
Cloning repository git://linuxtv.org/xawtv4.git
 > git init <https://builder.linuxtv.org/job/xawtv4/ws/> # timeout=10
Fetching upstream changes from git://linuxtv.org/xawtv4.git
 > git --version # timeout=10
 > git fetch --tags --force --progress git://linuxtv.org/xawtv4.git +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url git://linuxtv.org/xawtv4.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git://linuxtv.org/xawtv4.git # timeout=10
Fetching upstream changes from git://linuxtv.org/xawtv4.git
 > git fetch --tags --force --progress git://linuxtv.org/xawtv4.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 11e258342bda5ebf23e78dae05385185a750a2bf (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 11e258342bda5ebf23e78dae05385185a750a2bf
Commit message: "Make it build again"
First time build. Skipping changelog.
[xawtv4] $ /bin/sh -xe /tmp/jenkins8553108853685694405.sh
+ autoreconf -vfi
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal --force 
autoreconf: configure.ac: tracing
autoreconf: configure.ac: not using Libtool
autoreconf: running: /usr/bin/autoconf --force
autoreconf: running: /usr/bin/autoheader --force
autoreconf: configure.ac: not using Automake
autoreconf: Leaving directory `.'
+ ./configure
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking how to run the C preprocessor... gcc -E
configure: error: cannot find install-sh, install.sh, or shtool in "." "./.." "./../.."
Build step 'Execute shell' marked build as failure
