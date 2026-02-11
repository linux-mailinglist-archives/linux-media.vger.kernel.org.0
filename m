Return-Path: <linux-media+bounces-52616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAd9BYiyjGlLsQAAu9opvQ
	(envelope-from <linux-media+bounces-52616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 17:47:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C851264AB
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 17:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 231A43011C4D
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 16:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E04F3451BA;
	Wed, 11 Feb 2026 16:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="eTCQv+dy"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A72345CAF;
	Wed, 11 Feb 2026 16:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770828342; cv=pass; b=OeEgJ70fNhJUzYGjB5pUlqEqGlDY9fDkAnhY5n0FKcuAHlMsdrmzWJJnUTCjJQ6zR2bSvs4jcSNApx03ffvWiIfc/m+pB008XgIDzYR1IMS6CQat9McKTdRtAMX9e7Hfv2yGjiOW3P0pEqn9rFw+diLAgh35EkxcCBottYXQ4D0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770828342; c=relaxed/simple;
	bh=lNJzTV+GnKEeLloRv1cJFaqEWXBHBAMNQgJN9e3y9YQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9MhO9tV0Ad216E4/KQyGt4A0O5Wftuvctv4vuDJfXW1uG+YDo/vv83+l2/+qO7qwifVQIIwAH8Lc/0AZ9kjLDMH43VlYf9THMZYHNzCGVky+nlekwyyDUOZOS19j6Ur0eg22RJhGrWwAIhKZjzglITsz7aQqrN4dwlc6ZmN35U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=eTCQv+dy; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1770828314; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Rh6jbrGCN4i0yJiAtbkyjMCHos5PdRWhI6BXo2FIr5vBQJb1q59976pXAKDzwQ72ImUNZk8sNuTy8E6ptHgG3RRAHFLUHWQ5rQqvXxLA+0tr64ey5CI3qv+WgtAMnC6oNDt9YRNpN4ZXeyxUJxB5a3xmGX9d8DljuA3+Nr0eklM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770828314; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MOPvuc4/wYImhPjZkkCgLhAt4DRFj4u4a3d58oxFSZI=; 
	b=mGYGgcaqkxqtb68XRS5Uf1KaHGaBE7jm6YBokmdedIpHVQeFvC1RPfMyTSDa6heRdEc+1UotKEcY0nQZs7Yhcm0NQT3AVeCbteiuLSPvnOe511WZPgaE6lord0KPpX8JBUx9jTxqouRwZlnuuMbjdS4T7Jq6Uy1/suMHyLLEqf8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770828314;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MOPvuc4/wYImhPjZkkCgLhAt4DRFj4u4a3d58oxFSZI=;
	b=eTCQv+dyxTWyjLU6XzauQa9LiWwzpWvloo/dZYlKCnfgpKt3yxL223zLzxfbgUJq
	R05tMuJWX7zvOVtv/dwVqdb75q560IDSM7k/xcpF0V+bKZci9SXxWt3tOqVEtOnLsS/
	k9braiv8/simGb4sXggG1D0vm+ybJl5kC6XYJPqw=
Received: by mx.zohomail.com with SMTPS id 1770828311647312.6594488715315;
	Wed, 11 Feb 2026 08:45:11 -0800 (PST)
Message-ID: <bc8904f1-bc24-4558-861f-5230e0b73181@collabora.com>
Date: Wed, 11 Feb 2026 19:45:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: hdmirx: replace use of system_unbound_wq
 with system_dfl_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 kernel@collabora.com, Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251104102048.79374-1-marco.crivellari@suse.com>
 <CAAofZF42TocsYR7kBMoUWC4YQMnqv4j37kWsnY9r75V5PC7UjQ@mail.gmail.com>
 <f8522806-fc3a-403c-93ad-f37638870643@collabora.com>
 <2b5e55c8-6790-4de5-912b-9ca23f6bd7a5@collabora.com>
 <CAAofZF7uLAd-tDnQq9joZm5vZunVr64QfF+ZFH-OoYfqG2OrCg@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <CAAofZF7uLAd-tDnQq9joZm5vZunVr64QfF+ZFH-OoYfqG2OrCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52616-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,collabora.com,kernel.org,gmail.com,linutronix.de,suse.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64C851264AB
X-Rspamd-Action: no action

On 2/10/26 17:36, Marco Crivellari wrote:
> On Mon, Feb 9, 2026 at 10:18 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>> Alright, looking further at the code, apparently there is nothing
>> special RE the two unbound work queues. See some parts of kernel already
>> moved to system_dfl. Would be great is this all was clarified in the
>> commit message.
>>
>> Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Hi,
> 
> If you want I can send a new version with the improved commit log:
> 
> ---
> 
> This patch continues the effort to refactor workqueue APIs, which has begun
> with the changes introducing new workqueues and a new alloc_workqueue flag:
> 
>    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>    commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The point of the refactoring is to eventually alter the default behavior of
> workqueues to become unbound by default so that their workload placement is
> optimized by the scheduler.
> 
> Before that to happen, workqueue users must be converted to the better named
> new workqueues with no intended behaviour changes:
> 
>    system_wq -> system_percpu_wq
>    system_unbound_wq -> system_dfl_wq
> 
> This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
> removed in the future.
> 
> Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> 
> ---
> 
> Let me know what's best.

That's better, feel free to send the v2. Thanks!

-- 
Best regards,
Dmitry

