Return-Path: <linux-media+bounces-58598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLyxJc7D2mmI6AgAu9opvQ
	(envelope-from <linux-media+bounces-58598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 23:57:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E15183E1CA3
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 23:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5A683020A7E
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 21:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8C73358CA;
	Sat, 11 Apr 2026 21:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="aTzcrQRu"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998081F936
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 21:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775944648; cv=none; b=NeYHX6www2wWi6o+41izkV6hvVsdvLjjx80sc05sirJ9cxRsgYk4TcDqCtTTSDFeTpl3a9svnHusG3xFaiHUJ83athStWJFYH7LRFBnePgOE4C4q6m3cCIdsYBjhzkxW/M1+zyStWSJP0uVA1pjswN96y+hSMl36g7/KCxloM44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775944648; c=relaxed/simple;
	bh=hVtVPGYP78ujW3e/hri1hemtP0K5qtZoqE0uMN26V6s=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=UOnYTD4DjHy0K3bB5/Ep7jU0RbveghAvRhSmGd5rbvKdc0CNKPRJzzgbdrVbNNkapPRr1OxRwoPJjshk98wMWPrD2t8hQHBP+0CPhfFHFTB3hgG0bZCMnB3DjH4YrA7r0wI6h3nftfxhDaB1qeGApexsydSzgvmxthJXip0I4ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=aTzcrQRu; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hVtVPGYP78ujW3e/hri1hemtP0K5qtZoqE0uMN26V6s=; b=aTzcrQRuwHZtSZT8cuooeJgi35
	WzLIkIED3Dkx11A36LeB0ANPUaZGDOu6pA7wlxFewAcIBdoIohbkiMKh5ejAhy87ucS78KQnwggsd
	rpvgr8f+p7Wp/XckVu9EeI4rFC1OTI08VM0yTZUSokXX502cyXYu+NzCjmiMWlnZ+8GBG1mVG/qJ4
	Ff9xYA72f4jVTE13IBXTeV+Fbu7EfQpY4bCaxwtm5ptoE90M1pUI1z3vky7QLBJgYavEg87hPgQsF
	cwGXYGVOKWfdH0EMyALnqArGrTV5bLAN1s2gIZdjBhsxEDOAEXR8oc3OKcCstLNIjWliJjUFsZbyI
	sUlw1X+Q==;
Received: from [2605:bc80:3010:501:f816:3eff:fed7:54db] (helo=builder.linuxtv.org)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wBgKV-0002FL-10;
	Sat, 11 Apr 2026 21:57:27 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wBgKV-000hAp-0r;
	Sat, 11 Apr 2026 21:57:27 +0000
Date: Sat, 11 Apr 2026 21:57:27 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1605095208.3.1775944647262@builder.linuxtv.org>
In-Reply-To: <1201123717.2.1775944600638@builder.linuxtv.org>
References: <1201123717.2.1775944600638@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #43
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxtv.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58598-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxtv.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jenkins@linuxtv.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,builder.linuxtv.org:mid]
X-Rspamd-Queue-Id: E15183E1CA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

See <https://builder.linuxtv.org/job/dtv-scan-tables/43/display/redirect>

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
Checking out Revision be35975ac877ba020aaf1df4e0e352c9d11ffcf1 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f be35975ac877ba020aaf1df4e0e352c9d11ffcf1 # timeout=10
Commit message: "Update satellite lists from Lyngsat and KingOfSat"
 > git rev-list --no-walk be35975ac877ba020aaf1df4e0e352c9d11ffcf1 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse be35975ac877ba020aaf1df4e0e352c9d11ffcf1^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/dtv-scan-tables.git'
[GitCheckoutListener] Found previous build 'dtv-scan-tables #42' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'be35975'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit 'be35975' as starting point
[GitCheckoutListener] -> No new commits found
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@110595a5'
[dtv-scan-tables] $ /bin/sh -xe /tmp/jenkins18013392290482933138.sh
+ rm -rf v4l-utils
+ git clone git://linuxtv.org/v4l-utils.git v4l-utils
Cloning into 'v4l-utils'...
+ cd v4l-utils
+ meson setup build --reconfigure -D bpf=disabled -D gconv=disabled -D jpeg=disabled -D qv4l2=disabled -D qvidcap=disabled -D v4l2-tracer=disabled -D doxygen-doc=disabled -D default_library=static
Directory does not contain a valid build tree:
<https://builder.linuxtv.org/job/dtv-scan-tables/ws/v4l-utils/build>
Build step 'Execute shell' marked build as failure

