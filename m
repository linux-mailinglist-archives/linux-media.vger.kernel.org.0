Return-Path: <linux-media+bounces-62116-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA2yE0g1DGoKaAUAu9opvQ
	(envelope-from <linux-media+bounces-62116-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:02:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5E957BCF8
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6073931054F7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 09:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C494657EA;
	Tue, 19 May 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TtLgIlST";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KPqn1IrL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B71480DC3
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183804; cv=pass; b=rCquE4CBF4OY5Kw0TkkIK0v5OPTQcpt9v+GwR1cLkXOhC1Gq3gBRFxzNy0fdyBZtDKAupOufEFSmtR0CGj5EkD6N41PKEoyqdQIodxysWjEUoKZBDdBC2BpvnxleT86n7IwVBTcxdbqW3pAmEt0bTOCxRYbBiCDaFiQMDJe2hMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183804; c=relaxed/simple;
	bh=vupX0NJyQoj+YpsPS+mWEYXWTs2EEV9LxivCpOIjPNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUrbbarVPeaaYV//co6wzYx3lTEUpbd218oD59CkLAGuwE6UxKVO01m0atMj+w9vAyxYLLKg33kFD//Gh743Zm2MuYyZk8tqZVsViXLJNq3TlUd57H7fVqo59KonG1v2GVOqyPCJLf063N0G63J21pcIRGwy/sSbntWJdflxQtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TtLgIlST; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KPqn1IrL; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779183801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
	b=TtLgIlSTk0kRO9ZPvkrLDs9bgs97tSEGLHjqELywBE1r1nxKee7tyjOPXl+NA1uniPtiD2
	4n4OEGVnU3vAUFTvOKNO/5yAU3aUkfLHlQsMYidVeWmo7s8vS+gNudIRuY14GHNXKGmwL3
	NXmtRi3LU5+Fy0wTn6VTMlQMNF1t7Pg=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-lrtEl4pePiilLMTGABJKRA-1; Tue, 19 May 2026 05:43:20 -0400
X-MC-Unique: lrtEl4pePiilLMTGABJKRA-1
X-Mimecast-MFC-AGG-ID: lrtEl4pePiilLMTGABJKRA_1779183800
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7c9e610f273so39031887b3.0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 02:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779183799; cv=none;
        d=google.com; s=arc-20240605;
        b=jV78RYyKsPUs2MvGpQDcrpgtfBN5802jHKKHUZhHrnePfIExvTbNVwIfOldc8JlJBh
         bOWlx+AhJWZf7W/BLtIQ9ZVEiN0jO2MYZC8VPwFWpTuk79ncPB3VqaL0XNHBybfbQYuY
         53F09KUc3kM/PEZWkrMBVfEUY8mwSNut8c7ovItk62f5xtpsEW2bQBmlpmL5vxgO1ri5
         afsyI154aQEuMCp2IuWJ8kGjwbEhuHu+AV5hpu/MXCXdyeFTxCVlhMKXuiPb4IM/NO+z
         uMMuOk1l1WUPsMcdY2qBCY/j27BA5FJtyMTs83O6N0Q1VEMDUBIp3TbW+cPJjMy85REr
         wAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
        fh=gu3uMNbN1fM9yQDBB0r4FFM7qDUx0PIHLrOc3aOMVi8=;
        b=iCg3ADftquCvH1fEsnPFhUDrb8UwarJ9AXd06MZ/ic6QmhRKEqWi6EBMYqI0q5pgIw
         eZVrtWN8GzrwImDvUe73NEXKVPTYcGyIObdLEl6Xyjja52hujm7SzLUZjfNXvO8tIoEF
         vIZFaenXxpQIBlyMVVbyLx6ql80vbcCVZh+ZhcgVn8KYUF7YdBWVFr20asmHSqzMip57
         n9GZuodH1oFPlZyxrjSFb1V2Ww2TFOyYyIpkvjhCli938ma7T8Xv+mB1o/ovXdDebqSg
         bChCfdRMz+EtqbSXAPdGv2Hm4cO7wYl8wpFnDVbJl9UMx4FNfxcUb82AW23yq1h9qGCQ
         nGGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779183799; x=1779788599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
        b=KPqn1IrLOVpiT+kXRx1cIJ/wy0pmC8vIciCxnXaSVniK793kZf9uSDYqJSuTyq4+Vo
         OCOcJDVLp9dLU1aOfW91FAWCNMT4qHX+zhTVBluntj/iGMA7ZVyt9Z5fi7Lew+tUu7ku
         9j6ITpTCdxLhUI99sWiydZmA0jsbdc6nZcTgUez2egzACU3Ib79/E7ng+XiuDOQ+Fe/W
         TopIi2ZMUKYOzpb6fJELqgfefKHR38gF6UMySaCkix6C9FWBChjVsNwmkS6osJsq+HoC
         XIrxaQ4ELApiNy7TGCCBCrh51OJengTn6qb+ftJxbLkB0t8K3VNXyeY1TGxwkf0Z/eYF
         II2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183799; x=1779788599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
        b=gCfcB9wTYKuG5B3aMgXgcplDz5bcY3L9Q+DuHn5IN0SPjoi1WrhrVTAerZO3X4/wzx
         5F+G+HD2dgt3pdCDkrrU8+SEbim7td0pEI27sAglT+yENG/b06CP1RslP99MW6Qnh0q7
         5nm1LhSfv8O+Up2iq7RAtkqCTAmI+8ReIoiq6VxGZvDLFlcqKw1pzQnmEpKEUwrf4zy6
         LeY6QuBjTLgCcx9w0qnLDaju7bOmvRKFkOPHlm869ODdQz7f1jcESTsXbxS9Sl4m+Xkq
         mzekhD92neW5KuZFC0gyNOkDgvrAyDiF6StBJi9OOl7f517a6CLM1p9r7TJKaZKjHks/
         6k/w==
X-Forwarded-Encrypted: i=1; AFNElJ/VU7+UzIPK+SXM1TPEcVjLYqktZOvmXQy0/Bq6MkC/m+NGQXAx1CWr4QFojVFBrflArP7R6r82U2uhPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKphYJw/zf6wSaAQ2LWbk1r0lCP493Q4bxIuXw0E3vkBn13Hfm
	C1Ls0tKpkTPml4jNLn9X7nCd4etlFxWwJhA1XFFJ/MX4BNw7+trYvgUhrdxHoAQtA8VnM1HCt6+
	0PxQww6zEehqSdcd4GYxW3dq/mOCnEdAEBOAqLruy1WNMvDDW/yGduuuWBsy+LEfI47Tpf6xYuM
	rq5SqfoTxmK1RgXESqdi1kIl2QgePRENTh+N2YXjE=
X-Gm-Gg: Acq92OFTU+SdUIBS56Sw020zoi3IuGGIJYiJMANXkfkQDqEx1asIuM2hRx/CFJ1uZ+b
	45GFfjrR5pIVSFx+W0txiV6W+jGLMuXoA/jhPfD8qjP9Wuv/uy/C9v9LeV+P/dlE+/ieoPLJghc
	UztaB4OGudfecXNXC2VaJAN4DOO+nCS0kGNBZ4w3a1ZUW5qLWwdRVAROIB63hhFUofmlkjdUZUK
	oXtGQ==
X-Received: by 2002:a05:690c:6e81:b0:7bd:a63d:fe69 with SMTP id 00721157ae682-7c7e6586abemr212584527b3.9.1779183799567;
        Tue, 19 May 2026 02:43:19 -0700 (PDT)
X-Received: by 2002:a05:690c:6e81:b0:7bd:a63d:fe69 with SMTP id
 00721157ae682-7c7e6586abemr212584217b3.9.1779183799106; Tue, 19 May 2026
 02:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <CAGsJ_4xfznffbjOaNKwnN6oZk_H6pqOzYqd1zx4Q9XrocdzV8A@mail.gmail.com>
 <CADSE00LjJcL8P5M-UPEpzZijU70uEmUirnin29N8YR5W5D-oFg@mail.gmail.com> <CAGsJ_4xwJ7SAhKPJyRtMTw6psTO7H1EcFFpDw0po1W8PX4FE8g@mail.gmail.com>
In-Reply-To: <CAGsJ_4xwJ7SAhKPJyRtMTw6psTO7H1EcFFpDw0po1W8PX4FE8g@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 19 May 2026 11:43:06 +0200
X-Gm-Features: AVHnY4K6WRueJTIRx5g-aAlFuFoKaIp0iRf0U18smAauuYj52IGoBPbNpAKamXc
Message-ID: <CADSE00L00D7yi_DevNsZ8_=VXBVD2eO5FbcM+sv1ZdwgjaiRmg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: Barry Song <baohua@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, mripard@kernel.org, 
	echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62116-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,cmpxchg.org,suse.com,lwn.net,linuxfoundation.org,linaro.org,amd.com,linux.dev,linux-foundation.org,collabora.com,arm.com,google.com,paul-moore.com,namei.org,hallyn.com,gmail.com,redhat.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,kvack.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6B5E957BCF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:43=E2=80=AFAM Barry Song <baohua@kernel.org> wro=
te:
>
> On Mon, May 18, 2026 at 8:16=E2=80=AFPM Albert Esteve <aesteve@redhat.com=
> wrote:
> >
> > On Sat, May 16, 2026 at 9:37=E2=80=AFAM Barry Song <baohua@kernel.org> =
wrote:
> > >
> > > On Tue, May 12, 2026 at 5:18=E2=80=AFPM Albert Esteve <aesteve@redhat=
.com> wrote:
> > > >
> > > > On embedded platforms a central process often allocates dma-buf
> > > > memory on behalf of client applications. Without a way to
> > > > attribute the charge to the requesting client's cgroup, the
> > > > cost lands on the allocator, making per-cgroup memory limits
> > > > ineffective for the actual consumers.
> > > >
> > > > Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> > > > a valid pidfd, DMA_HEAP_IOCTL_ALLOC resolves the target task's
> > > > memcg and charges the buffer there via mem_cgroup_charge_dmabuf()
> > > > inside dma_heap_buffer_alloc(). Without charge_pid_fd, and with
> > > > the mem_accounting module parameter enabled, the buffer is charged
> > > > to the allocator's own cgroup.
> > > >
> > > > Additionally, commit 3c227be90659 ("dma-buf: system_heap: account f=
or
> > > > system heap allocation in memcg") adds __GFP_ACCOUNT to system-heap
> > > > page allocations. Keeping __GFP_ACCOUNT would charge the same pages
> > > > twice (once to kmem, once to MEMCG_DMABUF), thus remove it and rout=
e
> > > > all accounting through a single MEMCG_DMABUF path.
> > > >
> > > [...]
> > >
> > > > -               if (mem_accounting)
> > > > -                       flags |=3D __GFP_ACCOUNT;
> > >
> > > Hi Albert,
> > >
> > > would it be better to move this and its description to patch 1? It
> > > looks like patch 1 already introduces the double accounting changes,
> > > and patch 2 is mainly just supporting remote charging.
> >
> > Hi Barry,
> >
> > Thanks for looking into this series! Yes, in my head I was trying to
> > keep patch 1, which was taken from a previous, different series, and
> > then diverge from it starting with patch 2. This would clarify the
> > difference between the two. But I can see it just added some confusion
> > (for example, patch 1 charges on dma_buf_export() and then it is moved
> > to dma_heap_buffer_alloc() in patch 2). I will reorganize it better
> > for the next version, including your suggestion.
>
> Yep, I understand the situation now. I also understand
> that you were referring to T.J.'s patch, which caused
> some back-and-forth confusion for readers when reading
> patches 1 and 2.
>
> >
> > >
> > > Also, mem_accounting is only used by system_heap.c; has this patchset
> > > also eliminated its need?
> >
> > No, mem_accounting is still handled in this patch for the general case
> > where no `charge_pid_fd` is used. See dma_heap_buffer_alloc() code:
> >
> > +       if (memcg)
> > +               css_get(&memcg->css);
> > +       else if (mem_accounting)
> > +               memcg =3D get_mem_cgroup_from_mm(current->mm);
>
> I see. What feels a bit odd to me is that mem_accounting
> could either be dropped (with unconditional charging), or
> it should cover both remote and local charge cases.

Good point. If I understand correctly, looking at patch [1] that
introduced the flag, the shared buffer caveats mentioned there are not
yet covered by this approach, so the flag should stay. I will make it
consistent and cover both remote and local charge cases.

[1] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-1-ecc6=
b62cc446@redhat.com/

>
> I don=E2=80=99t have a strong opinion here=E2=80=94it just feels a bit
> strange, since its description is quite generic for memcg:
>
> "Enable cgroup-based memory accounting for dma-buf heap
> allocations (default=3Dfalse)."
>
> Best Regards
> Barry
>


