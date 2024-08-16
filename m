Return-Path: <linux-media+bounces-16372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C395475E
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 13:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D8FFB2198D
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 11:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28A2195B33;
	Fri, 16 Aug 2024 11:02:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE3817
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 11:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723806143; cv=none; b=UtMrI2CZX/Y+DH8Gm64USjiH7DfKHF0cKUVmEpEkaYLA7sxstqioLWWJxPvob7kQa8O/W1ZHgUEB7VVSZFfb+abkTT7ihQuX7sYbaloc7uBgGFcHbegnmX/KhPWtC1iS6RChSYftcPOeS6jajxEmyiASNaum5fiZmkCJkYCFzFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723806143; c=relaxed/simple;
	bh=+3LZ3E5migCSCiZ9slcN8HbbaDJtmC5fEorX8bFSQy0=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=VuhvDJQiRamCHQZH3Buv4K9ThYkpG77aLoOB47aOn29fEcSrEObmLAkFSn3psG5PvenVBhgFzVEHmDSjfrsxwC64HHTLDlizLU5uCx4UzKZAh/n7YNaEWrmw0b7zNcX2toVMMPd3vtQZhlxhtGVz5Fkk1MCuIOUYVE20+zeWvFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1seuir-00017t-1d;
	Fri, 16 Aug 2024 11:02:21 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1seuir-00FJUr-1F;
	Fri, 16 Aug 2024 11:02:21 +0000
Date: Fri, 16 Aug 2024 11:02:21 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <811865535.1.1723806141382@builder.linuxtv.org>
In-Reply-To: <1192596175.1.1723368733699@builder.linuxtv.org>
References: <1192596175.1.1723368733699@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #328
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

See <https://builder.linuxtv.org/job/edid-decode/328/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode: add options to read EDID and HDCP data directly from DDC

[Hans Verkuil] edid-decode: fix emscripten build


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
Checking out Revision 590a1ae57a3be3d590b5ab401086e7ec9672e3f5 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 590a1ae57a3be3d590b5ab401086e7ec9672e3f5 # timeout=10
Commit message: "edid-decode: fix emscripten build"
 > git rev-list --no-walk c3708827ae080b3ae8118a1bd812c53c760accc5 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 590a1ae57a3be3d590b5ab401086e7ec9672e3f5^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #327' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'c370882'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '590a1ae' as starting point
[GitCheckoutListener] -> Recorded 2 new commits
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@4d53b44f'
[edid-decode] $ /bin/sh -xe /tmp/jenkins1197945266960351725.sh
+ make
make: *** No targets specified and no makefile found.  Stop.
Build step 'Execute shell' marked build as failure

