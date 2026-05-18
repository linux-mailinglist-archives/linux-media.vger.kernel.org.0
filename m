Return-Path: <linux-media+bounces-62056-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIyGK3ujC2ooKQUAu9opvQ
	(envelope-from <linux-media+bounces-62056-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 01:40:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD8B575107
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 01:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E6B43051284
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 23:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB3733A00C;
	Mon, 18 May 2026 23:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aX+kKzUs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FFC3321A7
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 23:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147564; cv=pass; b=RIyJRdLF475DDcCYlDqSgdCnaEDXKz0ppYdvuf5LTkae2XQc5UhZJpF6dwCqpjCKGJIDGrWwT4QGWXE3nZIALfMCyz0g1SrWhdyyzXjIH0+79BQfBVUaGAPL5fVxsD34sJ6XjejiSphfCKppR7+/m1ufNwow+XkLA3F6xPYT0cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147564; c=relaxed/simple;
	bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpmVM6Rj7IiYGkDm+Z2KM8rZjsSz04yiJ+/0GVv+1SO3DG/VA7rYedQcQfalX1ILLmOKEa5/EB0GnzGXM4pjnTvRNnjGdfVcwkJRskywYPti45elgcdToEBYGxCvuqVYU51PeNdJyxB66bRWefpW3XoG4yGLAinhCZSMj5lPq7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aX+kKzUs; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so775e9.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779147561; cv=none;
        d=google.com; s=arc-20240605;
        b=T1CzIAiPbOzF07pKC+h1h/UsQB27z1DQ/qAaCfASGmq8qK8NKd7sx5Cfc0TRQEdOo2
         /hzvLvQk1xuN/7WDYG8aO1IeAZ33oxPzALbLPSXWnS7Tw9iL+34iLpISAkSQGj1uh7mA
         pJfgYd7McphOWQFlXaykyEZO+jQsXhMwzpagV9QqsHy/7jtjivEhwEZEVBvm4PHjrTfL
         on3j6fZNHT23gnVi5H9khKTb6niAG406Ikh5WN1cADuuDb4RC2kBAnJlq81Inw2kpQcu
         XyTNCL9ciJzhf+ef8agr047s+D40v6dhXtrssqwf9X12QKP/a9dQoNlpbAq17yGFIuqQ
         yNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
        fh=qpLGOTrazo73/AB2+xbSyV5cNH03R54BAkQ6kBw9510=;
        b=deH9ya0lM12AQT9zWCoUvBTaEi1Y35d/JTcgkYdOmDTx4lCJzO3CXsOwN7LsyLfaZs
         bfPfeTjB1ZMHw9AkAC/BrxT0buLxHkTA9Lf8etsf2TYVTLPX6LyjUgmF9ZPpQEIpoXdN
         d78FGhlvt9ZV2jRmIZqpXcyiF8tiExZlK1fi+KO4EPZGj+vTsPtgfKg9C5G3PPZRbEro
         1m/ZB1WQu3weKTMcSgIlOyP+Iu8ORDuYCrx3k5BEOtUeTiDusv/7AxA+FCHE8b2Wr48+
         y9Ipx2GqEEiu6b7uJXNMr3shRk/C98X6G7n1J9ubYJR2hafz4Vnk++2BaojvIEPLLxwB
         HJEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779147561; x=1779752361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
        b=aX+kKzUsboVSf1MSKClDtOA3TnfKk+2f/C6h/5nyVGbD9QLjyaIW08h8weErzxQ8CV
         K05jrB3VojE83yb+c2TIiJHZ53CzjtK3vhBDEYgkBJbzrecfWi1eqaiES6OCvMAdd70f
         6VUC1A6T4JCWF/UBzVx7hx02iiKtejtlhO9uaTDWQJMQaUDhf+7nzaNcVT+3s0e2QUgS
         GSnujKQ3COePTRHcxTBo16Pc/2bGiAVoDMzg7hza8br6DAfoYb+m6y62mfnRfGopFZgu
         1hCCXb9CCP+V63QbmI6ny3ZzWqx7jKpPC9Uc/dskvKKvJmtPSyszZdVulhdG92zpq2eO
         11Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147561; x=1779752361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
        b=tYYLYvimMpMTb7IvhYfN9R6guaezvb7khRXDjVeDYx9roLWSRtNZ2aAof7Wjb+q1r0
         QxnUaCnTxLZKPX2QhNWu+6kHtfSxJp/1R/dNKxnbclthbc1lWwivoFGzvFn1kjTXSAbZ
         Ze+1xQeOq5kWTOp8und0UASNpXLh1eDXB8IsowKNIvMEHteixW7PiT91IYYCi6J2gqws
         XoizSgzzWQQ/nl4LwQele818nZABUtbJUQJ/1A92kC590f3M5K7Nw79BWNLTVYwunSIJ
         0XkfPaFgwECkbrYNOJc5SJ+9aJy+klLUt/E1j4BkzzfzHavWsP4tYaB5o5FXhPOeMQuq
         w95g==
X-Forwarded-Encrypted: i=1; AFNElJ837SmAuwZSnfIqAVyQhO82qa8MiAl5Mv2A2o419YqC5a0WhzrZpnPqsYAz1myjp+EI5G3N/Oh4AbGyhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGQgJFHJVtGZH/YrA68jYV8wsNJwHZ+1qOhJab3uT8ygf/W6mc
	9LdXNTug52eZy9zPVDbhDIo48fCXVMDXi08ZxyvtN8DrjkIK3gzgn37vkQL3MoiHywzIFjY7lvw
	EVhzppqV5uG4ss+Ui9KmjnDse8EOVcCmA5n5EpFa8
X-Gm-Gg: Acq92OGTaj9Raoh4hUxlWMNb70KQQup1fg18N5OTktas5LtF77Hnq1sj+hedm5leklm
	sGo9qlek3OGB0Kuc5CFdUYgCjIs96qeIF5XCHG+iLU+jLCfpk3wrqTfy8KtTv6cVxfRAQDnpWZj
	5D+7y/MTpwqD/FeG8sjXbl/s7UHMRlFfoltbusLBFnsmWvOPhJcLnE3EyfqnDfB6f6iYpa6extW
	mYfV9qvQtHfjcPuHGVrlcjaed1e+aL7YPvXtV7ZfI/OnxG+YAlS+Jz3ssfQwPXyv8Pb7qyBNqR5
	yoDwefvdU7V/a0gtjLnivvDfoDMaZ1aP+H3oZo/2biL15j/f
X-Received: by 2002:a05:600c:534b:b0:48f:d634:b18d with SMTP id
 5b1f17b1804b1-48ffa5e1260mr1775015e9.8.1779147560622; Mon, 18 May 2026
 16:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <8ef38815-6ae9-4359-86d4-042554357639@amd.com> <CABdmKX2uwZ12kYJYPJGfWxuMBOJS=64b1GRj72tfB5D=NKM22w@mail.gmail.com>
 <CAGsJ_4zjrFJYQQsLThTGXR6g+2PXzeAhjyDpLHfDFqVViWvyBQ@mail.gmail.com>
 <CABdmKX0gqg309hcXcOHSj_yTg0h1zwDL34GDk8mX3wp4YoyfDg@mail.gmail.com>
 <CABdmKX3wwgovwS-V8rVC3=+EZcTvPs_cttpQb1w6WemwLAVhsw@mail.gmail.com> <CAGsJ_4y=Gsv=FSUjJ5+99Gg6ULUnv0LRexCGOGetzChR3YA44Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4y=Gsv=FSUjJ5+99Gg6ULUnv0LRexCGOGetzChR3YA44Q@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 18 May 2026 16:39:07 -0700
X-Gm-Features: AVHnY4LTFYlENC6xQVXK8AijxUAKUMiH_YZR8cEYxhyMaKCwg0sVArYGdEg8UAo
Message-ID: <CABdmKX3GgCogr9pQFybnV1p_zuo1V9fqJLCXvk-HAnk1gwLoDw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: Barry Song <baohua@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Albert Esteve <aesteve@redhat.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
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
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mripard@kernel.org, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62056-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,redhat.com,kernel.org,cmpxchg.org,suse.com,lwn.net,linuxfoundation.org,linaro.org,linux.dev,linux-foundation.org,collabora.com,arm.com,google.com,paul-moore.com,namei.org,hallyn.com,gmail.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,kvack.org];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[android.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1FD8B575107
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 3:19=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Tue, May 19, 2026 at 5:17=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> [...]
> > > > > Yeah I think this might work. I know of 3 cases, and it trivially
> > > > > solves the first two. The third requires some work on our end to
> > > > > extend our userspace interfaces to include the pidfd but it seems
> > > > > doable. I'm checking with our graphics folks.
> > > > >
> > > > > 1) Direct allocation from user (e.g. app -> allocation ioctl on
> > > > > /dev/dma_heap/foo)
> > > > > No changes required to userspace. mem_accounting=3D1 charges the =
app.
> > > > >
> > > > > 2) Single hop remote allocation (e.g. app -> AHardwareBuffer_allo=
cate
> > > > > -> gralloc)
> > > > > gralloc has the caller's pid as described in the commit message. =
Open
> > > > > a pidfd and pass it in the dma_heap_allocation_data.
> > > > >
> > > > > 3) Double hop remote allocation (e.g. app -> dequeueBuffer ->
> > > > > SurfaceFlinger -> gralloc)
> > > > > In this case gralloc knows SurfaceFlinger's pid, but not the app'=
s. So
> > > > > we need to add the app's pidfd to the SurfaceFlinger -> gralloc
> > > > > interface, or transfer the memcg charge from SurfaceFlinger to th=
e app
> > > > > after the allocation.
> > > > > It'd be nice to avoid the charge transfer option entirely, but if=
 we
