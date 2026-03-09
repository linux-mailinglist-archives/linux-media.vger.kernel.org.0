Return-Path: <linux-media+bounces-54926-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FdFFQGNrmnlFwIAu9opvQ
	(envelope-from <linux-media+bounces-54926-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 10:04:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F06235D6D
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 10:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26EBE300B8F9
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 09:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E4F3750D7;
	Mon,  9 Mar 2026 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kGAJK6pZ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A927D1E505;
	Mon,  9 Mar 2026 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046959; cv=none; b=jfGHGP8Z9qkjvrEbrnzrBI16FQp/i4EtC2Z4lM/AVXgwA+8QVuHflsv1Ph4VMHLnO6CZyoIBBigvb6DTEfsVc4Yk8rR6nby5qgWjxso/VgUHu4TcqcCZ6PajISWd5lqaWNrYfIw+oLVyypvFCNKTmmgIKijttEhUoo9SL6LRDkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046959; c=relaxed/simple;
	bh=pMsimM0jrkN9TClCZtebv47wyhydHL/nRiqxAuKIOX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcEYIazZJ1lKsThFRbgqnHi5jWNeNuyaK8PrpgCJ1erIu3KX5os2/jXYZq0Co/ERQbBoh+FTjDHKsh40nDzhfWZRr7ZyXY1gQglAjxHSyVsf+TxwjRDLI6d1z5DNwumDSsBcxqgLTyyaxNufao8GLjCXUfbIJRpK1RUCXYeNg58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kGAJK6pZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773046956;
	bh=pMsimM0jrkN9TClCZtebv47wyhydHL/nRiqxAuKIOX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kGAJK6pZNHnQh5u7UzYcZET/DCDJE/EIbrUvrqe2ovExMpFvnCGAYGpBYR5QzZ9FM
	 FlqoKEyBFyYNeHgSKX8IUaZgMpU2xuZW4b1/RzRSS1mSrxlHjz30bch7QHvDnHODc0
	 z0heRGeyJ1UqNnFZci0T4W9QR7tajqWb/uWEKU3IY1zKDqSUZfVJLwEukfAOVBTB5u
	 whNBUy9UwE8BbmCp90sQFzvQUty3jwkC3hMa3ANaXNDGU1+6vJTTXFfKiPOEPyzLje
	 xNwzRS7TeaNQFj8NOunvoF3NYZnpBIeh+7A8nNFfgISwHYKqjALFYTEH9ApC6qiC1u
	 F0Pqd1WmJX4XQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 33C2717E0EFE;
	Mon,  9 Mar 2026 10:02:36 +0100 (CET)
Message-ID: <d670a203-6fc1-4fbc-a7b2-c2366745d794@collabora.com>
Date: Mon, 9 Mar 2026 10:02:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: defconfig: enable designware mipi csi-2
 receiver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
 <20260305-rk3588-csi2rx-v1-4-0cd8d2bf28c0@collabora.com>
 <20260307-majestic-otter-of-contentment-eeba71@quoll>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260307-majestic-otter-of-contentment-eeba71@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 57F06235D6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54926-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Action: no action

Hi Krzysztof,

On 3/7/26 16:34, Krzysztof Kozlowski wrote:
> On Fri, Mar 06, 2026 at 03:09:51PM +0100, Michael Riesch wrote:
>> The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into
>> recent Rockchip SoCs, such as the RK3568 and the RK3588.
> 
> ... and used on boards foo bar.

foo bar = pretty much any recent board with a Rockchip SoC on it...
(plus NXP users, as there is a series by Frank in the works)

> 
> (becuse we take defconfig for boards, not for SoCs - if there is no
> single board using it, then it should not be enabled because it means
> you do it for downstream which simply does not exist for us).

... but there is not yet a mainline example. Next item on my TODO list
is to send out basic RK3588 VICAP support including the device tree bits
for the Radxa ROCK 5B+ plus camera modules. Should I include the patch
in that series? Or wait until that series has been accepted? Or will you
just take my word for it that there will be plenty of boards using that
receiver in near future?

Best regards,
Michael


