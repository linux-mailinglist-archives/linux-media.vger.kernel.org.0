Return-Path: <linux-media+bounces-11304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 184668C2187
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 12:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB84E1F21093
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5FB165FA3;
	Fri, 10 May 2024 10:02:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DA715B108
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715335343; cv=none; b=I0ceZkTXkS1swYRX8k6y4+ZlJJQqTgaWeGfyYjwyblcMJsto2E3jOVfQ/BjNQd2YrePoy3SmkjptvbBqAjKB/lbPStLpMtK2b6MqNt38WmZxMtKhqFbx7AbJmj0H5aB+vZr/2XyaYGW3fyhDb8iEaRDgUuXUW2FU3kNGmVJVl+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715335343; c=relaxed/simple;
	bh=/7sJtzB+VcT0z8CHViCjjTrycEP8li3/Rel/qxu1PP4=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=aSOJpNOTYDs8g+HYzP7UJFHwMJdXiN33jOf3kTYOUVBM0M/FDSHCItZxqJJtxBvm2nkQjXTgrYaX5p2aqDL04HYqBf894TUDOJzTrMXbMjkooxeLY7uqmghHJzeAIDgxhpNh7TtSVlLXU+pUjHiMT+tUahlVrJEB3CAUWFfg3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1s5N53-0000xF-1T;
	Fri, 10 May 2024 10:02:21 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1s5N52-007wwd-1S;
	Fri, 10 May 2024 10:02:21 +0000
Date: Fri, 10 May 2024 10:02:21 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <2104489613.1.1715335341224@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #321
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

See <https://builder.linuxtv.org/job/edid-decode/321/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode: build: add support for building with meson

[Hans Verkuil] edid-decode: minor modifications to README and emscripten path


------------------------------------------
Started by an SCM change
Running as SYSTEM
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
 > git rev-list --no-walk 3d635499e4aca3319f0796ba787213c981c5a770 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse f4b0548cb4b4cdff7947be59ce795b23e60266ed^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #320' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '3d63549'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit 'f4b0548' as starting point
[GitCheckoutListener] -> Recorded 2 new commits
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@1998bcab'
[edid-decode] $ /bin/sh -xe /tmp/jenkins6311854670986241266.sh
+ make
make: *** No targets specified and no makefile found.  Stop.
Build step 'Execute shell' marked build as failure

