Return-Path: <linux-media+bounces-62621-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPBuJ2tcEGqDWgYAu9opvQ
	(envelope-from <linux-media+bounces-62621-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 15:38:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4395B54E1
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 15:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AD233175E31
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 13:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C963A960A;
	Fri, 22 May 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IfFSm8Bt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6153A48FF
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456164; cv=none; b=bF5w4n+j04nav6D7BiDlL3GU49eD24fchQFlE5n0vitsA2m3VJsE49aM+ASvnNstgfiTWvboEZo4Ir6Z2xgToG/AUPlKS5G17IStROkarCU+aoKL1zP8zb+YpGAGR8F4h8P8Kx/g59tZ8xCX7W/VJ0ueH7eo+0HsnlUjGpKoInM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456164; c=relaxed/simple;
	bh=iQuBEkHkP60iYe92EnrAsVFZKioHOoQ3fMLBNw/bYhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCweD91rrsccHJx7S+y5RU5Bgc09kElXymSm+beNNXrmSgFv5tEh8Ut4rFC47r1FY7NWTwADcaXl46KVPI03WgH+rBSjuPGAU15EXqaefyRkwHr0QcS1nSDZwBMTS9B4FvaSDkfo6iUh38TbzO+8nLln4HKR8gZC9Xu7dDPC2ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IfFSm8Bt; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8b74b460d77so98138276d6.3
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779456162; x=1780060962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQuBEkHkP60iYe92EnrAsVFZKioHOoQ3fMLBNw/bYhY=;
        b=IfFSm8BtUnwKMSCRInVmdAzyhPsvutl60hjnduIT1oYMpqdcB3hYFAmiN7RvVe5Pza
         4fhvfA7iaCjHrnkiS+nltwu0mozzEfEjjNXb/cUsCbHmadu4EOS4HHJk4wERau2Bi3+O
         bp0wVf0XWCdJ2mXi4qyvIFehySnPn0f1eNurHrtn23KIsXQBOhgBwTDLFul10iwhv3WG
         JFlxmdunahKCmUf6xYRjWAoy7Xuki6afwA7ZXpk120ogI92tYAGHUfXFS8SnCVM1YSxA
         r3N9uIPXLyvhGPVD7Y+fHzjO+FQhGQAD7VTzN4bc5FZNkXzrn12tAgUM5CPQTq/K6b2y
         MQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456162; x=1780060962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQuBEkHkP60iYe92EnrAsVFZKioHOoQ3fMLBNw/bYhY=;
        b=AEWwMss/uMpVTtj0A4gRUVq6B2zceEFn24RdevRFuEytqy0/hrFtk+HUQSargYUGLC
         me3TXAIvriBIirkvEsbHjQYCLOFQmKSJvJlY2W4e3bd9TKW+hCJN3xI0MxMMnlywGpmd
         FhGJsQ4eePKq+C6Q6U3Vtbch0wob7t5+HlsM0Rm+xVbpaqsVTEc2PiitTNVS+YmDNxRw
         js+HdMMuxsC5Jf5p0MLLGhP+GFJjQm2edqr6EP8JzJskt1a6+vwHJooWl0VoBZS52sGQ
         1v1pdVacNFdWAlq+ml3S6sEqnCnobs76+jXfI6hVCdad9RDedSAgoaewPt761XxIzJWH
         AjDA==
X-Forwarded-Encrypted: i=1; AFNElJ+4hefg26duBaN6Y8DYmi1a+1vyvsvwdguOBcxsbluRziofTRw6rrNs4VdXwKTngNR5ssrOMyYB5Lakfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKnAAS4bZymu3EkIzn+R7hWc4ws5pLinn2iPRnn+PDEIQBJErF
	IxGqAOxoQN5shT5Gke/XfRAxeuyWHkE6LXy5riQ17ODmwF7Omda6CGsR+lNRoee49ek=
X-Gm-Gg: Acq92OGtLfsvxYfWsAYr/iiYaGF2rnqhJVUGbWYEVY23ZRyDXF5oj2+9fO5bpTQq6Aa
	5kzp0hUHYlA1C14UgbvhDfWBtlBKKSKt2qOwISIl3LA5lZ6hrWl7fG8loTxqE8m3riuD6j8abTZ
	8OKohXQ23xSbC9390Eiz8ixqZULxNKERoGa+VR86rpaeT4fJ1XAAKfJM7H30iApfjLlke/6YAix
	rq8GK8nja0ONK3XShrmfcL+rgOaFfdTLiv6LERREzCKx3cFd11MpTECio4SAt4L/kjN5r3KYe1J
	3Eup2bX+74YNCBGBVl68RVHwfPRmhNOfnxrpEppY6cNLCraJ/KmIpiGttM2sILLRYkx7RKwdwYD
	yVkrDvtxjdAc2uyxghkmKIBG0RcsAsBwrsn7Ij2oCtSOndt+URgmoADn8B7Ptq0T51Q8/lx1qgU
	7JkS5ZRMOv8r8itWjnGaHzooE+LxLxupPu15L9oudvonvkVEWbfc7u86lHREwINlz8W01WSRN0E
	1+sVw==
X-Received: by 2002:a05:620a:a2da:10b0:914:ba0a:b62 with SMTP id af79cd13be357-914ba0a0df1mr206635885a.49.1779456161602;
        Fri, 22 May 2026 06:22:41 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914bb8c7dc7sm116726285a.6.2026.05.22.06.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:22:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wQPpo-00000003hPg-2B15;
	Fri, 22 May 2026 10:22:40 -0300
Date: Fri, 22 May 2026 10:22:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
Message-ID: <20260522132240.GD7702@ziepe.ca>
References: <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
 <20260421121004.GA3611611@ziepe.ca>
 <yq5aik9jcpzm.fsf@kernel.org>
 <20260424225514.GE804026@ziepe.ca>
 <20260426130531.GF804026@ziepe.ca>
 <yq5azf1s6aic.fsf@kernel.org>
 <20260521175420.GA7702@ziepe.ca>
 <yq5aqzn45a81.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aqzn45a81.fsf@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	TAGGED_FROM(0.00)[bounces-62621-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2A4395B54E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 10:09:26AM +0530, Aneesh Kumar K.V wrote:

> Can I convert this as an independent patch with your SOB?

Sure,

Maybe you can ignore it for your series, the intersection of CC and
P2P is non-existant right now. HW doesn't support it. Make the DMA API
follow the design assuming this patch is applied.

Jason

