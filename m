Return-Path: <linux-media+bounces-16077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1BA94DBF7
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 11:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4D9281EAC
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 09:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8688414C5A7;
	Sat, 10 Aug 2024 09:32:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CAE43ACB
	for <linux-media@vger.kernel.org>; Sat, 10 Aug 2024 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723282331; cv=none; b=SjB0kZiByw3gDVaj6+/v7L3N5V+7sxRu3ahT5L9fgbCwf1YX4lbhoJAbXaYYLKDDK03rd7El8/V/bS3KC++hF9Ncro3DKWQwGUI0shfeHSpI0SzxmkaAjh4QmMwBAtDLOjn28tnfXmTLFgwdzLCVJvkg4hc4QHiPO//TcGVFNiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723282331; c=relaxed/simple;
	bh=jtV/daIsI7+UDoL6nyGj2krdZE0QhgsMq+B0x6oYz3c=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=dBDkKdXGjHBYRoeNIl/wfSB7AeWV9ZIhp6teBDxVXC8LSyod3boMIazZj60JCsRTyg22uI8AsIF36QcIAIyxIGoxL9CI7w/XxZ8yNBQm7JIXKHHBjIwTKhT4Yv2sWRjKTd58S0AAp8Ya4iVPOzYD790vD/0buaEN6zsp2+Vw5ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sciSH-0000gC-1k;
	Sat, 10 Aug 2024 09:32:09 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sciSH-004KVU-1U;
	Sat, 10 Aug 2024 09:32:09 +0000
Date: Sat, 10 Aug 2024 09:32:09 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <606540115.3.1723282329442@builder.linuxtv.org>
In-Reply-To: <1161248457.2.1723280553627@builder.linuxtv.org>
References: <1161248457.2.1723280553627@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #326
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

See <https://builder.linuxtv.org/job/edid-decode/326/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode: enable UTF-8 for the emscripten version


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
Checking out Revision 0ad31a9fc047572c649810ed4c6a809af4b0c5e0 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 0ad31a9fc047572c649810ed4c6a809af4b0c5e0 # timeout=10
Commit message: "edid-decode: enable UTF-8 for the emscripten version"
 > git rev-list --no-walk cadf102014149dacab0ac4429448f952cf969c59 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 0ad31a9fc047572c649810ed4c6a809af4b0c5e0^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #325' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'cadf102'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '0ad31a9' as starting point
[GitCheckoutListener] -> Recorded one new commit
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@6df0ece5'
[edid-decode] $ /bin/sh -xe /tmp/jenkins17984228423436933266.sh
+ make
make: *** No targets specified and no makefile found.  Stop.
Build step 'Execute shell' marked build as failure

