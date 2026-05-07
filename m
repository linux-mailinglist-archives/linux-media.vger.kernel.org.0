Return-Path: <linux-media+bounces-60774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DnFMY9g/Gm7OwAAu9opvQ
	(envelope-from <linux-media+bounces-60774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:51:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4121F4E63F3
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 223FB3012CAF
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 09:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03D43C8705;
	Thu,  7 May 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qb6d1Z+s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8627B361656
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147462; cv=none; b=ocVsGdwubHK2yy7A2EDyKCZ9F8axfQRA0AUae8XyTLdYQYmk9oVyq6KsOYIypQNpxjJ9XeoZ7TIsdvToTrLPhFTNN9hxqd7etkcGipuGtarMh1OWjISsowiZZZQXqWh1FXWpRNf8tlzF3OjUQTTHc9IAj5Vpfx5VxpoqEiD3S1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147462; c=relaxed/simple;
	bh=SGEcwnAvvWnARcPzNzohe5P5P1OF2zid+5BmrvKQSbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZ6OfwqVDPzTjWMWgC5qrFKasXDSMQBitZw3JChf6GWULbJ1sp4dzPI9Xni0rjRRugJvpXUCkHf97hxsW4FrwQEy6k2zIwsB1CFH41w8TYFD4hv726vd6Rer1HG45rCWcyqp2RQQSY/C3oexxuWd4IiEgSIk+Bugf+OSFtw7tKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qb6d1Z+s; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d77f6092eso419520f8f.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 02:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778147459; x=1778752259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EcZwFh2QZ44n0xgSUmMbcy6iZL2QmvBbYa+KTyDF4zs=;
        b=Qb6d1Z+sFmZAoweE/gz8UcIKxryKUEkHsLlzEG0V++nPg75LSmnULTfGYSa9yVm5sF
         rHal6jM18HSYeMMBitU23Ys9nmVQqDxtvZJLLrBaIcT9E0bCVdjBZ/sXJG25qSqdSQvc
         mWHHK46kKDfvDtvrtveG6YgnLwknIkrmDLhr+qJxboC26WKWD3+q5QJAtBCL0mJfg8MK
         KHQqqHIvUc3OUtmqij4iPvzScUg1METxrzed/zAReXH0ek1hGi6/eU3ZfZxUhiKHVwpW
         RdEWeOo4qH32eZeywVzwJZZgsFxfQG4Ya+5W20Y3bLGDho8geWYg3UfaJZp9PWvsYzYx
         tlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147459; x=1778752259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcZwFh2QZ44n0xgSUmMbcy6iZL2QmvBbYa+KTyDF4zs=;
        b=cEEBlIi9iXN04ybzG8ZARHjbqV50dsvCXwhhA04PcibXgSYCp9Thij2CCiHJGVdjys
         hJT1BqhI9TshKIyv4uIBvzAy87JhqT4Wrp0QRQYFFECo1nZMvWv1Rz6d+t0tJT8CTcf6
         ff0MJijeSF5JkC2h3INOXL+ecKVZrq6+VH61sMr6yl0nHd5Hm0308IR9q/jsC8iciyYx
         DUJ2M2MKacYkYsx1wJrTIEeXoAIUg9M4GyuwHpTJYaAYxeZo3MQ++cxn3XK4tQVYBU+z
         7CQO99ExHrBqFZkad/mnHdTAcOtn/cH2Xi0xW/cXv/QxpHiYnjZmFlsh876+uVKvOsC0
         /Owg==
X-Forwarded-Encrypted: i=1; AFNElJ8g7BV+lUqJ7LIGi20J/ALKuZPLMLCjBZH57MKvUepojv+b9HvItYTycHWlesMN7P35SqEA0uzPdqNKjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvUgbXSTUSsqrdHHF3k2jSGWgXL1XruwVxWWPWCQ6h7iiaX8C3
	US9BDLUAMcOXTly+QIYa0nGL1PAxG7H1hrdqg+mSJwpJeYB8CFOipi6J
X-Gm-Gg: AeBDietDd7Zt5h261VrrvHhVmFDmH8TksSxvRlQOEq2wGV2zRCWQL+z4IYRg6/G7538
	GSncqofn/NG5WgczxMc795jhcS9m4UmEk7rA1mc0rhA0Qa7aq3Ho9B8c98PcKDM9QP1fTOXfQ45
	KXmXj+cxehyXpWaDOFF+tjSKB2SqPDd9RU7QFDGEVPveadGrB1yEMOBso46FA5jtnfmpBTIYR1h
	bIsRR+ymEqFEb5JnKaSscy1L0XqYBuHqZtWE5mGLKK1HYcK4BEThan2VtQKe8j7eK3PNT/UznLn
	7/cYtAnnjKfr/I8/nZzmXD8/kPzkE4M+bEvPPnoeIJMGfpHtHBPMSalaJJv0JDQHDOOX4jm1rjk
	3BvwrW+Z7XvlA5Dd0jsodpvDHtF/3u0hm6tzAkgqtVmwlN+NRMM81xAPEp6tWysIWoICeUB1mcK
	LTT7fPzEheyQVYxLIXP9COHHQvy5+2o3T51ZqaxYSwNZEL+mXf74TcFppyxVxhJw==
X-Received: by 2002:a05:6000:2207:b0:43d:7dc2:b655 with SMTP id ffacd0b85a97d-4515ad767c3mr12533550f8f.15.1778147458336;
        Thu, 07 May 2026 02:50:58 -0700 (PDT)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a48c04sm19976392f8f.15.2026.05.07.02.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:50:57 -0700 (PDT)
Date: Thu, 7 May 2026 17:50:43 +0800
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
Message-ID: <afxgc4hizusnAA26@fedora>
References: <cover.1777475843.git.asml.silence@gmail.com>
 <afi7c-VUJWOLlC1m@fedora>
 <6873d617-c904-45f3-bad9-e1ae39cfecd2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6873d617-c904-45f3-bad9-e1ae39cfecd2@gmail.com>
X-Rspamd-Queue-Id: 4121F4E63F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60774-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 10:02:11AM +0100, Pavel Begunkov wrote:
> Hey Ming,
> 
> On 5/4/26 16:29, Ming Lei wrote:
> > On Wed, Apr 29, 2026 at 04:25:46PM +0100, Pavel Begunkov wrote:
> > > The patch set allows to register a dmabuf to an io_uring instance for
> > > a specified file and use it with io_uring read / write requests. The
> > > infrastructure is not tied to io_uring and there could be more users
> > > in the future. A similar idea was attempted some years ago by Keith [1],
> > > from where I borrowed a good number of changes, and later was brough up
> > > by Tushar and Vishal from Intel.
> > > 
> > > It's an opt-in feature for files, and they need to implement a new
> > > file operation to use it. Only NVMe block devices are supported in this
> > > series. The user API is built on top of io_uring's "registered buffers",
> > > where a dmabuf is registered in a special way, but after it can be used
> > > as any other "registered buffer" with IORING_OP_{READ,WRITE}_FIXED
> > > requests. It's created via a new file operation and the resulted map is
> > > then passed through the I/O stack in a new iterator type. There is some
> > > additional infrastructure to bind it all, which also counts requests
> > > using a dmabuf map and managing lifetimes, which is used to implement
> > > map invalidation.
> > > 
> > > It was tested for GPU <-> NVMe transfers. Also, as it maintains a
> > > long-term dma mapping, it helps with the IOMMU cost. The numbers
> > > below are for udmabuf reads previously run by Anuj for different
> > > IOMMU modes:
> > 
> > Plain registered buffer is long-live too, which raises question: does this
> > framework need to take it into account from beginning?
> 
> Not sure I follow, mind expanding on what should be accounted?
> Are you suggesting that we might want to use normal registered
> buffers in a similar way? I.e. giving the driver an ability to
> pre-register them?

Yeah, normal registered buffer is long-live too, which is exactly
what the driver cares for the long-term dma mapping motivation.

> 
> > BTW, inspired by this approach, I adds similar feature to ublk via UBLK_IO_F_SHMEM_ZC
> > which can maintain long-term vfio dma mapping over registered user-place aligned buffer.
> 
> Interesting, just too a glance, and it looks like what David Wei
> was thinking to add to fuse, but IIUC he gave up exactly because the
> client will need to cooperate and that could be troublesome.

Here the cooperation is minimized, maybe one shmem/hugetlb path, or memfd,
and it is one optimization and opt-in, and fallback to normal path
if application doesn't cooperate.

> 
> Should we try to push everything under the same interface instead of
> keeping a ublk specific one? Again to the point that it requires

If generic interface can be figured out, it shouldn't be a big deal for
ublk to switch to it, and the usage is simple actually.

So far, ublk supports both FS and nvme block device.

And cooperation can't be avoided for this usage no matter if generic or
driver specific implementation is taken, for both fuse & ublk.

> a cooperative client, but if it's something more generic, the user
> might just try to use it as a general optimisation. In the same way
> it'll be helpful to fuse, and as a bonus you wouldn't need tree look
> ups (but mandates clients using registered buffers as a downside).

Yeah, but tree lookup is fast enough in case of huge page for typical
application, and it is simple in concept.


Thanks,
Ming

