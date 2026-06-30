Return-Path: <linux-media+bounces-66089-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j5FNN4+6Q2rWfwoAu9opvQ
	(envelope-from <linux-media+bounces-66089-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:46:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8976E45F3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:46:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ziepe.ca header.s=google header.b=AQyU9Svc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66089-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66089-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 360DD30238E5
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C5140E8F5;
	Tue, 30 Jun 2026 12:42:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB4D40E8C8
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:42:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823376; cv=none; b=OEk/qJHss1KJNowOYWHZqG9SNcq5Y4nlTw2PySYBR1wTxYhnsZv2EZWbbbDon7xE+w8A7LWBMrPgIDv1Q2ogU2E90sgj4y3doDe8gxBbyOgxbkIlUHa0h5Watj315nu7IXxLL5glxfNT7ya1iV8SYSABmC2XxjCFIZ6Q+A0GcS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823376; c=relaxed/simple;
	bh=QWPvsZn8DT0/Vu+hfGGOncPmT+V2i9T+xJS7wbHqZDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLkMmLs4M6ftATvfpGelnr9tHVsa/v6N/JUACVJDEK69tJaFRi3olTYrOfz4K4AQC6ZxvJjFmsVNJp+nBWk5dZ4X3TuzVlJ5+W6p+bAGmcuHRT4B0gqe1OFh8wAxtAYTQPcNpzEMvUKF/X4yPZH0zwxLvJKfRI5MCUSja4rtSCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AQyU9Svc; arc=none smtp.client-ip=209.85.222.176
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e50c5d14cso136145485a.2
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1782823374; x=1783428174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQO+LwB4rlmVUEVrQLIA/Kr74YcNiyTBCzOFtX1NQKY=;
        b=AQyU9SvcetA82WLkeROen+k6W0F5e3l9/8IL757VdeHfqC5l/eTg5b69ecvU7K+/Zk
         vX66jljRtZLrJV4TCgrpL5ZSb8/fooY7Tu4xVHTBP5AMm/3+CMCqV3nsZ9YtiFvTsdYa
         5mjDednvi2WYt2+uFBSZ7p1AMa98HBI8gmlN+PTnP7Sk2ovzsLwtzTtDf6FS53eqP8ZO
         Y4PNEd8K3+mbp0NqoAVJ4pTi1V44AOlwaWbStPtz65hEl8e+S0ecQmq8ZEpLXkVPMmZ3
         qIEb/GNUWmMHuyrhe92sozLhDWtcKwWpjWvIJsJLxUHoSvBqhNa9xER0ylnst6ppdGz1
         RChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823374; x=1783428174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQO+LwB4rlmVUEVrQLIA/Kr74YcNiyTBCzOFtX1NQKY=;
        b=ryJUYOnrmWZo7iMHoRWfYMDiSC/aeIRLUXa7mdyJLDbNoOjDpLojGTmrPUChwIoB9M
         O2clS59QaBjfu57ZUHt+bxTSivtPa5HxYKc4nmdU/Mw0b67ymEH5ABE3dey6oF2+u70b
         Vi22og4sK5SIJF51/L+JOXLaTsPJDAZtlcSmy3UiHzwqDGAQVUXDs6gSkfP8DJ1v6Yjx
         geq8GZ9w8CXgnCwWOpT9fFVagavIQK/lUKJQVRCoQGuKRp/WVRGItk9e6+k56zWQ5GZF
         5O6ZX2EVZk3QbmxGrFnBJK1EA+rslmM8A+6LTfJvL8MYRT9pepwjFbY/f0EJc+87s/50
         1/SQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RMaZi0zo3dxB5vPldsycZLxBRvKTTtIh8cPEuyJg2LQg+ZottBVU0/Efcr/lH4SvGhm3QwXJseWj5Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS5R8mEqZKHHcYkhhXNUAFf+Du4Dz/3MZdI3AhBS+U8lXd7ds8
	NPBz5tjHOhQ4juSO/trmTg2cLCvYCjZr6Pzt64WSJJGWsaL4u8oNkiLF65Qo47798Wo=
X-Gm-Gg: AfdE7cnvTcNRuYBVng/u1OtZtnO0PcaD00proSn7yx16qNYZ1jQHpS96rEPBzDXtIPA
	U8ADcjJ7NnqKqVIlyN1sJ1R3v8vB7ttQ+clbB2Dh2W3MKeTZHW99mg9es26NmYnGjiG+kW+ICAS
	yjITjdRzyglEnmGONZQcRUKSKMa4JPdwQ4Hi9wNwUq9KpIALFGCGa3BPVAM45/M0pB1X1yxbqoZ
	5DC3Mhl1WukbrRNQLAkN+Kp8wtm77G8+Y5WtUUYPRGZvboR3zaCDupU+sb3F1VNq1P0zmXLqKiC
	H48IYjbQ1TnH1+Oq6yyX66YKbqHnYKPmb45vvY55LDCP9O/cnyyI1H37yim+Dhq3I8BphOjZ5o6
	EvJWdmEVN1BXqsryDo6+dYTVztPYqWaTnf9BetdiIq7NHG20rkybibny5hnpAWt1whoL6xpRqhf
	5sXp1+u6b6YmrwybN0uByKgrwqsAFLntFab0mO42hpsOo4Xm37xVecludWz/DpfpJeEVA=
X-Received: by 2002:a05:620a:8391:b0:92e:4867:95af with SMTP id af79cd13be357-92e62af0f9amr515174185a.73.1782823374078;
        Tue, 30 Jun 2026 05:42:54 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e6234dc50sm226634685a.39.2026.06.30.05.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:42:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1weXng-00000001qgI-3Vni;
	Tue, 30 Jun 2026 09:42:52 -0300
Date: Tue, 30 Jun 2026 09:42:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Laight <david.laight.linux@gmail.com>
Cc: Pranjal Shrivastava <praan@google.com>, David Hu <xuehaohu@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	jmoroni@google.com, kpberry@google.com, chriscli@google.com,
	sashiko-bot@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] dma-buf: Split sgl into page-aligned 2G chunks
