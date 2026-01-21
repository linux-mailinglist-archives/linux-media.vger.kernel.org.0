Return-Path: <linux-media+bounces-51268-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHiLA83mcGk+awAAu9opvQ
	(envelope-from <linux-media+bounces-51268-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:46:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A55C558A2D
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 51E237231A5
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3230D48C8B1;
	Wed, 21 Jan 2026 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Jze1fF0Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B075314A95
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003992; cv=none; b=OHAeZMYjZ3/CiHAEcF+5xzUJhMlV672byXtAdqRVwSWeoZ/fO7TLlQqBCpLlzt6+P8t+cEoEwkE7ul/mJxm5IWEZYfKMi2oXNxpmlsF3Yi/4GMWc/+6CKOU7cWTa+bufZUTe3mjuEp+NhGSoPkMDF5HkBrHfGLF1xMULH7CCRoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003992; c=relaxed/simple;
	bh=tR+AFnMPEtzcHlOQnrldwGxBaKLMhAwLG9LVsjQDN2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jK2IU0rwsSudhr804onnrcyhN578lGxi8ED4XQF7LRsT081RnH0ImR7Hk6tuIca8vC4slZ6X2qvErF0Ho0kPB8AbwA3hwUiTm+yDo7zsf2bjB8s8z4PsEWqvv9lQb51hC5csKI49I5YAC0d3M01EOshADote66Tsz5I6fZAh54o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Jze1fF0Q; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-5029901389dso42948721cf.2
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 05:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1769003989; x=1769608789; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NrFwAYZYjJdV2hWLBqDeijXZcUvvrfRZB3KhQxPCGpU=;
        b=Jze1fF0Qh0XqI4BuP54hDc4hfELdDetpltdtEDmBXNzTnuSGNNQVroYyi9QrehQ2o9
         4PoUpTuwKH0WFeXOtdWPP5cSMSEplNmxiH+jdQS+EI+Kyarl3xrrJlpYkMYwv2kuaWPt
         ZV8Ff+4ClFwnu45Xff3eVIaffTmCx/lCQwGQUrSH7Y0Npj6TbtsTjjjVWFNKiHOySOP4
         ZaJy5GUCHmmwvgyyugkTYFGvW4Co8LSNP1BN9pYmqtYi7m1exostNPSVMF836p/0m79j
         dNW7ByNav3nois3lD6T0pQCM0sOhhfAOr+N2WiKOCtyZq+xysFKpplttTYfq8WRty2NR
         U7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769003989; x=1769608789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NrFwAYZYjJdV2hWLBqDeijXZcUvvrfRZB3KhQxPCGpU=;
        b=P+AoOZ9zoTE9gZ+3cTBG3h6mmQdo3gcQCG5N0/mMbC7NVGI1dEikBSyj94JqhGGFF6
         9W5uIdBrgnNbqcK3fwVhHhg08828MJIGpT3ur1UJL1eQxdASc0Syp7T7wDKUTdcrpr91
         Rd2P/Ifk3Dme1gg4QvNMSrq5iaTiWLbPBT0eiV+V7CXnqQQGmKD89jXoME+a3Rc/XrIY
         HxrIKPuTm9dzCCJVIjExrGYmOwiV0RxQAEfpasvLYhlqjbZb9hSx4TA9O/U+ApVqukiu
         T23Dk1ivH2K9cw8OBkhFpJfef16cDBb96gkZSkp1yl/y+MV+2drhbv2tLi6Df+zKm5Kk
         xB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCxOZ71GMDmrYywd1ScKOrO2zVhRNgKBSeuLn1s/cRKvnsdjh9EEwWsVQAXSy4g2+7wk59ejPdIZ6ICQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPDGUamzHFB1stVl1VJX9i+4CR0RoRxGLv7le2hFl6NvRUy3HN
	3lIAisoiBPpFuP2jdqlBIs07SwQAsVssShWgPnYp6/Tnf1GHwauYOQ2mvSmPsveuNS0=
X-Gm-Gg: AZuq6aINVixGZsX+bn6pRZmsaRyNIjmtzttRhHzOwytdiAVJG1MwvkYzftZ95J78EL1
	R0bsB6jDrP3clJTU48/f1ln3gV+m5rGCU1lxSaPdGInWzuKG9DIH5dI5TsY1eQ79fP9piwKaPDE
	2eGlVok2WOCAX2slZXCPIU7RaT1s534eyyOsxJ18I2LttEHaDHJ33p3VErcn3hwT06i2r3LENII
	afwIYNxSrbwZ7lHxOKRpfs6LpsB4Rf9ZtkjCdNM9vtcVACt9V0JLc0Jmm5aDV0CZr/yHTih3u61
	PiZ/NtrilsdIz1dUt9ifdfFVp1JM72La1eR5NPJ/32tSd31rNxfgzMnajY+fGysfRZ81w3uzblD
	+Inj8zLYC81f3D/2x66jrYN/lumAMHTFPPeR7vmvO76gtUR9yAiCgap3jHnPp3nQhwS+vROrvzd
	MoWpGIsFBTgTZFZcNSeKkRaV62+I23CPypcvXntbKY/GEIKCIPTSEy70xLb5DZnw/FDzY=
X-Received: by 2002:ac8:5d14:0:b0:4ff:c5f7:f812 with SMTP id d75a77b69052e-502d855fe29mr65972911cf.38.1769003989233;
        Wed, 21 Jan 2026 05:59:49 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9f480sm113423091cf.13.2026.01.21.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:59:48 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1viYkO-00000006E8Z-0XjE;
	Wed, 21 Jan 2026 09:59:48 -0400
Date: Wed, 21 Jan 2026 09:59:48 -0400
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
Subject: Re: [PATCH v3 3/7] dma-buf: Document RDMA non-ODP
 invalidate_mapping() special case
Message-ID: <20260121135948.GB961572@ziepe.ca>
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-3-b7e0b07b8214@nvidia.com>
 <4fe42e7e-846c-4aae-8274-3e9a5e7f9a6d@amd.com>
 <20260121091423.GY13201@unreal>
 <7cfe0495-f654-4f9d-8194-fa5717eeafff@amd.com>
 <20260121131852.GX961572@ziepe.ca>
 <8a8ba092-6cfa-41d2-8137-e5e9d917e914@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a8ba092-6cfa-41d2-8137-e5e9d917e914@amd.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51268-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	RCPT_COUNT_TWELVE(0.00)[34];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: A55C558A2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 02:52:53PM +0100, Christian König wrote:
> On 1/21/26 14:18, Jason Gunthorpe wrote:
> > On Wed, Jan 21, 2026 at 10:17:16AM +0100, Christian König wrote:
> >> The whole idea is to make invalidate_mappings truly optional.
> > 
> > But it's not really optional! It's absence means we are ignoring UAF
> > security issues when the exporters do their move_notify() and nothing
> > happens.
> 
> No that is unproblematic.
> 
> See the invalidate_mappings callback just tells the importer that
> the mapping in question can't be relied on any more.
> 
> But the mapping is truly freed only by the importer calling
> dma_buf_unmap_attachment().
> 
> In other words the invalidate_mappings give the signal to the
> importer to disable all operations and the
> dma_buf_unmap_attachment() is the signal from the importer that the
> housekeeping structures can be freed and the underlying address
> space or backing object re-used.

I see

Can we document this please, I haven't seen this scheme described
anyhwere.

And let's clarify what I said in my other email that this new revoke
semantic is not just a signal to maybe someday unmap but a hard
barrier that it must be done once the fences complete, similar to
non-pinned importers.

The cover letter should be clarified with this understanding too.

Jason

