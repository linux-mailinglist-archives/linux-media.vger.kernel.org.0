Return-Path: <linux-media+bounces-64033-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AMLDHO2zJGoU+gEAu9opvQ
	(envelope-from <linux-media+bounces-64033-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 01:57:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD51964E893
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 01:57:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VLMn1wIE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64033-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64033-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D4093019F23
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 23:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9774C2F6560;
	Sat,  6 Jun 2026 23:57:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254CD45BE3
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 23:57:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780790243; cv=none; b=SN2BhgcGj/Zfn6rPfKKmcAn+KKsuVuYWZRn4DPqjaNgCdLSYOpfUNWCbWqG+oWX3XW6/Oie3H35CqjeMuWa3fIvtWMNaEHjmmme0itUQ71pm4GsooI2Bnsg93WcYP6mhJn0hFDBu4xQCFrgm1CECL3EdIzSysZOOMiQvkNWYU3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780790243; c=relaxed/simple;
	bh=g3sfZ4T+xpsIM9MckdXu0wnPt19hTQuJ3grm4GwXbS4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i/VIJ8JHPTNMAdx/xr0cp9bqLUwKF6rUnnze0UYEjAQDbFS5Du3bxpqGUvK16BVskVwQsyFBkj9Yd2oHRDE/IPt+vxKfweQs0rW/4jlmhruNyXBtpYu5Uu/kftCAQgtukXrnFoD2AiA02jwKUd14AjJ3Nl7/E8vCCNRITUA9qCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLMn1wIE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D501F00893;
	Sat,  6 Jun 2026 23:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780790241;
	bh=GtAIZmEba0/bua25ucvtbIoh8d+XrvRoan3kk8cpnBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VLMn1wIEwFH19kX32Y7cFjR7MSzOFDWe7GbwdpgL0HTrpNazId1h/KyLRTDSB/w48
	 1ZvIxOgSrB32aKIHwolkSNXP6F05VwqQ8nYsxpuEUOmI8gW1zwR3+nlZv5b3S8KG9O
	 Be8pzl+btMSJfzboXsBxcxhgMnYDTLXZGZqvziUvWvHpxeyGfBW2rnkA4VHYtZhL1w
	 zKdJkeXXsSVCBwsH2sex+eyYSEps5Dg9XTvdDw9Xr9+GvxPsscHfTNriZlih8u6QxS
	 +Di+XUJaYUkfLh8ex+Nccln3fa/WufdZn1qGwRx2dcggH2Qejch99puO27IYmsSOfa
	 uX+OJwpmuvg4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] staging: media: atomisp: prefer kcalloc over kzalloc
 with multiply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Soto" <linux@notrealandy.dev>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606234427.9902-1-linux@notrealandy.dev>
References: <20260606234427.9902-1-linux@notrealandy.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 23:57:21 +0000
Message-Id: <20260606235721.87D501F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64033-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux@notrealandy.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[notrealandy.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD51964E893

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Ignored memory allocation failure leads to null-equivalent pointer=
 passed to SP firmware.
--

commit 967be0a2dfa51f2c0edc88c4aa3976bc41aab85d
Author: Andrew Soto <linux@notrealandy.dev>

staging: media: atomisp: prefer kcalloc over kzalloc with multiply

This commit replaces a raw multiplication inside kzalloc() with a kcalloc()
array allocation in sh_css_params.c. This validates the array size
calculations to prevent potential integer overflow vulnerabilities before
interacting with the kernel heap allocator.

> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/=
staging/media/atomisp/pci/sh_css_params.c
> index fcebace11daf6..9147ca0474ad2 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -3716,7 +3716,7 @@ ia_css_ptr sh_css_store_sp_group_to_ddr(void)
> =20
>  	IA_CSS_ENTER_LEAVE_PRIVATE("void");
> =20
> -	write_buf =3D kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
> +	write_buf =3D kcalloc(8192, sizeof(u8), GFP_KERNEL);
>  	if (!write_buf)
>  		return 0;

[Severity: High]
This isn't a bug introduced by this patch, but is it possible that this ear=
ly
return causes the firmware to crash under memory pressure?

If kcalloc() fails, sh_css_store_sp_group_to_ddr() returns 0, which acts as
a null-equivalent for an ia_css_ptr.

Looking at the caller in drivers/staging/media/atomisp/pci/sh_css_sp.c:

store_sp_group_data() {
    ...
    per_frame_data.sp_group_addr =3D sh_css_store_sp_group_to_ddr();
    ...
}

The return value is unconditionally assigned to per_frame_data.sp_group_addr
without any validation. When this 0 is sent directly to the per-frame
hardware configuration, will the SP firmware crash or lock up the hardware
when attempting to access address 0 for its group configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606234427.9902=
-1-linux@notrealandy.dev?part=3D1

