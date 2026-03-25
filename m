Return-Path: <linux-media+bounces-56955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EBFGUKbw2myrwQAu9opvQ
	(envelope-from <linux-media+bounces-56955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:22:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD53215A1
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC12C3078C2A
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 08:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1B131A7EA;
	Wed, 25 Mar 2026 08:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZIXwU/X"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2F81DF75A;
	Wed, 25 Mar 2026 08:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774426790; cv=none; b=pQQKIxK73SghZTkVe12OJFKvuKHIDVBv1uFas/Yc3lzPnHNMFcsPW6YxtiyV1PEnCVNy013bSAr05AcpoOoIh1TcAMB+9WEpLfZ4cYcKKbaxdkH4KqT8aDs58g+zzX2Sr2qLuUoHMIgtvon0xaPTeUfEMChG7kGiUU3bqGABEAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774426790; c=relaxed/simple;
	bh=wZTuF9Kxnl0hTiLVEOSjyb+uOH+U7l9pjwriuson7q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9UF40dDiXQps/imfuPFmnmCQf95zi2038Uu2MQuP6sez4s/aMpU652IEIwBCLJ8jYgx8vpFsGhrEHFxarQcwR4hoOAcAoRtXhwjcO2QohqMnJocd0c+QXSj+46u55DHp48PaW2dn/sY8eKlWzLLp5yUWYIXG87vXuHQLOjYlYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZIXwU/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E7AC4CEF7;
	Wed, 25 Mar 2026 08:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774426789;
	bh=wZTuF9Kxnl0hTiLVEOSjyb+uOH+U7l9pjwriuson7q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZIXwU/XHoV2PEbjHbfnNvaaQr+6bLyRkWWuSQqZBZoZ3CaMGucQA8IBKAL4wtJ8N
	 OrV/BIv0loGirBWA9UD2J+fjRiNyspvL7/SJs0bVhnHG2owek+/v7kfL+Zz9ZS06Pq
	 4bYRks0w8nS1mF62eCsgaW34014rbE4sO8JnFl9MFyy/Q1CImEfIk/u9CSckIK7cQb
	 CqOL6zK8hcy4YEBl9WelNrtij9PFiUFOCGRWcWcMBMtkpQQsH767FtE8kNAmTrmMxh
	 2WFUS5d+k6nWZxBjsh0K88l6j90w6HpUq0G+7Tl604BkN9ZogOUbFGVRlB2JWu+ta7
	 2V6/sCkMZbHqA==
Date: Wed, 25 Mar 2026 09:19:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vasiliy Doylov <nekocwd@mainlining.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, david@ixit.cz, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Vitalii Skorkin <nikroks@mainlining.org>, Antonio Rische <nt8r@protonmail.com>
Subject: Re: [PATCH v4 1/3] media: dt-bindings: Add LC898217XC documentation
Message-ID: <20260325-slick-magenta-gaur-cc41ba@quoll>
References: <20260325-media-i2c-lc898217xc-initial-driver-v4-0-6ad6fd74915e@mainlining.org>
 <20260325-media-i2c-lc898217xc-initial-driver-v4-1-6ad6fd74915e@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325-media-i2c-lc898217xc-initial-driver-v4-1-6ad6fd74915e@mainlining.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56955-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,mainlining.org,protonmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mainlining.org:email,bootlin.com:url]
X-Rspamd-Queue-Id: B7CD53215A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 01:14:59AM +0300, Vasiliy Doylov wrote:
> Add device tree bindings documentation for ON Semiconductor
> LC898217XC voice coil motor.
> 
> Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


