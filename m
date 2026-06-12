Return-Path: <linux-media+bounces-64722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jt9gN2hPLGq6PAQAu9opvQ
	(envelope-from <linux-media+bounces-64722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 20:26:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EC867BAB5
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 20:26:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=nbEASQ2b;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64722-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64722-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6AB7300F273
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE4738656D;
	Fri, 12 Jun 2026 18:21:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8586437F740
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 18:21:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288496; cv=none; b=pj1Rtrb+5Fra79TpTDw4uVHHN6PUBHpeKqHegxZkj8mfb5YOv0i9YyC+SIE/U8X6cU4SKC5QgB3iV95XJPSgJXKqngnBS2xT66hJQ889lE3a3EGkUixJoDi8r9uVCcCQoAvgC4wSbWjeHOxlqkWMrqFNgU+m/HPXGb84YNMh3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288496; c=relaxed/simple;
	bh=GXDov58oeN3/+KOSLd5d2wQs5OFIS/2CmV/MKcaSW3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jA2NDtysm7eqwU7cRTJ5HGLtNRNwP+2ikLLeZ764Nr+Tn6TsHRlEA/EYqKdJAhP503BJoHRc6BtekdFVd6halhiKIB+a9tkt0iebozf+OwRLxA8r86zf2cbVv/1ic9zIUb+suOUJvV6aT0tNzDrjbl2TaEAuFInyIndGn6A+soI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nbEASQ2b; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf22c18ad3so10955ad.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 11:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781288495; x=1781893295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e+Upf3vkFcOgQTn7qEBZF1fjinQnmqMOEEdN6sxgH4g=;
        b=nbEASQ2bz0xs+J/lkvTKkvuEgXiCDZj1lyyVwCdoI1s9xFVDp6/sHl4csodIFjqeIx
         OBJNUqXCIj3W6nUHfF8HeexB8FOOMVSj89ACUUNOAI+dCltTg9Mze5WT16ZSmSy4qjx5
         kshPwVI7wvkswbq5++yOUJQ6zW7euHLcAF4gUk5q1+ctGWIwH7k9Hay7wXYEALn5wVkG
         2gXCbPvEB//2T1TPa/gi7HUEeNu+epFV5zSJXkqaIHqY17PJNIyhWLOJRIEzGW3Ff5QM
         Y1E6wgZ3xhFcOBYr9AqqzPhGtas8paxSSsINdsmatcPavAhYxvwsS4Hubw+DJuNU0EPH
         OzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288495; x=1781893295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+Upf3vkFcOgQTn7qEBZF1fjinQnmqMOEEdN6sxgH4g=;
        b=rP1EHRU62op85zeRFRoG3ZJk3yJiPaQFNvdGmdw5mc7FB9C36VXUfOgguACs0RheYJ
         algFZXnBQnyFgxhSWTPeZFmNeDgMATxnQ66qwE6tWTivhO7FSy8/cGfvQPDi21H6znuF
         38DtWpnW5HCsOIFZp4M+lDNZxqHiz0nJCB9MTQEywhAl3iZx7EQ54mTN1YZ4Cj0MxZ5+
         MlO03tyjXXR9PlmilmtigYp26s8DVvmr/m+1CVl3HbAhElWjXTtMAhpzj8R1DXkNHYnN
         Nwlt7857YyiMZ2ZAi/t9eSw6VnAYILaw/VXFnqlC5mS13WdwRohG26fZH3f9fjVqInjK
         nkeA==
X-Forwarded-Encrypted: i=1; AFNElJ97YBtu6Oja7Az/f/Q4xMUHr+hmt9l0Dc5s2ii7eQqtYliAqRL3WsZz8VoUSxp/1XoktOESouYF7tFfAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9y3cYKUloBIPPfhIZKHQT+Xb+lUdwilluWf/2jUVSxFZTzBVd
	wf2HqQxzow+ihGX0G4cKPCF6T7O2ozWIWiNIPWH2icUuWlvWkkV38PsOopd7rGKRGw==
X-Gm-Gg: Acq92OGJXF5yJnucXYFGnQKa8trFLjNS6B+j+s4lHr4RtS2KAmcmJrBQItWotqbB3iv
	tK+mpf9pKgSfHBZaZcsVgqlkAttfgeFTE/neS5HrkWh3oj7i8Pi5JTYMhvcIJMTRVgS270qWjzk
	vXbavrpjM07dcV8j92c3B0cOm3h1BHnkrJNU2bT9U33rZy3V6aUlGJMh66lwKVx0HNsY+TyjjVQ
	jTqpxqJvNvei3wliUg2ZycViuVnkDJ7iv95R83CW9f+II3ronaPU+mz7JODW9IqcSrWpijqOspI
	7WhijyTCacFOMNAtz4oFmdZnHftOsG3hzmqLsNakhnWwk4youecnZGciuTsSOOv3eQZIm5CFqMZ
	izfknYwXICMvJIPfhS+283iadv5sndt5IzsTEJ9s5Spljkdeni7vuKXqiM53g+tV/f7iKTNN0DX
	BZkOlq+VdyJ0K3RzGasid9oGAKFcb/a0WGUNgJK6cGKE+D66IHCzRT7vCPBz7u
X-Received: by 2002:a17:902:e743:b0:2c1:ee6e:4e4d with SMTP id d9443c01a7336-2c665142269mr202305ad.30.1781288494306;
        Fri, 12 Jun 2026 11:21:34 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8663352fd4sm2677095a12.12.2026.06.12.11.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:21:33 -0700 (PDT)
Date: Fri, 12 Jun 2026 18:21:26 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Matt Evans <matt@ozlabs.org>, Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Message-ID: <aixOJs4_HHFLgGLA@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-3-matt@ozlabs.org>
 <aisa6H-a-176MXhC@google.com>
 <20260612113735.79518b15@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612113735.79518b15@shazbot.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64722-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:matt@ozlabs.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[praan@google.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05EC867BAB5

On Fri, Jun 12, 2026 at 11:37:35AM -0600, Alex Williamson wrote:
> On Thu, 11 Jun 2026 20:30:32 +0000
> Pranjal Shrivastava <praan@google.com> wrote:
> 
> > On Wed, Jun 10, 2026 at 04:43:16PM +0100, Matt Evans wrote:
> > > +	/*
> > > +	 * If we get here, the address fell outside of the span
> > > +	 * represented by the (concatenated) ranges.  Setup of a  
> > 
> > Nit: double space before "Setup" and "But" below.
> 
> Some of us old school'ers consider this proper writing style ;)

Ohh okay, I wasn't aware, I withdraw that nit then :)
and come on, I don't think you're old school! :)

Thanks,
Praan