> > > > > need it that doesn't seem so bad in this case because it's a bulk
> > > > > charge for the entire dmabuf rather than per-page. So the exporte=
r
> > > > > doesn't need to get involved (we wouldn't need a new dma_buf_op) =
and
> > > > > we wouldn't have to worry about looping and locking for each page=
.
> > > > >
> > > >
> > > > Hi T.J.,
> > > >
> > > > Your description of the three different cases sounds very interesti=
ng.
> > > > It helps me understand how difficult it can be to correctly charge
> > > > dma-buf in the current user scenarios.
> > > >
> > > > I=E2=80=99m wondering where I can find Android userspace code that =
transfers
> > > > the PID of RPC callers. Do we have any existing sample code in Andr=
oid
> > > > for this?
> > >
> > > Hi Barry,
> > >
> > > In Java android.os.Binder.getCallingPid() will provide it. Here
> >
> > ... let me try again
> >
> > Here are some examples from the framework code:
> >
> > https://cs.android.com/search?q=3DgetCallingPid%20f:ActivityManager&sq=
=3D&ss=3Dandroid%2Fplatform%2Fsuperproject
> >
> > In native code we have AIBinder_getCallingPid and
> > android::IPCThreadState::self()->getCallingPid() (or
> > android::hardware::IPCThreadState::self()->getCallingPid() for HIDL)
> >
> > https://cs.android.com/search?q=3DgetCallingPid%20l:cpp%20-f:prebuilt&s=
s=3Dandroid%2Fplatform%2Fsuperproject
>
> Thanks very much, T.J. That is very helpful. I guess
> that would require user space to understand the RPC
> procedure, including single-hop and two-hop cases, and
> make the corresponding changes.

Yes, this is solvable by having a policy in allocator services where
the caller is implicitly charged, while also supporting cases where
the RPC includes additional explicit information about who to charge.
This needs security checks to prevent arbitrary remote charges at both
the ioctl() level (selinux charge_to from patch 4), and at the RPC
level (not sure yet but maybe a private interface between system
components and gralloc), so that only privileged components can
initiate remote charges.

> You pointed out the SurfaceFlinger cases, which are
> two hops. It seems that AI models are also using
> dma_heap, at least from what I have observed on MTK
> and Qualcomm phones. Likely, we need to understand
> those RPC relationships in userspace and make the
> corresponding changes.
> I assume AI models are a single-hop case?

It's currently a mix because AI model loading is largely controlled by
vendor code right now. Some implementations use
AHardwareBuffer_allocate, but that comes with unnecessary RPC overhead
for the AI use case. So I think we should be trending towards direct
allocations from dma-buf heaps because model loading time is
important.

