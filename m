Return-Path: <linux-media+bounces-61786-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCCMGuQ2CGpregMAu9opvQ
	(envelope-from <linux-media+bounces-61786-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:20:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C61EF55AE3C
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56EDA301E3EF
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 09:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B5A37C937;
	Sat, 16 May 2026 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9SwKdvf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4176D380FF8
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778923194; cv=none; b=kgZ4geXh6e9L0tykrtr9xK1Fc/aHWGHwr3xPqXvaiLBUH9wB7/36jo93xNeknx13cXU9MdY3rr5lMtPmPeL1gI+euUqHV8wEnudlZn5cNMAuVqTeGhPJLvsETIUr2YXhAOkRbjAQDGmupAQ2xhVYLOIe8qnwLls4Y7bYXR/pzpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778923194; c=relaxed/simple;
	bh=G1PUbCxyJOX//Tw7UPj9+qUEfRYerN3gCn9IPzsOw7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgkvPxW/Xz9/EEoP7Jj/E9V6EjERTf/dXR7m+J8TRD3j94AQdKaWvNA+HgstF3XKuQHat9q2m/mBRHLBkkQzJwYDo0PZBmgNM11V1J7O5ibIewhHRgyzYWnIFVSjmVsB3b8sr4pe0P3WT7BWWkqZFWPPDvR621kHuzwf6+7kt+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9SwKdvf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80A3C2BCFA
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 09:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778923193;
	bh=G1PUbCxyJOX//Tw7UPj9+qUEfRYerN3gCn9IPzsOw7c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C9SwKdvfUekKBUyiyNk6WQJZPr8IlNmEy29D8qKqD1ZtNIaDBvkSgCtgX/ipXvvrm
	 HAwFc2fmOJf6Jh2DPU2YDf5ZqlF1guEmkiaDRB6r5mmlsjxYt/oiTXpd1EFxyUUgex
	 ZF9Cf76Fr2rwUo6cybbmnjG4c1haUcp5U0muHbAhlKw4Mg4ogi5R8O0NA08IWDXWhk
	 GpxX01BzUE3qsuvQjWfhQJgCRImt+Lve5ENnkadT78zjSbQuftbKJAvVaNEyFmrUOY
	 U5GqaII0kibA4XCBXSyheMeEfFEq3WKk8nTOn8YeT1gdHRPvxB2p1yL+tmat79vrgk
	 a0/SO6ldpXmzQ==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9116861f004so205311785a.3
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 02:19:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+fkj/Opsm8VgphU9srahKUoBQkuSDnd9PuwxY0ZM25eYKQIlutJN2qaJecBjfgOvuE6oPIgul/nD4rBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj4fOpeS0DRD4y6OtDbBj9RgvHfimu1leUruAdWAzZv1Rfu4KF
	HLS7xN7fnFSHDWodb/on/VQazRk5Ow8TVTvrbV22pFpIdbdpUah3hXvRkhgl5x3p3D3IYs2EwYw
	nxL4e7hWXQqy3nrkdvunzSiCl98FAGnA=
X-Received: by 2002:a05:620a:4487:b0:912:c631:d797 with SMTP id
 af79cd13be357-912c631d977mr618156185a.60.1778923192922; Sat, 16 May 2026
 02:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <8ef38815-6ae9-4359-86d4-042554357639@amd.com> <CABdmKX2uwZ12kYJYPJGfWxuMBOJS=64b1GRj72tfB5D=NKM22w@mail.gmail.com>
 <CADSE00Jq_uvNgvxgPze0mEdUd+hF4-DPZkHy0KroWHZzygf4WA@mail.gmail.com> <CABdmKX3DhejYBis9htLDnzPrG7vuF3R3URLVNEbnyd61SSsx=g@mail.gmail.com>
In-Reply-To: <CABdmKX3DhejYBis9htLDnzPrG7vuF3R3URLVNEbnyd61SSsx=g@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 16 May 2026 17:19:41 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zyecY6E-=Tm4_couT7uoM9LMcFdTMUPkZAjj4zUKE-dQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lfp6d8-xrGLNMN2A36VEAHbeTkf6FHYhVfd3tCidoD4YpDVmS9DpWsPFQ
Message-ID: <CAGsJ_4zyecY6E-=Tm4_couT7uoM9LMcFdTMUPkZAjj4zUKE-dQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH RFC 2/5] dma-heap: charge dma-buf
 memory via explicit memcg
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Albert Esteve <aesteve@redhat.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri- <devel@lists.freedesktop.org>, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mripard@kernel.org, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C61EF55AE3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61786-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,amd.com,kernel.org,cmpxchg.org,suse.com,lwn.net,linuxfoundation.org,linaro.org,linux.dev,linux-foundation.org,collabora.com,arm.com,google.com,paul-moore.com,namei.org,hallyn.com,gmail.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,kvack.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baohua@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 12:35=E2=80=AFAM T.J. Mercier <tjmercier@google.com=
> wrote:
[...]
> > > I have a question about this part. Albert I guess you are interested
> > > only in accounting dmabuf-heap allocations, or do you expect to add
> > > __GFP_ACCOUNT or mem_cgroup_charge_dmabuf calls to other
> > > non-dmabuf-heap exporters?
> >
> > We're scoping this to dma-buf heaps for now. CMA heaps and the dmem
> > controller are on the radar for follow-up/parallel work (there will be
> > dragons and will surely need discussion). For DRM and V4L2 the
> > long-term intent is migration to heaps, which would make direct
> > accounting on those paths unnecessary.
>
> Ah I see. GEM buffers exported to dmabufs are what I had in mind. I
> guess this would only leave the odd non-DRM driver with the need to
> add their own accounting calls, which I don't expect would be a big
> problem.
>

sounds like we still have a long way to go to correctly account for
various v4l2, drm, GEM, CMA, etc. In patch 1, the charging is done in
dma_buf_export(), so I guess it covers all dma-buf types except
dma_heap, but the problem is that it has no remote charging support at
all?

> > udmabufs are already
> > memcg-charged, so adding a separate MEMCG_DMABUF would double count.
> > Are there any other exporters you had in mind that would benefit from
> > this approach?
> >

Thanks
Barry

