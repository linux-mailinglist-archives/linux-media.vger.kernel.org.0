Return-Path: <linux-media+bounces-62134-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP21LxlZDGodfwUAu9opvQ
	(envelope-from <linux-media+bounces-62134-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:35:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D71B57EC85
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ADC031077D2
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6184DB574;
	Tue, 19 May 2026 12:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q1qj6Ejv"
X-Original-To: linux-media@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F54D8D8A;
	Tue, 19 May 2026 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193721; cv=none; b=lKTFT/qgfYaY2ZJOyWeGaP5q2WjtvqFTb4G81rI+oqSXQ3fVA9eXK9vnYK2pVX3t2Wfsmn6UANuRHThfnS0gXZRUMKCyielsOu4nKJL389OAO1FtFSgktLeH8TyA1h8JPSAbnZUSXOUe7sqZGrvbL7V/lFIzeHmpUJIV1kKDLzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193721; c=relaxed/simple;
	bh=KzhKDF0K3r8ZFHYPz4rFLwMyhdEt83hvwqLEVGEIrmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpvYWdIUdmwgCE8wSwWThraxMfBhXZkZtPQBdmiy0nWYNHMyv5Rc4UK6WxJQsPTyueZ8V22OKM558vWqwD+L6zoOgrq80nk8eGgZ7/2OAy9PNuQEXs3KBYamQ5fI90fMh1Xb6VPmpH51uFekUzYjOcc9gYIuB/yhTz1qYd4XEaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q1qj6Ejv; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LSInc1JiWKpTsleWh0NnlPhduAwurDov6fxszzRl4KU=; b=q1qj6EjvjeOCpnV9NuMTZItkZo
	T49ZLX8cYfyOlkxGJ5ed0/205ef9CdMyfpTnPrJw4d0NlREDi558jtxp6i14+ScXOJJJeOKeAI6Ca
	c6ybN1E7zSWrAAJBgiMdxBZFC6gf/BHl9K8PjFGljUMOD377kqH85RMtSd0emtLXkLcCkCtdj8PSO
	+3Y6QxsUHJCJkZp8fwY6a7sB7lowzJocWIGcFLpvXn+T5Zn5WBPWyJtrQMUhHCFk/3fQF46w7jPnf
	7cF8vntKQ5xvdQ2a1KiK9hB1UPs/bVJjk2Y+gCy4qSHwmzjWs6ixfRlnn3wz0OeKWI3dHtddEaGUA
	1Rzx+RCA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJYp-00000005tqO-1kxS;
	Tue, 19 May 2026 12:28:35 +0000
Date: Tue, 19 May 2026 13:28:35 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	=?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 09/15] accel/qda: Add DMA-backed GEM objects and memory
 manager integration
Message-ID: <agxXc8ttEzBFOlE2@casper.infradead.org>
References: <20260519-qda-series-v1-9-b2d984c297f8@oss.qualcomm.com>
 <5e0d72fa-929a-4905-9066-6648892bef4a@web.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e0d72fa-929a-4905-9066-6648892bef4a@web.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62134-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[web.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.linaro.org,amd.com,gmail.com,8bytes.org,lwn.net,linux.intel.com,kernel.org,arm.com,linuxfoundation.org,ffwll.ch,linaro.org,suse.de,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[casper.infradead.org:mid,bootlin.com:url,infradead.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2D71B57EC85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Feel free to ignore everything Markus says.

On Tue, May 19, 2026 at 02:14:34PM +0200, Markus Elfring wrote:
> …
> > Assisted-by: Claude:claude-4-6-sonnet
> …
> 
> Did such an information source gather the knowledge to benefit more
> from the application of scope-based resource management?
> 
> 
> …
> > +++ b/drivers/accel/qda/qda_drv.c
> …
> > @@ -32,6 +33,18 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
> >  {
> …
> > +		if (refcount_dec_and_test(&iommu_dev->refcount)) {
> > +			spin_lock_irqsave(&iommu_dev->lock, flags);
> > +			iommu_dev->assigned_pid = 0;
> > +			iommu_dev->assigned_file_priv = NULL;
> > +			spin_unlock_irqrestore(&iommu_dev->lock, flags);
> > +		}
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(spinlock_irqsave)(&iommu_dev->lock);”?
> https://elixir.bootlin.com/linux/v7.1-rc4/source/include/linux/spinlock.h#L619-L622
> 
> Regards,
> Markus
> 

