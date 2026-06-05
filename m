Return-Path: <linux-media+bounces-63940-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KIlvO2jwImryfQEAu9opvQ
	(envelope-from <linux-media+bounces-63940-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:51:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBC36497C3
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:51:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fzWzVea7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63940-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63940-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B589A3056862
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 15:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECB43D524D;
	Fri,  5 Jun 2026 15:35:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906493B7B7A
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 15:35:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673739; cv=none; b=DsfmxaE7mQBn5hUaIj3aMJ/7trk2VZ6fmbE4J21o1PTwXtENcxFn1d8QHX51FxIp4r6eeZ8fGct6hrD9pceCOwPkb3QZmI5ifm7t7dARG7dxN1CahF4DmsBIlWw8N4s9SbFne9kJy46is/0vhF66Q2YJRAAoDbXIoRj5BZ0vkq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673739; c=relaxed/simple;
	bh=PAnC4mLvyUUp9MLzPMbRT//DSkE3Dk1mXOL/7klrM+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8gkg3lOK5UZYNjdgx8vrxmMgRMfnljBywkWOkIvobp9+46PiGZAA8cluHjfvK//DUJwXmup5SXIQqUr+EF/p5DvRlOIsG3dFcDgnXG08wG15ih8WFEkl5Lxb2pWQW2mGDuyRDj9x6Y9PMRpIPc8V92fs7pPrH6Uf5RXFdKweuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzWzVea7; arc=none smtp.client-ip=209.85.214.195
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2c132ac5ec2so20094205ad.1
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780673736; x=1781278536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fcdauWu6kB0J8jFGQyoE+3xe804PkmDYTAOAHNlgs3o=;
        b=fzWzVea7k6W62mlqRIwb3r7DPjksGcTZ3e4wD0vz72AcgLjseAZadyANrwv87Bkr2B
         5WaKcZ2NaMnhu0MnEU26d/84dFKc1oBQCSKnfAt/0P90xhhyz0bl0NuwgZng/XttdAa/
         HI+ZaneUtepfXkmuB2PSYvxrKK+aToUU+i0jE6dImZmhZcEE25XgCGT4Dl88FVqvpNYF
         /oDBSKqmuGmzB9A7ne4khJwf60b6uckm0uI+e0jUOltvGW6QBfKWigETOOu5gaaIoKQT
         Z2RzKuBamM+PNBAl0lnODRS/2H3eK7Bz+W5nBZh8AcTODbhAjRhIt9AnEFz+7SdaUt6I
         AhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780673736; x=1781278536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcdauWu6kB0J8jFGQyoE+3xe804PkmDYTAOAHNlgs3o=;
        b=HOr/4QfONBX5haXDtI/rBwrksdde51X73uUucvWY37eyddJEfr8XZYt8SNlof2nTKb
         KATRqX7gcims/90ywpC8ZA1Fg3P6ZzoBGFhUWSo78wxBXh9lIHLhqY0UWOzpTZkyNpfw
         PuYmjMxTp68zowRvR0KJD755LrBn5tso8dvC7is8+Gm1INC9WCpNRLxklCbfZUx3SUFN
         rTGjx5LPsCuuECNqptW3ufe7FCbJK26OVVi7fQdPevZ3tgZLav6any5ANIittWMj/ecw
         VF0UxXNfRXk0QEC6XGQFi0F2OIGdSRmxj5HYqwxtqjuY/1dXWhgUrQtUsQWhHRfTN40m
         nU0A==
X-Forwarded-Encrypted: i=1; AFNElJ8DGTsdHCiL6Ad3qOEbHYezRk3KxZ/jsh66QeZF4fhZDyFdVEc3JSAHswT7wuXRnckt4pbJMlYkyJkfkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRlNiuGp25fiJRkIpT7F7PbzYVdfhfUB750JrI7x+VYOBMcAz
	2xXga18qZzPW8UDSl3kWQo376apAZ34JdbRCMKKq/WcS63/T2bPgje8s
X-Gm-Gg: Acq92OE7U5HpNi0vmPE2X3kc5RLDQ806NLIz0dQl4xBUeiXQuGZgLO4bo59iCU36gWt
	CYmNDlgUvq5PGTdpJY8qE4e+QawcZtle2cj4QQmRdnmKlb7XNVmZCJCWaEhuo9oYSmke4LVKE3z
	ZLwrErUTCRcNpfTtneM+gzVEfPr3LR7ynEpV+jPTfWgK0E/P1WgS/l781pUTkDL8H0Uq4Y1IxhV
	jnuq98YXQpMZVZik0yJJJ962w3XLDxAYK9KewFpm6BDcUTXamEMthCkGOODR6dbo65PVdCZGOVH
	KEkUfy8+cIjpwZYHHGeH+yd8atlZsYQGCS5fEB1sLVTWmDDOE4k7hA1Wg0/5AYNuiSfSQPmaEm6
	zscigfhgs4vNxXXf+wN/YL6ntu0QLwZFub1FyELydvyJu1yOO3fEk/F81xf8/mT65a3h4wDhHOP
	2oO1YRYZUOmqvk/PDTuB2X12ZIVtI=
X-Received: by 2002:a17:902:d4cb:b0:2ba:7749:f89a with SMTP id d9443c01a7336-2c1e7e55623mr43588465ad.11.1780673735644;
        Fri, 05 Jun 2026 08:35:35 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5e::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166391d53sm127920285ad.65.2026.06.05.08.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 08:35:34 -0700 (PDT)
Date: Fri, 5 Jun 2026 08:35:25 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, sdf@fomichev.me, 
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org, 
	skhawaja@google.com, dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 3/4] selftests/net: ncdevmem: add -b option to
 set rx-buf-size on bind
Message-ID: <aiLsegSEGviNluv1@devvm7509.cco0.facebook.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-3-f37a4ac6726c@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603-tcpdm-large-niovs-v1-3-f37a4ac6726c@meta.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63940-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bobbyeshleman@gmail.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sdfkernel@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sdfkernel@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devvm7509.cco0.facebook.com:mid,meta.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FBC36497C3

On 06/03, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add -b <bytes> to request a non-default niov size via
> NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
> udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> hugepage produces one naturally-aligned sg entry.
> 
> Reject values > 2 MB up front: MFD_HUGETLB + udmabuf can only guarantee
> 2 MB per sg entry (one hugepage), so a larger rx_buf_size would fail the
> per-sg length/alignment check.
> 
> Add CONFIG_HUGETLBFS=y to drivers/net/hw/config so the new path is
> reachable in the CI kernels built for these tests.

I vaguely remember there was also some kernel cmdline argument to
reserve these? Do we need to also do something to NIPA to reserve 2MB
pages for this test? Or was it for 1GB pages?

