Return-Path: <linux-media+bounces-52265-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APoXETuwhGk14QMAu9opvQ
	(envelope-from <linux-media+bounces-52265-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 15:59:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57975F458E
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 15:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 711AF3004CAC
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 14:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4B04218A5;
	Thu,  5 Feb 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="i1JLIViS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F2641C311
	for <linux-media@vger.kernel.org>; Thu,  5 Feb 2026 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303527; cv=none; b=gESQJ1ox2S3ycFcteLoyDtkCqdFiqoJRRWZFEjtuT3f6mYt5U5++z39+NoU8Y30Ng4VosDa1w6/lRF6+n6hq5c0B/h6ikAKKKReKiQqCv7xKYLdm9lnYIynHw1lW3YdA9VkMbiqWDs+KOIsdpwSK0AIm9sy0Pqepx+JtS56vbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303527; c=relaxed/simple;
	bh=r4B2Ie8qQ9e+bddAPy/IrxMyxgCLdGouLxcA6jhMbCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+LDZ8oN/DvGw1SvIw9bl6VLgy8C4rqIjT3crDV6ac9cQEnbgQZUYfR0t4iX/yuHTdkZXteIB3KHWVAI7xR+BUFqXkNlDyrqmF9SxPvWnptR+828+aA8JH8KGZENm9qOAHzhC3NVDq4GmRYFipoyH73nN0wtOxXd9Hua1nKMbZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=i1JLIViS; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-88a367a1dbbso17929666d6.0
        for <linux-media@vger.kernel.org>; Thu, 05 Feb 2026 06:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1770303526; x=1770908326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6paZ1/dfF6ZJkTrV436UqQ3Veg/Kl0esrhdcHdeVKCQ=;
        b=i1JLIViSZyg9JmiQN9fxVXsiYybSALi2vY+h68TUZ0OV/iIqVwWZRRhWt4H4dAcruC
         1i+pwaEaMqa57MqN90cVZt0MfBHW8Tj1osq2pqqmDhjT0Z7tSaSEVUKtQetugOK1tAeE
         3FBk14xY6abiw7keBtBmEImVaTb7z6Lz6UPMlPZ4nMWBFAyMHXF/zGrF2gi63Axb1mIW
         CWxS8XdzmLR3dJRWiH5lPUnU+AoTeVpLYTfg4EhmcXTraVToOqdIuU991XYnC9TCb0FX
         xQDtvL9jPqwYkvj11cK4xOgrbX8zFxsfixd+4pi5h24blIbPPavxhxs8yeCENJhoSjdL
         XhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303526; x=1770908326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6paZ1/dfF6ZJkTrV436UqQ3Veg/Kl0esrhdcHdeVKCQ=;
        b=M6eNq2K4XwSErxoP7+C943XwC1w9/k1SBFTzzpzNUN4wQXPPmTs8Og5KcyvIdsoRLN
         dq2NX9Aj2zupElHfWeYycN3xLYrqdcLMOsD3bZxHjBu1ltVRVENCPQ8EInG55m2pwg7R
         COmQEnaluASs9cyA1hblWz3qsRq70B7wJJU8dRDvTSQWsJGhLQp4DtcXrgSWZVcbJ3x3
         BvFhGpLD8cj3f3dG6QZyNO09RODUd8ZvA8xivfPE6Url2KIdeRmB3HoMSEI449Ye7rPZ
         6Y42SAm/XJKs/8ybyYSqohwTao5s9eNzuKud0C3g0mgjhosM3Pv5KDa0BeD90TqDIDNX
         0/8A==
X-Forwarded-Encrypted: i=1; AJvYcCUS/qlsVQMgXH38ITZrhcxr+MVz79F6kKO3tmJWSGH+K+ri/BPBDPuZ7w76oz7mucYJQ6H2F9PriQZcrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1B/2CXMsSw+f9QuDjROQQmyDxY93vz2aqKNO9dSKe+lw0/Vkt
	LscwCUiVAMHggNDfjqcTdzadCc3wGGLbkocQwHGhJ+B3EG6eP6HhWK0zVAuU3ee8XQE=
X-Gm-Gg: AZuq6aJ+OKaYwE2lTp2qhrSfDEbYY+Mu+Y+yNfM013OgqW/u4bOEVqYt2LdhdXCqJRV
	mr/bsvaZaf4DbXFulbn5wSJ7PQxbZ1bLVCD3sRVSLuh/76KtS9AgSGOiAxeRk/s8Letmhpw/VH9
	TEFb+HSiivL+e94sUpzEGqivycM1r7zxdi92KtXZ+AuCHu3FGBLdfxArN/aOnrZKEsqW+hh519A
	mtyP32B4sU2uIgbVed3rWRXiQYS1+i6M2V4k9+KR50Tb97mennFrD+Q7mOWFmoYHw81GGL5ZK/l
	hrhYe8BnxAj6q+JTXegqyQmqTFEqGX/6JciMlZ34VrTF8cKPZhi2/22X/3dFF76VOgZ20Ydd4Wb
	5RpXjSLtnw0x0iPg/1r+JLpmDr6eypwZM6FL+vU9LBpfPiEdd9XQjwIFxkYSWSiHJBXjSO77nM7
	+S5KvP0RS9V53BKI/tRD5R2v5OZdnbUpsRrb363WYZEMQWiTwMExa0U4U/UJzwim2eh94=
X-Received: by 2002:ad4:5bc1:0:b0:894:6d0b:502 with SMTP id 6a1803df08f44-895221eff32mr95805386d6.59.1770303526139;
        Thu, 05 Feb 2026 06:58:46 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89521bffb41sm43278866d6.4.2026.02.05.06.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:58:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vo0of-00000000zky-02N9;
	Thu, 05 Feb 2026 10:58:45 -0400
Date: Thu, 5 Feb 2026 10:58:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex@shazbot.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Leon Romanovsky <leon@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
	intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v7 7/8] vfio: Permit VFIO to work with pinned importers
