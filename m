Return-Path: <linux-media+bounces-57906-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNg3Cg3SzWnVhwYAu9opvQ
	(envelope-from <linux-media+bounces-57906-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 04:18:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A26382930
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 04:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 509A6302DF7D
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 02:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26A42848BA;
	Thu,  2 Apr 2026 02:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="Be7FWQ76"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB8E1EEA49
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 02:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096329; cv=none; b=qkkDIBZVO21J+0LNw4ET0bdOROaQp66EhPA5QUkIBJFljfH/Ez6WmQv0CfGKP5/8x52VkkTRRMYDCO/UD1wzOhj6/jUI/oMa5bzUQcJR15Osa0R+HRs7Tsf9oE8jgT/M6A11p2DkUIpqpBvzw3coo2ssQgMfkCv9wgFhkGJSGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096329; c=relaxed/simple;
	bh=nlQyViKkjH4/+zd1hTaN7dfeagiHZabB+Eudd/Ic7mY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cVQWO6sCQQLXrcuZyMKE6RnVSgOM5QW/KlhuGCfuiI+tSjCKnHZs8ZeSOebPWIhKG84Mlt91Fg1Luhb8CglSZBoIQg/n/kFxvZar49UV25ATgBATyl3uTvmQV3gqoeQ9Rl190uI/D3GqG6rBbjDRRatY7j9BEHngJd9Kc78t4FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=innora.ai; spf=pass smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=Be7FWQ76; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail; t=1775096317; x=1775355517;
	bh=zV1wuNbiqtmiDlb+UQsMvQCW/nntEfgpQyjZEoDGF8I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Be7FWQ76jFOmvxsBpLaVUQ2BcVCwOjeBaTB4sC/qr/jMJU2qwb/8bFW4d0UIdCLNZ
	 K52bhY6mjWWNlbk138rkQVGAyXJGbWu/ACnQ7F9o4AzcSTFZYVcQpLOHowySPt2WnR
	 vt/iur8L8kCVHzLupjPCm+eiZXktksrTmUk7B22lCNuF5u/zKLXPsbMsLRCRlChXEU
	 Da92UZUf4bHIOxW9OYJdqY6r9nPMYX+kdBLwl9k5GUfJk7KrJiB3IABxb01XLor4xa
	 7kpK1yZtLbZm216Td9dD+hCEWBM8YnFNrChs2cYWo9AbYcVwZgDatz2oEI+pEVT2yA
	 40OM+PHDMx/bg==
Date: Thu, 02 Apr 2026 02:18:32 +0000
To: linux-media@vger.kernel.org
From: Feng Ning <feng@innora.ai>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Subject: [PATCH] staging: media: atomisp: use array3_size() for overflow-safe allocation
Message-ID: <ac3R8_qf4qivmGc2@ans-MacBook-Pro.local>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: 19b7b74d54c3637ed0d944a4f4952bcb73824f6c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------c87e65cf39a9a4de9406f79c16af3449f5339ee71514eb8addafa1090d26194b"; charset=utf-8
X-Spamd-Result: default: False [-4.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[innora.ai,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[innora.ai:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57906-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	HAS_ATTACHMENT(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[innora.ai:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[feng@innora.ai,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88A26382930
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------c87e65cf39a9a4de9406f79c16af3449f5339ee71514eb8addafa1090d26194b
Content-Type: multipart/mixed;
 boundary=f295e648c7368048b3681a0b0fd5d3d1ad4e17b7b2427519e01222734591
Date: Thu, 2 Apr 2026 10:18:27 +0800
From: Feng Ning <feng@innora.ai>
To: linux-media@vger.kernel.org
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Subject: [PATCH] staging: media: atomisp: use array3_size() for overflow-safe
 allocation
Message-ID: <ac3R8_qf4qivmGc2@ans-MacBook-Pro.local>
MIME-Version: 1.0
Sender: feng@innora.ai

--f295e648c7368048b3681a0b0fd5d3d1ad4e17b7b2427519e01222734591
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Replace bare width * height * sizeof() multiplications with
array3_size() to prevent integer overflow in buffer allocations.

The atomisp driver computes DVS and shading buffer sizes using
unchecked u32 multiplication. When dimensions are large, the
product wraps and kvmalloc allocates an undersized buffer.

Use array3_size() which returns SIZE_MAX on overflow, causing
kvmalloc to fail safely instead of allocating too little memory.

Affected locations (11 instances across 3 files):
  - sh_css_params.c: ia_css_dvs_6axis_config_allocate (lines 4482-4498)
  - sh_css_params.c: ia_css_morph_table_allocate (lines 1384-1387)
  - sh_css_params.c: ia_css_dvs_stat_allocate (lines 4209-4214)
  - sh_css_param_dvs.c: ia_css_dvs_6axis_config_allocate (lines 52-79)
  - sh_css_param_shading.c: ia_css_shading_table_alloc (line 342)

Example fix for one location:

  -  dvs_config->xcoords_y = kvmalloc(width_y * height_y * sizeof(uint32_t),
  +  dvs_config->xcoords_y = kvmalloc(array3_size(width_y, height_y, sizeof(uint32_t)),
                                       GFP_KERNEL);

The full patch covering all 11 locations is larger than suitable for
email. I can send git format-patch output if preferred, or submit via
a merge request on the kernel gitlab.

Reported-by: Feng Ning <feng@innora.ai>
Signed-off-by: Feng Ning <feng@innora.ai>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c       | 11 changes
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c    |  4 changes
 drivers/staging/media/atomisp/pci/sh_css_param_shading.c |  1 change

Best regards,
Feng Ning
Innora.ai Security Research

--f295e648c7368048b3681a0b0fd5d3d1ad4e17b7b2427519e01222734591
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - Jiqiang Feng -
 0x7D1A285E.asc"; name="publickey - Jiqiang Feng - 0x7D1A285E.asc"
Content-Type: application/pgp-keys; filename="publickey - Jiqiang Feng -
 0x7D1A285E.asc"; name="publickey - Jiqiang Feng - 0x7D1A285E.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuOS4wCgp4ak1FYWFSbHJoWUpLd1lCQkFIYVJ3
OEJBUWRBd0tYblA1L3dHcFc0b0plTTVmVEo5bVRiTXdmaGpzSzNheldTClNDaGg4cnJOSFVwcGNX
bGhibWNnUm1WdVp5QThabVZ1WjBCcGJtNXZjbUV1WVdrK3dwTUVFeFlLQURzV0lRUjkKR2loZTgv
NlFmQldVK2lrdWN6QVBZb3JvbmdVQ2FhUmxyZ0liQXdVTENRZ0hBZ0lpQWdZVkNna0lDd0lFRmdJ
RApBUUllQndJWGdBQUtDUkF1Y3pBUFlvcm9ucnpyQVFDNHVMcGgxbThyaHh1dUFCazhPbE03QW8w
cU5tUWdoN3Q3CkZIa1orWmxGOHdEOUgzWDdrZjR5MDl0TnkzZWpRdXNKVko2VjFWekpMY2RnU3oz
WnZJSnMvZ3pPT0FScHBHVzIKRWdvckJnRUVBWmRWQVFVQkFRZEFsOUVsUGwxU2dkQ1JiMmMzNTh1
VmN2UE1oRFBTRlc3Rnd5TjhORjg4QUNjRApBUWdId25nRUdCWUtBQ0FXSVFSOUdpaGU4LzZRZkJX
VStpa3VjekFQWW9yb25nVUNhYVJsdGdJYkRBQUtDUkF1CmN6QVBZb3Jvbm8wWkFRRG12c3VQa0hn
Q1VHd2daaFhtS3FKZFpocTlYK3JQYm12blNjbXllOWlBa2dFQWorSWgKN0dVUklYR2tHN3NlRFFt
WCtCWXBBa0FSK1JUNmJSYmluVHQwaHdNPQo9M2VuQwotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBC
TE9DSy0tLS0t
--f295e648c7368048b3681a0b0fd5d3d1ad4e17b7b2427519e01222734591--

--------c87e65cf39a9a4de9406f79c16af3449f5339ee71514eb8addafa1090d26194b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmnN0fgJEC5zMA9iiuieNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdsrtQmrzp/oHR4HdEWiW/aFiEEfRooXvP+kHwV
lPopLnMwD2KK6J4AAKI9AQDNn84bcqdKHDqNSruTo8hBsbv74Zah1Dyet/wA
uzH7cQEAquDP/UHpRBGKU5/hZ2ZYAadAC00DCb+kH4cfYY10DAI=
=BMN0
-----END PGP SIGNATURE-----


--------c87e65cf39a9a4de9406f79c16af3449f5339ee71514eb8addafa1090d26194b--


