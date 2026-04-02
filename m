Return-Path: <linux-media+bounces-57958-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIMTOAZrzmmpngYAu9opvQ
	(envelope-from <linux-media+bounces-57958-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:11:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C2338974A
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E1C3307A319
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 12:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B1C3C5DC1;
	Thu,  2 Apr 2026 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="svR7RC88"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0C23C8718
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 12:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134706; cv=none; b=Nx2Ag6OxKybeYu1zpP/JKVW7G3KNrQhhmST1SFv9+uqqW0H7r6Asj83TljoDx0cdx/jGg4TueM9gCv6iOmSe2KfphfJgGFgC0oZrQ+BVpx3kkGgwaiQZ9st1WimnHFvSR3r8ejDtw4TVFkKr6DFsyUwXTVJTgssRqQc6RDw1K0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134706; c=relaxed/simple;
	bh=UzYbx1sEpC0M+peXKDrwMMEQ4PJH/E0owphKLjh5Vw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E07KjRv0cFj/h3Pid0THEJer0MJ/qBB6TmPUEaGHbxxcw77SxbDdKWut5vmYIa0WXRABknwLyEqhbel5MEnHsf+dsSkYZ9csBiNFuaYltJbFaOTadzb+HvvTZ1zYp+jhpIyCwe0kKn85T4O+T7zc0gHLWM/gw3MVm2vWcdPHEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=svR7RC88; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so10446575e9.3
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1775134699; x=1775739499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UzYbx1sEpC0M+peXKDrwMMEQ4PJH/E0owphKLjh5Vw8=;
        b=svR7RC88+u9oBJXAe7M7n+wJ8AtuZ/bl6pDN+bfq0deg8MCNQJQIhr/oXfiMFpVTzd
         Y4wjYsEn//+vxNRpzScxCyhENNhNyPkHIdgP+RpPW6pKBQWOvl8ry1Sy2omBYkJ11+JY
         XMnqWlDtaEs6+kFzBS2ZCBpjl9GOm444I05YlD9QmN7tr6tOVRN/pdfgkH0Mkc9Fahbn
         e43lUqhtgbsgCxZqe6rlpa6iZy0AUq9CoVvuAdNjwr+JJ4hg4fAwAIfAMzzDAmWA4kQ+
         Dci0XRAkV+VPnqQsxf9vD9rS+D9FGLmd/r/cNH7hc/ivXKEZ5Ngswtnxa/wj8Ddwn+2q
         B9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134699; x=1775739499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzYbx1sEpC0M+peXKDrwMMEQ4PJH/E0owphKLjh5Vw8=;
        b=cPJyvkr9htSI5iH21JhmM48amxHqUNfUq/yTHiMRlvXFrcYIOJdDrg52vD2TnPncj9
         6NMvkEC+yE+giNuEC7DVYk0NHwZ7DyS9kF6C4vmnSizIB5o5X/CwspbIFf3reoqYj6D9
         xGZfM8IoZBJU6bz+4y/3hhAOWLJOLPpn2ORwgPb4DBe200WIdTbcGkvofXfr171qS+jP
         IVzRKybQKQ0b2AQMKOgnBd5LkxNu7KP3GPzgbk0tMFl75DUG5lyPm7rMucAk/cqqDPwf
         rdnvezNuCNSdw85YysgYxSSEQDpa0qx/cCygxyWTSK5ayibjSF0SZYbpOs/3SkE8PaLA
         xbrw==
X-Forwarded-Encrypted: i=1; AJvYcCUZoEl68ZERxMuZkyO8ZbZIXNKUnunQ0jIFXmGXYBLAVfp8lTyVAUawHmjy1/8qItiZl5an6khVST8Q0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YziyxE/n6V79HpQUlHhB5qhloYAywE4c/SseYj3rT+i+uF+bBLU
	RPx+pYxkv21xTYp9ryM9mf7pi9uzrwOtU+yyQRtXdhw99fd67TRifUWBQT+Uc7Iz/gA=
X-Gm-Gg: ATEYQzytqGb4B4JFxGk8NxdGhdrvtsWdSV2LpNlnGw/KeDgG1Tu5wxoMHQvwCz9Q0n+
	Jfx86oxRMvgcKt/CyuOxmqwNG4Ut3ahjB6RXn6ENeFb/ODX+0h4N6F8dQYSdUwtjoT+x1FtMXIt
	qKoybVGfTT3mU4zR1nqeMI7/O1t5vPKRUd2GrLRFGbsK9tOCnNJ6o3RT7sBvHfJ/85Kvfa5NDJ9
	Nu+CgXSogdwWia15dCyO4BDDq+4UMSDZ+EBFN5Of/W9R8RTnQUeYtndOr63VQ5Jj45NLmEgyIU3
	qO2hVRPN27NQp3w3cp9E72UpL1PHluWbjJMQS6N5I+MPNVpMfcKOK3eOd/9u/LEUUEcNh5+haQp
	SwWvYAlZ7flPBYszRSYm9sFIBmWjX4A/5ug5FVCZjGAYPoBF0lAvoziooPg2cA1lJ0/+BwxKtjU
	MRNDaP3cs4WVnLKzv+fwotU5Hm372qWIrvynNX9hFQhQ==
X-Received: by 2002:a05:600c:1f93:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-4888b7130f3mr58915525e9.12.1775134698707;
        Thu, 02 Apr 2026 05:58:18 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c884f77sm62829225e9.20.2026.04.02.05.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:58:18 -0700 (PDT)
Date: Thu, 2 Apr 2026 14:58:15 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Brian Starkey <brian.starkey@arm.com>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev, 
	nd@arm.com
Subject: Re: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate
 explicitly shared/decrypted memory
Message-ID: <l26gcpagdhabj6w66hhxzgwkwqlybontqtbf7f6lu2fic6pnu6@crh3rt3j3alm>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <4s75rtsmdfrze4rscbqzyrjyrko7n6sehe7agrngqag2cna5bz@eflmf4kwjocj>
 <20260402120254.GB2551565@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402120254.GB2551565@ziepe.ca>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57958-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,resnulli-us.20230601.gappssmtp.com:dkim,ziepe.ca:email]
X-Rspamd-Queue-Id: 31C2338974A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thu, Apr 02, 2026 at 02:02:54PM +0200, jgg@ziepe.ca wrote:
>On Thu, Apr 02, 2026 at 10:52:34AM +0100, Brian Starkey wrote:
>> I'm not clear why the heap depends on !CONFIG_HIGHMEM, but I also
>> don't know anything about SEV/TDX.
>
>It is because the CC apis, set_memory_decrypted()/etc are slightly
>mis-designed. They take in a vaddr to represent the address instead of
>a phys_addr_t or a page *
>
>This means the user has to use page_address() and then the whole thing
>is incompatible with highmem.
>
>Which is fine, highmem and CC are never turned on together.

Yeah, I was wondering if it is worth sanitizing it, but decided to be on
the safe side, for unlikely oddities future may bring sake :)

