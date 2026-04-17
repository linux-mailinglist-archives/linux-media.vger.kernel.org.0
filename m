Return-Path: <linux-media+bounces-58981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJs8AEH34Wn50AAAu9opvQ
	(envelope-from <linux-media+bounces-58981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:02:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4527841906C
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 029AD3144046
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B262DEA61;
	Fri, 17 Apr 2026 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxkHH38V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4379B3B19BB
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776416351; cv=none; b=O6Pyn7shMHTZWzioI23kqtuH3DJFaDtrn7+00Efwb6uLrrtgk228lPl52CqRoqmL7ZiYQ9O6gGe2x090GBG1vELfFADGxoBcNn0nOSM3G1D6LKuXO35Piq+AS/YN+1jxGd7kLvOOFj3Arsma59VMlWqgbXfkcBONKtukB2VS2sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776416351; c=relaxed/simple;
	bh=m1E3OPJdbPotAXTP7PMTI4xgVnL72n7MnjVVwFpoLb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za46XUmEgrfrBzcztRlHWuThYZs/ynG2TbnFw22j7YBz6siynV57JXSwjkIFf0hLzcnkXEketwb5tkV71rH6cQ/7BarM4bAxUaSGbwfEA0bo+KCjoifI4jxEgxoqbzC4Ps1kCpqWAQACdQcsW6fB1/19d9f6mL9HvWMGPXJRN2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxkHH38V; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43eb05b1875so247120f8f.3
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 01:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776416346; x=1777021146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7dukGfBvDpAabuQBzEcR2UgSSr/EW6iSoTCsDqEM0lo=;
        b=JxkHH38VMEOWEvDUbdo7C/T+AFKDuL9ewei86dnEzvVvp1xsBt4PDZSHaUJesSvx7e
         lbf+oyr6IMpuijNSvusNp0dfGG6FOzMms+wKLANqovdjEKUwGpOJAYgQ7MnxcNW6O3Wh
         j+SQiLV16xUBn1MfR61RTfLTqjo+8egZzEJS7ur3sbAPopV7HxtGtXloMo26H1CUn0fH
         yIGZ91GKJ7dVesaum9ppqw1yjGXr8TFdRmNXWFNUgA0ipxKn6TvAQn68rhrsYNHsTzew
         3SzsuJ6EgC9DpnhKx/c3lMteLwv89mzssMpSLG2M41vE/YY7KDT9FLoXrf2VQs9t56a7
         jnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776416346; x=1777021146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dukGfBvDpAabuQBzEcR2UgSSr/EW6iSoTCsDqEM0lo=;
        b=iVlRN4JIgsNzxhKPD+R43dVCVRIxMgBOb8BkDjh3OTfJz+8iYRQCbN4jVe540N+LSN
         4B/7vMnleJhPGf1MqrdC5H4FiF3ckFsfZfcGmm3/Cn1Kr+h4ifPNXol2EUOg0m8uVpf1
         9xgZ7wSHf8Jqs1F3OT8DvYzSbTZO05TVPV5TKsAPFE0Q01a9dWgSDWCQPRG3g3/afGW9
         OE1ezraHApQnKx4gNgsDCi2vT8bmH3twkihlS7yQlVasrZ6K2JBfD39VhRKZzpsTCbUd
         X5TYmHyZac8AV5DDSil+YNoN/xG9Wk71fLJRrOvtPFIz3CGb/GmZ6+2MOVWKntWGzt13
         Gsgw==
X-Forwarded-Encrypted: i=1; AFNElJ8L2N8zlHlJ3TyVHo59BkR8YlX/Mggt+RL+ZespeBL8xFc93Yigro6GqhnBqm0NCDmAUVfF1nRCRyFI1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YznAnQVNzwefUQun2pdQloguBGX6+5Hw3qiCt8wCG503bvXDT39
	jqYxr+F0UhEQkgwspGKWwi+iX132LxNk5wZLZp5fs8bV4O7fqeAVXxVj1OdXVQ==
X-Gm-Gg: AeBDievLKs3qmajiWoP5bbvQ1gbjrcuIFj0sIyRaRDTET9L33C8Hp3kq2kRTrFO+cDi
	sx9VCmMiPfIaXBcm/DIxeZKv9JVNb/2/i9UeWRULxs+S1uXAziHiYIOfBTca/3ubOBmwHe6Wsvp
	/dOpi8GK7j19jm1pNzd4CXSlSRCNjTL291iuxc8sJfUVJoYnVb5ulDdtB13zqbDjjJH6KGyoN3h
	BS0Vg4zBR7rdrX0UtKYxx5uUkdWWN62XMSCR8Xlm53Hm0TEPGk0BlDpVmfJd/+oTj1HYdwuLsET
	Hpmwt5hroPDmQkRx3NChndAWs/Yc2eVizuxEZ2zxpg9EMCyDx9oyP8hpixJXGh/SlOlvs5ymLPC
	KV8X7sZ8EdDb+fx5glZX3y1U2kGFltppA1Uaz2+OYWMl5sxKvX7woykhEKx6W/I/kqclCpzeoaE
	ZWvJkPLkUsapgsRztKJqDBupKLWsfaPQ==
X-Received: by 2002:a5d:5889:0:b0:43c:f8b4:e58 with SMTP id ffacd0b85a97d-43fe3e0c7ebmr2930843f8f.41.1776416346074;
        Fri, 17 Apr 2026 01:59:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb11b4sm3075735f8f.2.2026.04.17.01.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:59:05 -0700 (PDT)
Date: Fri, 17 Apr 2026 11:59:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu7: fix MMU resource leak in
 ipu7_psys_init()
Message-ID: <aeH2VjOV4_Ql_zeY@stanley.mountain>
References: <20260417075807.2691958-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417075807.2691958-1-hhhuang@smu.edu.sg>
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[smu.edu.sg:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-58981-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.167];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	TAGGED_RCPT(0.00)[linux-media];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4527841906C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 03:58:07PM +0800, Huihui Huang wrote:
> There is a memory leak in drivers/staging/media/ipu7/ipu7.c.
> 
> In ipu7_psys_init(), psys_adev->mmu is allocated by ipu7_mmu_init().
> When ipu7_bus_add_device() fails, the function returns without
> cleaning up the MMU resources.
> 
> Add the missing ipu7_mmu_cleanup() call on the error path to free
> the MMU resources.
> 
> Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
> ---
>  drivers/staging/media/ipu7/ipu7.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
> index c771e763f8c5..4039e548dc8f 100644
> --- a/drivers/staging/media/ipu7/ipu7.c
> +++ b/drivers/staging/media/ipu7/ipu7.c
> @@ -2228,6 +2228,7 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
>  
>  	ret = ipu7_bus_add_device(psys_adev);
>  	if (ret) {
> +		ipu7_mmu_cleanup(psys_adev->mmu);

Same thing.  We call ipu7_mmu_cleanup() in the caller, and it looks like
that will trigger a NULL dereference.

>  		kfree(pdata);

This kfree() is also wrong.  We're supposed to do:

	put_device(&psys_adev->auxdev.dev);

which calls ipu7_bus_release() and that frees "pdata" along with
psys_adev.  In this function the first two error paths are correct
but the next two are buggy.

KTODO: Fix error handling in ipu7_psys_init()

regards,
dan carpenter



