Return-Path: <linux-media+bounces-58687-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKHjDg1U3WkFcQkAu9opvQ
	(envelope-from <linux-media+bounces-58687-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:37:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 954DE3F3245
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC3BB3066A21
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 20:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0939B393DDB;
	Mon, 13 Apr 2026 20:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ueKp/Tc3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F97136A035;
	Mon, 13 Apr 2026 20:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776112455; cv=none; b=ZcLW1Cr1EtCPxdmEOUM4sLjxF6DN0orSMF048lVZz+TcxY5E4OxOKXJsFPhtEZ2gbIKSvsSTbVrV8wwD20ymoCfyGCLHX6XiS/VcLsZxPkjiHDrZN14CtrKK4TYlwd6+7rOF5+hdvcEtoCpCLRPFez/fse2GIwQ7CybVvoTHzUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776112455; c=relaxed/simple;
	bh=udQmhbHAYKfxARhnBiFmlPPjAm5aIDxgX6FrYs49XaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tWHfBuIkQa9i2198MdxJLlx/ojSeBa2VRxyFC6CL4+Z6YHWEovVsXNYCHHavApIUPK7a9X2X8HWy4P5aa/6gX4zEW3TAsFoSjvj08bUhbp1goS7rKt8yju44Ehpg1ensumbc2q9aBdYq7fjtqFUtEjTvSdrzcMG6KJq/4mMxwCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ueKp/Tc3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5340C2BCAF;
	Mon, 13 Apr 2026 20:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776112455;
	bh=udQmhbHAYKfxARhnBiFmlPPjAm5aIDxgX6FrYs49XaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ueKp/Tc3D2T4mj9KONopLzkmpEcHbY3/kRGZG8SfqhL0L/aWP1ghxhxSVO03Ua5mE
	 yLXwsiAenxD64ayJqoXfs8iBRWzAhqWZx+giUMaZ1iF2Bnx4m6ALNtlTwi0A7newGd
	 I11xXRhvr1Geih5+J41lYDYfvA0fjuE85t2jSJk+D6EnfQjbLvYgHW+RmvM/XyhtCQ
	 Ohh6PQSqRU31ugGUgxooghMNNshX6qSmQgpWHwIUAmCOeY4p4GXXuK1cXFHrr8XVCg
	 usqs8p7pLJ9h0/rJVkm72u93GV5OUM7b5FdOEjl/B+MV+OFBfEttg7HY+3kR12WxY7
	 9HLpsZUfy2QdA==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: david@kernel.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	21cnbao@gmail.com,
	akpm@linux-foundation.org,
	dri-devel@lists.freedesktop.org,
	jstultz@google.com,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mm@kvack.org,
	mripard@kernel.org,
	sumit.semwal@linaro.org,
	xueyuan.chen21@gmail.com
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap() whenever possible
Date: Tue, 14 Apr 2026 04:34:10 +0800
Message-Id: <20260413203410.13079-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260403092028.61257-1-baohua@kernel.org>
References: <20260403092028.61257-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux-foundation.org,lists.freedesktop.org,google.com,lists.linaro.org,vger.kernel.org,kvack.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58687-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baohua@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 954DE3F3245
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>> vmap_page_range() does flushing and it has instrumented KMSAN inside.
>> We should follow same semantic. Also it uses ioremap_max_page_shift as
>> maximum page shift policy.
> 
> Not quite sure if vmap() should follow ioremap()’s
> ioremap_max_page_shift. If needed, it shouldn’t be
> difficult to do so.
> 
> I have a version queued for testing (Xueyuan is working
> hard on it). Meanwhile, if you have any comments, please
> feel free to share.
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 57eae99d9909..8d449e78a07a 100644

Hi Uladzislau, David,

As explained there [1], this standalone patch is withdrawn,
as I have moved to a series that addresses a broader set of
issues.
Sorry for any confusion this may have caused.

[1] https://lore.kernel.org/all/CAGsJ_4wCBeVfyFraj_dRdsUrSNqDG5a8SO9C3=PFRSt04dRvGw@mail.gmail.com/

Best Regards
Barry

