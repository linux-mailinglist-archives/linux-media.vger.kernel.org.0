Return-Path: <linux-media+bounces-51796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DgJDKr4e2n4JgIAu9opvQ
	(envelope-from <linux-media+bounces-51796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 01:17:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E325B5D7F
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 01:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32861302AF0D
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 00:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DC827F4F5;
	Fri, 30 Jan 2026 00:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KA7biT7z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70823D7C2
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 00:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732236; cv=none; b=TrziuRrEQxTjcZpT+LH6Jy40+ncOxqMdiY8yJMUGy7flakpwBKhAr+X9gEICFOsz51UzVE//N2K0LoJCIHICuGzHwP4Jy6JEpLp9eoti2eeBznpgre0jTIptuPpzBV/Clv+FK4YjssB4ch2mXhThBpTBILPFYBXWDO+UqkX2EQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732236; c=relaxed/simple;
	bh=PgxWXxtJeqUdvgjP5KxrfenUWVrCXmnl/Ip3hY3gzr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHufKybpIwYfcUotPTv1PI+x+pRazx2R8J9Gj+dT91eg4okioE5LCf6PlLH5dzdoRSn+cE5Gj0K2/E2zQKiMgJM1Z/rWmHBW7iH0+sRyo1MYrP5/N68hFxRm7GcONLIBFLsRBYDdix4m4cVW7WoQQY6wkIqXogvGot+JxAnjlkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=KA7biT7z; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50146483bf9so16970411cf.3
        for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 16:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1769732232; x=1770337032; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JQnCcQDZjp9U0R1Q7JCyNDeekOxxS8phMo1p2crcsis=;
        b=KA7biT7z2WPIJqn1yWtupwtFpuiVSND6sCJuDPiqtvlV/udtpzWhHBdHKHzdXfdrt9
         s5ff0uj0MnRJ2qUUQNgrd0lk2LV/u1TJUfKQTbzPIGnBZoQoPXVw92tOcr4jJ+o6LTsh
         pmrSmwNEYgAYmP11U4AzdudTpUbSJ/6lGl2fTB0tpVVeZ5pwjPdB10zBv03zrqTMm32F
         XRxwdujmIDrabfqlhXdKEogyduDcZ/LafEpZu5i5+k5xCZIZggCdPOPnVishQAaKjj5E
         KENQjSUQFCVdWDnSRyM99hu8FmY0ffQviK954nkYYxdhylaquDPwhk4OhuIA+A5fqMJJ
         rp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732232; x=1770337032;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQnCcQDZjp9U0R1Q7JCyNDeekOxxS8phMo1p2crcsis=;
        b=Be66X8Axk61pA9r0LYMhl5oSgiB1IgnaGmWuScxpsKggIhp8HbMrODz3Qfht9n3mJM
         Pc9VKcm6Fyk25Opkkm+aTj7s7tHS32SKh2SvrhKI+K6jbLM4X4tRqxmuD2359gABVokf
         RSdgrGk53Jut85WgTne7qWS555RAsbdIKPNr89eyTH2U9MTuKlG+Fp8yve2oXeazCy5f
         ZOQtPWj2aOWj5A2YnV/19BDdjGsPhC2jcl+86JSGLSkiQ2zTXzu2dZyXiqm+L4wlai7p
         BmEWv5S8w+IHVGNuJSgCZi9LzKz60hH79FL+VLjaULA1fJeVQClOHXYoRgpwWuUvUMf9
         lPjA==
X-Forwarded-Encrypted: i=1; AJvYcCVArQfIzeppWd5oOfcTqILi2LW2ixD445alDPRPS5gDGyN7nmzmffduohoKxubZ8/zG0gCRsgDdzZJfmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+iU3yIboVE7XOZhXzb70R//4VYy2FsngdU6XK79PVK0J1Ity6
	K9u2l5zvPuHHbFGe1sTJuGDsshGruw+AyvyiAOOl1eFJRpb0A+dNfsbrcvtC8YsYzvg=
X-Gm-Gg: AZuq6aJX00xeZvPjKhAsmePCxAN6daP44MJ5ZkV0N3V76cm0Kyo44tzKa9RBcoExxKf
	GIzogPghtMfmNGTvVf87jBXOtGV1UMsC0oBdcKcQRnC2nXz/s3AG8wgjHZP79GkdK6bsENemEHZ
	1BHXM1+uXQa2LRcDsHD9gJolNOvnRHbPk3pW93L/8xZbEDRZIXaOz3dAB1VY+N+J3MCkpf/V+Yn
	TjIPW9MYBncvZaQ/JcfyDFT6ZrS0vJPJXK7E4Pk/HkO6QcZxgrpSoL6mqU6NCK6I1qocLosnr1G
	xLZkNtp+LQUsS9ZqwS3XvztX5Z9PTgJWATZ5xmNf0e6P6twYEYqlT79YZMo1CGTPdyKknpXNHGY
	Xf+LncBVzP+FmPHJ8Whl8EmuwW6lcJc0L8KOAbYCB/eBPDMeJDNafk+J4j/rcQDIgPdADN+mM1z
	VuBAnSMXPORdrvwHZxVObAHrYsvnJbif2Vb8EJBrdIhSqM9ejUSuZCbizIdiiJ5AUBoqC+PB5kK
	vn9yQ==
X-Received: by 2002:ac8:5781:0:b0:4f3:5f7b:cc1d with SMTP id d75a77b69052e-505d21846b4mr19549181cf.34.1769732232444;
        Thu, 29 Jan 2026 16:17:12 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337cc19d7sm45008611cf.35.2026.01.29.16.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:17:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vlcCE-0000000AQZD-13C4;
	Thu, 29 Jan 2026 20:17:10 -0400
Date: Thu, 29 Jan 2026 20:17:10 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
	intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v5 8/8] iommufd: Add dma_buf_pin()
Message-ID: <20260130001710.GB2328995@ziepe.ca>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-8-f98fca917e96@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260124-dmabuf-revoke-v5-8-f98fca917e96@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-51796-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,ziepe.ca:mid,ziepe.ca:dkim,nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E325B5D7F
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 09:14:20PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> IOMMUFD relies on a private protocol with VFIO, and this always operated
> in pinned mode.
> 
> Now that VFIO can support pinned importers update IOMMUFD to invoke the
> normal dma-buf flow to request pin.
> 
> This isn't enough to allow IOMMUFD to work with other exporters, it still
> needs a way to get the physical address list which is another series.
> 
> IOMMUFD supports the defined revoke semantics. It immediately stops and
> fences access to the memory inside it's invalidate_mappings() callback,
> and it currently doesn't use scatterlists so doesn't call map/unmap at
> all.
> 
> It is expected that a future revision can synchronously call unmap from
> the move_notify callback as well.
> 
> Acked-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/iommu/iommufd/pages.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

