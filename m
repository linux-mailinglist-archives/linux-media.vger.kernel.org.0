Return-Path: <linux-media+bounces-34340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22311AD1B92
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 12:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 155821888E43
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 10:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD23E253920;
	Mon,  9 Jun 2025 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="C7BXdaBL"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3AB2F37
	for <linux-media@vger.kernel.org>; Mon,  9 Jun 2025 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464957; cv=none; b=A3Q798svvwsKZoWm+2Nx3E6KqX5KYwc0BL66z/hxgBC5f+PJMLpFrLgesEn+qZh2aGKCDiuGgMm7VX52WfG9Rxm5PrfPWgZIlFU59RyUorJheAtrOyV7Bxz7SRWbkiw7IBJLTd/MB8VlFYu0AZDdWpn4BfgO+g2BpkdQLmyfsuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464957; c=relaxed/simple;
	bh=U6O+2LDRSNivx4tr/BLyasa0dRd6LUmFroVSo0UyyQo=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=LtE4XmksmHDwgxcoP01T4LBv1LfmzVnmWhLyzDxZBm2g+oNszU4NNpvrcw8bSnt/B/3Txp9d1zDnJtzVgyfvfrXWj7ox421Pj429y4qP4CvxTH5fSU7RjtT3pB69z/5lxz+riALQCPvPaIvH1zWO4vgvEDFj/MJXaIv4/rM7dNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=C7BXdaBL; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=U6O+2LDRSNivx4tr/BLyasa0dRd6LUmFroVSo0UyyQo=; b=C7BXdaBLwTmFMGhLsV2RfMA9qj
	UjztVJ41GZwthZVeVAiWd+IM5lKD+C7xpFXYq9K8v0ZyhWxHXaCJ7jH1tp63QAclnRWMJ1ggtUguk
	hl3jx0Q1u2aSKTQznH5UEnzhq0vwV65R1qelAawZKS1aQJDp+50iWYP8mgGIGm7GRmEhDi/rY1SJo
	7zpImw2xnu65RqyebeBs/xqJdC4yiY3BIzx3aUHVEw2TILqH40vcWOQUYVW2FdVyELnVUHo5lBgUh
	Ag70XjzpDDZjHhJQiHFrmWNWxsi5L2HFJLyVBs6L048DcN4STNNylGuDdqqTzA2KwHi8n3K2GdWXL
	6vVMtECA==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1uOZkh-0006GG-0N;
	Mon, 09 Jun 2025 10:29:15 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1uOZkh-00Ertb-0T;
	Mon, 09 Jun 2025 10:29:15 +0000
Date: Mon, 9 Jun 2025 10:29:15 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1655081924.1.1749464955045@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #33
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: dtv-scan-tables
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/dtv-scan-tables/33/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] dvb-s: add frequencies from https://en.kingofsat.net/


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave1 in workspace <https://builder.linuxtv.org/job/dtv-scan-tables/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/dtv-scan-tables/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/dtv-scan-tables.git # timeout=10
Fetching upstream changes from git://linuxtv.org/dtv-scan-tables.git
 > git --version # timeout=10
 > git --version # 'git version 2.39.5'
 > git fetch --tags --force --progress -- git://linuxtv.org/dtv-scan-tables.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 15661aabc342b72f539d4600ad87df6663e23aa4 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 15661aabc342b72f539d4600ad87df6663e23aa4 # timeout=10
Commit message: "dvb-s: add frequencies from https://en.kingofsat.net/"
 > git rev-list --no-walk caca23fb546620433763a3ec04f65e62855b1dbc # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 15661aabc342b72f539d4600ad87df6663e23aa4^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/dtv-scan-tables.git'
[GitCheckoutListener] Found previous build 'dtv-scan-tables #32' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'caca23f'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '15661aa' as starting point
[GitCheckoutListener] -> Recorded one new commit
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@4c0b236d'
[dtv-scan-tables] $ /bin/sh -xe /tmp/jenkins933854567487690005.sh
+ make
Reading file dvb-s/AlComSat-1-24.5W
Writing file dvbv3/dvb-s/AlComSat-1-24.5W
Reading file dvb-s/Amos-7-10.6E
Writing file dvbv3/dvb-s/Amos-7-10.6E
Reading file dvb-s/Amazonas-36.2W
Writing file dvbv3/dvb-s/Amazonas-36.2W
Reading file dvb-s/Astra-1G-31.5E
Writing file dvbv3/dvb-s/Astra-1G-31.5E
Reading file dvb-s/Astra-2E-28.2E
Writing file dvbv3/dvb-s/Astra-2E-28.2E
ERROR value 7/9 is invalid for INNER_FEC while parsing line 44 of dvb-s/Badr-4-26.0E
Error reading file dvb-s/Badr-4-26.0E
Reading file dvb-s/Badr-4-26.0E
Reading file dvb-s/Badr-6-20.4E
Writing file dvbv3/dvb-s/Badr-6-20.4E
make: *** [Makefile:49: dvbv3/dvb-s/Badr-4-26.0E] Error 255
make: *** Waiting for unfinished jobs....
Reading file dvb-s/BulgariaSat-1.9E
Writing file dvbv3/dvb-s/BulgariaSat-1.9E
Build step 'Execute shell' marked build as failure

