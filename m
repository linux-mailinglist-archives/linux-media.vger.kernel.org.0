Return-Path: <linux-media+bounces-67327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9x2DGEZiUWp6DgMAu9opvQ
	(envelope-from <linux-media+bounces-67327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:21:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB773EC1F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:21:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=cNtDC6+V;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67327-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67327-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34DDD3044A73
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E363B6354;
	Fri, 10 Jul 2026 21:18:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A03B4EAA
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 21:18:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718306; cv=none; b=uAT3UGLjeg1hfMWuqZGZhN1JPYVl8oQp6hVAK6mjf6vfEfoul9q3SbH6zfS+wJtJFzQiyoJir9PjOMnGVYvT1phEafOqPrvCOi+eD104XN/vI/FSbXpnDNiPG0TlJcgIzZMXua/MTxVHSSBEvbUsTsSKRsakfCm08Akqbu8rtKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718306; c=relaxed/simple;
	bh=ficNYagYQIPTXXmKCLzquJXcfR1k7CdVFC22y7rVVoQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=trAZyuTDkzF4OPKtYx9nxB0vwcgCZF4Lji3di6ZTdGkX2uituyKvYvnxvSSF3o42Eo+Z55+p8+HwnHd8xGwMlyZAlyd8QlqYH9O06ULUS+Zh0TnfSZMGNgesgWGmXoRQcIKKL9ahbr6pfvj7orZbLQx0cDFRbLxaj+qVouUkeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=cNtDC6+V; arc=none smtp.client-ip=209.85.222.176
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-922ff615c14so106560585a.3
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 14:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783718303; x=1784323103; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WsiwI578hidtfXo3Jj5CK8o7cgRkY/PSnZLtr9p7LeU=;
        b=cNtDC6+V+3vrq36NSFKoaVn+czi/S1Bz1ULbVddrz6VfYOWghZ9TfP2rIbZd4ByBJe
         jWnoCyo2GlQFfkXZnwKUXXs9XhxFkrBHal3SSyHP/mjm2aNZ7Ok1GdVrLh/u/GbHRP8/
         bba9kU2eDtOg092Zsgd8bOS06L4LxqShzelVgWxMdyFnIvwI8naVKssx3k6sbipuAJ65
         2vUTlPtUI7sBRXJChdZYUj0/pF35p0G99v4uSU15KjdjcQMXD1nIurk+idWEC0tk9e8k
         csazpwYURb8VEHFgtxq1qInpc44Px6kIxt3s0D4Y14kIXJrpJBu8GUJ437091/BCZSL1
         YFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718303; x=1784323103;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsiwI578hidtfXo3Jj5CK8o7cgRkY/PSnZLtr9p7LeU=;
        b=XeECeDTe4KE5rstTo3lJln8IW9chGHMRWPqhdk9/6u2BUoB4yDSMAwXGhHLkqtcdDq
         MvX2R5P7Beisz/hEhMTWNFj3mK8MQxpOdDm2XRLccq2uESAIb4xrmd1Xt8HskIJoUCSI
         qvTkuU8qB2J2P6NK0D9ez2zg+v6M+fcc+8d6gVi6wX+HE4eQVNUIl1bAHsIONwtxfaT7
         spHl5PnHr2fIeGtkpzGRs0/dimepyKRyvfw4Jvc5JFItOzEok6Y4EKLomx6WtBM+F2+G
         LdD7vqNNr5hhCA/CklE1rDTj3/abVBfJolonqzRnarRcxRfc0lJbcuoDhVMhUtRWSBro
         sNEg==
X-Gm-Message-State: AOJu0YzoPjVKtybSl4fpRMaIEq0wGzo4bVj59/mJfhVlU+1xa5UXDKBc
	yRUWjMIDWM2nS8yTiZxfutUZWFsOGPWHCEQnOeopWxEg8tE4Jj+NaPam3yUn6Iu4glMmAZiod1n
	YuJBENmQ=
X-Gm-Gg: AfdE7cmxQeD7qG01TV0edgCEkaeFZBIYD6LYdE384LNsWUCYBzX+CwBu2jEfygoJkR6
	n0oyk67XON6cwVoulRbzxj/0pxXtVGLjyY7/l+tAvuPXqGWZEJ8dcNUDthYTUp/1brAl289h98R
	4EA29OcZkpNex2CwSxzoTUesxMG74y7zzgoX1xyTw9EnsWVHYorl7KK2xXf3tqAxNtT6NeQPyND
	iBqYmNzA9nkuD2dai9KzshPoKCKcXB9yv8QMntuPasPdFF5jMmnEk7dHQpMXFq0oQNF8bOkJlDk
	k1wUklzqqu+hZki6mNIStuhamR6Pr6W122EhSew3Htq4Qht6FjjiOX81xBUe+7AMrVDpOS+cjV8
	2yWVQH2D35jjFWDIGSFOaA73TEXr33TnWvR6pLpAF8FJDB42bRQ76Du70ro9vc5Rxfg1AnuhD4m
	s0oo/unOXGOZWg/p7/Pw==
X-Received: by 2002:a05:620a:284c:b0:92e:7f13:1489 with SMTP id af79cd13be357-92ef2b4b8c4mr103370485a.10.1783718303296;
        Fri, 10 Jul 2026 14:18:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b4b38dsm307659485a.10.2026.07.10.14.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:18:22 -0700 (PDT)
Message-ID: <aae16dbfb26c8ee7e54247ca4d123b15748d623f.camel@ndufresne.ca>
Subject: Re: [PATCH 05/17] media: v4l2-mem2mem: support running multiple
 jobs in parallel
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 10 Jul 2026 17:18:20 -0400
In-Reply-To: <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
	 <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-QDW0FalwTgRr/hRObvGf"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:s.pueschel@pengutronix.de,m:jacob-chen@iotwrt.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:detlev.casanova@collabora.com,m:m.tretter@pengutronix.de,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67327-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ndufresne.ca:mid,ndufresne.ca:from_mime,pengutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2FB773EC1F


--=-QDW0FalwTgRr/hRObvGf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 06 juin 2026 =C3=A0 00:06 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Add support for running multiple jobs in parallel for SoCs containing
> multiple identical devices. An example is the Rockchip RK3588 SoC,
> which contains two identical RGA3 devices. Therefore it is desirable to
> have the kernel schedule the work across all available devices and only
> expose one video device to the userspace.
>=20
> Previously the curr_ctx member of a v4l2_m2m_dev was used to track the
> currently running context. But the currently running context will always
> be at the top of the job_queue. As the TRANS_RUNNING flag can be used to
> check if the queue head is already running, the curr_ctx member can be
> completely dropped
>=20
> To avoid queueing too many parallel jobs, the
> v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
> to set the number of parallel jobs and avoids calling device_run when
> the given number of jobs is already running. This is set to 1 by default
> to prevent parallel job runs. Drivers with the need and support for
> scheduling jobs can adjust this value accordingly.
>=20
> Note that this change doesn't allow a context to be used multiple times
> in parallel. So a single stream won't be able to utilize multiple devices
> at once, but N streams can utilize up to N devices. This is caused by the
> fact that a context is not added multiple times to the job_list and also
> holds the job_flags to distinguish if it's currently running.

I do prefer this over Detlev proposal, so let's move toward this. Would be =
it
cleaner though to first remove curr_ctx and then add=20
max_parallel_jobs ?=20

Nicolas=20

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-mem2mem.c | 89 ++++++++++++++++++++++-=
----------
> -
> =C2=A0include/media/v4l2-mem2mem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A02 files changed, 62 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-
> core/v4l2-mem2mem.c
> index a65cbb124cfe0..14ac9c85803d1 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -84,16 +84,15 @@ static const char * const m2m_entity_name[] =3D {
> =C2=A0 *			v4l2_m2m_unregister_media_controller().
> =C2=A0 * @intf_devnode:	&struct media_intf devnode pointer with the inter=
face
> =C2=A0 *			with controls the M2M device.
> - * @curr_ctx:		currently running instance
> =C2=A0 * @job_queue:		instances queued to run
> =C2=A0 * @job_spinlock:	protects job_queue
> =C2=A0 * @job_work:		worker to run queued jobs.
> =C2=A0 * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
> + * @max_parallel_jobs:	max job_queue instances number marked as running
> =C2=A0 * @m2m_ops:		driver callbacks
> =C2=A0 * @kref:		device reference count
> =C2=A0 */
> =C2=A0struct v4l2_m2m_dev {
> -	struct v4l2_m2m_ctx	*curr_ctx;
> =C2=A0#ifdef CONFIG_MEDIA_CONTROLLER
> =C2=A0	struct media_entity	*source;
> =C2=A0	struct media_pad	source_pad;
> @@ -108,6 +107,7 @@ struct v4l2_m2m_dev {
> =C2=A0	spinlock_t		job_spinlock;
> =C2=A0	struct work_struct	job_work;
> =C2=A0	unsigned long		job_queue_flags;
> +	u32			max_parallel_jobs;
> =C2=A0
> =C2=A0	const struct v4l2_m2m_ops *m2m_ops;
> =C2=A0
> @@ -123,6 +123,12 @@ static struct v4l2_m2m_queue_ctx *get_queue_ctx(stru=
ct
> v4l2_m2m_ctx *m2m_ctx,
> =C2=A0		return &m2m_ctx->cap_q_ctx;
> =C2=A0}
> =C2=A0
> +void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
> +				=C2=A0=C2=A0=C2=A0 u32 max_parallel_jobs)
> +{
> +	m2m_dev->max_parallel_jobs =3D max_parallel_jobs;
> +}
> +
> =C2=A0struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum v4l2_buf_type type)
> =C2=A0{
> @@ -229,14 +235,22 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_buf_remove_by_idx);
> =C2=A0void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m_dev)
> =C2=A0{
> =C2=A0	unsigned long flags;
> -	void *ret =3D NULL;
> +	struct v4l2_m2m_ctx *first_ctx;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> -	if (m2m_dev->curr_ctx)
> -		ret =3D m2m_dev->curr_ctx->priv;
> +	if (list_empty(&m2m_dev->job_queue)) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		return NULL;
> +	}
> +
> +	first_ctx =3D list_first_entry(&m2m_dev->job_queue,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_m2m_ctx, queue);
> =C2=A0	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =C2=A0
> -	return ret;
> +	if (first_ctx->job_flags & TRANS_RUNNING)
> +		return first_ctx->priv;
> +	else
> +		return NULL;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
> =C2=A0
> @@ -252,13 +266,11 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
> =C2=A0static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
> =C2=A0{
> =C2=A0	unsigned long flags;
> +	struct v4l2_m2m_ctx *ctx;
> +	struct v4l2_m2m_ctx *chosen_ctx =3D NULL;
> +	u32 running_jobs =3D 0;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> -	if (NULL !=3D m2m_dev->curr_ctx) {
> -		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> -		dprintk("Another instance is running, won't run now\n");
> -		return;
> -	}
> =C2=A0
> =C2=A0	if (list_empty(&m2m_dev->job_queue)) {
> =C2=A0		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> @@ -272,13 +284,30 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev
> *m2m_dev)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> -	m2m_dev->curr_ctx =3D list_first_entry(&m2m_dev->job_queue,
> -				=C2=A0=C2=A0 struct v4l2_m2m_ctx, queue);
> -	m2m_dev->curr_ctx->job_flags |=3D TRANS_RUNNING;
> +	list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
> +		if (!(ctx->job_flags & TRANS_RUNNING)) {
> +			chosen_ctx =3D ctx;
> +			break;
> +		}
> +
> +		running_jobs++;
> +	}
> +	if (running_jobs >=3D m2m_dev->max_parallel_jobs) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		dprintk("Maximum number of parallel jobs reached\n");
> +		return;
> +	}
> +	if (!chosen_ctx) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		dprintk("All jobs already running\n");
> +		return;
> +	}
> +
> +	chosen_ctx->job_flags |=3D TRANS_RUNNING;
> =C2=A0	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =C2=A0
> -	dprintk("Running job on m2m_ctx: %p\n", m2m_dev->curr_ctx);
> -	m2m_dev->m2m_ops->device_run(m2m_dev->curr_ctx->priv);
> +	dprintk("Running job on m2m_ctx: %p\n", chosen_ctx);
> +	m2m_dev->m2m_ops->device_run(chosen_ctx->priv);
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -469,15 +498,14 @@ static void v4l2_m2m_schedule_next_job(struct
> v4l2_m2m_dev *m2m_dev,
> =C2=A0static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
> =C2=A0				 struct v4l2_m2m_ctx *m2m_ctx)
> =C2=A0{
> -	if (!m2m_dev->curr_ctx || m2m_dev->curr_ctx !=3D m2m_ctx) {
> +	if (!m2m_ctx || !(m2m_ctx->job_flags & TRANS_RUNNING)) {
> =C2=A0		dprintk("Called by an instance not currently running\n");
> =C2=A0		return false;
> =C2=A0	}
> =C2=A0
> -	list_del(&m2m_dev->curr_ctx->queue);
> -	m2m_dev->curr_ctx->job_flags &=3D ~(TRANS_QUEUED | TRANS_RUNNING);
> -	wake_up(&m2m_dev->curr_ctx->finished);
> -	m2m_dev->curr_ctx =3D NULL;
> +	list_del(&m2m_ctx->queue);
> +	m2m_ctx->job_flags &=3D ~(TRANS_QUEUED | TRANS_RUNNING);
> +	wake_up(&m2m_ctx->finished);
> =C2=A0	return true;
> =C2=A0}
> =C2=A0
> @@ -544,16 +572,19 @@ EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
> =C2=A0void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
> =C2=A0{
> =C2=A0	unsigned long flags;
> -	struct v4l2_m2m_ctx *curr_ctx;
> +	struct v4l2_m2m_ctx *ctx;
> +	struct v4l2_m2m_ctx *ctx_safe;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> =C2=A0	m2m_dev->job_queue_flags |=3D QUEUE_PAUSED;
> -	curr_ctx =3D m2m_dev->curr_ctx;
> =C2=A0	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =C2=A0
> -	if (curr_ctx)
> -		wait_event(curr_ctx->finished,
> -			=C2=A0=C2=A0 !(curr_ctx->job_flags & TRANS_RUNNING));
> +	list_for_each_entry_safe(ctx, ctx_safe, &m2m_dev->job_queue, queue) {
> +		if (!(ctx->job_flags & TRANS_RUNNING))
> +			break;
> +
> +		wait_event(ctx->finished, !(ctx->job_flags & TRANS_RUNNING));
> +	}
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(v4l2_m2m_suspend);
> =C2=A0
> @@ -896,10 +927,8 @@ int v4l2_m2m_streamoff(struct file *file, struct
> v4l2_m2m_ctx *m2m_ctx,
> =C2=A0	q_ctx->num_rdy =3D 0;
> =C2=A0	spin_unlock_irqrestore(&q_ctx->rdy_spinlock, flags);
> =C2=A0
> -	if (m2m_dev->curr_ctx =3D=3D m2m_ctx) {
> -		m2m_dev->curr_ctx =3D NULL;
> +	if (m2m_ctx->job_flags & TRANS_RUNNING)
> =C2=A0		wake_up(&m2m_ctx->finished);
> -	}
> =C2=A0	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
> =C2=A0
> =C2=A0	return 0;
> @@ -1194,12 +1223,12 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct
> v4l2_m2m_ops *m2m_ops)
> =C2=A0	if (!m2m_dev)
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0
> -	m2m_dev->curr_ctx =3D NULL;
> =C2=A0	m2m_dev->m2m_ops =3D m2m_ops;
> =C2=A0	INIT_LIST_HEAD(&m2m_dev->job_queue);
> =C2=A0	spin_lock_init(&m2m_dev->job_spinlock);
> =C2=A0	INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
> =C2=A0	kref_init(&m2m_dev->kref);
> +	m2m_dev->max_parallel_jobs =3D 1;
> =C2=A0
> =C2=A0	return m2m_dev;
> =C2=A0}
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 31de25d792b98..e6177d0eaf637 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -594,6 +594,9 @@ static inline void v4l2_m2m_set_dst_buffered(struct
> v4l2_m2m_ctx *m2m_ctx,
> =C2=A0	m2m_ctx->cap_q_ctx.buffered =3D buffered;
> =C2=A0}
> =C2=A0
> +void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
> +				=C2=A0=C2=A0=C2=A0 u32 max_parallel_jobs);
> +
> =C2=A0/**
> =C2=A0 * v4l2_m2m_ctx_release() - release m2m context
> =C2=A0 *

--=-QDW0FalwTgRr/hRObvGf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFhnAAKCRDZQZRRKWBy
9PrwAQDNSzCL5oAGQfVmC3OhUffae971mvKMYg7A8/oRYIIxKgD/cgSHWJHtif2N
4LPSEtHdmWGJ5UHRpA48+LdsQPOBYgU=
=lbZn
-----END PGP SIGNATURE-----

--=-QDW0FalwTgRr/hRObvGf--