Message-ID: <20260630124252.GD7525@ziepe.ca>
References: <20260621222130.1667453-1-xuehaohu@google.com>
 <20260623015459.1153884-1-xuehaohu@google.com>
 <20260623094446.4a8fc2ed@pumpkin>
 <ajryxMaT5evDUxaq@google.com>
 <20260623235350.6540eaa2@pumpkin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623235350.6540eaa2@pumpkin>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-66089-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:praan@google.com,m:xuehaohu@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:kpberry@google.com,m:chriscli@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	DMARC_NA(0.00)[ziepe.ca];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:dkim,ziepe.ca:mid,ziepe.ca:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD8976E45F3

On Tue, Jun 23, 2026 at 11:53:50PM +0100, David Laight wrote:

> > If we restrict incoming dmabuf transfers to fit within VFS-centric 
> > limits (2GB), we impose unnecessary overhead on the RDMA stack, forcing
> > it to manage a significantly higher number of memory registrations. By 
> > cleanly splitting these massive contiguous device buffers into 
> > page-aligned SGL entries, we directly improve the efficiency of P2P 
> > transfers and memory registration.
> 
> But a divide by '4G - PAGE_SIZE' is also non-trivial and (I think affects
> a lot of io) when the quotient is always 1.
> Splitting into 2G chunks is a lot cheaper.

Doesn't matter this isn't fast path stuff. It is better to use fewer
SGL entries, IHMO.

> > Since this change doesn't seem to have a negative impact on standard file
> > I/O or break existing VFS constraints, I'm curious why we shouldn't 
> > support splitting these >4GB P2P transfers? Am I missing something?
> 
> I was only wondering whether it was needed...
> It does bring up the question of why the >4GB transfers even need splitting.
> But that is another question.

SGL can only store an unsigned int size, so any large physical range
has to be split down.

rdma now a days has code to process the sgl and restore back the > 4G
sizes since mode RDMA HW can accept that.

commit 486055f5e09df959ad4e3aa4ee75b5c91ddeec2e
Author: Michael Margolin <mrgolin@amazon.com>
Date:   Mon Feb 17 14:16:23 2025 +0000

    RDMA/core: Fix best page size finding when it can cross SG entries
    
So whatever this produces needs to be compatible with that to undo it.

Jason

