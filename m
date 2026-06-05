Return-Path: <linux-media+bounces-63939-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +syJApjvImrEfQEAu9opvQ
	(envelope-from <linux-media+bounces-63939-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:47:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E09649724
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:47:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Sarze8Ca;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63939-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63939-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8EFC304FA6C
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 15:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C4C34751F;
	Fri,  5 Jun 2026 15:33:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FB3364052
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 15:33:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673611; cv=none; b=KDBwp97cabWFpX9Nh9A6hJhjzKBay9fdzffNBZl8x3mJq6EmR2Z+YQqPXRq4coeT2WSDVmRrIn6Cilr0uOLIC2uKOqWLndB/xObTCfNjgHIKnvgkb7TZKneEN0V68GP9iE/JmNbV92UxWn1PizW+yE4SAni7zxoJ1Us93osS9FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673611; c=relaxed/simple;
	bh=pe0rmx+cxv9y62/iOkR1NUb7COuXxk0zlNl1qRN4sF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkWcFINM5aLpvggJ66W8dNZj5p/s3+68Hl4X9BO2b+gXKyPqBDERkqP1I8n5XlEatP/VQwBILzjSwEDFjDugcPFAyh4CmomLiNuiqecu6xEWGetyyc5mc/2x/uVCytysJCfvV7hZ7JVMgicaQ5wUOK4Q1OCeGHmbYtLftgDocxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sarze8Ca; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652C71F00898;
	Fri,  5 Jun 2026 15:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780673608;
	bh=Mbdmq4Leb+ZwNWt2t0EiTXdInl4X5ELk6gS+BDi40i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sarze8CaQXIeUh0LxG+LNjaZOAkFNtKMtCGAUXKYWRLQog2MHPBW3mcMuD6wzHjAx
	 GKBmtxTTlomZ8JP74z6t+PolFKlpVyxSz2w6ELKxn98iYspxRD409Q55yJGD+hQdqM
	 SL38P2cYSM4uaidBYzOoWY5kwpCEmMTpI0etpt+4gCIB+huwE6aWdBkOwYpYDJ61AS
	 km+JqK0FApRGa56+1n9iAlrNmWw4FUk/FA/4T4wW8lf545QIz1Z2wlbAXLVNWSeDHO
	 6V2qpjEnM1bIO0BGu7lFUPiYOruwGuTEvyNVOkiPI+sRYfsU7g2U82Uugc3kMFJT4z
	 Heik13egUPbew==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9922DF4006F;
	Fri,  5 Jun 2026 11:33:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 05 Jun 2026 11:33:27 -0400
X-ME-Sender: <xms:R-wiag_yggALpQ_A3CEUcnpnnZIdWF84d_9K86fZpaYuXJ5uKCZbPQ>
    <xme:R-wiajqpPpSJ5tlj8qN9Ml9aiKLQ3vvbaolr3hjPTSsBEolHogb4WF1El6g0ZQPZG
    qhihsY6MxHIqJZmML48ZX0VGL_-trCIH-w16xo740KHBXlylgoiNRs>
X-ME-Received: <xmr:R-wialCgOMZeCMpQfi7Y3flj7cDHYl3v3ISRNyNmGGpyiUwVQK8G1Gwyy7s>
X-ME-Proxy-Cause: dmFkZTE5q7wspRguf/xfzLeVi3MIs2Gj4EfIHTkUc1lLAmhybEywZyWFPuPAchSTPk302j
    5qa7Ta75/FfpsA9ph/y6zR8dOlipoy2NsJryeCv/cMr+KRmiWbN5BTDzMY09PKgPw6Q8/S
    JOrNBMYEwaRZaQQpqEbygfvD4EKweAd1f/LEWcRkUNU2kx6mYNxsjy1On2KzKqsLciVQGU
    BpN5qsnQnZ09Sg8h+Ite1nVQy3obAfWhBuTG1G+oW38s2TVFq31W9GKGBj7Wah+ndwXE7Q
    QqsDM+FN9gCvCmAM8OijbjxYVINJ7C121xS0f50lXW82d75diCF5OdbN1WyWapAyFjgblL
    brlJoA0MM1gvpmGP3KPxPVpJRj6PLnoZyPyzS09TqOKWpLmgYjhUJfLcKomC+L3pAq+RV1
    gs2zfu2UwvnVrLTwJxCGGo0/z/Bp68InsXjq7MXUx9UdhxdvB6vWOXdAiezHG2Qr2HbUmk
    EWQyAwszmoBUUTayyLTi12jUIVK3wd5uasMtHv2bYL+7+No3nez6Gn6Wiy4NjrwxNQChvE
    2MkrosLDTsbe1qHXAb/YZN53ElTwbVaczqkhjEV/l1ZgJlS5J2e2D8qfRiAZplZ5FuS6oN
    XhzegrTUvLMLshR5WLVYINVI1VkPLf6EQzzQntPp4f4CfO1YtSoloe32I+9w
X-ME-Proxy: <xmx:R-wialwmsm7WJhW1PeysoUg4RdFP0hVThJgIJt_tawH-TdrEF48Igw>
    <xmx:R-wiai3ZZECYe4b5noWuc65Ow--1iNyXAM2bR6lVH0Oz6CyrG18qFw>
    <xmx:R-wialxUOtBmFVJwt6aLXC_hJ1Koj5VmMDdhfxVoGm0wX-zUpwPP1Q>
    <xmx:R-wiapFnJeVXfqsTY6IYikssaDySFaVP3k4arC0WUPNnMCTy635shQ>
    <xmx:R-wiaoa-8rVNKpz61--7XNOBC41A8UQwkolhdzlcePhlwhgALiG6a1U_>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 11:33:27 -0400 (EDT)
Date: Fri, 5 Jun 2026 08:33:26 -0700
From: Boqun Feng <boqun@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: sashiko-reviews@lists.linux.dev, ojeda@kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] rust: rcu: add RcuBox type
Message-ID: <aiLsRpKWnRk5DQBd@tardis-2.local>
References: <20260605133541.22569-2-boqun@kernel.org>
 <20260605134935.B6C0E1F00893@smtp.kernel.org>
 <aiLgJkKzwEDGWNtY@tardis-2.local>
 <CAH5fLgimUgbK_dVwq7RQimOugqJka2bM_u2r5S=3aze_8uCnbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgimUgbK_dVwq7RQimOugqJka2bM_u2r5S=3aze_8uCnbA@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63939-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:sashiko-reviews@lists.linux.dev,m:ojeda@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57E09649724

On Fri, Jun 05, 2026 at 04:54:55PM +0200, Alice Ryhl wrote:
[..]
> >
> > [Cc Alice]
> >
> > I fixed this locally by:
> >
> >     fn into_foreign(self) -> *mut c_void {
> >         let ptr = self.0.as_ptr().cast();
> >
> >         // FORGET: Leaking it as a pointer, the caller is responsible to free it or unleak it by
> >         // from_foreign().
> >         core::mem::forget(self);
> >
> >         ptr
> >     }
> 
> I prefer to avoid use core::mem::forget.
> 
>     ManuallyDrop(self).0.as_ptr().cast()
> 

Sounds good ;-)

Regards,
Boqun

> Alice

