Return-Path: <linux-media+bounces-52606-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC1ADjmGjGmfqAAAu9opvQ
	(envelope-from <linux-media+bounces-52606-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 14:38:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC469124D5B
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 14:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18CFE30059B1
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 13:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9325E285061;
	Wed, 11 Feb 2026 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="MggHiK+T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A021FF48
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770817076; cv=none; b=ZG3Efuyk1FIMkeLk0C0kcg//yiRYispBf/ANsBdRshWA843qsXKmn2894D1oxftJVDpH6+PWlZPOHyltZ00m8YUbz2gdxd2egxk5n0zeXmrMb6Mju38hrD5u/UMI+3/nr5i39zxOf/Ve0FChUROTFLSMfxV4VaJSHoZkiWSIsdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770817076; c=relaxed/simple;
	bh=9W2G5JcTGD+030lOPS8a6WSy6+wSQZ5q8+t2hBKxMqw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=kdN5l9v34/oCZ+VJQ8GsolpK3Jf1sAzTmRgwXFLHoTMdru7iZc8T6IXvguJHIzzDlOUC2zSMADszEZ+RvC7RsXjFP+xADNxnWmkNNwnnQ0EqAb+Lx7bTNav7fFbmo1NxocGz9cxW2v9FboNW9xoH28ZsR2a9cedQxfMwkYqYk5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com; spf=pass smtp.mailfrom=tutanota.com; dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b=MggHiK+T; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutanota.com
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id 497E210BD3DC3
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 14:37:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770817073;
	s=s1; d=tutanota.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=9W2G5JcTGD+030lOPS8a6WSy6+wSQZ5q8+t2hBKxMqw=;
	b=MggHiK+T8VhOvf1PLrMnRUMFZ4yRojN3FqiztXdTz8jun/UedAeUHgJ750ylRE1U
	qR5bdWpnZHDUrk6BFKpyEyMESgmV9s/4aDAvyMOfLFOvFkMOKYpGHTfmFk89qV2trvb
	aXjRZVFWc5yryiZUK0sK6Zb6kLV77KLYm3/4PVybjsxWb1iY7Qp/A7HjoFef6TQ0Mh+
	VQPQCKjyUM/udEOJb6CaS2V8KMDuU8hyqe/u8xLtKEG8tl4Z3js6SpgwvdkrpOBr8xF
	UEa1Q82fISzuCoGv0K3xoh35FUOq2IGurvuqcHh8aGxFqchFxaKv3UHtvw4+dZul26/
	t4YMM58CIQ==
Date: Wed, 11 Feb 2026 14:37:53 +0100 (CET)
From: soufianeda@tutanota.com
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linux Media <linux-media@vger.kernel.org>,
	Linux Staging <linux-staging@lists.linux.dev>,
	Gregkh <gregkh@linuxfoundation.org>,
	Johannes Goede <johannes.goede@oss.qualcomm.com>,
	Andy <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <OlBv1uI--R-9@tutanota.com>
In-Reply-To: <aYwVNjC7Zbhr_4vo@stanley.mountain>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com> <aYt-vrc7h7CJOmSu@stanley.mountain> <Ol83sWa--F-9@tutanota.com> <aYwVNjC7Zbhr_4vo@stanley.mountain>
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: 01942f2d6730cf62a97c7cea648ee3955a02563caa9cabc06f7a1657ed38cd89e45b3b265ac75872da62f850375ec2fec65ecca3f233db501351f9ed31f2eeac4a:TurnOnPrivacy!:tutamail
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tutanota.com,quarantine];
	R_DKIM_ALLOW(-0.20)[tutanota.com:s=s1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-52606-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[soufianeda@tutanota.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tutanota.com:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CC469124D5B
X-Rspamd-Action: no action

Hi Dan,

The issue is that res->data_bytes and arg->fmt.sizeimage are computed
from independent sources with no validation linking them.

ia_css_frame_allocate() computes data_bytes internally based on
width, height, format, and padded_width through frame_init_planes():

=C2=A0 frame_allocate_with_data()
=C2=A0=C2=A0=C2=A0 -> frame_create(width, height, ...)
=C2=A0=C2=A0=C2=A0 -> ia_css_frame_init_planes()
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> frame_init_single_plane() / frame_i=
nit_nv_planes() / ...
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> frame->data_bytes=
 =3D stride * height=C2=A0 (varies by format)
=C2=A0=C2=A0=C2=A0 -> frame_allocate_buffer_data()
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> hmm_alloc(frame->data_bytes)

But arg->fmt.sizeimage is a separate user-controlled field in
struct v4l2_framebuffer. Nothing enforces that sizeimage matches
the data_bytes computed from width/height/format. A user can pass:

=C2=A0 width=3D100, height=3D100=C2=A0 -> small data_bytes allocation
=C2=A0 sizeimage=3D1048576=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> 1MB copy via hm=
m_store()

The hmm_store() then does memcpy() with the sizeimage length into
the data_bytes-sized buffer.

I found this by code review, then confirmed with a userspace harness
compiled with AFL++/ASAN that simulates the allocation and copy. The
ASAN output shows heap-buffer-overflow immediately with mismatched
values.

The ioctl path is:

=C2=A0 ioctl(fd, ATOMISP_IOC_S_ISP_FPN_TABLE, &fb)
=C2=A0=C2=A0=C2=A0 -> atomisp_fixed_pattern_table()
=C2=A0=C2=A0=C2=A0 -> atomisp_v4l2_framebuffer_to_css_frame()

Regarding your suggestion about bounds checking in hmm_store() -
that would also work, but hmm_store() is a generic function used
elsewhere. Validating at the call site before we even vmalloc the
oversized tmp_buf seems cleaner and catches it earlier.

Regards,
Soufiane Dani

11 Feb 2026 at 06:35 by dan.carpenter@linaro.org:

> Please send this email to the list.
>
> This information is not secret and should be included in the
> commit message.
>
> regards,
> dan carpenter
>
>


