Return-Path: <linux-media+bounces-52468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id q2f7OkdPimmUJQAAu9opvQ
	(envelope-from <linux-media+bounces-52468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 22:19:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51710114B5C
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 22:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51E47300C008
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 21:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8A930BB82;
	Mon,  9 Feb 2026 21:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="LXXMH2Pc"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f119.zoho.com (sender4-pp-f119.zoho.com [136.143.188.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7108B2DCF4C;
	Mon,  9 Feb 2026 21:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770671936; cv=pass; b=XlzZ+L34Xoe+BvGrf5j7M4Z/qrrH5stAJ1F8L99NDaFOQj4MJvZSCyBpNqLoq6NPL2A8PvAyRKp1mYzVPdGiIZAPRKVHx1Mf+lBx2cVNgkKc0w+RuPcWurXBjlTh4m9fQC//93vrXze3OtUpOzJD6nLSTVpwi3npLZs1zsYL4/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770671936; c=relaxed/simple;
	bh=mq12hSuh+6+szevywMP2aHTXFxOksdgg1lsS6LuAVLA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZXmRC245cT7B4m/LzIdZD7QMc8qec0OVuVgeptLVdr9Sam6OUOw4MSZfABG/ml7EqsgReMDiWNEDsbNM7sUEC+v0c2+pYLhai6U2ZFhsA3fRTkgUR3rEtw9S6tSYom/arvBCKr0NmBN8jkFh/2T0904AiEptV9X2m/HPeBiQJrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=LXXMH2Pc; arc=pass smtp.client-ip=136.143.188.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1770671921; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cCTbZ5yqbt+K+thi8lcDf5gzHwquohfQtJAWMozlydpwQ8AQzVWJMA7G/f8903fctZDm5mWHrP+GnKv1NLIq5cw41jS3JqiV1ELbOkDuYA0yarX8ZdUUaYVSiZLdsl/q0htuNcz2sC3dDUxDXOC7SgUTChr+LrJdeNQJ8tz5/+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770671921; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ERXZ5hIvSu/hODlghE4TA8bwRra+9HDTO4t7wORrejo=; 
	b=FFtlkIuJ9XmffZky7uvXgqKwdC39O8cNv+ufSsE8L2shFxh1AbRrEFpiXTTT3Ykes5iBzx867cBkvsHMy7qcIquaAbTcvh8RBo9lO/MB7sIkxrd+nFrcxXy2d/PeNqgX85whbBv60PF8wH0UYZjjnU+z67D7udtw5dXWISAt/cQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770671921;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ERXZ5hIvSu/hODlghE4TA8bwRra+9HDTO4t7wORrejo=;
	b=LXXMH2PciszbzNiuLwU+PPOxm5eFPKLZKE+yy4Gf7PHNoGlhTO25lk5GDbaQzx+4
	cZMsQD/r6YUCdBxMr1nEULtN0oeuCIbrrhiGojCg0Hz60YHCc4sdHIzIwfGNW4ljgLw
	ARtfIqyMWe9ckw4KYh5vN5mMwvXBK0KzuoU7XHYc=
Received: by mx.zohomail.com with SMTPS id 1770671919744813.3929930767857;
	Mon, 9 Feb 2026 13:18:39 -0800 (PST)
Message-ID: <2b5e55c8-6790-4de5-912b-9ca23f6bd7a5@collabora.com>
Date: Tue, 10 Feb 2026 00:18:34 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: hdmirx: replace use of system_unbound_wq
 with system_dfl_wq
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
 <f8522806-fc3a-403c-93ad-f37638870643@collabora.com>
Content-Language: en-US
In-Reply-To: <f8522806-fc3a-403c-93ad-f37638870643@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52468-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51710114B5C
X-Rspamd-Action: no action

On 2/9/26 23:46, Dmitry Osipenko wrote:
> On 2/4/26 14:49, Marco Crivellari wrote:
>> On Tue, Nov 4, 2025 at 11:23 AM Marco Crivellari
>> <marco.crivellari@suse.com> wrote:
>>> [...]
>>>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> Gentle ping.
>>
>> Thanks!
>>
> 
> Would be good to have a reply from Tejun as I feel confused by the two
> "identical" unbound workqueues. What happens if one part of kernel
> queues work items to old unbound wq and other queues to new system_dfl
> at the same time such that all workers are busy?

Alright, looking further at the code, apparently there is nothing
special RE the two unbound work queues. See some parts of kernel already
moved to system_dfl. Would be great is this all was clarified in the
commit message.

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

