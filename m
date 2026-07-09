Return-Path: <linux-media+bounces-67139-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mz9iFFmWT2oWkQIAu9opvQ
	(envelope-from <linux-media+bounces-67139-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:38:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAEE731120
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:38:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=gdFh8VX7;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67139-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67139-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0AA730F1C45
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 12:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61D4423760;
	Thu,  9 Jul 2026 12:33:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A6D3BED63;
	Thu,  9 Jul 2026 12:32:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600381; cv=none; b=ZZMfvdBpDYPS6HBxP8xtz5uIims+uazta5gk1y032UJqLRUR4Kp/eSk/pm8k/ndQtkj5sJUbkZwmwI38oNpDsQo7be0rvQE8TFTYMl5cq++C+dBTCFuz3izqtWs/qYzh1RLnm0/4SzN4FZbsniOQrK717z1eBFkWAwSVD0qjFMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600381; c=relaxed/simple;
	bh=D/91n6+nYj/UVmCFWW79SAONgyBaNJJl5h2fcYUuJKg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LAmG3ie/UfjUYKb/ajfZZmaZ1udf+HmMqvtWT0Rc16yWzUsJ/DDZksJ3N87Qtj51D8AT5N5KrDvkyo21VyjzYy0zwD5xpytYIzTCPgRpvCl+ytFTB0+EfY+h7qgTWAUQ7uwPR937nNp/4LwBqTowGxLuMJ5hnBTWR9jcstYb8m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gdFh8VX7; arc=none smtp.client-ip=80.241.56.161
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gwvWB6yxNzKmyt;
	Thu, 09 Jul 2026 14:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783600375; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVYt+UStdsp6KSy/K/PPDXZMCGokRgp9VCy0kpFdPoM=;
	b=gdFh8VX7SzGhmQ7SHfO274rZcpjmyjzdoawdIUQozbFTeA/8X5xbhrVIaYJJ8cSaM4stqb
	XXltG7AAq4u7ii/krmysiaGXk/jKpVXZ14B8G4yKr5rG3NlUnjSDv6t93ZFAW5bBpbcqap
	1cvI6v1qQ7nOGzmY5CO4b7QWPjRNra93fN1BOiIJkF1dembWqIK40jLqlqYifGZPmISkaC
	8707rqIwuJmEZ4+5Cffxpi78avEFeb7fE5DiAXiFzijozmpnvLznDzFl7wDS3CUrxpwPyD
	6WCnIYOHKRP211+5ZGTWVNwTC9GsVR3sd6SsQYTTrUCEUNm7oO6iruk/6BhlLg==
Message-ID: <1ccfc0b5d1696a8dec4756b675294e7fb41ab5ff.camel@mailbox.org>
Subject: Re: [PATCH v2 1/2] drm/drm_crtc: ensure dma_fence_ops remain valid
 during device unbind
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Philipp Stanner
 <phasta@kernel.org>, Danilo Krummrich	 <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com
Date: Thu, 09 Jul 2026 14:32:48 +0200
In-Reply-To: <20260708-linux-drm_crtc_fix2-v2-1-cf72be75d75a@linaro.org>
References: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
	 <20260708-linux-drm_crtc_fix2-v2-1-cf72be75d75a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 9kkhdaab74g8d318nt6ektw8founsbd7
X-MBO-RS-ID: f11a675c1421234383b
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andre.draszik@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,collabora.com];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67139-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,linaro.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCAEE731120

+Cc Danilo (who is currently concerned with drm_device life times)

On Wed, 2026-07-08 at 16:22 +0100, Andr=C3=A9 Draszik wrote:
>=20

[=E2=80=A6]

> Link: https://sashiko.dev/#/patchset/20260618-linux-drm_crtc_fix2-v1-1-c0=
3e77b36f34@linaro.org?part=3D1
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

I am tempted to think that this also needs a Fixes and needs to be
backported into stable kernels, doesn't it? Especially if the BUG_ON
disappears in stable kernels.

> ---
> =C2=A0drivers/gpu/drm/drm_crtc.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 63ead8ba6756..d55f1377ec36 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -501,6 +501,12 @@ void drm_crtc_cleanup(struct drm_crtc *crtc)
> =C2=A0{
> =C2=A0	struct drm_device *dev =3D crtc->dev;
> =C2=A0
> +	/* Ensure our dma_fence_ops remain valid for an RCU grace period after
> +	 * the fence is signaled. This is necessary because our dma_fence_ops
> +	 * dereference crtc->dev.
> +	 */
> +	synchronize_rcu();

nit:
I guess this is the only place where one can reasonably put the
synchronize_rcu(). But I would hint at the RCU delay in the function's
docu.

> +
> =C2=A0	/* Note that the crtc_list is considered to be static; should we
> =C2=A0	 * remove the drm_crtc at runtime we would have to decrement all
> =C2=A0	 * the indices on the drm_crtc after us in the crtc_list.

