Return-Path: <linux-media+bounces-58204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFQ/EdkF1mnbAQgAu9opvQ
	(envelope-from <linux-media+bounces-58204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 09:38:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 410D33B8684
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 09:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07A393025F7E
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 07:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A053803D4;
	Wed,  8 Apr 2026 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="IVzaHNVa"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A415536F419
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633397; cv=none; b=pid22sWE8nKFOOsx+FTrFApB3phJRsPW2OIp/Kox7+k3BWnaTHfAfxX/1qlYEUf2whOUWHDoaDQB8YQHXMlTvPrDxsP/Reu7qcKsYM3RI3RnY4jxF06MF2tGB5RxMLcLEvAeYW2Go6fXlfKKKClDmW4RE5XrIubvciXtrj08474=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633397; c=relaxed/simple;
	bh=YGd5SOajoGO1Z8aDaYGzJSb4FK9V9WUeqkR8dBEyAj8=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=HtADLQcj37VEiohiQQlQaJo1ncaLL87jyuRwO6cDSfVMb9heIwUT7prWpUEXAd9SLdF5PbOlMTpFlZbIX94bJhllSU3H3JrG/o4Th5N0kEWvjwCeRWerLkbR2NPDEcIznLijvGn/Ga21+rbx+CIS0O62Ysk75IRQ6lqClBCU34Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=IVzaHNVa; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YGd5SOajoGO1Z8aDaYGzJSb4FK9V9WUeqkR8dBEyAj8=; b=IVzaHNVatChPKvvzjlX2W40799
	jtLY8g6MUxrhy9wFg4/si2zdSDIdBwtki4NufhcImElRbVYvC3eijzU5WHjM7mbH93aud2+Oj16cX
	gkisnQ2uBBAsIqd36HQ4Y81kB/CPk9jFL06KqJ7oop/m96cSEW1FViMb1aCZxrmgb2sFartukgCwk
	6lZUXq10h7jdANtLAYpR21QCv8P7uMOJ2Fllv2DLsZUJqvZ8H/PizC2uFqRzzMMMxa9NcNvQjHano
	G0oZHqz0A2PAJ1Ny1xtFmOBDjPjOq8jdYybojDylaIAkdP8qZyrb0l7jPA1LFs5QjHOxT7YOdd+Q+
	6xcXwlAw==;
Received: from [2605:bc80:3010:501:f816:3eff:fed7:54db] (helo=builder.linuxtv.org)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wANMK-00065y-16;
	Wed, 08 Apr 2026 07:29:56 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wANMK-000207-0n;
	Wed, 08 Apr 2026 07:29:56 +0000
Date: Wed, 8 Apr 2026 07:29:56 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1079283140.1.1775633396243@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #35
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxtv.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58204-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxtv.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jenkins@linuxtv.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[34fdf292:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxtv.org:url,builder.linuxtv.org:mid]
X-Rspamd-Queue-Id: 410D33B8684
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

See <https://builder.linuxtv.org/job/dtv-scan-tables/35/display/redirect>

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
[GitCheckoutListener] Found previous build 'dtv-scan-tables #34' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '7a595d0'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '7a595d0' as starting point
[GitCheckoutListener] -> No new commits found
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@34fdf292'
[dtv-scan-tables] $ /bin/sh -xe /tmp/jenkins12516069626841525672.sh
+ make
ERROR value 7/9 is invalid for INNER_FEC while parsing line 44 of dvb-s/Badr-4-26.0E
Error reading file dvb-s/Badr-4-26.0E
Reading file dvb-s/Badr-4-26.0E
ERROR value 1/4 is invalid for INNER_FEC while parsing line 63 of dvb-s/Eutelsat-10A-12.0W
Error reading file dvb-s/Eutelsat-10A-12.0W
Reading file dvb-s/Eutelsat-10A-12.0W
ERROR value 1/4 is invalid for INNER_FEC while parsing line 55 of dvb-s/Eutelsat-21B-21.6E
Error reading file dvb-s/Eutelsat-21B-21.6E
Reading file dvb-s/Eutelsat-21B-21.6E
ERROR value 1/4 is invalid for INNER_FEC while parsing line 72 of dvb-s/Eutelsat-36B-50.5E
Error reading file dvb-s/Eutelsat-36B-50.5E
Reading file dvb-s/Eutelsat-36B-50.5E
make: *** [Makefile:49: dvbv3/dvb-s/Badr-4-26.0E] Error 255
make: *** Waiting for unfinished jobs....
make: *** [Makefile:49: dvbv3/dvb-s/Eutelsat-10A-12.0W] Error 255
make: *** [Makefile:49: dvbv3/dvb-s/Eutelsat-21B-21.6E] Error 255
make: *** [Makefile:50: dvbv3/dvb-s/Eutelsat-36B-50.5E] Error 255
ERROR value 1/4 is invalid for INNER_FEC while parsing line 45 of dvb-s/Eutelsat-36D-36.0E
Error reading file dvb-s/Eutelsat-36D-36.0E
Reading file dvb-s/Eutelsat-36D-36.0E
ERROR value 1/4 is invalid for INNER_FEC while parsing line 242 of dvb-s/Eutelsat-3B-3.0E
make: *** [Makefile:50: dvbv3/dvb-s/Eutelsat-36D-36.0E] Error 255
Error reading file dvb-s/Eutelsat-3B-3.0E
Reading file dvb-s/Eutelsat-3B-3.0E
make: *** [Makefile:50: dvbv3/dvb-s/Eutelsat-3B-3.0E] Error 255
Build step 'Execute shell' marked build as failure

