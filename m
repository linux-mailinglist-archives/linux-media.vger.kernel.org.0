Return-Path: <linux-media+bounces-52466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH43AdpHimmXJAAAu9opvQ
	(envelope-from <linux-media+bounces-52466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 21:47:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74054114848
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 21:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C6CB30185B5
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 20:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D3A335093;
	Mon,  9 Feb 2026 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="LTXvO5eA"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBD232FA29;
	Mon,  9 Feb 2026 20:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770670033; cv=pass; b=a1o4RiZSO3/Q5W8ietNGf3V7kXELd68CfE6FlnLfMba1ce2PVfIpINoLh6PMfMkUg80TsAT4ljKLnvTpjSfNx3PWnYFGpAA0q6zDFTUP4oWePjTC1gQuqcpDK2XW5dbxHClAT5kCkHlykUAR2gWcOGvF2T1f5eR2FWIhsv3xcy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770670033; c=relaxed/simple;
	bh=/LjCxDxrBk163eREfmnGlUIRiiC7fbPd5kCOknbe7N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrGN51z6VJqkyIb2VGlq3GW7TQ6MAFu9Get7IfT/1j5zpC+njsiXKU9kqKCBSrS0UXn+CTmP5kFxUHpXBpK8Bmaim7huLRt3JlDuoxQ0pbXD5YjZkaC8EuSh57IMQlKh9kWmGORp+XpTG61wLrbumwDebXhf8O+fFsp+n3g1LJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=LTXvO5eA; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1770670003; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l2+IYXgdXR2q3tZyRK5xznp/iUZQEDiQetLqYT4Nb0WsJUL1K1lhhA+CCmxI9Uh9WTCJK0f5/HG+slYCm057lcso/+barSVf4+F4ksQD9yKN9J4dNm//2t6g/kyhUYkJHVL0BGD6ZFW97ZXOw750DezMhkoNUeI/hTVFpMFTqVE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770670003; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Eq3/ryZgs0yhOJ76O1635Pkry96463+IBd0Xvg0t6lU=; 
	b=lrPCyqIY6FML6sjJd1gI8758C0+mwH72dH1xbjMLnc924T1gpmLrTh6Rf/5oNUNWs0HY5VpgAjTm8dNSBRELJHK1MpRBvwgIE+9Ulc8gSSarJw5ho9+SgNGiNXV4TvC9sWsFUKGP1xmD4KApyWM7JiUTi4yAe6veDwvts8g2dkU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770670003;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Eq3/ryZgs0yhOJ76O1635Pkry96463+IBd0Xvg0t6lU=;
	b=LTXvO5eAToJMFQYtIcBvDBxJ7RzILoU6byLbjNDu4LZ8r8VF1K8iDa3iw255MyAM
	QVOHwcgYr2baGTGNBFUsZk40LvY43GJkppYmgQXmhJ15XZoAoN1uAW/pjhZ7gawgTwn
	tAVGen0EQwaBqtoJCe1kzZr6xb2jXJ4bwmJAeJF4=
Received: by mx.zohomail.com with SMTPS id 1770670000861821.4410261295726;
	Mon, 9 Feb 2026 12:46:40 -0800 (PST)
Message-ID: <f8522806-fc3a-403c-93ad-f37638870643@collabora.com>
Date: Mon, 9 Feb 2026 23:46:35 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: hdmirx: replace use of system_unbound_wq
 with system_dfl_wq
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 kernel@collabora.com
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251104102048.79374-1-marco.crivellari@suse.com>
 <CAAofZF42TocsYR7kBMoUWC4YQMnqv4j37kWsnY9r75V5PC7UjQ@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAAofZF42TocsYR7kBMoUWC4YQMnqv4j37kWsnY9r75V5PC7UjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52466-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: 74054114848
X-Rspamd-Action: no action

On 2/4/26 14:49, Marco Crivellari wrote:
> On Tue, Nov 4, 2025 at 11:23 AM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
>> [...]
>>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Gentle ping.
> 
> Thanks!
> 

Would be good to have a reply from Tejun as I feel confused by the two
"identical" unbound workqueues. What happens if one part of kernel
queues work items to old unbound wq and other queues to new system_dfl
at the same time such that all workers are busy?

-- 
Best regards,
Dmitry

