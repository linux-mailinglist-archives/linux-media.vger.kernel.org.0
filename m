Return-Path: <linux-media+bounces-52914-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOYMNjU5k2mV2gEAu9opvQ
	(envelope-from <linux-media+bounces-52914-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:35:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C20145A83
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C62D3066E4F
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE91330B34;
	Mon, 16 Feb 2026 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="ajPNtAFw"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FBA330B04;
	Mon, 16 Feb 2026 15:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255853; cv=pass; b=et6FP2ld/RaAwiG8JMjL3GO3qWTXalqjtNB8b6ol4ahywYojzV6nswwmljakkJdLMQ1TlrdEfo5pDfqKfftKtxPqK6g+0/APouDPEVaHi4Rx+tXOfhjyGibXQEAoix1kjZG7YP493MSZD1Tn0vzQDv7mX1Gq1GTrrjiFCEiYbpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255853; c=relaxed/simple;
	bh=xTKzSo0m4MUPpEAgib4DKtRAuR0nDfthFRJAVbg5eIQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=JPP2v+i5SVKweD6pEt994Q663uRVsL0LbuCpc/8cVyontLZz1jwmyQ/rM8RCC8woDTZg/baF6MjPXVztdA3tF8SDUYdjpXgNqAoiIgWVECGPVSPnxW5OI+Kn/l22qtioKUdKBYX17beUuzeXBqbGZVv5lVih6I8WJJ0YoLuKIoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=ajPNtAFw; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1771255838; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TvcWoI1Uy75QsBx2SWl+GJ7QfpFv3dQVyYATezKi9ECZSn1FJE8BRIbEjrm2sye70WTW3Cj08vlCoUgdiugN4I9V144gbgxWRkC1KGP9lX629DEkHxAn0//ryMSghYVshYKeiBedDzZxt3o+uCzJ9AEBb3EWfUJSFPgbyNuw1N8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771255838; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xTKzSo0m4MUPpEAgib4DKtRAuR0nDfthFRJAVbg5eIQ=; 
	b=g5+0CSpTrkqKwti0l+aGUjKhbJI44WlzDyAlYW4koe+v4TyIVlBoGGD8DjBQYzXAW/7Wyn86wiFxpNnvz6OFfgid6zaGrNqbxGO+UJHTO0qpMakyqLnkpmNJPYuDhUgnOZ5SvFvywcHeeNWnH/lslrl50k86J/hKRHkq8jycfJM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771255838;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xTKzSo0m4MUPpEAgib4DKtRAuR0nDfthFRJAVbg5eIQ=;
	b=ajPNtAFwzTNbO+oplWBn2oy1PNrd4ALkhk/OBecJl3vOoEQ8oCF604lbpUNrpoTB
	OkjCsG4jP4STtkPOYROnFWVvu4KKVV8wSOvzU0DHzKnLLnuPDxHgDKB2vUhj+LW2VTf
	DdQxj3Qu30YOV1l5grp3w7bkOsxymvq34uZBg3tk=
Received: by mx.zohomail.com with SMTPS id 1771255836497792.8581418577553;
	Mon, 16 Feb 2026 07:30:36 -0800 (PST)
Message-ID: <16e32780-07bb-42c9-a5c8-aa61f2366efa@collabora.com>
Date: Mon, 16 Feb 2026 16:30:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org
References: <20260216095144.107356-1-benjamin.gaignard@collabora.com>
 <20260216095144.107356-7-benjamin.gaignard@collabora.com>
 <07b62f39-d27b-4439-a60e-42fd47f49b13@kernel.org>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v13 6/6] arm64: defconfig: enable Verisilicon IOMMU for
 Rockchip RK3588
In-Reply-To: <07b62f39-d27b-4439-a60e-42fd47f49b13@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52914-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 62C20145A83
X-Rspamd-Action: no action


Le 16/02/2026 à 16:16, Krzysztof Kozlowski a écrit :
> On 16/02/2026 10:51, Benjamin Gaignard wrote:
>> Enable Verisilicon IOMMU used by Rockchip RK3588 AV1 hardware codec.
>> This hardware block could be found in Radxa Rock 5B board.
> I could not find such board. I even git grepped for some variants... It
> seems you are adding it earlier to a known DTSI, so it will reach some
> board, so the point is to use here REAL name of the board we do support.

Any rk3558 based board have this hardware block
and arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts describes Radxa Rock 5B board.

But maybe I miss understood your point ?

Regards,
Benjamin

>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
> Best regards,
> Krzysztof
>

