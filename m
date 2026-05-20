Return-Path: <linux-media+bounces-62351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKHJHNwcDmro6AUAu9opvQ
	(envelope-from <linux-media+bounces-62351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:43:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C750F599FEE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0F76304972D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 20:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16C6372ED2;
	Wed, 20 May 2026 20:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=henrialfonso.com header.i=contact@henrialfonso.com header.b="dpNnsP22"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4F7363086
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309746; cv=pass; b=aGeoA3zXTYKKQaehit313fRbKDdSZ/pCQaorsOdHUle6ekW+qd2pXkcsA9O7Na1j4PsUxUjabPff4vM6cpB4LVgc4fz9wavGCJBZsdCtOD27HtcwtcKiyXeT7A9SMRpWKMew4/gPT5D7jlYXe1oDW7RQEkOSKgs1qjfQreSFBIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309746; c=relaxed/simple;
	bh=y8u47cUNwcU0Da4FA4K0nLPpSPqFKFvGut/fJmbwmJw=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=kbIuoRzThI5mpsXiqHauhKrDMKtOXShNxkIaGX768tiRPWiv438VNmf6S2Uu8SbE4FGjPNv6uWxgEH06IxgO0Pp3T85mrkurug4hhICJxFg6Cb7Yz3MeUG6/tfnas14HmaFXixKgtv+vFWWAipnMBIkseSs1hDGjge2xcSXCsrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=henrialfonso.com; spf=pass smtp.mailfrom=henrialfonso.com; dkim=pass (1024-bit key) header.d=henrialfonso.com header.i=contact@henrialfonso.com header.b=dpNnsP22; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=henrialfonso.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=henrialfonso.com
ARC-Seal: i=1; a=rsa-sha256; t=1779309742; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iwGaq0VNESkxgOKZGK76jaVpdnW6CmMC0Pn4hC8V79o7tNGSBfr4QgklQ/KOyvV4/CclXvVJB8PLd/J6WXIJ0vb3L5fgI3mwVtnAD7yfqu4+Z1ql2Qke34OeBEsKFNat/ALRiatDXu9dmqZnPIq9LOgHVPkM/8+QagUqgaAztjU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779309742; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=upY63IAzd2RCMkbM3ss+91Wx+ytXdTrtWrGJ4SWqsqo=; 
	b=WT4LlT4PxbdXLCIG93qvNSkrQzyQx+JsuI/piI+5mDu1WHcDNR2pqATEkVMj2/AANTRGVsP6kaIx4zeNJHTJDOBnbU5gOf6VqYCsbmXi0OLmgs7CN9e1fML1XZUvAqAj+qy8/6XVzoUqx+C43I4CcBUemDp3HoszOEvQkEGn4nY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=henrialfonso.com;
	spf=pass  smtp.mailfrom=contact@henrialfonso.com;
	dmarc=pass header.from=<contact@henrialfonso.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779309742;
	s=zmail; d=henrialfonso.com; i=contact@henrialfonso.com;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=upY63IAzd2RCMkbM3ss+91Wx+ytXdTrtWrGJ4SWqsqo=;
	b=dpNnsP22mV+rPUihNhhM/lPzdDgNOQWhqMVCf+jpqiC2EifW01Mu2J/g31EHjkgM
	8zLvmG7pX92sMhY1QwYvQgyLFIE5cRzWTQw7vgvsrbcjUX9efROiadbSMv+DjE8RTvo
	lW/oN4IuB/9nW1PLp9wL+og5ITS3Y5nje5vwSt/A=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1779309741526256.1241175577852; Wed, 20 May 2026 13:42:21 -0700 (PDT)
Date: Wed, 20 May 2026 16:42:21 -0400
From: Henri A <contact@henrialfonso.com>
To: "linux-media" <linux-media@vger.kernel.org>
Message-ID: <19e47200593.3af1f4ab518100.2940362720440007116@henrialfonso.com>
In-Reply-To: <6a0dde00.943759fe.18e37d.8303@mx.google.com>
References: <20260520142544.104309-1-contact@henrialfonso.com> <6a0dde00.943759fe.18e37d.8303@mx.google.com>
Subject: Re: media: rc: igorplugusb: fix control request setup packet
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[henrialfonso.com,quarantine];
	R_DKIM_ALLOW(-0.20)[henrialfonso.com:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-62351-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@henrialfonso.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[henrialfonso.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: C750F599FEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

I checked the failed static job log, and it appears to be a GitLab
runner/container infrastructure failure rather than a patch failure:

 ERROR: Job failed (system failure): waiting for container:
 error during connect: Post "http://internal.tunnel.invalid/..."
 ssh tunnel: read tcp ...: read: connection reset by peer

The same log also shows failures to inspect/pull/remove containers and
clean up volumes. I do not see a static-analysis diagnostic pointing to
the patch or to a source file/line.

Could the static job be rerun, or could you point me to the specific
patch-related issue if I missed it?

Thanks,
Henri





From: Patchwork Integration <patchwork@media-ci.org>
To: "Henri A"<contact@henrialfonso.com>
Date: Wed, 20 May 2026 12:14:56 -0400
Subject: Re: media: rc: igorplugusb: fix control request setup packet

 > Dear Henri A: 
 >  
 > Thanks for your patches! Unfortunately the Media CI robot detected some 
 > issues: 
 >  
 >  
 >  
 > Please fix your series, and upload a new version. If you have a patchwork 
 > account, do not forget to mark the current series as Superseded. 
 >  
 > For more details, check the full report at: 
 > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/100353082/artifacts/report.htm . 
 >  
 >  
 >  
 > Best regards, and Happy Hacking! 
 > Media CI robot on behalf of the linux-media community. 
 >  
 > --- 
 > Check the latest rules for contributing your patches at: 
 > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html 
 >  
 > If you believe that the CI is wrong, kindly open an issue at 
 > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all 
 > to this message. 
 >  
 > 


