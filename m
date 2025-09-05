Return-Path: <linux-media+bounces-41843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F2AB4583F
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 14:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77D14A08352
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D47350D48;
	Fri,  5 Sep 2025 12:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="V6C7LERr"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BF4350842;
	Fri,  5 Sep 2025 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757076850; cv=pass; b=Bp5Au+q3cX6v6vOGfb3x4MWi7d+wPNYvHqO9urryEmI8e/G+vtqDJ/7ntt68GLji+rTegt0wnHbhA3o91Pq3zx2KA32vs8M94eyr+9Dq5RjBs0BBpfDVRtRQdO/ZALUU7vXvo8fQV1XIqdAVk2BTb6uogj3sr8zUDsvB+cm0C10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757076850; c=relaxed/simple;
	bh=IhV6JrFrqmw8qOU5WUVwAH8fqiEhjI9hAYG5HTMtCrU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DDSr7BKX+/A4nZaX5SmsNvq6uCH6D6idxIgVesgJkeH+YWKJHqqpnMSH83qLEvQpBAG7eZ3L+EuVxL5gYV8y1dXBQWm+hkUcl7mSUf7IzTtveJWDyssMK2zB4NLhqG4UjLhzcKtzLRmew3dQ5XluYjgmhHqgnx6jJocRvijepxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=V6C7LERr; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757076843; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SaTKMvMi6RhuoR3yzxnE16roLlxmcD7j2Q6c4VeJ37XA6Q7Hy1EowhR/zfJDis4BPJAFwvHGBkP4zHiWxqErjs2GD+my57Wbvnn1A1bDUvS9znlJ1v6v/ZCntUL4erRy/5dXJjRnf7lEKTTv9ngTRzRzJ8FKygPOhiqE3u22czI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757076843; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=os9bh//smt/UIodGYqnwPtUu/En7lmpyHv6vRfiOJEM=; 
	b=ihL8jBOQ0E1wAnntqtOJlGrOu0BwNxYQBsYM2y6A6e4fs5qptQhk0gKGAiha8fh887L00xa8AR3k3EFf/tYj9S37vkHBLNXa482XqK0/Sy5awULcWgVN0/GCcq2eNNwCZUkTfosQYu/a9QR6S9sXyxmJHaadQfRHGMfT7KBoAhY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757076843;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=os9bh//smt/UIodGYqnwPtUu/En7lmpyHv6vRfiOJEM=;
	b=V6C7LERriU8u8J1eQ7SL58HjnRIzzKUnVVq+ATmhgHCyh1uFJmwQRNJL2bmbUCBT
	Z5W5Nfs6YmTKEJH3DH00lrWlPNc6PnHhiC3ozVy8NmoxT2hUmIDa6ibM8lrB9EZApjg
	DNBuP+Eg8qZ8hHwjzpR06pZ4CvqEXn7/QoCv+ks8=
Received: by mx.zohomail.com with SMTPS id 1757076841256971.3020603340233;
	Fri, 5 Sep 2025 05:54:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3] media: vidtv: initialize local pointers upon transfer
 of memory ownership
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250905051816.4027814-1-aha310510@gmail.com>
Date: Fri, 5 Sep 2025 09:53:46 -0300
Cc: mchehab@kernel.org,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <96EC5D66-18D8-42E6-BD3F-F07F220EA5EE@collabora.com>
References: <20250905051816.4027814-1-aha310510@gmail.com>
To: Jeongjun Park <aha310510@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 5 Sep 2025, at 02:18, Jeongjun Park <aha310510@gmail.com> wrote:
>=20
> vidtv_channel_si_init() creates a temporary list (program, service, =
event)
> and ownership of the memory itself is transferred to the PAT/SDT/EIT
> tables through vidtv_psi_pat_program_assign(),
> vidtv_psi_sdt_service_assign(), vidtv_psi_eit_event_assign().
>=20
> The problem here is that the local pointer where the memory ownership
> transfer was completed is not initialized to NULL. This causes the
> vidtv_psi_pmt_create_sec_for_each_pat_entry() function to fail, and
> in the flow that jumps to free_eit, the memory that was freed by
> vidtv_psi_*_table_destroy() can be accessed again by
> vidtv_psi_*_event_destroy() due to the uninitialized local pointer, so =
it
> is freed once again.
>=20
> Therefore, to prevent use-after-free and double-free vulnerability,
> local pointers must be initialized to NULL when transferring memory
> ownership.
>=20
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D1d9c0edea5907af239e0
> Fixes: 3be8037960bc ("media: vidtv: add error checks")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
> v3: Improved patch description wording
> - Link to v2: =
https://lore.kernel.org/all/20250904054000.3848107-1-aha310510@gmail.com/
> v2: Improved patch description wording and CC stable mailing list
> - Link to v1: =
https://lore.kernel.org/all/20250822065849.1145572-1-aha310510@gmail.com/
> ---
> drivers/media/test-drivers/vidtv/vidtv_channel.c | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c =
b/drivers/media/test-drivers/vidtv/vidtv_channel.c
> index f3023e91b3eb..3541155c6fc6 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
> @@ -461,12 +461,15 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
>=20
> /* assemble all programs and assign to PAT */
> vidtv_psi_pat_program_assign(m->si.pat, programs);
> + programs =3D NULL;
>=20
> /* assemble all services and assign to SDT */
> vidtv_psi_sdt_service_assign(m->si.sdt, services);
> + services =3D NULL;
>=20
> /* assemble all events and assign to EIT */
> vidtv_psi_eit_event_assign(m->si.eit, events);
> + events =3D NULL;
>=20
> m->si.pmt_secs =3D =
vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pat,
>     m->pcr_pid);
> =E2=80=94
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>



