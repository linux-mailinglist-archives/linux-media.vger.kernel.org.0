Return-Path: <linux-media+bounces-16082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6554C94E0B2
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2024 11:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 084D91F216B5
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2024 09:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0168C38DCC;
	Sun, 11 Aug 2024 09:32:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3225774
	for <linux-media@vger.kernel.org>; Sun, 11 Aug 2024 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723368735; cv=none; b=RUPqIGec4sFVAQOeKucvKoVGdoKJheryuu17NNM3XRnrbaWJzvZQUkfH0zJuSBl+2CM54rrimrJruCrLi+xP275yy2dOwRhOaQQMEwecMjMQaYIjIfn+B8cTuBrO+SO5x9yH+izNy/dup/I75d/PhMs/lPwY4L2pOcVkqIS8QAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723368735; c=relaxed/simple;
	bh=6qYJTR0NDZpAY67pPqLkKdtWQejWglnG/1by2/1tqnY=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=raEw2w+FniG0eaL8smkmM5ZpfrhY5ynfD6TLwsFVDu+GoUgNe7r+/i4Ud7j1kuirm+yXbPAHl7PH2Xbr1GUv0nfSaXpA7oA7N093a+BoA3IH/Ct0vjL2Jh9ZdHWRhlhE+NVS3LRxZYjwCpYgpulFztjokqk9QG6Aw+QdJQDgGFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sd4vt-0003Yc-2Y;
	Sun, 11 Aug 2024 09:32:13 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sd4vt-007Djg-2H;
	Sun, 11 Aug 2024 09:32:13 +0000
Date: Sun, 11 Aug 2024 09:32:13 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1192596175.1.1723368733699@builder.linuxtv.org>
In-Reply-To: <606540115.3.1723282329442@builder.linuxtv.org>
References: <606540115.3.1723282329442@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #327
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

See <https://builder.linuxtv.org/job/edid-decode/327/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode.1: document the two supported InfoFrame variants


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
Checking out Revision c3708827ae080b3ae8118a1bd812c53c760accc5 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f c3708827ae080b3ae8118a1bd812c53c760accc5 # timeout=10
Commit message: "edid-decode.1: document the two supported InfoFrame variants"
 > git rev-list --no-walk 0ad31a9fc047572c649810ed4c6a809af4b0c5e0 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse c3708827ae080b3ae8118a1bd812c53c760accc5^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #326' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '0ad31a9'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit 'c370882' as starting point
[GitCheckoutListener] -> Recorded one new commit
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@5399daf7'
[edid-decode] $ /bin/sh -xe /tmp/jenkins10296099105841675568.sh
+ make
make: *** No targets specified and no makefile found.  Stop.
Build step 'Execute shell' marked build as failure

