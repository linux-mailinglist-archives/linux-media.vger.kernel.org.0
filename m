Return-Path: <linux-media+bounces-65470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h117IYV+OmoN+QcAu9opvQ
	(envelope-from <linux-media+bounces-65470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 14:39:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E536B723C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 14:39:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=Yg3sRbg4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65470-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65470-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1CF830B5CA3
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 12:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D273D5673;
	Tue, 23 Jun 2026 12:38:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0733D5226
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 12:38:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782218298; cv=none; b=VXjkiLJl6G2eB9AXs2Ok7F+PgCPnm04PpgdHluMo1dCXOb/R8/SAF4PxBd7L9E6gtdnbu/BVkeuGacgD0jjABwL+NKuIlQpByh9Uq26nUcAMx5TY/HqVxrMmmgYSg3FofAw/qn2XaPbdrsjVkuyD28DC5AZ31FteSDUyytIUt8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782218298; c=relaxed/simple;
	bh=0r+J+xSFPVTDu03hM9HofRSVjf4b9CkdYvs63DmWm7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DC3UxAQfxbkEjLNaXqHUu13o1bruwNx4VvtYgMJK26ZADSIae3cyAUTDCoGoAjW70jsCUbmShRGQTHfTIQH4q+7DiDKeWiD2Jp/Gqt5pUU3C9UQhA6tEdAiOpuyyqoiIz1vXCAAsinTe5UgAdb4aWGGdA1XNRckpdfY50l3eyD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yg3sRbg4; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6b7bd4e8dso46045ad.0
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 05:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782218296; x=1782823096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kRyC6uc9PiBbjK9ZqA0DFvnVffsSMfHhakITg77vSEE=;
        b=Yg3sRbg4JcgakwmVfurdoXfjSEBxkvQUvrGes5NXfUKDFWt+W+dLi61pcHGBIzlJ/f
         eKvld8j2snhn0VdxWAGJWsZJxkTde3rC9QvL4/P5Yrsic0c3LHmetJNsr3fjxsBi+0GH
         4bnUr/NIcg5FFT0fhdMdngy9o3gL4jozOs3FLKvNbfyOOh9NSwjkPKT++hwaFdvY9AKv
         JBSzZXvkPB2sSrkhBQjCq+fEPjLlubZh/B41aNOIpxnEZkjzWuazxkuU3AW5lZbpmQqv
         0wu5Q9OUGn6pMz9lINaWM9nBDbZ+S3OJBtPebRTgLzLLMkQ9vLRfEKlRqfAW8ISqwdTH
         VFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782218296; x=1782823096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRyC6uc9PiBbjK9ZqA0DFvnVffsSMfHhakITg77vSEE=;
        b=e8P0OzFB4s9SPaREkDF/C1BGbQI+eVOXDvbSeW77ZWy8N8kERVkvn28P+GPz4+YGfU
         WdQWt/Kp03COuN6324MUk7q8gLqATDc+3nbQQCnOUAh2Q5xEQSgmxz+ZIpO+QYO4e389
         ReLCBGxNs/ZiweUSIN9K58FRvBJumvDWcMNjj1D21qFE2pVj273N5LgcKbTsbVrqmaBa
         VcvuTHxbKHqeJV5vtAT56robrX5BWaSHFOB8CwbrkH6o/YlV6khYbUQZdpS64wFb/NVS
         U+b9lWV7x2Z5pSdQ+qGBqXzmyO8dOB3VUUp8S1tyLTWlzgjW3KUVoA2ZWxbdhEuNg4Rn
         GFFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrd+xEvKqo1+4r5u5Li5b9XgEJaRU+TpA9Bj0kg02DAOISuHUETxiiBhPsxGTGBqwoQo+kAeIiwDUpi/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzjxw9FsKJD5zY+kYu7LA/67GGfI+4fEQ3kHewmWENSDsEQb6V
	gsxQtQH8FNXsFNGX8u1uTuw+ySQfUQ8tmkiVG0xyik9lnDCHALNvnFkHDRa5Lv2gaQ==
X-Gm-Gg: AfdE7cnUtQpBEDOauikm24pqW2fcfHHo65XAfzZAgs8qPVJ7uaS4k9U8wDIRGAtttGW
	POaHUyAvVg+oVhrkYvBMQ5UMwIscMLcZ0P5umj3oHVOQ8wO4yz0PDoVMBy1K25sOZqleaCU1r5G
	1niFlVT7jkkkgoaD4ddmpZGJmAmkCy33byuDtvUz66SPAJQc6Z7VXbGbNs7bhsAzRgob5Fh8dV/
	/dThy18CG4YPV4+GXFrkbTef8Dsk+7zQlWR4SVoL5FGHEVSLvvOYHFfeUzR9MMIWSgDvvU6L+zC
	MWfv1vqtfzE7EbBiibelbBVeBhOLwqcZAyxx0S0wmAMItn4mAXoUoTqvGR8MMDajrQCnGH7y3gY
	2aLEdzdkxBIngFaTJXF1HVR5CYjJiPcjpHwc68YcHmJIZwRmbuU4K9bwgfcmAAnXyUHocoDKg+v
	mBLne1F64eyMnSlHmem6T+y9s5xTPCpStn9UJZGLQ6rdUycsmsSJMem8ZaFY4Q
X-Received: by 2002:a17:902:e5c2:b0:2c1:4a67:5f31 with SMTP id d9443c01a7336-2c7c70efd4emr1597435ad.9.1782218295641;
        Tue, 23 Jun 2026 05:38:15 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c2cesm13106102b3a.2.2026.06.23.05.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:38:15 -0700 (PDT)
Date: Tue, 23 Jun 2026 12:38:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Matt Evans <matt@ozlabs.org>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
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
Subject: Re: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Message-ID: <ajp-L7wHQ2rQFK97@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-7-matt@ozlabs.org>
 <aixgZQiBQKgS7yIM@google.com>
 <62970f4b-e624-403f-9cdc-02438c820d23@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62970f4b-e624-403f-9cdc-02438c820d23@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65470-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[praan@google.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0E536B723C

On Thu, Jun 18, 2026 at 05:06:27PM +0100, Matt Evans wrote:
> Hi Praan,
> 
> On 12/06/2026 20:39, Pranjal Shrivastava wrote:
> >>

[...]

> >> diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> >> index 86362ec424a5..51990f6d66d5 100644
> >> --- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> >> +++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> >> @@ -1692,6 +1692,14 @@ static int hisi_acc_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device
> >>  	if (ret)
> >>  		goto out_put_vdev;
> >>  
> >> +	/*
> >> +	 * hisi_acc_vfio_pci_mmap() calls down to
> >> +	 * vfio_pci_core_mmap(), so BAR mappings are still
> >> +	 * DMABUF-backed.  They don't require a zap on revoke, so opt
> >> +	 * out:
> >> +	 */
> >> +	hisi_acc_vdev->core_device.zap_bars_on_revoke = false;
> >> +
> > 
> > This seems to be happening after we vfio_pci_core_register_device, which
> > could be slightly problematic if another device in the same group races 
> > to trigger a hot reset before we can set this to false. Could we 
> > initialize this flag before registration instead?
> 
> Remember it is a safe default, so in the event of a driver not managing
> to opt-out before it's required then all that happens is a redundant
> unmap_mapping_range().  The default-safe was a nice suggestion from Alex
> on v2.
> 

Ack. I see. That makes sense.

Thanks,
Praan


