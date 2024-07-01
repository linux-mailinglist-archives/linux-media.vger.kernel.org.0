Return-Path: <linux-media+bounces-14465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B399C91DC49
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 12:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EA4F282948
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 10:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2501465B1;
	Mon,  1 Jul 2024 10:20:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ABF5A0F5
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719829257; cv=none; b=O45JxWkfs1/MCZUJScP0vNdOmYHrlBnseOFkX7X3WsLu+rqEX/e+CEj89r8sn+qDKVK38Da4tjNeaouFSU849AvM9/Fo3g0MSi5YAQGA3yQy+oV1x7YGLnKSwOij5yWD/bwIC9sVwI90JkvrrWGKBFjoeUQTTcWK1Tkl1ljK6z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719829257; c=relaxed/simple;
	bh=QreW4TCRdBdZdC+Z7gNuhayILa0uqBw8qJ0I/DWh03c=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=tZG9B6hSRKn84xWueg5ovmxVWYsU+krWAVrQLhuuQPQhQ5KDNLScpaeovjsS8aUIDGAsAwj5ig26D6shEWjb8sSoVj+N3aCN6Lw7m9Z5r9y6zy0IWk1vxQOaWF6l0a3x7Ahrs/PFOa2mIHBEg4ZDKHTpLEeQhx0dEvPUtmvw5+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sODqj-0005XT-0k;
	Mon, 01 Jul 2024 10:01:29 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sODqi-0063Kj-0Y;
	Mon, 01 Jul 2024 10:01:29 +0000
Date: Mon, 1 Jul 2024 10:01:28 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <538818423.1.1719828088957@builder.linuxtv.org>
Subject: Build failed in Jenkins: v4l-utils #558
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: v4l-utils
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/v4l-utils/558/display/redirect?page=changes>

Changes:

[Hans Verkuil] v4l-utils: sync with latest kernel


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
 > git --version # 'git version 2.39.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/v4l-utils.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 0ec2d6d7d8d82d7fe295cc1ef326790c33584842 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 0ec2d6d7d8d82d7fe295cc1ef326790c33584842 # timeout=10
Commit message: "v4l-utils: sync with latest kernel"
 > git rev-list --no-walk a0fd7261492d3ffeb33a3ad2e25e3642a23e01a2 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 0ec2d6d7d8d82d7fe295cc1ef326790c33584842^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/v4l-utils.git'
[GitCheckoutListener] Found previous build 'v4l-utils #557' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'a0fd726'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '0ec2d6d' as starting point
[GitCheckoutListener] -> Recorded one new commit
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@7aba9e48'
[v4l-utils] $ /bin/sh -xe /tmp/jenkins16165868415824339050.sh
+ rm -rf build
+ meson setup build
The Meson build system
Version: 1.0.1
Source dir: <https://builder.linuxtv.org/job/v4l-utils/ws/>
Build dir: <https://builder.linuxtv.org/job/v4l-utils/ws/build>
Build type: native build
Project name: v4l-utils
Project version: 1.27.0
C compiler for the host machine: ccache cc (gcc 12.2.0 "cc (Debian 12.2.0-14) 12.2.0")
C linker for the host machine: cc ld.bfd 2.40
C++ compiler for the host machine: ccache c++ (gcc 12.2.0 "c++ (Debian 12.2.0-14) 12.2.0")
C++ linker for the host machine: c++ ld.bfd 2.40
Host machine cpu family: x86_64
Host machine cpu: x86_64
Compiler for C supports link arguments -m32: NO 
Compiler for C supports arguments -fvisibility=hidden: YES 
Compiler for C supports function attribute visibility:default: YES 
Program bash found: YES (/usr/bin/bash)
Program clang found: NO
Program doxygen found: YES (/usr/bin/doxygen)
Program grep found: YES (/usr/bin/grep)
Program perl found: YES (/usr/bin/perl)
Found pkg-config: /usr/bin/pkg-config (1.8.1)
Run-time dependency alsa found: YES 1.2.8
Run-time dependency gl found: YES 1.2
Run-time dependency glu found: YES 9.0.2
Found CMake: /usr/bin/cmake (3.25.1)
Run-time dependency json-c found: NO (tried pkgconfig and cmake)
Library dl found: YES
Library elf found: YES
Library m found: YES
Library rt found: YES
qmake found: NO found 'QMake version 3.1\nUsing Qt version 5.15.8 in /usr/lib/x86_64-linux-gnu' but need ['>= 6', '< 7']
Run-time dependency qt6 (modules: Core, Core5Compat, Gui, Widgets) found: NO (tried pkgconfig and config-tool)
Run-time dependency qt5 (modules: Core, Gui, Widgets) found: YES 5.15.8 (pkg-config)
Run-time dependency qt5 (modules: OpenGL) found: YES 5.15.8 (pkg-config)
Run-time dependency libbpf found: YES 1.1.0
Run-time dependency sdl2 found: YES 2.26.5
Run-time dependency sdl2_image found: YES 2.6.3
Run-time dependency threads found: YES
Run-time dependency x11 found: YES 1.8.4
Run-time dependency xmlrpc found: NO (tried pkgconfig and cmake)
Checking for function "fork" : YES 
Has header "linux/i2c-dev.h" : YES 
Checking for function "klogctl" : YES 
Checking for function "secure_getenv" : YES 
Checking for function "__secure_getenv" : NO 
Has header "sys/klog.h" : YES 
Header "execinfo.h" has symbol "backtrace" : YES 
Checking for function "argp_parse" : YES 
Checking for function "strerrorname_np" : YES 
Run-time dependency iconv found: YES
Has header "gconv.h" : YES 
Library JIS found: YES
Library JISX0213 found: YES
Run-time dependency libjpeg found: YES 2.1.5
Run-time dependency systemd found: YES 252
Run-time dependency libudev found: YES 252
Run-time dependency udev found: YES 252
Program git found: YES (/usr/bin/git)
Program msgfmt found: YES (/usr/bin/msgfmt)
Program msginit found: YES (/usr/bin/msginit)
Program msgmerge found: YES (/usr/bin/msgmerge)
Program xgettext found: YES (/usr/bin/xgettext)
Configuring libdvb-version.h using configuration
Configuring cec-gen-dummy.stamp with command

utils/keytable/rc_keymaps/meson.build:1:0: ERROR: File mygica_utv3.toml does not exist.

A full log can be found at <https://builder.linuxtv.org/job/v4l-utils/ws/build/meson-logs/meson-log.txt>
Build step 'Execute shell' marked build as failure

