Return-Path: <linux-media+bounces-58207-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFv9AA4F1mkbAwgAu9opvQ
	(envelope-from <linux-media+bounces-58207-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 09:34:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAED3B859A
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 09:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 301D5300F106
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 07:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADD817A300;
	Wed,  8 Apr 2026 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="g2C20WlO"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066C29992A
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633447; cv=none; b=is9EPhoS2soflzddkxqz29JZ8Zdmbdxh/hYGM7BobF5rK32Yn5StxBKxf2ZD3pGJlWJVl1PZN8VpAxKX5oDoC1RyPz1bN/AMP4Hf/IR3nhScXG7rQzCSFFReCmxuEe/nQJfA196R5MR3dnb37VFo8A/pC+9NCw09yH4497R2XOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633447; c=relaxed/simple;
	bh=KjpvXrPlE3vKMpCu3FcqHtnnqCHQLDPyg5BihZFc+7Y=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=a2NUP5KTbTBCIPfcXNsQXTwxTSLn723p5rSWW+pqlP7uE08jFErU0qqQYnCMmbkdOwSts1sNyNha2pgWjJ8HO/jgjq1qaHpZ4b6DlUQKYLgE6528HoXYyHKPNGJKExMWmOEEB9imW9WvZkgXCERAd0C5TkiLfdbgfwbhuSQhJac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=g2C20WlO; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KjpvXrPlE3vKMpCu3FcqHtnnqCHQLDPyg5BihZFc+7Y=; b=g2C20WlOqXnXaN7Swwpwxix7V9
	yaE2TqWwYiWjMyDWAeOXY/ujJgwShzMUFo65VGXin5zljTXuGNgQ97/qV4UhgQUmsrTOfnXGCOUBS
	CKL8qLGvEUhEn8Bu+ld/5bIHnL7f+pqmIlEiKEn6vvTvBMZQczxqevN21TFjNdrzIP2GxomRKiYBH
	BWD/d6Gw23W4CGhG0N7aM3AORTvb1dyzMRzn+qoQ8exfgV0fnLJRWKF+FNJn5lEE3SSgGyiFfFd9q
	RfPADfj4KN/DeCR2Puo9I08n9/V+0aDLrP2a3rDqAEYkHv2Riw1yhIJEIDUudulbblPo24WaqUMwk
	QvZjXvuw==;
Received: from [2605:bc80:3010:501:f816:3eff:fed7:54db] (helo=builder.linuxtv.org)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wANN8-00067L-1l;
	Wed, 08 Apr 2026 07:30:46 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wANN8-0002Wa-1W;
	Wed, 08 Apr 2026 07:30:46 +0000
Date: Wed, 8 Apr 2026 07:30:46 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <831108703.4.1775633446455@builder.linuxtv.org>
In-Reply-To: <1079283140.1.1775633396243@builder.linuxtv.org>
References: <1079283140.1.1775633396243@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #36
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
X-Spamd-Result: default: False [0.64 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://builder.linuxtv.org/job/dtv-scan-tables/ws/.git];
	R_DKIM_REJECT(1.00)[linuxtv.org:s=s1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxtv.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58207-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxtv.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jenkins@linuxtv.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,builder.linuxtv.org:mid,34fdf292:email]
X-Rspamd-Queue-Id: AFAED3B859A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

See <https://builder.linuxtv.org/job/dtv-scan-tables/36/display/redirect>

Changes:


------------------------------------------
Started by user Mauro Carvalho Chehab
Running as Mauro Carvalho Chehab
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
Checking out Revision 7a595d06a6b034e28e6ba01b84f51145f9de3cdd (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 7a595d06a6b034e28e6ba01b84f51145f9de3cdd # timeout=10
Commit message: "README: add a note about its intended audience"
 > git rev-list --no-walk 7a595d06a6b034e28e6ba01b84f51145f9de3cdd # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 7a595d06a6b034e28e6ba01b84f51145f9de3cdd^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/dtv-scan-tables.git'
[GitCheckoutListener] Found previous build 'dtv-scan-tables #35' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '7a595d0'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '7a595d0' as starting point
[GitCheckoutListener] -> No new commits found
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@34fdf292'
[dtv-scan-tables] $ /bin/sh -xe /tmp/jenkins5977698962741686178.sh
+ make
ERROR value 7/9 is invalid for INNER_FEC while parsing line 44 of dvb-s/Badr-4-26.0E
Error reading file dvb-s/Badr-4-26.0E
Reading file dvb-s/Badr-4-26.0E
make: *** [Makefile:49: dvbv3/dvb-s/Badr-4-26.0E] Error 255
make: *** Waiting for unfinished jobs....
ERROR value 1/4 is invalid for INNER_FEC while parsing line 63 of dvb-s/Eutelsat-10A-12.0W
Error reading file dvb-s/Eutelsat-10A-12.0W
Reading file dvb-s/Eutelsat-10A-12.0W
make: *** [Makefile:50: dvbv3/dvb-s/Eutelsat-10A-12.0W] Error 255
Build step 'Execute shell' marked build as failure

