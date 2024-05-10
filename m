Return-Path: <linux-media+bounces-11308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7E28C2216
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 12:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60E401C22888
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F0C168AFF;
	Fri, 10 May 2024 10:27:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E27130E39
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715336845; cv=none; b=KMQjTDA+vLiIHKNgPT7/TiARqUUf5p1GqFmPuRMTi+54PVGXl3QoCAR5HsME6A34AVL+yN+Dj6V8PBlSpF3GcUE6I4k1U4ooWYrfVYzXaQDOKFOxnbyKPVDvIufoiKR7LtL4ahlyebQ8kmBSQDuDVVheDGdYyuc+6rCUTEUaddE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715336845; c=relaxed/simple;
	bh=sVh5yM4+osa7dANgP0gwRkhT2plE88h3VnNKH48slPo=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=HTp4vHgszk14I21W45ydXR47lCdToIvF69T36F4B4SO4whvHd5y5ty1/4RzkfkqZsmlwj/20kTv6ASEwrI39t+Ioc8Jmos5DBKmhSAXdFIMHtrR3Y5OpwvBUdY4RMElhXsuIUf243ZP/iOkuVBE2QVfeu4ndehMuHk87OitYEHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1s5NTH-0001rL-1Y;
	Fri, 10 May 2024 10:27:23 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1s5NTG-00804r-1p;
	Fri, 10 May 2024 10:27:23 +0000
Date: Fri, 10 May 2024 10:27:22 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <606077562.2.1715336843353@builder.linuxtv.org>
In-Reply-To: <2104489613.1.1715335341224@builder.linuxtv.org>
References: <2104489613.1.1715335341224@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #322
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: edid-decode
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/edid-decode/322/display/redirect>

Changes:


------------------------------------------
Started by user Hans Verkuil
Running as Hans Verkuil
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/edid-decode/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/edid-decode/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/edid-decode.git # timeout=10
Fetching upstream changes from git://linuxtv.org/edid-decode.git
 > git --version # timeout=10
 > git --version # 'git version 2.39.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/edid-decode.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision f4b0548cb4b4cdff7947be59ce795b23e60266ed (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f f4b0548cb4b4cdff7947be59ce795b23e60266ed # timeout=10
Commit message: "edid-decode: minor modifications to README and emscripten path"
 > git rev-list --no-walk f4b0548cb4b4cdff7947be59ce795b23e60266ed # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse f4b0548cb4b4cdff7947be59ce795b23e60266ed^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #321' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'f4b0548'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit 'f4b0548' as starting point
[GitCheckoutListener] -> No new commits found
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@217ee163'
[edid-decode] $ /bin/sh -xe /tmp/jenkins14551156528123712110.sh
+ meson setup build
The Meson build system
Version: 1.0.1
Source dir: <https://builder.linuxtv.org/job/edid-decode/ws/>
Build dir: <https://builder.linuxtv.org/job/edid-decode/ws/build>
Build type: native build
Project name: edid-decode
Project version: undefined
C++ compiler for the host machine: ccache c++ (gcc 12.2.0 "c++ (Debian 12.2.0-14) 12.2.0")
C++ linker for the host machine: c++ ld.bfd 2.40
Host machine cpu family: x86_64
Host machine cpu: x86_64
Program git found: YES (/usr/bin/git)
Build targets in project: 1

Found ninja-1.11.1 at /usr/bin/ninja
+ meson compile -C build
ninja: Entering directory `<https://builder.linuxtv.org/job/edid-decode/ws/build'>
[1/10] Compiling C++ object edid-decode.p/parse-di-ext-block.cpp.o
[2/10] Compiling C++ object edid-decode.p/calc-gtf-cvt.cpp.o
[3/10] Compiling C++ object edid-decode.p/edid-decode.cpp.o
[4/10] Compiling C++ object edid-decode.p/parse-displayid-block.cpp.o
[5/10] Compiling C++ object edid-decode.p/calc-ovt.cpp.o
[6/10] Compiling C++ object edid-decode.p/parse-base-block.cpp.o
[7/10] Compiling C++ object edid-decode.p/parse-vtb-ext-block.cpp.o
[8/10] Compiling C++ object edid-decode.p/parse-ls-ext-block.cpp.o
[9/10] Compiling C++ object edid-decode.p/parse-cta-block.cpp.o
[10/10] Linking target edid-decode
INFO: autodetecting backend as ninja
INFO: calculating backend command to run: /usr/bin/ninja -C <https://builder.linuxtv.org/job/edid-decode/ws/build>
+ pwd
+ meson setup build-wasm --cross-file ./emscripten/wasm-crossfile.txt --prefix=<https://builder.linuxtv.org/job/edid-decode/ws/install-wasm>
The Meson build system
Version: 1.0.1
Source dir: <https://builder.linuxtv.org/job/edid-decode/ws/>
Build dir: <https://builder.linuxtv.org/job/edid-decode/ws/build-wasm>
Build type: cross build
Project name: edid-decode
Project version: undefined

meson.build:1:0: ERROR: Unknown compiler(s): [['em++']]
The following exception(s) were encountered:
Running `em++ --version` gave "[Errno 2] No such file or directory: 'em++'"

A full log can be found at <https://builder.linuxtv.org/job/edid-decode/ws/build-wasm/meson-logs/meson-log.txt>
Build step 'Execute shell' marked build as failure

