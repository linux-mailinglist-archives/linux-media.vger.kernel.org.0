Return-Path: <linux-media+bounces-58164-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHZJKDDQ1GksxwcAu9opvQ
	(envelope-from <linux-media+bounces-58164-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 11:36:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E53AC21A
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 11:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5016A30338B9
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 09:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90633A641E;
	Tue,  7 Apr 2026 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBpd7zWE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491C2D7BF;
	Tue,  7 Apr 2026 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554464; cv=none; b=MHr6H2oPzVmIRHysMqP061PUjJRoUel5lXqqrYoRwwfkJEYBEXKaBqtLZusJnAgsao0Q8Bl0+iBiLljQ5QgjWgL5O7qdbr1LG8i/AgL1dh31oNuWM7DDLGQSkwp0QONHHIh8ZzpHrmWz7p0AybltKMtJLZ2sDR3eK6Ja+RaYWU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554464; c=relaxed/simple;
	bh=DOJqK1vcnzd2aYpCEVGT7CW4DJ9dz564DOCE0PC7N+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVZtLqF0uq/yRZWJbhxkVxc31UEUfkVVSQgvfGzFcsm/cvn9wAC6+yoobdcsHFwNu0bQX4jRkMG+5XuvDRyDXHR6U/PMsBzZL03lijx2vC10d8wPlUOEG3LDUd/RnEwpp4YPbVUNa1zLpj1azeia8A1z/rDeBMLAAhGxNgQkoiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBpd7zWE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7335C19421;
	Tue,  7 Apr 2026 09:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775554463;
	bh=DOJqK1vcnzd2aYpCEVGT7CW4DJ9dz564DOCE0PC7N+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RBpd7zWErz8kmfapDEjomtgKdJmlAtotjpA1DiTmtGklrmYo4YeRwd36fjKYl+F+g
	 pUhwEkPF+SQYVPjujGs1tYNqozAZdQflEErIkaDFkftkI4VEiaeDVDFZWA2aAq5foo
	 mktRJ7Q9XMfy048b/ItWRMFGwIUGdP61VWALkA70uf0cuaQ0ig7f3RKl8Nwyr69nVW
	 K4a11UjfKtW259B8jUPFS4olvzcfWMazbVjSpFlCfCkNsxQMuwKyS/zc9hHKKKsNoN
	 8JaXMqhmhtALGBmk7owI1jO1QaGjGMflKReZrhhVw3I3lBhA6LGilrX47sVpWSlNel
	 iCwwZEZg1TJ8w==
Message-ID: <1f839244-ff46-4b9e-bb93-65785ee8bb2c@kernel.org>
Date: Tue, 7 Apr 2026 10:34:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: qcom: camss: Fix RDI streaming for various
 CSIDs
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Gjorgji Rosikopulos
 <quic_grosikop@quicinc.com>, Milen Mitkov <quic_mmitkov@quicinc.com>,
 Depeng Shao <quic_depengs@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
 <CAFEp6-2BMaT+u0cAJnZNCaxbiNGCayYs5uMr13AEe2iWWZZxzQ@mail.gmail.com>
 <5812c794-fd2c-4b49-8146-db6a1c783706@linaro.org>
 <gBeTbEFB4K-w71pUFUFbCcART84qW03vNzEwOBCSXz3pUUCM3nk5sYR2W_k2gbg8fEdqIE8XokiODLotFVHPiQ==@protonmail.internalid>
 <CAFEp6-1HVph_+278jXCb-G-XDc=Bg1X0y9hSq79qr6WG+nJ3bQ@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <CAFEp6-1HVph_+278jXCb-G-XDc=Bg1X0y9hSq79qr6WG+nJ3bQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58164-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B45E53AC21A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07/04/2026 09:49, Loic Poulain wrote:
> Okay, then that does reduce the usefulness somewhat... Another point I
> hadn’t initially considered is that we may also want to support
> different data types on the same VC. For example, metadata, stats, and
> image data could be transmitted over the same VC/stream? That seems
> like a valid use case enabled by your fix, and it might be worth
> explicitly mentioning it.

Yes true you can also separate out based on DT.

We could have different data-types on the same VC but of course you'd 
see the DT field in data-stream change and then we'd route that to a 
different rdi on the VFE.

Should be possible to interpret that data from the streams API and route 
but it is indeed VC+DT to vfe_rdiX where both determine X not just the VC.

---
bod

