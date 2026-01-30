Return-Path: <linux-media+bounces-51858-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP9zCZC4fGkEOgIAu9opvQ
	(envelope-from <linux-media+bounces-51858-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:56:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1093BB67A
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E655E300C9B8
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2623195E0;
	Fri, 30 Jan 2026 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="eIYcXAWS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5730F943
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769781382; cv=none; b=plOAfbS+++gb4w6VZr2tUue3jhIfaji65xge0WNJWEY6FApe+YkKygAqOwuQcYYJcwMjgzGiUXsEMvVdt5xIuI20LalXJsx0O7IKCyWrnhzAZp2qzyDtWXwfk9xfZ/s76us8xPxcpBNP8eI5QAmMul1p+Oke1PTU7pwnfh/xcmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769781382; c=relaxed/simple;
	bh=SL16M++KtfIb+4uJE+a/R7kOylXhnM5j4tZGOMk8fro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmMcXxlNij2wMang2+J/SXiGgllIhPTXLiyppaJ9guRgJFlkDFwOTkdeGu+hj4Nnc+nTQ7U1fbTU78FgPkjHBLvhBdUEXVijeq3m+dROJkEk4pTCG9bttzW3hATyZxrZ7i22AmLj0vbIWi1m5Soha2jNT5Bw3fTM5qlPCivs4/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=eIYcXAWS; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-894774491deso28387246d6.2
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 05:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1769781379; x=1770386179; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nHaCd4HrbYw78ScpRIoaj6AeaBJaVtnx8urFDLScj1Y=;
        b=eIYcXAWSoo1RbCh5BvSxy6AEZnoiozLBx1VBEN2IWQi8ZC19oyIWOOVmRnZzJF+1Yk
         SCC/pCL3wp5JE8KWke6ThiaLJnoP1be7LSDKGW24XvZ5Kn+ozIGNhbOhK/olKYWEHD2u
         uSe+TCKw4TcbIHEYVz4MZIlSHAcwYGMub7mqUUEn3ZYEjOyamT+dTcZCo5KOg8J9d6sw
         ANgcr5CV39slNHFiDZTsXt8wUcpjwcDmngp47QEGfM5rWOW/2zbuqcrvmM22lo8AwwHE
         4FunVydn1CLvLnxp1o/5Oz9rFQSCnwmeedSXMFIuXAXZS6xG8M2dhjxa5VrLVJI2FSo2
         hGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769781379; x=1770386179;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHaCd4HrbYw78ScpRIoaj6AeaBJaVtnx8urFDLScj1Y=;
        b=RJUrU9aOTms15/VqrsSat0I5gFBpRN1Xz8a/QRi1NytZN66/7Qo3zy2s6gKsvMbXmi
         Ekr+GMn2ee0gDXIYwZ7FNjwZlaRpVBlcifkW8ZZqf/rSCyreSaXbgxr3oo0poUXb9u9c
         ctt0OsYQ/zyVnsr6oWu8KZLNeah+uM+tB9LSKnQ4rJl/rr6PtZdmL+1ZhoU5CAmJf4Mw
         WS/NJ0yehU0qoiBjZfI9bn7zghAvJgZxYyRpp4L4yY30CEQsW4nkaHWSLByWdg48YHv1
         KquSrI+KL1PJdc2f6CIEwOug5YJuTQloA9J1jRbfv/oMLzINs5Mr+V5HlC9Utyvwu3Ba
         gWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1Dvu+h9giiLFUkQOShn2fPilCP1M5f+IrHGlIXLROz1VC2eKRgCaxsn833IdpbdkiD0pDzp5tvKg5Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/22hxxo2jk8FBDkHPIBscLjmpsR2H7kAmOVN8W8hW9OI1e3H
	n0FV/Ab+jHZeFo9F/LfpPlAgW3zOjwtUdo3yj9tAOb4FMh03H+CoQQWV0lz9y7u/7zA=
X-Gm-Gg: AZuq6aI8bKxNIsdT9hrhiZxjULnIYtfqZWZFTbaA3oAQkHt7PDM1xTTibxEMQLSE7Bt
	Ndu1CYfR2ue4raJSJOpNbNyXFyjdicqqsspm8hzohiRxrJzaknbyxX6Eya48hB2DCTxgIThd2Cm
	XLy6urjxcAaSr8n0P9TisFpxFB1u1ikzKpBLa43MeDeNqq+dK9xuMm15urCbpWhrFjHh52FXAhC
	x1Qec2Vc25Vm8Cgcz6VV9hnjUXRao1Xc8ZeXOhydQQ29LoOGyV/0MYClFS9W9RLwgT84cDP+uzi
	t2dIkSPS1rVjnz1SC/GQvtSQo5qgsXuTwPbulBCq7yI4ZslS7jG0MOArGaZHLwNxw0DcE4eYaF0
	SwXDg6Dfz8CrCyT/xvZfxjnNrCxxiHrXm5HWpb/QO1Tugc7QYAM20bvDf5whtoi4+CdRSrwXdEL
	BB3xbxUMhg50+IA6Azwq6+EMW2glxq103mzVwXqGbHSNJ684LjwIXyBGjYGzuTfKmpNai/ER83E
	t7cng==
X-Received: by 2002:a05:6214:2a48:b0:88a:529a:a53a with SMTP id 6a1803df08f44-894ea09691emr43666386d6.51.1769781379597;
        Fri, 30 Jan 2026 05:56:19 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d376da66sm59670316d6.50.2026.01.30.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:56:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vloyw-0000000AmRb-29H1;
	Fri, 30 Jan 2026 09:56:18 -0400
Date: Fri, 30 Jan 2026 09:56:18 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
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
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Message-ID: <20260130135618.GC2328995@ziepe.ca>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <31872c87-5cba-4081-8196-72cc839c6122@amd.com>
 <20260130130131.GO10992@unreal>
 <d25bead8-8372-4791-a741-3371342f4698@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d25bead8-8372-4791-a741-3371342f4698@amd.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	DMARC_NA(0.00)[ziepe.ca];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51858-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C1093BB67A
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 02:21:08PM +0100, Christian König wrote:

> That would work for me.
> 
> Question is if you really want to do it this way? See usually
> exporters try to avoid blocking such functions.

Yes, it has to be this way, revoke is a synchronous user space
triggered operation around things like FLR or device close. We can't
defer it into some background operation like pm.

> >>>  		}
> >>>  		fput(priv->dmabuf->file);
> >>
> >> This is also extremely questionable. Why doesn't the dmabuf have
> >> a reference while on the linked list?

If we hold a refcount while on the list then the FD can never be
closed.

There is locking protecting the list so that it is safe and close
continues to work right.

Jason

