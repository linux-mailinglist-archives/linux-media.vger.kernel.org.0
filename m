Return-Path: <linux-media+bounces-60311-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CICqE467+Gka0QIAu9opvQ
	(envelope-from <linux-media+bounces-60311-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 17:30:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A424C0B31
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 17:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 681E13008C04
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 15:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F313E0C55;
	Mon,  4 May 2026 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRCydiHt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6545C3C2782
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777908617; cv=none; b=Goc091VQ/yvGGRmQjpejXe6pS/GrbLyMweVN3mP7Zp+aGdC4ctillXyyTRuXMyaReUUqqfuidyyp94I/BUrqmgEoRfZZdUljVJpJ6YQ8hgoecpO2V4QhpuQYQi9buSIJll9LH4TCcCQb1pEcegg9oushvTVOlzUvsFxiOPfgPUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777908617; c=relaxed/simple;
	bh=6QwUQCcZs6tvnhRhV82Gt4iwhALrIcfYYBRUBpS70Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rl6p0gUqxibx7tIPeS8hmm9jEaSyNbFvNxfSF7VLbEXtP6nmghkOueZyxNW/rxIbaQoYamqp/rTOuvH3LN7wjJeBKTsbrR4Rd6fwPtwjo/wvDm7vrhXxO+lskNES1rC5CghiSzJ8tZc2gAFMebsjS0TOX9LD7Nllew6wzwaM9T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRCydiHt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso37470075e9.2
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 08:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777908615; x=1778513415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTReAJBRtrEN050pOinCvG1qLugpFlFxRiDBF5vEgm4=;
        b=KRCydiHtndzdGf5TkyPWPK008OR44tmdTzRSw2JTkci3b8zxWdo6LUsffiYnvHOIHZ
         byvbAFU+RxD4lCtq0X+S2IM4H0QbB6OZMCBxc7pin9y6EX+SuPXA5gMhhWyeXfpWAAV2
         Ks2/rvJXblg6QPna/4dBmIaDduBtVsMUv7M+b8K74EgNRC5F6jdMSS0X6eDO4NIB2O8E
         FByWC3qNVSk5GNL8bwbGWbQyiohl2FuRsikc2DbQXJqAFZMniHDWsJjhrCZRbrQpJSz+
         eFYbBUm/AxpKp0NDVg0mO4O7XcgZ22nVwUnW81OZx2sRwS1e6QUjjoB+WkcRsrYrQtxs
         dBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777908615; x=1778513415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTReAJBRtrEN050pOinCvG1qLugpFlFxRiDBF5vEgm4=;
        b=Ernt1Km0EVNl8UFyc6kuVD91fayu8NKKdBZEgPut6tAy4aQ/IDIiOoYLOV7G8WZDij
         ggyByOJlmIOyqzP/mkcbbCvE0VFbADAkaOU2fSbffDiZlK5oN3uOcUpkJbT/OKTzjNph
         i5oIf9HJC8wYlfgRsHNScwu2zAvfGjHKQ9SJmbp0wiIjTZBtL1ugKD5fFIHqgIkEAZp/
         bdiMkl8C9ibB/3t9cmfkl5yoAET1xQeBTfn336Il6vGVLebCN8vQ7YhHdmmOzvBRfMqx
         aynbxKRIzjx1V1ySVuy6d5fEEyaOwRsj38R+UT4AcnqYs55bm1ARh5X2RLyX/wkMZn+5
         5ibQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zsb5o5ddhub5k0wfWYqqOb7BNJTxq+gpEpWQN/VR2y61KQwagTJE3rHgfSZCh3d31/ZYaUwrFdEuxHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaNkFW60sm4VxYqQnsV0e6RqSlIILMkrGSiPLYHFGHzT/21GeZ
	LXz/hKxP5UZGZLamwvcEfQRdoAI05E/lbfiFGXvebCrvTqeiIr3M4+z0
X-Gm-Gg: AeBDiet33PJbswHdRsEUmwaa12ToXHyNMTbpEGITt9QTlsgpo/svJBDDWyTUv1bl9YT
	+6vX3Sr5lhAcfR6e6M2zw6ikkLyML+B9N/eIRzg483b37cyfCAxz5mpU04nQBHoO1q7MiYGRB+w
	+nNNebW+nOdalE03JrF9qW+6ctJSGlJ9MVJv4ie59rqY+hQibAENlp0VrsUjsS35vVftdeX1gAF
	jFZ6cLNp+3npi0Z08HFhmoppDsdcxZAovgWIdrAdadfu2kL6Xv2RvgHbHVrB0fuNEJ+fEOtPMSD
	GgWQgFDR0ktz2PpwVZCSEXsK41tdftomY7yDh4dtIIybuwgMtR3G2Xaq7OIM6dWlK5w5QrswaI/
	sVuDIa8tja6/d/4RuDgRpTcL1T6Rxl7aACfEcTYA9RHIT/Nsj4YvQfNVgSpxGb/QXmz+qX9sCy2
	u0t6BNysnA2ERkK4fV8+V7+EYig+RAqssGCTVtZaOu8L9hUHcm2Pv9vqcnEnL6H/fSCNISgNgjk
	/7mQ8PzLxZ56OH70tmCJnjt
X-Received: by 2002:a05:600c:4f91:b0:489:1ba8:5be9 with SMTP id 5b1f17b1804b1-48a98676b26mr157938505e9.29.1777908614504;
        Mon, 04 May 2026 08:30:14 -0700 (PDT)
Received: from fedora (185-147-212-251.par.as62651.net. [185.147.212.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7cfd2sm25250825f8f.2.2026.05.04.08.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 08:30:13 -0700 (PDT)
Date: Mon, 4 May 2026 23:29:55 +0800
From: Ming Lei <tom.leiming@gmail.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Phil Cayton <phil.cayton@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 00/10] Add dmabuf read/write via io_uring
Message-ID: <afi7c-VUJWOLlC1m@fedora>
References: <cover.1777475843.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777475843.git.asml.silence@gmail.com>
X-Rspamd-Queue-Id: D4A424C0B31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60311-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomleiming@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 04:25:46PM +0100, Pavel Begunkov wrote:
> The patch set allows to register a dmabuf to an io_uring instance for
> a specified file and use it with io_uring read / write requests. The
> infrastructure is not tied to io_uring and there could be more users
> in the future. A similar idea was attempted some years ago by Keith [1],
> from where I borrowed a good number of changes, and later was brough up
> by Tushar and Vishal from Intel.
> 
> It's an opt-in feature for files, and they need to implement a new
> file operation to use it. Only NVMe block devices are supported in this
> series. The user API is built on top of io_uring's "registered buffers",
> where a dmabuf is registered in a special way, but after it can be used
> as any other "registered buffer" with IORING_OP_{READ,WRITE}_FIXED
> requests. It's created via a new file operation and the resulted map is
> then passed through the I/O stack in a new iterator type. There is some
> additional infrastructure to bind it all, which also counts requests
> using a dmabuf map and managing lifetimes, which is used to implement
> map invalidation.
> 
> It was tested for GPU <-> NVMe transfers. Also, as it maintains a
> long-term dma mapping, it helps with the IOMMU cost. The numbers
> below are for udmabuf reads previously run by Anuj for different
> IOMMU modes:

Plain registered buffer is long-live too, which raises question: does this
framework need to take it into account from beginning?

BTW, inspired by this approach, I adds similar feature to ublk via UBLK_IO_F_SHMEM_ZC
which can maintain long-term vfio dma mapping over registered user-place aligned buffer.



Thanks, 
Ming

