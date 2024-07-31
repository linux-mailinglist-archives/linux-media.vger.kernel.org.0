Return-Path: <linux-media+bounces-15648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F5F9432A1
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 17:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7581F26D40
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 15:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD7314AA9;
	Wed, 31 Jul 2024 15:03:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8181511CBD
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722438187; cv=none; b=tg1wSisip6n99rd6chL6w8cZWV3ucnDDF6uU6LJy5IHXM7GRaySXgSyVV4zgH62FhM4/+1ApZYx3ITUGb0mRCQLtdRYN7cslsdfrvtFL8p8S4j/r7zc8BwGLQevPslAL8Vz/yIm6xK2W9rljTBR8PstdeURKqIuKi8ZXyv4fwac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722438187; c=relaxed/simple;
	bh=oSfgWlm6T4YO7D4aCUkRv3zBZ7x6Kg/ovHlolyM1tyk=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Idxv3wQm++ZHP29IKBT0XbcV17+TYY2BaWU1Yb7rmF8HDWqtetdM/jcK+7jJ0BhTKogjPFQ3ykTYOarKNX4fpagQaaT/1VxcyrwvtfTefl0OVy+us+xZgze5Gmwi55qUQoTNas8fd+n+7CcLnI9y6zoeM1qHRu/xRWcKGg5q1HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sZAr4-0005R6-0J;
	Wed, 31 Jul 2024 15:03:06 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sZAr3-00EKmu-00;
	Wed, 31 Jul 2024 15:03:05 +0000
Date: Wed, 31 Jul 2024 15:03:04 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1041029412.4.1722438184995@builder.linuxtv.org>
In-Reply-To: <1868099762.3.1722432741368@builder.linuxtv.org>
References: <1868099762.3.1722432741368@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #324
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

See <https://builder.linuxtv.org/job/edid-decode/324/display/redirect?page=changes>

Changes:

[Hans Verkuil] edid-decode: add THX OUI

[Hans Verkuil] test/vesa-displayid-fixed-length.test: add test example

[Hans Verkuil] edid-decode: specify checksum position for do_checksum()

[Hans Verkuil] edid-decode: extend print_timings with ntsc argument

[Hans Verkuil] edid-decode: export speaker_map as cta_speaker_map

[Hans Verkuil] edid-decode: add 'silent' arg to data_block_oui()

[Hans Verkuil] edid-decode: move chrom2d() to edid-decode.h

[Hans Verkuil] edid-decode: add initial support for parsing InfoFrames

[Hans Verkuil] edid-decode.1: document the --infoframe option

[Hans Verkuil] test/if: add infoframe test data


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
Checking out Revision 303b033f92683fa3f2e73d642bf86ead8fec77b1 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 303b033f92683fa3f2e73d642bf86ead8fec77b1 # timeout=10
Commit message: "test/if: add infoframe test data"
 > git rev-list --no-walk 4353d8fb6b4e104420fc1d10915d3a1d0205a7b4 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 303b033f92683fa3f2e73d642bf86ead8fec77b1^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #323' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '4353d8f'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '303b033' as starting point
[GitCheckoutListener] -> Recorded 10 new commits
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@11547aa9'
[edid-decode] $ /bin/sh -xe /tmp/jenkins2994978876482768888.sh
+ make
make: *** No targets specified and no makefile found.  Stop.
Build step 'Execute shell' marked build as failure

