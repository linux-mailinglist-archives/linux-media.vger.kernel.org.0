Return-Path: <linux-media+bounces-63152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPIAID95G2rcDQkAu9opvQ
	(envelope-from <linux-media+bounces-63152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 01:56:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E87E3613ECC
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 01:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B0C5301EB66
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 23:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3730379C5E;
	Sat, 30 May 2026 23:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSL9nGPM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445C225A2C6;
	Sat, 30 May 2026 23:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780185392; cv=none; b=D1qUzKiXiY3HbwRcyvy3nE47sre8p5DINsHEoU2hfI40XJOsUbXlJYQ69YW0IMhDK7+xp1SMycPxoP0Gr4UkfwVpzU29GPCxrfptSWkSJNlkOwOHCKB7azJ2OrAFBn/t9X+NIOaF98CKsQldiwHJbus8KDArsexcTFA8xf7cHDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780185392; c=relaxed/simple;
	bh=CZ9MglIPeW7nm024CBs4F9t5WDn6VXekikQkFI8zPx8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=e1qWIt0NSCSwYIm7xn2soYnuTWgS5zWcica/CyRaZ3wNol3UAVDtcVw/fJhlFObHK5YJ6Ayo++fjlLD+ye8FawSu+49eShph5zqVwa3Ql38AI6QmR5rQPcO9/kxkxKFulcyGyLGozpd8HMtYrin5BtGPbHPuNfW7aoDLqDVn4Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSL9nGPM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9811F00893;
	Sat, 30 May 2026 23:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780185390;
	bh=BzdUu4KhWuuqrwepDB+Nqmxu7JUuV28N3I0QgiRYMbg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=eSL9nGPMZArI3kUZ9+24fElYHm0HZEI9NrzHMHHpkyJ/pDYKEPXwpg+cU+ry5cWDL
	 URlUMhKlc5TvZsqcOr0PHnUnYa7uaAJemjWhc/KZiyyTZ+Bo/Q7UmHG2vTYhtA+tVL
	 FV5NfWYkR+nHKZ2SnzNho9Ptd0n5npoLJQW4Zx0G/07HKEowZbpGm+z9xyhpLcQFe7
	 LZ5x54xwg+Jl0ZJYZ8ER+Hu2Bjc2BnYpoiRl8GmD9o3Nz9NzyOr9e1I7btx/V3x2QY
	 Rqspb6aZepAcE1Url8vTCatvuGDuI6iHJkboYZF/nfm2zWSGlYShAIF3M1WHh8HuwY
	 pX1X9ZOWGspuA==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/7] media: qcom: iris: Centralize internal buffer
 table selection
From: bod@kernel.org
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260423-iris-code-improvement-v2-1-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
 <20260423-iris-code-improvement-v2-1-9e9cbf00f9c9@oss.qualcomm.com>
Date: Sun, 31 May 2026 00:56:24 +0100
Message-Id: <178018538483.10222.11193748558944377408.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=536; i=bod@kernel.org;
 h=from:subject:message-id; bh=CZ9MglIPeW7nm024CBs4F9t5WDn6VXekikQkFI8zPx8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqG3kqrQgE7WzALICWj2VO0c60I8CvberBJcifi
 yShT0KEgcuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaht5KgAKCRAicTuzoY3I
 OhpaEADAGD6jNbFWwn5ZpsgJwwfRjPXKGn8quGrs+jtPCTM1N6YYKcWOdQNnqa+q7BOYhsX1bnq
 2xqDEQI/+iYU8Svph99GCvBp2MG8ifZrDr5qpUvotKrmJnyK77KEFSke2y5gHRUL7CYoAxmmKOO
 1w8d2fnr6wkJZ2JDXOkXb6DY7IMWZvKLTNBxF64CwzTHEnaqW2kzkSrA1BSjN/eO+iOJxuw8rXA
 k3tuRapPRJCDKjN3b8cef6HVHKacP735P2Kwbw/WkqJbP7oSEXxHXNuiMkIVwzioNa6RoTXGjJT
 dkbwHIZ/4svrh+eaAUyBVaNJ8btGjjKBTVNKLIpNSQk7cX+waqHJ8YZjvXcf1rkjg7P54XBEJCR
 4BwQTMOAS7QynUfXT8AnGNc8PojFnhnkz0yRNcbS7abZNDC5Nt4Qvw6c77XLpzf0HND9Q4Hh4vG
 J15KBqGL0QF3rI5n/bDHX0cpgkckkDvfBJhuh0yBgidQkI2G8q1wq2FAUHxNqcYimrJeioJrNm1
 lR30QPcY4PrmQi/K1Tikb0ycswrz1U8uyOyMJP1EQlUtK6Dbh8YKt3GxyO/tXagX6Dt1Qmo089i
 k9Q2pW5pKTjqUIPWIjEDDk52ci5/9vtykaMau0qkFfd9LHGUFEleEIEI+/41VM9t6ZXbr10EIdX
 72AykTQxgcEG5ag==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63152-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: E87E3613ECC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-23 17:30 +0530, Dikshita Agarwal wrote:
> Internal buffer table dispatch is duplicated across multiple Iris code
> paths, which is error‑prone and makes future changes harder to reason
> about.
> 
> Consolidate the buffer dispatch logic into a single helper so that table
> selection is defined in exactly one place and keep call sites minimal.
> No functional change intended.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod


