Return-Path: <linux-media+bounces-67182-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xIy+NC6yT2qmmwIAu9opvQ
	(envelope-from <linux-media+bounces-67182-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 16:37:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D89732566
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 16:37:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Zbi2aVuo;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67182-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67182-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4888C30EC839
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 14:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DDF33120C;
	Thu,  9 Jul 2026 14:19:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC155199D8
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 14:19:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606758; cv=none; b=JA2I91G8KFdds/x9PBU4JNMl/Un84KN8vdiEWHZGVzh1PJujACh61ls0gfQK7Pc9oXYOLJtvp3n5KOyZWhneDbGTVi6tld7MKO/NVL2fqVdgiy9rl4NQXQnre+g4EqALuHrX9LFMlq7ChGT94wnOHFS2CGWh/w1gi8Gjc+WEomU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606758; c=relaxed/simple;
	bh=ttNAzd6I/ZaDegdJeaYWdH1yZmzDjqnA/YL3Pm2rvsw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cTr/bm0MBpz9R04/caCNeEWC4msOgRgTiM6nsFVvyEGXLBotFr6trRy+4G8i1LcWbVkpVIolgmdnlRgglRMTlVSTnMcFp/TB2ATXjsrna/slAH4AX+x28CDytQv70QFvPFh33pdsrTVboS8A1Toh/jA8lflWd3m2Y7QBsIbTGSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zbi2aVuo; arc=none smtp.client-ip=209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so3183078a12.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783606755; x=1784211555; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mbTByd7x2B0SVAGizj79lBbxC5X4KQlpFVsjQoIekHk=;
        b=Zbi2aVuootiApF4z3r/c041uaLYQJXh+LT8G5UGWMPfKxdRKmtgvVUaL9JT9Tf24yW
         L211wYpYHLZFJ0qqGV+9Xvn3q50VqPkjKlSEa5vmJsuBvUaV2Eiqa526XEr0dwXk5gU8
         So/jX6pOGVJqY0Q75TjC0xYfwbRsLoDjGzxNNnRmq+/iM+vNlEF7L34/cOoPZ0PQRTPd
         FkadwZMnHKwhT0PcW3+mgpRPEMkncQOEbY+SlF+gISrSwwwvkO/R40SH1hftO2pXjJGh
         vuTVNNzLfbExeXj5Nv0gZXv7b4UGHGGPgYTddMH3TgMEb4k95O80bCKvAk+5n3LO83eo
         qE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783606755; x=1784211555;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbTByd7x2B0SVAGizj79lBbxC5X4KQlpFVsjQoIekHk=;
        b=cIEKCw1Raoi9XvnC5TAD2cKdR6QIWr61hwoSDfFDwkc/P4JXaYCCxJ4knVL/c4i4GE
         vlZyp2BepSPew+CA7Ndp6NMtCYnnxl8vgXi0lzJanSeNqtSbWcCrv++tdjh6+Lj3QsyZ
         7jxg6JzTsiB/4cSmslmvDUaB5iI2eQxipI00LvQFYdzlZOqcef5OUoizXnhisyS4losM
         2WSmp7jHh4P8xjTOGuCuKvfrvhJ+S7xdjENl8OU2n2eUvw+7wF7/TJJXOO/3mS8WWsqc
         JuN7tHA1+WBULUfTFVv8KWgsLzdMvErXUkHKqNvdTZFPjbrYwU3bHLXhTTNzfdiWRH6x
         6Nrg==
X-Forwarded-Encrypted: i=1; AHgh+RpeHtfSm7FWxVeKlTQOY9vxKVQ+qxoF/HRZRYSfoYMGjP7KPr6hONRC0WMKeDPFqpi7cKRqep03cd1VDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE38+H1G6Dp2Y0prcGemTUVa9nGU0ynatc14/7jH0t88hqvdXa
	FCtLDbkL0nQRS5+k57PHK1Lp0+e/RF6YJ8JuAmngq2WFV5m+G3iDbV20WiCPy4FhEPI=
X-Gm-Gg: AfdE7cm6NK5m5Pf9yNORYZiaiye8MJHpDisF+kKXXFsd96yk7wQe8Rsp6YzSAfsKooX
	6tlnwgesbMctWGHtreK1GM55cgORU93Yob9pKdBRyV/zL/NnU+RfxOhXoVFX2EQHq4Kw/3evKyd
	s6lYtspQ/1Qlj6fI55ylpTFbVWb1k3t0mJk36B4Sp22oKAE6HIYQdGI8gtyRZT0I7oBd2qSyRZB
	QcHFdJgjEI9TF0ejHana43Xo6VRo+ee6Owu3dBpRmUBfKJL6M+gVvET2fDYN+4vbih885bTwxQC
	xCKGMPzTqfDHGboa1Z4ZG/sZlqlnOvDWvFdA70avjd7HbH9RDWCIw91Oj3ik22sVKsfav3+1dV9
	qa4i1NxL4b8jurPnvU34bEBDOgAECxNn+hnBhQOit12ZvNtA95eF/7iLz03dZVQL2indY1wMBzn
	CyJGpqnEvvRMV06qqDbUda
X-Received: by 2002:a17:907:e146:b0:c15:b55b:7826 with SMTP id a640c23a62f3a-c15ce0c03f0mr176642766b.39.1783606755075;
        Thu, 09 Jul 2026 07:19:15 -0700 (PDT)
Received: from [10.1.1.102] ([212.129.81.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ae0bb618sm497210466b.20.2026.07.09.07.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:19:14 -0700 (PDT)
Message-ID: <899942cc84af7a82a35b4ca34b486c40327fd543.camel@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/drm_crtc: ensure dma_fence_ops remain valid
 during device unbind
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: phasta@kernel.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com
Date: Thu, 09 Jul 2026 15:19:30 +0100
In-Reply-To: <1ccfc0b5d1696a8dec4756b675294e7fb41ab5ff.camel@mailbox.org>
References: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
		 <20260708-linux-drm_crtc_fix2-v2-1-cf72be75d75a@linaro.org>
	 <1ccfc0b5d1696a8dec4756b675294e7fb41ab5ff.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67182-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,igalia.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72D89732566

Hi Philipp,

On Thu, 2026-07-09 at 14:32 +0200, Philipp Stanner wrote:
> +Cc Danilo (who is currently concerned with drm_device life times)
>=20
> On Wed, 2026-07-08 at 16:22 +0100, Andr=C3=A9 Draszik wrote:
> >=20
>=20
> [=E2=80=A6]
>=20
> > Link: https://sashiko.dev/#/patchset/20260618-linux-drm_crtc_fix2-v1-1-=
c03e77b36f34@linaro.org?part=3D1
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> I am tempted to think that this also needs a Fixes and needs to be
> backported into stable kernels, doesn't it? Especially if the BUG_ON
> disappears in stable kernels.

Good point, thanks. I forgot to add this in and will try to find a reasonab=
le
commit to relate to.

>=20
> > ---
> > =C2=A0drivers/gpu/drm/drm_crtc.c | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > index 63ead8ba6756..d55f1377ec36 100644
> > --- a/drivers/gpu/drm/drm_crtc.c
> > +++ b/drivers/gpu/drm/drm_crtc.c
> > @@ -501,6 +501,12 @@ void drm_crtc_cleanup(struct drm_crtc *crtc)
> > =C2=A0{
> > =C2=A0	struct drm_device *dev =3D crtc->dev;
> > =C2=A0
> > +	/* Ensure our dma_fence_ops remain valid for an RCU grace period afte=
r
> > +	 * the fence is signaled. This is necessary because our dma_fence_ops
> > +	 * dereference crtc->dev.
> > +	 */
> > +	synchronize_rcu();
>=20
> nit:
> I guess this is the only place where one can reasonably put the
> synchronize_rcu(). But I would hint at the RCU delay in the function's
> docu.

Unfortunately, this still looks like an incomplete fix -
https://sashiko.dev/#/patchset/20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f=
34@linaro.org?part=3D1

My next version will simply copy the relevant strings into a custom

struct drm_crtc_fence {
	struct dma_fence base;
	char driver_name[32];
	char timeline_name[32];
};

or similar as part of drm_crtc_create_fence() and just use those as part
of the dma_fence_ops. That approach should avoid all race conditions and
corner cases with RCU.

I'll also make sure to update relevant documentation.


Cheers,
Andre'

