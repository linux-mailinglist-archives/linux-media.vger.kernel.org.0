Return-Path: <linux-media+bounces-63952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /+uGIJ4AI2pPgQEAu9opvQ
	(envelope-from <linux-media+bounces-63952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 19:00:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 246BA649FB1
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 19:00:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DGLnEzMC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63952-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63952-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 088903031253
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 16:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD5D3B42D2;
	Fri,  5 Jun 2026 16:56:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058E3254BD
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 16:56:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780678609; cv=none; b=oj61/1udeHyq/LrUpfnvp6ZWHgYAEKT6+Va95LN9C87n5RBAwS4caU/a8ta7l/z2Ed7LujctAkhre7Gp4lPjHqmRHJ7gE+08W4CgpM2dUdrs8dW9+pYeXNNjCwN+YcwkbzBwPZaF4J3zQOH82Eyc1DhvhijbRoKjzIeBCBs0JwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780678609; c=relaxed/simple;
	bh=d/cDT0ruaR9THqHE7wAti4oD73K1oJCeBXScG3umFvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aucD/oum0GCberjv69lndMYMcFCHLLzev95ui0g0wUdx7dEht89VATWKmgCHJ8HdvL06iX6mVwf9j8O4HMHbJlVRyVgKFnXXWpWzyyjYdCzTl60w0P10ClkYeK6PZwgZ1O+QQL6FhDVWnIJdTL8diDDo6zqdt54+ccqu937+Ur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGLnEzMC; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0aa420401so16302325ad.3
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780678608; x=1781283408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=07Z9+e3inJcySCaf9Ls4BTaFTWY0Pppf5c+tjALyKsk=;
        b=DGLnEzMC0aA6oOMptcEqzyZGTbXMRFHkBubeM86BkxJdQ3QjAn59LPR6sejHjDA+BE
         2bkksarvA2u5f2zgXovnmh7dKC7soSa0BzsVLnR4qMm68vxDdIhbFhOAH+ggECP40Do9
         H1jeeg1OLn9sxt+4CRpoPd+zmoUGGnH63VzW7pR8A5IzFbQyoV5hVvyb356x/jqiMJQz
         LLwKwTgSNyDqMkpgDVidpeCPhRMkJFmkkoqakgs9cVndCuUKKK1V+roF+kdC1ck3OXNf
         rv7v/HLtKRwqbBtyLS6GyGgdwSa8d5VbgDoZLTBCnsNWCSCPZYLMc8DcixxEq1IuNNG8
         2/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780678608; x=1781283408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07Z9+e3inJcySCaf9Ls4BTaFTWY0Pppf5c+tjALyKsk=;
        b=hQsHMuM79MZIokME545uzKWQaTx3ksnlas/cd22viD+yaIImfZF0VakHKGJ0i0j1nM
         v2APkNIt+C8hHluT/RFqkh+O7K6VgK8jlOnepd7tUgo2zbR8d5sOwPnXwin7wMXjxgxg
         wY+waeXCFLcCa6NQBCmgDOLzhxISlDWqzJdtOklOsYZLGD6KY22wQI4sj9jAhnmJgYeC
         L3UjnGxOzUXngo7JUPKTgO0M3kU+KO5t4uVXZ39zXD95khaphEyOszp39LOPxsm5csGL
         RLqCCh802gIvEcZ7MBBMdBH6eJigY9hBhvAlLY8OhINKYIiHDkL6oFOOwl6qiY7FksXs
         H1Ow==
X-Forwarded-Encrypted: i=1; AFNElJ+6J19gshXtRMhtpyJCDB2xDLzo1E6FoiT3MR1IVJJG8iXS037/jpwOpuaUm2gNvKcS6JJB2617/Cbqgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqGpbpUfUaRQxR/1z6OTjmJc+HjpvQPWjOdCy5M3fbJkvi18hK
	0m4UfTQr6fWhNtKel8iQ6b4x4NELzzEhI9kRGmR0V3iEtAsCA5LnXnsw
X-Gm-Gg: Acq92OHISeQTWzpBr9nSkEsbh4jgznSxXKXJfViMZ2RM266PgoDyV1LKmgnVHip/XN8
	huHtzKISXkNGeUd2hNdKtSF9CpCQZFioU2AGb4sdrImPhZuIluqer4gwttpwpUwmkDsUCTmqqHS
	IBjBhNUos63zxbvmVZrOm1QRowH0qeGtvtsloTKZXQTJbTGoJDhnonjQQ1X10aqp6Pidt0bsN/o
	AZosOrQZmSMm0tRfIDmC7IUreqtofRRMeANx+z41nKwosG3vO911hyPO2ktuOjrHyUiI/mE+FFp
	bgN5nlzgIzFbSRU1056OyO0iL4SQ3aqyN8A9PkLTtXD95BW8hR+whYziBnOTSYuLrmNt6s/YGBd
	4zoM1QE4b0gj2whs3T7pyCEZ1PB0TqMCSOiGcSgqbfr/6ti/MJxVEiKk7uRG1vj6djWtf86GAqN
	EHXDN8ue9xANt2GR5MbzGLDi2nGCymz86u9b6/bPXR6kKe3zfM2fsyJnY=
X-Received: by 2002:a17:902:e790:b0:2bf:379b:53ed with SMTP id d9443c01a7336-2c1e821e5e8mr49794665ad.27.1780678608079;
        Fri, 05 Jun 2026 09:56:48 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6dc92sm89653455ad.13.2026.06.05.09.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 09:56:47 -0700 (PDT)
Date: Fri, 5 Jun 2026 09:56:45 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 3/4] selftests/net: ncdevmem: add -b option to
 set rx-buf-size on bind
Message-ID: <aiL/zQe7Ku7bKIJ6@devvm29614.prn0.facebook.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-3-f37a4ac6726c@meta.com>
 <aiLsegSEGviNluv1@devvm7509.cco0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiLsegSEGviNluv1@devvm7509.cco0.facebook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sdf.kernel@gmail.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:sdfkernel@gmail.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63952-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,meta.com:email,vger.kernel.org:from_smtp,devvm29614.prn0.facebook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 246BA649FB1

On Fri, Jun 05, 2026 at 08:35:25AM -0700, Stanislav Fomichev wrote:
> On 06/03, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Add -b <bytes> to request a non-default niov size via
> > NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
> > udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> > hugepage produces one naturally-aligned sg entry.
> > 
> > Reject values > 2 MB up front: MFD_HUGETLB + udmabuf can only guarantee
> > 2 MB per sg entry (one hugepage), so a larger rx_buf_size would fail the
> > per-sg length/alignment check.
> > 
> > Add CONFIG_HUGETLBFS=y to drivers/net/hw/config so the new path is
> > reachable in the CI kernels built for these tests.
> 
> I vaguely remember there was also some kernel cmdline argument to
> reserve these? Do we need to also do something to NIPA to reserve 2MB
> pages for this test? Or was it for 1GB pages?

Good call, my little runner script when prototyping this adds these
pages at runtime and I forgot to move it into the patch, we can have the
py runner do this setup.

Best,
Bobby

