Return-Path: <linux-media+bounces-41787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589ADB4462D
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 21:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4920A7BAFF0
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 19:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B339326A0DB;
	Thu,  4 Sep 2025 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="KrgrQzzH"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E554D599;
	Thu,  4 Sep 2025 19:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757013025; cv=pass; b=GBEeIFxP/1XTIEEO4OyLiVnYtZYLecPCRbX9DD4WTw013b8GA9Ps8H+YNdcBTVD9srabDt3g0M2JvdomfTzVYd6dV+eeiZZdNRsB/EsQ6sZiCfS6swZVptAt4F1KzULlRJrEzn+i6UHeHYjkFtXcJFhBrKR9bdxEEoeyjqGU2Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757013025; c=relaxed/simple;
	bh=+h4Zse7WhDcAJDw0AavI4Al0yjN0FBx0HhqVfrpEfIg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GdPzBJqnf+cD60NDUSDxrpBs02zr7gaEoUtVTLML/f/wAlFRcgKJHMCYxm3nnynOtdlQRUrc7/CX1I0CQj1IMdsdLt0fm8B3uqbgAEBZ6IsKisML0HXBWf5DqFvFjFc76+RLs8Jb+iUqTTfjneFWRAHK76oOtMnY8ANmPfZUn14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=KrgrQzzH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757013016; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EyAXeSu3/4WsEdNzyrP8tAQT1gP81vdqPZpi7gqVzRlQwRcMt/DR5QJAhP0OMJGxn/1ZALfxn7gHXuxKqKzeJnGNcmxlgfLQ4lWeFrJpEChW1SL0HIuAY3xDtjJ/aYX8EhtlOfB3C/OFIx6xuP7bPHWCsjzphUCbmpK2+fPxx8s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757013016; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+h4Zse7WhDcAJDw0AavI4Al0yjN0FBx0HhqVfrpEfIg=; 
	b=MWHm/Vmi+YouFlPxnuSLcdyzNM4twXnNan5Lj4mEKbosagIWAJVRxCqm0A07sXE0M9WHvWXW44vJB9inpcu4pnFOiaWV5cEo7e4kJgqJuA2e9/qpu+KVqj+Oj58kkpUX4IhsDBeyhWwehgFYFrSrC4IY9kh1wGv1nlbjWT/q2Rw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757013015;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=+h4Zse7WhDcAJDw0AavI4Al0yjN0FBx0HhqVfrpEfIg=;
	b=KrgrQzzHT6tJrG2R3fySF+qofUY7rNqw+Mhi+ZQYTu3BLj9S8jCnt5z7AbQBoDsa
	lxVzDpDg3zzC89uIh//UC6/VmP1/9wdkxV1zxM3x1V86Ks61eQl9bq6oe3MOaBaqnSg
	uMxQx+rJEhXYtxAJyNKV7mMbcw7IlIUEYOrQygr8=
Received: by mx.zohomail.com with SMTPS id 17570130111351013.0951418007742;
	Thu, 4 Sep 2025 12:10:11 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 RESEND] media: vidtv: initialize local pointers upon
 transfer of memory ownership
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250904054000.3848107-1-aha310510@gmail.com>
Date: Thu, 4 Sep 2025 16:09:56 -0300
Cc: mchehab@kernel.org,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <67D8F9B1-3121-469A-8F50-952BD4C0C99F@collabora.com>
References: <20250904054000.3848107-1-aha310510@gmail.com>
To: Jeongjun Park <aha310510@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Jeongjun,

You=E2=80=99re resending this, but there were comments on v2.

If you=E2=80=99ve taken steps to address them, please send a v3 instead.

> On 4 Sep 2025, at 02:40, Jeongjun Park <aha310510@gmail.com> wrote:
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
> Therefore, to prevent use-after-free and double-free vuln, local =
pointers

Please do not use =E2=80=9Cvuln=E2=80=9D instead of vulnerability.

> must be initialized to NULL when transferring memory ownership.
>=20
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D1d9c0edea5907af239e0
> Fixes: 3be8037960bc ("media: vidtv: add error checks")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
> v2: Improved patch description wording and CC stable mailing list
> - Link to v1: =
https://lore.kernel.org/all/20250822065849.1145572-1-aha310510@gmail.com/
> ---
> drivers/media/test-drivers/vidtv/vidtv_channel.c | 3 +++
> 1 file changed, 3 insertions(+)

=E2=80=94 Daniel


