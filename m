Return-Path: <linux-media+bounces-19770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1AF9A0FFB
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 18:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F6A81C21F49
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 16:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AC020FAA7;
	Wed, 16 Oct 2024 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="cH8xcVPp"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8EF17CA1D;
	Wed, 16 Oct 2024 16:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729097071; cv=pass; b=X76xG1xuAlatPDt1NiXWvHTRbWBfltP4NbDVAsohq9Fiq2WKxUsQVHZ5yZCSVBjGQJoUgv42fs1QfZMPhPn0/h47DpiFNP7KmkWPy4rVBEMJ5G9OZjQDzdBsQXBM+QNlO08+s/qX2xNokL5YL6WGRCqouNNkNRjzZnO3UCHx3Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729097071; c=relaxed/simple;
	bh=ojFXVVeQZGgtN6vcT6igavztvLxIzfW1jK0ZdXlv3B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wu8HelCsvz9/6R+Aahs/bqqXKvDjr4YDvu7yZXkkJHXNcd+RPjGRYPxCfmkMnSv5MQYmH6UB6eftho7SZEjjkIDiwIwaOUguLwfOnJJ9ceOq5NaypU0x+AHMZw85pS+F6MRD9vN1UFbbQ9YhL1cITvGEZPJtK5WUtK/O2aA46ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=cH8xcVPp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1729097044; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KaLJhY2x2InqoZkfO7V8PKBnIjfMnc/m/C1+rd8yCGKFAuV3VV1lNLD4FhvCYfZayeinL9h29fzswP6yM9iD+Svmg5jzEDPBcoT6D4Onn+x/dW1iQpaUwVoKvN+PxUfH4U6VHEqgKJ8hSoG6GVoqOukDgSeY6BGk/SxmzxM00K0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729097044; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E6uPqykNee58PqlLG7URU7ixNKBWZqWVJSo5nXew2es=; 
	b=EZ31NDYe5lIJZqtueZNrvUbXFw5Qp7t1Xsr224kTLms1CTHOT3p8lCLRydAj3kDQcKVuxvDyxAawYY+3bdCY2YkGo8jwQPrvABuEjGkJl9ecYuqcMJe+tB+lkmTWxonEPGCO7mDtOtl1nTEXLVbIqhclZCvAg+R4gHPFZWVMRKk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729097044;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=E6uPqykNee58PqlLG7URU7ixNKBWZqWVJSo5nXew2es=;
	b=cH8xcVPpTFTWKAjsmZzdPjYS6pWPSs9VTtGvmL2phPJvHA33ABDfp31yF+/JSnSE
	aJ9AEs2We3dkQXWGdKM7RnHHO9R5VtWYDeudTO1VmDcHc9TnmbQm4t06BcqecGDow3W
	Fd+DHNvzuP6mSXuvrysN/j/rREFdynfCr5tDTq88=
Received: by mx.zohomail.com with SMTPS id 1729097043765679.2832689445722;
	Wed, 16 Oct 2024 09:44:03 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:43:59 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sumit Semwal <sumit.semwal@linaro.org>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 9/9] drm/panfrost: Explicitly clean up panfrost fence
Message-ID: <3mkdo37kvulmticy7g5siwk3skvbg33fnrioolcgofgbakbnph@3dyq77kiotig>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
 <20241014233758.994861-9-adrian.larumbe@collabora.com>
 <94be6c2a-47fd-4157-b5d8-307040eaa3b7@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94be6c2a-47fd-4157-b5d8-307040eaa3b7@amd.com>

On 16.10.2024 15:12, Christian König wrote:
> Am 15.10.24 um 01:31 schrieb Adrián Larumbe:
> > Doesn't make any functional difference because generic dma_fence is the
> > first panfrost_fence structure member, but I guess it doesn't hurt either.
> 
> As discussed with Sima we want to push into the exactly opposite direction
> because that requires that the panfrost module stays loaded as long as fences
> are around.

Does that mean in future commits the struct dma_fence_ops' .release pointer will be
done with altogether?

> So clearly a NAK to this one here. Rather document on the structure that the
> dma_fence structure must be the first member.
> 
> Regards,
> Christian.
> 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >   drivers/gpu/drm/panfrost/panfrost_job.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 5d83c6a148ec..fa219f719bdc 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -85,9 +85,15 @@ static const char *panfrost_fence_get_timeline_name(struct dma_fence *fence)
> >   	}
> >   }
> > +static void panfrost_fence_release(struct dma_fence *fence)
> > +{
> > +	kfree(to_panfrost_fence(fence));
> > +}
> > +
> >   static const struct dma_fence_ops panfrost_fence_ops = {
> >   	.get_driver_name = panfrost_fence_get_driver_name,
> >   	.get_timeline_name = panfrost_fence_get_timeline_name,
> > +	.release = panfrost_fence_release,
> >   };
> >   static struct dma_fence *panfrost_fence_create(struct panfrost_device *pfdev, int js_num)

