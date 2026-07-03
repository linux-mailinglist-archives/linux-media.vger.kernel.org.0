Return-Path: <linux-media+bounces-66422-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RaQ/Njw3R2p4UQAAu9opvQ
	(envelope-from <linux-media+bounces-66422-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 06:14:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 473006FE5F0
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 06:14:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=gb0HBjvQ;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66422-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66422-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99AD73081E96
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 04:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679EC31D381;
	Fri,  3 Jul 2026 04:12:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8818531F9A5
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 04:11:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783051920; cv=pass; b=ks620AA30w2wjtkopVKuLRQkobfz5ubaGwdWod2ex4+c8RM1/varHq59OFRPd0Jrp8i4aR2lWg9XIzZ96KjqkRtQ9jaUi+YWTdg8rtVXwqKuXT+trP7TIJ7trk4da/lv/TTfMptxy6jCKa4rzg9xeXDRFqyjcC/6PvEsRKq1lSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783051920; c=relaxed/simple;
	bh=lBh87CRQVK/bQItX2JEUtPyQ2PHFCrCkEVZmQXZdgXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tC8m5koZnZrMcoaUocX3mA13BQIuOf0K+mzvtf2CDvlW8N9n2uLTJI+c+kLfB7cDuHfvxVtSGLPV4ezm1vKpzDdeZyp6t4i7tJcnn3qhwi8yr0K4jw/vRgzQqFzJoP25F8+pzaZY2eB3NC85neqUis6pD3H9AkaJ2OQ2Li1TKSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gb0HBjvQ; arc=pass smtp.client-ip=209.85.167.54
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb688ae83so32964e87.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 21:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783051904; cv=none;
        d=google.com; s=arc-20260327;
        b=kS0SRc9OUOPB7PLZdflhcp1kNXBlOLkK/DyjhZpjbD4kE/qzRAXQuEjhiFmQ/79WKG
         eD5G7ZSs3qpS1MOPH/qBnmXg7dWAK1RQAuj/MbNi0QDgq3zwaylmFEYIUWzzPiRMh2ov
         GrFI15cbAJOupki+Miakxjad1aAs3aNo6wMh2MLzyGhKatV0IEpfW7wgTXfVEsGvTo/j
         mJxP6bMwEGH1aeXeRJ644fTN+0xK14a9hCfdZRGVMJit9156uHO3tprwd5JygVaCPaMR
         BIpr6dF1kKM5tYcoPR8Ol1GyK+uf0EV3CL5M1StSVkwoWbbp/et0V2ng8PNdhA4X+Lr1
         uknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mYG5gbdqiZUgRx9K2qyqNMU3tiBr/+AhYbboeAOaEGY=;
        fh=tfzg1GfXBvaIpHqTwvEHau/xNEynaCBrb9ek5sQ79Cw=;
        b=NECxvnOmnvsrhJmCvEtKrduMI4AakWw+QTxlY8hxxqXbehii+JmHOOAomCBTysAEtn
         Tu5T4zoW+NNMmLqBux3zLWg5wIg6q7l2d/LV2I1+KAk6Yf9C+sSe8Q28cfzgns6fG297
         bwjsJudW54gX7MX3uVV3R5tzHJKxpvR0PladJLILeRDiFqWe3/hsXZBoJwFWVFPFJ856
         DHRplrIPXDi0YYAv9dgc1tAZiGJZlJyVYSJ6NyCrBijoQad79oddf0/aTbbQiN2A8L1X
         sDIV+SGSP7cwIv7/MP6GI1oQfbE4sd0Bxw252IYv6Y1eueL+mth580I0Ghs+uDKV1c+P
         SQSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783051904; x=1783656704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYG5gbdqiZUgRx9K2qyqNMU3tiBr/+AhYbboeAOaEGY=;
        b=gb0HBjvQ4z6+qygSuofxlKUgbse307TxADbyAPkkyL2GmNj89WAYZ0Zbj99JJ8uWH9
         PnP9MKfchTPBZo3OGceZN9SUUHYrSberO3f6xxrAcO4YXLVmXXBuH0nfbzpadVYabbm0
         tjYNt3jqs/hlvXVwnX8KDjExGJrXwubRV0hEJoUHj1kn/FvrKWH4IOz/h3Alf7Tm7kxD
         /MliF15Ct6jc8NdDt2S/Ro3dkQuEIC/EznuPqDNiye0wdeEMph3kGuBXYMrMp1FvgjV/
         nC9YQ8O3amPvKpcrtCSCBemodUYM5qZWcns0eOldKTnyDgYUG6hPL6Nt6f37d3kO15fs
         jpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783051904; x=1783656704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYG5gbdqiZUgRx9K2qyqNMU3tiBr/+AhYbboeAOaEGY=;
        b=FIkINisFqOXkyRksx5MWxOsjZLejTfNG45+lFjQYcdjITOpZD5GVCMzYz+VM0g8i4Y
         1rT8G8NRBa5qB0jNVX12RSDmuWiMrj2xQ2esKe6SvyqYxhPS679FvtWcHa4j+7zmY68O
         erm29XvuhEuIRBps8k4iLyqfNf8EmLj0NcmqMVSIL0t9X64s9Ou6Yd5EZSLaZ4qgcNft
         bMPz7tYlS69lNXp7qk6ElONxHFHFi3wDS4Jq+01vru/Sy/PHemG8f47ccEAkpCws2HY5
         HBAW3w2dTiC2/TxIUEZsPAkNErdzhhrxHTlHRF6wdqgK4AFF58oL7uaIcNb+uosGefil
         te8g==
X-Forwarded-Encrypted: i=1; AHgh+RqegQPKBgp+QrkFzv15qrhFAy+burPK3VbDMhkqWfoN1L3cpVr9Xk5rD9aH1JUwGysuRQ8ECK0yCWsbRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXD5DPx7UVRvr0+1e6/4mr0nw4Nde1zEtXrvyzcL8c2Yia5T5l
	GSPR1gkQYggdibluFvVGtI95h5/eBB+Krurr4hDYruyMHPXnBu4QQAI/5lo36K8OnsFUvHgn4tZ
	/9KL4BsGkG9PrNqINz8C5kp6afI30vNOv7g1CCig=
X-Gm-Gg: AfdE7cngfCaHgik+cOuydt4p8wR2mbWMJPF6MgoOROnMW0EfYZ5qPQPZZAA4GRSNMfS
	5FEuc8/f6MmaE//ra8GB6U6de3FTmByDKLTm78NVLDdVI2JUs79T9eNgN4QmzhnuajC15wncPnW
	elbnJFXQMBY5bMx2wgcJ3AidL98H205+GOz5v9GDrUY0P3Z1rjb69Qc4e+U6OKd7zKpCJrncwW9
	z2kOcFJvCXeAo3fvy3qALAL/+YlduoF39SoCNhSQ6L3LQut8YGUygOdIitKkb4NV44iZt6jGlIR
	jJulJNAXiO7OyYApnSktA2+V4WvMnA==
X-Received: by 2002:a05:6512:3b0d:b0:5ad:4a8f:58ed with SMTP id
 2adb3069b0e04-5aecc237342mr247261e87.7.1783051903965; Thu, 02 Jul 2026
 21:11:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621222130.1667453-1-xuehaohu@google.com> <20260623015459.1153884-1-xuehaohu@google.com>
 <20260623094446.4a8fc2ed@pumpkin> <ajryxMaT5evDUxaq@google.com>
 <20260623235350.6540eaa2@pumpkin> <20260630124252.GD7525@ziepe.ca>
 <CAPd9Lg9uY1RZvYUtcbKUg=VdWM61M2f3aqmS5veUg_8M_Ce80g@mail.gmail.com> <20260702091040.35eff00c@pumpkin>
In-Reply-To: <20260702091040.35eff00c@pumpkin>
From: David Hu <xuehaohu@google.com>
Date: Fri, 3 Jul 2026 00:11:31 -0400
X-Gm-Features: AVVi8CeOojzP-I_HmExSVQqRC_n17UpgYFkRlrxVBr237r7JGuzRVJ9YNtE2VWM
Message-ID: <CAPd9Lg-ti9hOr4-62xExbNuBJ1fmnhg_Vi1uxFZ8h-9FoeGAnA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Split sgl into page-aligned 2G chunks
To: David Laight <david.laight.linux@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Pranjal Shrivastava <praan@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com, 
	kpberry@google.com, chriscli@google.com, sashiko-bot@kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:jgg@ziepe.ca,m:praan@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:kpberry@google.com,m:chriscli@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66422-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 473006FE5F0

On Thu, Jul 2, 2026 at 4:10=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 2 Jul 2026 00:56:40 -0400
> David Hu <xuehaohu@google.com> wrote:
>
> > On Tue, Jun 30, 2026 at 8:42=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> =
wrote:
> > >
> > > On Tue, Jun 23, 2026 at 11:53:50PM +0100, David Laight wrote:
> > >
> > > > > If we restrict incoming dmabuf transfers to fit within VFS-centri=
c
> > > > > limits (2GB), we impose unnecessary overhead on the RDMA stack, f=
orcing
> > > > > it to manage a significantly higher number of memory registration=
s. By
> > > > > cleanly splitting these massive contiguous device buffers into
> > > > > page-aligned SGL entries, we directly improve the efficiency of P=
2P
> > > > > transfers and memory registration.
> > > >
> > > > But a divide by '4G - PAGE_SIZE' is also non-trivial and (I think a=
ffects
> > > > a lot of io) when the quotient is always 1.
> > > > Splitting into 2G chunks is a lot cheaper.
> > >
> > > Doesn't matter this isn't fast path stuff. It is better to use fewer
> > > SGL entries, IHMO.
> > >
> > > > > Since this change doesn't seem to have a negative impact on stand=
ard file
> > > > > I/O or break existing VFS constraints, I'm curious why we shouldn=
't
> > > > > support splitting these >4GB P2P transfers? Am I missing somethin=
g?
> > > >
> > > > I was only wondering whether it was needed...
> > > > It does bring up the question of why the >4GB transfers even need s=
plitting.
> > > > But that is another question.
> > >
> > > SGL can only store an unsigned int size, so any large physical range
> > > has to be split down.
> > >
> > > rdma now a days has code to process the sgl and restore back the > 4G
> > > sizes since mode RDMA HW can accept that.
> > >
> > > commit 486055f5e09df959ad4e3aa4ee75b5c91ddeec2e
> > > Author: Michael Margolin <mrgolin@amazon.com>
> > > Date:   Mon Feb 17 14:16:23 2025 +0000
> > >
> > >     RDMA/core: Fix best page size finding when it can cross SG entrie=
s
> > >
> > > So whatever this produces needs to be compatible with that to undo it=
.
> >
> > Thank you everyone. It looks like most open issues are sorted out.
> > I'll wait for maintainers to weigh in before sending out v3 (which
> > will remove the type cast for min() per David L.'s feedback, and
> > revert to ALIGN_DOWN(UINT_MAX, PAGE_SIZE) per Jason's feedback).
>
> Does this code get used a lot for 'normal' transfers?
> I'm away from my normal systems and can't check.
> But if pretty much all of the fragments are small (< 4G) then
> it is probably worth adding a check for 'size < limit' before
> anything else and optimising that case.
>

Hi David,

Thank you for raising this. This file (`dma-buf-mapping.c`) was
recently added [1] to exclusively export MMIO device memory.
Therefore, it is bypassed completely for `normal` transfers (IIUC,
e.g., video buffers for V4L2 or DRM).

Regards,
David

[1] https://lore.kernel.org/all/20251120-dmabuf-vfio-v9-6-d7f71607f371@nvid=
ia.com/

