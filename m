Return-Path: <linux-media+bounces-57227-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGcML4R+xmlTLAUAu9opvQ
	(envelope-from <linux-media+bounces-57227-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 13:56:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2C73449D2
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 13:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB44F30F6950
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 12:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3273BB9F7;
	Fri, 27 Mar 2026 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GrVG6KQ3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF417A309;
	Fri, 27 Mar 2026 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615907; cv=none; b=ibIh2ww2v3jhH98+bD60JaEfPTY2qS5pKaZ5G4NXyY+3UunVvhX5Hy5VJXnfq3RIXT4XKXMzlQ1ZvCqzHFxV5LJKcN1yef8YxvxcfAUgQDm51on946zZhijMz2055SW4tDkXISjG15e19RlNIr2OniHlxn9wHKAztBimLY3Wz78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615907; c=relaxed/simple;
	bh=+CLD7N/xs5jrp+gBJvL7KeuM5R0Wm9A5tOiDhEWnQiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gSwW5krIO9EaZspxphSlws2NAZP15YBo530+6zEdoUKoFbDGaYjX7LS7fo6yqDkRHOngJmVTMn8px5QkBIGxnHsrOvNXYsgwkORcI1E7+Zc3me9nbe7t4/55g0C+W2/gfRYT1xErCXrhVEEzUxMH50IMO+AkH81Zn6yVWn4wT8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GrVG6KQ3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774615904;
	bh=+CLD7N/xs5jrp+gBJvL7KeuM5R0Wm9A5tOiDhEWnQiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GrVG6KQ3t5hCut9XXlE4yEKNlD9EE7f2zXD8SXKt5k1CyGL4BKYGEftfjbOXj2Pqf
	 etbaQ07g2cCAjT7HqbxY+GBTx+16RHZQwQWH99vA8e0TE9HgT7PGi1mYI/1HI1EeO8
	 9k6jfrkwEopTQMUa4rRszityVb+SpSXJfXDKyDLcYfThtc6D8kCC2rF9eOweFXKWj7
	 n7xJIUAowB1mVJ8Nz14xx0T2UPyyEMGv7rrjJ5+NktKraudt+ll0LX3yO5UDFsZyp3
	 9pE7Ija3/997BqehoBNexfTvyXyUZEEVBO9RX6ZHkm1EOPak/Ca6+34ohCx3syNiID
	 40u7HH5rG8lig==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9C4F17E5A72;
	Fri, 27 Mar 2026 13:51:43 +0100 (CET)
Message-ID: <87f08459-740e-4fbf-b933-110182bc8918@collabora.com>
Date: Fri, 27 Mar 2026 14:51:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576/RK3588
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
 <4358847.1IzOArtZ34@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <4358847.1IzOArtZ34@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57227-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,27b00000:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 2C2C73449D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/10/26 10:44 AM, Heiko Stuebner wrote:
> Am Mittwoch, 4. März 2026, 22:00:39 Mitteleuropäische Normalzeit schrieb Cristian Ciocaltea:
>> When building device trees for the RK3576 based boards, DTC shows the
>> following complaint:
>>
>>   rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
> 
> [...]
> 
>> Cristian Ciocaltea (4):
>>       media: dt-bindings: rockchip,vdec: Mark reg-names required for RK35{76,88}
>>       media: dt-bindings: rockchip,vdec: Add alternative reg-names order for RK35{76,88}
> 
> due to media "applied" messages most of the time not reaching all Cc'ed
> recipients, please tell me once the binding patches landed somewhere.

Yeah, sadly I also haven't received any notification so far, but just noticed
the binding patches are now in next-20260326, as a result of merging branch
'next' of https://git.linuxtv.org/media-ci/media-pending.git:

a11db8d8b403 ("media: dt-bindings: rockchip,vdec: Mark reg-names required for RK35{76,88}")
35c8178ed2bd ("media: dt-bindings: rockchip,vdec: Add alternative reg-names order for RK35{76,88}")

Thanks,
Cristian

