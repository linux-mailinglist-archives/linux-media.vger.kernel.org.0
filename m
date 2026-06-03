Return-Path: <linux-media+bounces-63654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +O2dN1SIIGod4wAAu9opvQ
	(envelope-from <linux-media+bounces-63654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:02:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F1D63B09A
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:02:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Y8LCfBY+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63654-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63654-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D42FD3016807
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C2D3FE652;
	Wed,  3 Jun 2026 20:02:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9A93FF8BB
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:02:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516939; cv=none; b=RzaVCq1T6yN429HkogRKFjrHW2FcyITmGQLFLjC2JfMm1D/mNZrJ2y1PrqEu5j33kf0jUdujoUh2+rMBGfL0oPeRBwjeIyEz4kL+2gytxcV84ppL3vHBY/5+W1vkZf8Et4KeZdB/tXGix65dtexdtq9bpWW4mByPJxC9uwPPwvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516939; c=relaxed/simple;
	bh=Ap/bI37EhIJo52KTykcIrAoPFQ2DVrB+Eswv1p73M1M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VNj4FHZorsaorD4UJDRlvBihW3X5SHUkH6nyOwiIBymnBNQh6Nir77tCiqsrGPgLaew/5VJsAvSMBVjfD0AwAHskSFRRcdelZj8d0NhEPytX1AG5YOaG8rZVUng+SRNvqoAPBJ5s3RvofjP/6NU5i1cb5bABet87Vi4gfbMqP+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8LCfBY+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F001F00893;
	Wed,  3 Jun 2026 20:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780516936;
	bh=Cr1qN0NznhK5TWtHKOI856cyb3Gh1BxRvgCZlULCyag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y8LCfBY+wtYC6Qb8i2ylGxuLbpqMNDWWL2JjJMIIl02KtNgUy0B8gHRxxA5tfj52Q
	 rH2Td3yOM4fHt2oIO98CaoNuAwF22CMajw1iZwfgUY+ikhqXSlqZjrNm9tAmxg8NJQ
	 /wOcy1OiiWgRbCkdmk9URbk+qS2A5Xi/hEUIwxp3/E+hUdtScfgjNwTphvgQ0XLDWv
	 FycjHbuEtekApWUPMjlKwil0hWip78CRs2dDEpoXcT8IhhYBDhB09boYunUTmA2KVA
	 htEQMbGoy896LVB53e56XtDBh52eyDTNQNKTHtSm/v0jhi1+exu+tG/ZEQUStYaZxC
	 rmSWyLGXU+6yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 1/6] rust: drm: gem: shmem: Fix Default
 implementation for ObjectConfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260603195210.693856-2-lyude@redhat.com>
References: <20260603195210.693856-2-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 20:02:16 +0000
Message-Id: <20260603200216.A2F001F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63654-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:ojeda@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36F1D63B09A

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect use of `#[inline(always)]` annotation for `ObjectConfig::=
default()`.
--

commit 974110b1b618554fdff7106e2b5a8152da0f6df4
Author: Lyude Paul <lyude@redhat.com>

rust: drm: gem: shmem: Fix Default implementation for ObjectConfig

This commit replaces the derived Default implementation for ObjectConfig
with a manual one. This avoids the requirement for the generic type T
to also implement Default, since T is only used as a reference type here.

> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 34af402899a0e..084b798ce795b 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
[ ... ]
> @@ -53,6 +52,16 @@ pub struct ObjectConfig<'a, T: DriverObject, C: Device=
Context =3D Registered> {
>      pub parent_resv_obj: Option<&'a Object<T, C>>,
>  }
> =20
> +impl<'a, T: DriverObject, C: DeviceContext> Default for ObjectConfig<'a,=
 T, C> {
> +    #[inline(always)]
> +    fn default() -> Self {

[Severity: Low]
This isn't a bug, but should this be annotated with #[inline] instead of
#[inline(always)]?

According to the Rust subsystem guidelines, #[inline(always)] is reserved f=
or
functions using build_assert!() that depend on function parameters, while
#[inline] is meant for small abstraction functions like ObjectConfig::defau=
lt().

> +        Self {
> +            map_wc: false,
> +            parent_resv_obj: None,
> +        }
> +    }
> +}
> +
>  /// A shmem-backed GEM object.
>  ///
>  /// # Invariants

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603195210.6938=
56-1-lyude@redhat.com?part=3D1

