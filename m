Return-Path: <linux-media+bounces-58237-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPHBNkpn1mnIEwgAu9opvQ
	(envelope-from <linux-media+bounces-58237-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:33:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 537E93BDB40
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F016C3022547
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 14:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98E63D3490;
	Wed,  8 Apr 2026 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="VSnlZ7R/"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6A03D34A8
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658821; cv=none; b=SenF2CQRshgm9SCK9IYZBKcbVPUSq5wBsdCFvldJE/NuXEEWEVgKdtQX0cnESGW1+oRWlo7X2fjq/D7OAsyQUsc0YaIIOD3vXRLMTiKc5kg8jAENIYFlKaUG4q2YdTOLhNwMjob+pqK9ug7lrQW6dPuxhswv+SGMEDcXpyaYZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658821; c=relaxed/simple;
	bh=D9RD4omsJl2frZ+r32czMalhfwS9hqXoeHtuFhHdMzg=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=jXxVti3wWMVLl21CO6uZNLbK4P00FgyQZcWCaD/tJbeh/wYLwuYJhWYYZ1045//x8s+SHR99hin5XjMXmDvvBcMj1HVu5kPVqDXFFc/vLriBKi5sauWIsWpSNRW1VWPQAjr5LALwaKG8xY8vI3VFCM80rd5S8SCJeXaVtyYA9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=VSnlZ7R/; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=D9RD4omsJl2frZ+r32czMalhfwS9hqXoeHtuFhHdMzg=; b=VSnlZ7R/vhRlR3tCtUf5YINo/L
	65W8j6HQ3WCtXmvK5UB9/AwJfMeWYH7QvyaLNhSVTx/0zFLkpzp8nhCH3j/NlBKopMeSyGB8fg74E
	6dWtpEfmfmLSVov8ewuyz3NjGhi0I+flUu5kDSo1yUa3Wwuav36lMV8eQmAuRHOzmMl7bwyycTstW
	UEyrr7XwY4Dd5k6m9I2IPigkUyHFGol8x43OazTnt8gmL06NFTmUItTdXHSboWwKKcx0ckffkDbCB
	zDFFoBErfZY8RVtoDQ1/66a1twLHp8fPG3BbrUyrXxmtrw22EaUHPjntczDq9nc/OkP7NgZ513Ikr
	eMLyRJ6g==;
Received: from [2605:bc80:3010:501:f816:3eff:fed7:54db] (helo=builder.linuxtv.org)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wATyO-0004XR-0F;
	Wed, 08 Apr 2026 14:33:40 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wATyO-000FpF-06;
	Wed, 08 Apr 2026 14:33:40 +0000
Date: Wed, 8 Apr 2026 14:33:40 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <185900707.6.1775658820029@builder.linuxtv.org>
In-Reply-To: <1173339489.5.1775658656613@builder.linuxtv.org>
References: <1173339489.5.1775658656613@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #38
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxtv.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58237-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxtv.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jenkins@linuxtv.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxtv.org:url,builder.linuxtv.org:mid]
X-Rspamd-Queue-Id: 537E93BDB40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

See <https://builder.linuxtv.org/job/dtv-scan-tables/38/display/redirect>

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
[GitCheckoutListener] Found previous build 'dtv-scan-tables #37' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '7a595d0'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '7a595d0' as starting point
[GitCheckoutListener] -> No new commits found
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@73be5663'
[dtv-scan-tables] $ /bin/sh -xe /tmp/jenkins17029581179690117310.sh
+ git clone git://linuxtv.org/v4l-utils.git v4l-utils
fatal: destination path 'v4l-utils' already exists and is not an empty directory.
Build step 'Execute shell' marked build as failure