Message-ID: <20260205145844.GM2328995@ziepe.ca>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260131-dmabuf-revoke-v7-7-463d956bd527@nvidia.com>
 <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
 <20260204095659.5a983af2@shazbot.org>
 <ac33ad1a-330c-4ab5-bb98-4a4dedccf0da@amd.com>
 <20260205121945.GC12824@unreal>
 <20260205142111.GK2328995@ziepe.ca>
 <f27ad57b-d935-4ffa-a65c-9f6b5d9a1f9a@amd.com>
 <1b7ee5ad-6dde-415a-8e06-93daddc9bcef@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b7ee5ad-6dde-415a-8e06-93daddc9bcef@app.fastmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	DMARC_NA(0.00)[ziepe.ca];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,ffwll.ch,intel.com,linaro.org,gmail.com,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,8bytes.org,arm.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52265-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 57975F458E
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 07:41:11AM -0700, Alex Williamson wrote:
> >> From https://anongit.freedesktop.org/git/drm/drm-misc
> >>  * branch                          drm-misc-next -> FETCH_HEAD
> >> 
> >> $ git show FETCH_HEAD
> >> commit 779ec12c85c9e4547519e3903a371a3b26a289de
> >> Author: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
> >> Date:   Tue Feb 3 16:48:46 2026 +0300
> >> 
> >>     drm/komeda: fix integer overflow in AFBC framebuffer size check
> >> 
> >> $ git merge-base  FETCH_HEAD 61ceaf236115f20f4fdd7cf60f883ada1063349a
> >> 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> >> $ git describe --contains 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> >> v6.19-rc6^0
> >> 
> >> $ git log --oneline 61ceaf236115f20f4fdd7cf60f883ada1063349a ^FETCH_HEAD
> >> 61ceaf236115f2 vfio: Prevent from pinned DMABUF importers to attach to VFIO DMABUF
> >> 
> >> Just pull Alex's tree, the drm-misc-next tree already has v6.19-rc6,
> >> so all they will see is one extra patch from Alex in your PR.
> >> 
> >> No need to backmerge, this is normal git stuff and there won't be
> >> conflicts when they merge a later Linus tag.
> >
> > Correct, but that would merge the same patch through two different 
> > trees. That is usually a pretty big no-go.
> 
> Applying the patch through two different trees is a no-go, but
> merging the same commit from a shared branch or tag is very common
> and acceptable.  It's the same commit after all, there is no
> conflict, no duplicate commit.  When the trees are merged, the
> commit will exist once in the log.  Thanks,

+1

This is how shared branches work. There is no issue here.

Jason

