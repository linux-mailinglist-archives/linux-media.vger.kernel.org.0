Return-Path: <linux-media+bounces-53310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLiEExL3nWlzSwQAu9opvQ
	(envelope-from <linux-media+bounces-53310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 20:08:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0018BADB
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 20:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE558314D492
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 19:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4A52EC086;
	Tue, 24 Feb 2026 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hhWXpSxv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0940E2E7BD3
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959889; cv=none; b=q+gLT/IE4bY1BJxdtKNOsWKyWjdtQgkkFafh8BUcUUWtDmTr6NBOH4BHbvVsGOT2G2Bim/GW87GzWzeBNkQbwH8r/MyodS4+HTbsHsGZ2ZkTbRKW06ENVHlY2JDBM9okJeAOjqVAL1jn9nhHZUlor0eYBdehE0ocxsAuxPBs36U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959889; c=relaxed/simple;
	bh=qB84I5PLMqppF3pGBBFSGnCXPwBNXGSe+RrAN3wymw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAv5BEpMmrByEnnDb4/eeD2EG430yPHoQP6YlRgwEZ08/l1VnPtsnH/BmcX8mZZWq6LQGf/o4f1nRN1VGUF+f07mWuc8M1gLYjWEt2DDMbLGj/h19VVrhBabMBRXPTRi0IuEZ7+j9bFwXD+HKJ2OlnVRZv1TUW11+qwlF+q+atM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hhWXpSxv; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8947404b367so69533806d6.3
        for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 11:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1771959887; x=1772564687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FrFsN3h74aSMBKIOJ1HcZrCNEQY8luWcshhq585BEE4=;
        b=hhWXpSxv1ir9/eaqA/q2af3at2u9DKpsA+wPMsSLVEE5saF+g2dfl/wHJiG7yBI6Hl
         qsbIMVzTQiiiTWzqh4w0GpHBufH+l7JtFEOwL9luWu47t6vpjEbLWA7A5tOV1ILsCNmS
         8UC2jIKEFIu/OvW3mFRDAAFAx6OVUudcfnj4/yz0vLli8AwbwPO2PTeU3CCZ69piVSmQ
         PqUxTV1Q3xSXc4o3dTrVt8yp4gU8JYGrbAvlDPWnOplXhX18K9oTaUdhGkwZqSNUs9kv
         TkFlwGDtQ18tgny6IGdvQzTX5QUuTt5lMCBuoAHyCsIuWjUW9edB4cFHxOEsdFIkpGU/
         Gh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959887; x=1772564687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FrFsN3h74aSMBKIOJ1HcZrCNEQY8luWcshhq585BEE4=;
        b=IFAx6bTognw1lb26ZxDEGgufqVRIg8hlTkF3tAcnywkx0vkX1lh5KnY/Ur0lpEhyHH
         BKX2OQNBdpdA9zUnPfnup1lVfzWs1Eyq3oTpKbLLVamc6RTbr1XjDoXXpUoH3UdmvlsU
         /OkgvOdspN6C1CKtOlTHByzwhg4HZM6ub0LtovkAFp1tSm3XNmmEC8b8TpFYLuOrBYPh
         lF9MeTtlrpKdEXJ252WNr1lDSg5OI+plmXMepl5Hv/2/aDchyMIWIr4rEY059gypaIzg
         Zes2ZwmTvIVZbeq4U0/5mrTNWzSujSEQQ67ZLs7YUWD9QVgcTWhowh911+8NOO8kS6ID
         ez8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUC1MqSYR4hvGBWrSqbn1XmkMRpkRx/NBeKZNBPezzNiStQYyuHFxfCjpwrZoOWrrvi7MIPwQZRXzzUkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXVwGTvJp7FIW+1Ga1jjkfLJyuFnzGkiWPh4mxaYAK4/Q+nmzb
	TatrcwyEYQkXt4bpJIdtOnXMVulkgBHkqZoOJzuVc4lLuzDMmXSPwlFPWMxnBLg2JH8=
X-Gm-Gg: ATEYQzzyA9HjDkP1F/GHG7bKNidaNHysEopajB2YTVbwAXmOONRtrH540IrcJMEWA/X
	txpPu5NhNnsWvopJJg0QXNJHYxLBA4wlz4z9w7nhBB1pPg6HYY3GDzhSLA3GV9hxFpYyRLm9Ybo
	Ukz0s2Zk1yDTfpf/ptIEZSN6jSF5goUkShVBvLgi+uZlcF6ivRAJ83wExI12CpR+vCJmIjySLCi
	T1Yd8KDhOf63HqeKUgdcupTfW6ZBWZmsfxNzn8Rrc8V1ct1Dl9xh6LEh3a5q/NnO9s7eDkv51SG
	JPwL+G+GAiDq63YOP6eGdJCtoTgrKYeL1MZ4l0iGQd+DhxJTCUWCbyiIMOnbzT9WfGEY4ve+KW3
	yZDkqviofcMuLzc8rF7x0Zz6nBYxB+nwto8++v7Qi74YTBciC8HYsQnDG9nkFIoXfWyhrf2/5IR
	c=
X-Received: by 2002:ad4:5cea:0:b0:895:46e:e8a3 with SMTP id 6a1803df08f44-89979c3c12cmr199567356d6.4.1771959886898;
        Tue, 24 Feb 2026 11:04:46 -0800 (PST)
Received: from ziepe.ca ([173.231.112.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d103084sm1292269385a.33.2026.02.24.11.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:04:46 -0800 (PST)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1vuxi9-0009D4-Vg;
	Tue, 24 Feb 2026 15:04:45 -0400
Date: Tue, 24 Feb 2026 15:04:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: system: add system_cc_decrypted
 heap for explicitly decrypted memory
Message-ID: <aZ32TUEy9CB6rs2d@ziepe.ca>
References: <20260223095136.225277-1-jiri@resnulli.us>
 <20260223095136.225277-3-jiri@resnulli.us>
 <CANDhNCp94KG06P_7ivMTNA27qEM9g8ox-h3b_tZ=v6e-25xJ3g@mail.gmail.com>
 <5z6d2etfr24oscoxhk3samf2bbhtcz6hymf65cow76omagsplf@6gdaev2perkk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5z6d2etfr24oscoxhk3samf2bbhtcz6hymf65cow76omagsplf@6gdaev2perkk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53310-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: 9AA0018BADB
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 09:32:01AM +0100, Jiri Pirko wrote:

> >Should there be some global list of leaked decrypted pages such that
> >the mm subsystem could try again later to recover these?
> 
> swiotlb does the same non-recovery leakage. I belive is it not worth
> implementing this at this time,

Yeah, I agree

Looking at the callers the purpose of the return code is to trigger
the memory leak because there is no way to recover from this. We have
no idea when in future the hypervisor might permit the operation and
we have no way to keep track of the memory until it does.

It is not a great API design at all, it only makes sense from the
hypervisor perspective where it can run out of memory trying to do
these changes..

Jason

