Return-Path: <linux-media+bounces-51784-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA5YE7d1e2mMEgIAu9opvQ
	(envelope-from <linux-media+bounces-51784-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 15:59:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E83ECB13C3
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 15:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADC57302291C
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 14:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355F5336ED2;
	Thu, 29 Jan 2026 14:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Vv/672/s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C089E30B50F
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698735; cv=none; b=YRQI7IEnKxQyvd6JspdWP32+YImqDcMrN5ZJwM3+jwAVerxca0d9EOMLNIhsb/8r9yXc9FcyRPj9pXp8LMQ9zQqTz1PIOSRjm39drfVDMRMH0h+SbU0bbtTmJNY+pB+8/CpC4wmvh4bkGwXp2Ou+HBLoKCAL/B5pE6d7hUWsqc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698735; c=relaxed/simple;
	bh=K929Qe1UqCZl76ieO2aMPpP3RDbZ+XEIE24yDLHrmkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzECF/WfiqpixoAsEKSxwW2MnK4miNrrSWzVV5vvd31dLX2u5D1VsRejrL7TBFuboxk4rvXOuxrnn+gTRbAX5CWXnLN0FCkkmpG8eX3wcc/qIxF/wtWqgI4LfgfRXZ5Kgxys6MQGN6gqMGUTvbblsqWH5giqc2cKz5IP982skKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Vv/672/s; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c6f21c2d81so111084185a.2
        for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 06:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1769698733; x=1770303533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o4w2e3JsR9J6c+UOY9xxx12hv3SNlcI3MEz/ixg8Unk=;
        b=Vv/672/s8xBCHgxjq9LZBCAxet4jeR/CrpWOyGRXzO+uVCKSlDLDklZFsaQLQ72QjB
         svqWLOG5aU9GL3y3XaJ/9z7igiVcCX0agb0OOzQjQt49nrHbbeIdmwsd1dujDeYgF6kg
         ERpr7lewIw/eU8trh3RfQC9ClBuKQsyG/q8uhcnJ65p+f0TntHfaCUwBR6PlRM9x+rtz
         j+uTJyk/C1forQFvrgIW2Ex4xSCDmwAoD8PrfXYvac67fu5vgqXb0DXJWrTYBuKGrI1o
         9KErYnxlwzN1M5HAXJx+o5p6yP+4AaxYWGVmCHnzUBIPlZ59NiL/PUKQUHlNWE1TyrkX
         3EwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769698733; x=1770303533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4w2e3JsR9J6c+UOY9xxx12hv3SNlcI3MEz/ixg8Unk=;
        b=sCgM5SZfo+180Jy+fKvll2Oh8FrRPZngk0NRmrf6Fglw984uL0iIfWRB5HYpaYTrHt
         T7xJm2DzJgGQV3fZ1q8qpdS0D8+cncJ0xia2fsH8K7d8PEH2dDUCZIjgVL3OkzbA9c+G
         vQKF+1Qu46NlZAPFWlMq0tGCGwaXsdEAsQnUtOngEiqj3pl5xKHdonglISr57/ub/Khq
         NnteZucWVEgubwe8IFkoiYOtYcA5dP+S47d3QSLajimSkmJsORtyHBLqY7xMloWM2OYm
         VUf0GXd01S+Ab3dCZ9eBrHsjBY/O6ymqVmuwYRs6SgB72En77Jy7psz5h+JcLH5gfDkL
         XgNw==
X-Forwarded-Encrypted: i=1; AJvYcCW4F3uKtJPX+ydM7P9eHuNhB/ShvaFA+TQYoY9cQnw1llwAgn3w6p6eYP1JxV6M7m0W5SoOhHxaUzO1Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw82wfADZTIjGOElvjMlHVktaChoPVGv1Z8NAW9YCZ/QXVsnaaC
	rIDtNItuOiIJiAO7z9Flk97zb1WuYUzhvvfK2dXeDRw9azMEIsHJe4ajl7xwgaxevB0=
X-Gm-Gg: AZuq6aIfv0YUF0mnlyuBaYOGJya0nQ+9ZZzzzGfrHzyJ2MFuQ8V+e/GNHPW/QOXVTDc
	rjy5y6Z6LyqVoSVdfVGNUHcqfPwbN4xeTLfXWKM+cEAknWMLUw7aYNFo82xPncmSsws8x3d+bph
	tQSTDctTRNCtn3TpjEzcdkJhLSrmGef4Fw6mvYH0jiHdN3t15ZXSpoasFKVPSaF5+5phihBkPoO
	7jyPNMtC9Z4Jd+O/y7ARvLrfv4G5TWCRIvSyJ1nHlOeQm848rU84YK/cQyT2QApe7Q6B718mB/U
	jEzYyXkuYKmFALRsP5AYNCFNtVLvjEBS0lgx2U2QxaYdyDm0CldADjfhGMLdrBhF0C2w4agF+E0
	gpEoL+QaHkdf7ZgsUI0gLF8lmiguEf72mqufwwKjR2KaqGuJ0pBYa6O6uNjk9ShZ3lQuJl4qaou
	ProUd4V6Gwhjoo7orsiLyPkED2UazUbTCjVDCxSOB33JlS6EeX6x6hlA2N0uga5kD7VGY=
X-Received: by 2002:a05:620a:2550:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8c70b833da6mr1225384185a.2.1769698732651;
        Thu, 29 Jan 2026 06:58:52 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375c0d8sm38242676d6.43.2026.01.29.06.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 06:58:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vlTTv-00000009kfJ-363L;
	Thu, 29 Jan 2026 10:58:51 -0400
Date: Thu, 29 Jan 2026 10:58:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
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
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	"Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Message-ID: <20260129145851.GE2307128@ziepe.ca>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <aXfUZcSEr9N18o6w@google.com>
 <20260127085835.GQ13967@unreal>
 <20260127162754.GH1641016@ziepe.ca>
 <BN9PR11MB5276B99D4E8C6496B0C447888C9EA@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276B99D4E8C6496B0C447888C9EA@BN9PR11MB5276.namprd11.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[ziepe.ca];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-51784-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: E83ECB13C3
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 07:06:37AM +0000, Tian, Kevin wrote:
> Bear me if it's an ignorant question.
> 
> The commit msg of patch6 says that VFIO doesn't tolerate unbounded
> wait, which is the reason behind the 2nd timeout wait here.

As far as I understand dmabuf design a fence wait should complete
eventually under kernel control, because these sleeps are
sprinkled all around the kernel today.

I suspect that is not actually true for every HW, probably something
like "shader programs can run forever technically".

We can argue if those cases should not report revocable either, but at
least this will work "correctly" even if it takes a huge amount of
time.

I wouldn't mind seeing a shorter timeout and print on the fence too
just in case.

Jason

