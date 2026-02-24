Return-Path: <linux-media+bounces-53305-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC0FCMvfnWnaSQQAu9opvQ
	(envelope-from <linux-media+bounces-53305-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 18:28:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FC218A86B
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 18:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AF8A3076495
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 17:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941213A9610;
	Tue, 24 Feb 2026 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="j9Up2n8Y"
X-Original-To: linux-media@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0215C3A6407
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 17:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771954113; cv=none; b=UtTTQ05Sq32LiaXFEoJLK8Kw5hixhbVsuzkb0qZBOozyx/sK5h6YfJigGAeNSAyjbcDHS8reH5+Fck5Pkb69uMjIlPx08W2iwkuxinMdyul5JMtETKJGqftXsGfuepUqJpyIpLfX1mAdfRMSUBSYffJaBz+luOSrhIiOwffwAH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771954113; c=relaxed/simple;
	bh=Ur/cmC9qUuPZPz92Gemm6ysyVYp6dFiEBwJy+IYff3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pM5soiHNafM3xHqSe3vrVeYnOpT7stE0Yy0JHtDYkRuYFii5PrN5jeBAJmV2xumWqLv89m40661C2NTR9hPIOZR4FvF3cvAIHyATGVt//HeMgKpWcC6PGJOKYcSmTtULRsZ5zdHWY76CVsiGDmg7MxvDFHwhDxjsKrielbgD9Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=j9Up2n8Y; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fL4ST0dLtzlgr49;
	Tue, 24 Feb 2026 17:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1771954103; x=1774546104; bh=wi6mr4NmBc15VEQobMK1prO4
	EcrB/sl8jJSzBnjRhzg=; b=j9Up2n8YczB81VeZn6zAiDnrC47ySRlMtyzv/stF
	5gRcFGQwKIivzEtOzCFD9wbtJaANse0H1+4vmSveJ8YA/WXSO2aXd1co41IRylNp
	kNhrRZ+5v72MjZqfAu4aWbetcImjo+CFZVOYM6JJWPdIYpNx+h6/NMzp1NZrauif
	/Bo4q/56IQXggg0NQnn9pBj9d27jMlPjT/UYFrEXSpoEJ2w95a+E2mzahl2y7UKQ
	vnTca8ryQ3emqdC8RxsBx02yrmpoe23EhWduQzwqC/2MI3gfZcoGmfZsPqF2GpaW
	llqTGjqOJEk0UWy1aAnA1WySuxfpZFQhV8SC4Xy0I0GlmQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Gypf9e-3dmJN; Tue, 24 Feb 2026 17:28:23 +0000 (UTC)
Received: from [172.20.150.38] (unknown [4.28.11.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fL4SQ3gc7zlfc3w;
	Tue, 24 Feb 2026 17:28:22 +0000 (UTC)
Message-ID: <975acbb3-a4d3-45a6-9aad-3682c46e8fd8@acm.org>
Date: Tue, 24 Feb 2026 09:28:21 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/62] dma-buf: Handle all dma_resv_lock() errors
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20260223214950.2153735-1-bvanassche@acm.org>
 <20260223214950.2153735-7-bvanassche@acm.org>
 <5d9daad3-a687-4116-99fc-b6c7d82fe5a9@amd.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <5d9daad3-a687-4116-99fc-b6c7d82fe5a9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53305-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[acm.org:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 82FC218A86B
X-Rspamd-Action: no action


On 2/24/26 12:20 AM, Christian K=C3=B6nig wrote:
> Why exactly do you need that? Would a code comment explaining the
> background be helpful?
dma_resv_lock() has been annotated with	__cond_acquires(0, &obj->lock)
and dma_resv_unlock() has been annotated with __releases(&obj->lock).
Hence, with thread-safety analysis enabled, Clang complains about
dma_resv_unlock() calls if dma_resv_lock() returns an error code. There
are several possibilities for suppressing Clang's thread-
safety warnings:
* The least elegant is to annotate dma_resv_lockdep() with
   __no_context_analysis and to add a comment.
* A better option is to rework the code such that dma_resv_unlock() is
   not called if dma_resv_lock() returns an error code. That is what I
   tried to do. There may be better alternatives than my patch.

Thanks,

Bart.

