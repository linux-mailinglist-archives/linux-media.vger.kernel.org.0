Return-Path: <linux-media+bounces-57494-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK2PBIfPyGkNrAUAu9opvQ
	(envelope-from <linux-media+bounces-57494-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:06:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A545350FAF
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A56C7301980B
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 07:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576B229992A;
	Sun, 29 Mar 2026 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFASYLiz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534DB274FEB
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768000; cv=pass; b=bEI6VkQwFfPdTtyyL0baf5ACM+wRpVPNxphfHYIdprZYu6GO+6/lc+mZWnODYp+r4z53/6++fBRfHjqB55YFw9kWG/mHeU5sLTfJfvDubbBPfKTeXIidbJ8nRXJnO/7YoaNnQY8FeMfbZ2zYCjDcAaOAtWYmZpRxApcS3W3cPCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768000; c=relaxed/simple;
	bh=NNGBmtQAgY+BxkCF0EV6ObLRWDh5SxBHx6Zh3deyXDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJ7tmpySkGxwDMPS9UV2Ph2qzXo5+OF/8JNXX0jnhgKH65qcaiOb0HN7PUY9thVQPGKWl/te//gM+50NJUGiTlRCTb1dXWC2DP5/Ux+/3b1+3K921nAEW3it2/rcbjCQJfOwksusvPtAo8I6Y9GIWcxs7UYuAVNhlbAysbFADU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFASYLiz; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66bb6eb28acso405527a12.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774767998; cv=none;
        d=google.com; s=arc-20240605;
        b=kIJe4y+Rtr+Jcb5W03ka1eua1Xqf0lMuLOTJL4bj9kBoNMWmvEUPTtKYj6k0W3ixSh
         y706lqaDdtsx3fsldtT2cjiVNkXgCNGuvsYHooOsHwkYMjOm06LiZzXbb0bZ9VvUkKOa
         in6MGPsbtFQI+Disnff73M1MBcOlqfg/jCM4Al3KAU2MzqDt0rPmx4Es2q8fHFGTsFh3
         VRncGZQHrngvCVRH0U67Ef9G1ufvp3nn7Gac/mETwQ/RBrkfPFrQsUJdWycwzNc12/lL
         LlQwyeN0Rk7c0WrD3cjz436vpOPP4wmVYlLjM+kbzssBV4fNoWlMq5NqaVzCGAulq+Vf
         rsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPoAbaOTDaZRILn48jSD9a5Te7NEEJaguvhFNEZ/iuU=;
        fh=jVNYieIZoTff/qw7+QME5E9cI+Zh1RejN6shk+DyUWs=;
        b=BSBZTUQXMfApbXUsT0uZGmE4S6s7/hORdDk/TC21BbPQeCgFyt9JDMYrImjI2TrEUP
         UQgAGeu0hkj/qfKxoLUiMXNf5AN8Vu3iRmcRKiBN1OXDMsMF2jlyqoATN1stNfhvNLyF
         cSys37Qi5kKdV0TqXyBGFG0OZgygK+60Dt/wZXVVfSQgDyfnqddRMP+Wt3pMlfx+n8lq
         yqjAUB+lvlfBKZa+KGWtXO0DfLgijjsqO/OeWTl2dlqztIoPzk4KM2uH/CSzW0wUoXuo
         Y34mASkPvCMBS+JXtDrJpZsLpq50eTLOew9x95BbrwCbIwSdAxVDkF8/zGsIgBUBz5tb
         UxjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774767998; x=1775372798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPoAbaOTDaZRILn48jSD9a5Te7NEEJaguvhFNEZ/iuU=;
        b=FFASYLiznGOZIU+irNTHXE/bEHxpODf1uaWGMXNhk3Lf3JdoKGlj07xkMaX+x3yWoh
         o5GaBjWEZMcx48P5KfWCjPIj7U4+bbOvsnsEiMC+NNNAG4k1BJgaXEh4z/DPl3lqfjId
         RCHqxUHIvIfw8cC8BYxgpZkvu4KZm6PVif7dy4wqdzwD8v/j+yTJZhRAHehTP9LK3JP8
         S3kC7hp+cO7ObajIaZhqcbKigY8/6QncXqVD9QV/+0Zo5PgqBT0TrGbZmXGf7bY93M1z
         cIjyWA81i16aSbB00V+Twg700hfzl8ncF/feQ8wzXVeYvV9t/Z+H26zPvpm8Y5bFzSyK
         OJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774767998; x=1775372798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QPoAbaOTDaZRILn48jSD9a5Te7NEEJaguvhFNEZ/iuU=;
        b=LLKzigup9fE/3x9alX7faYm5PH5ghF28PazFrmMHaG23WCKcOY0d3GyT5nl4xI0t4T
         J7rlCInOOVdH9F8OPLzvRTibuN6CYzpmMCtF4RhU3xiOiCGyty7ANeBUpXzige0NtjbJ
         odDTn5PgDMkdt4VAQktH5vQ5hBL2wU51N8LIpF0tMqNtsR29ww6ihg6kjrGpMLDOngna
         I/Yd187GxNHPJqkURCWFtt+wfk0PvXfcDoWk4wj6YppfBJNwPqr6/FuD1a0N4o3JBixx
         iBVt40yipaEPjgz3GKjRN1/R0tcyFSZwzrZxDaHHpx0/kRhPB4qTiaMMfjkcS62Cdr+c
         LgEA==
X-Forwarded-Encrypted: i=1; AJvYcCW3CUpO7+JLx9oA3kSkaQlVePYgJ+7LqLfTOg8U4cVER3AYW73qh6p1pmYtvawoEVGLYHfEWwcAIJP+xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDY94h9Xt49Ygs2ymdyiWue4VwMI7tn7pN8axunSdVMpx2E0Jp
	vawGh26riyK4N82M9dojyeiTgyh4L2C6bBYhTyJiqI8YIz+0q/X7QU6NBKOvNdui2VrCpSlsVMU
	ZjC2G9gfZXolTYomHOuyL/u9ZVxF7zAE=
X-Gm-Gg: ATEYQzxWRLygEh7h9eTqf0L8E9Q4Z6IFpVY8yiVLDl2m6XUnzMVhOF6yc8R8z108xPD
	IlPFllRBHshFIPtOOJtwTGbwAaJsOQlL6oFsHqkwbcaHjgZRYZPVvfQv7k8fxCoDubbNpSX6qCT
	v/hL/UR2I7e8zKrLgyZCNlZ9t2O9J/ckSEvwKdnkBXbDU2Zw+cX7R1iaGTP5p95Mws1Yh6s7VEg
	OAmZRnJyl2FRipEwdY01fwwskf1vqahykZ7IIyF/kLlaG307pBxydMbqdv4CgVGIpbjWiLw3Sj0
	nmWZwnNe
X-Received: by 2002:a17:907:1b17:b0:b93:9ac0:7913 with SMTP id
 a640c23a62f3a-b9b50569823mr591319666b.35.1774767997433; Sun, 29 Mar 2026
 00:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329062229.493430-2-sebasjosue84@gmail.com> <2026032936-deniable-visa-2459@gregkh>
In-Reply-To: <2026032936-deniable-visa-2459@gregkh>
From: =?UTF-8?Q?Sebasti=C3=A1n_Alba?= <sebasjosue84@gmail.com>
Date: Sun, 29 Mar 2026 01:06:24 -0600
X-Gm-Features: AQROBzAihjIwpcTjap3p5TjClCHzZ37PiL7DJ6OWobwHSfMj9QJhipEKcBxE3f0
Message-ID: <CAJD=UNcZXXV+iQrGCeUUBdq-NzKOy8ZTGT=72mgkCVEyCrkiHQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] staging: vc04_services: vchiq-mmal: fix OOB array
 access in event_to_host_cb()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57494-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebasjosue84@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6A545350FAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg,

> The kernel trusts the hardware the driver is bound to, so this
> shouldn't be happening ever, right?

You're right that the kernel generally trusts hardware it's bound to.
This is a defensive hardening patch - a malformed index from buggy
firmware would currently cause an uncontrolled OOB access, while with
the check we get a clean error return. Happy to reframe the commit
message as hardening rather than a security fix if you prefer.

> No cc: stable?

Will add Cc: stable@vger.kernel.org in v2.

> dev_err() is best, right?

Agreed, will switch to dev_err() in v2. I'll need to thread the
struct device through - will check how other functions in this
file handle it.

> And are you going to allow a malicious hardware device to spam
> the kernel log?  :)

Good point, will switch to dev_err_ratelimited() in v2.

I'll send a v2 addressing all of these. Thanks for the review.

Sebasti=C3=A1n


El dom, 29 mar 2026 a las 0:35, Greg Kroah-Hartman
(<gregkh@linuxfoundation.org>) escribi=C3=B3:
>
> On Sun, Mar 29, 2026 at 12:21:11AM -0600, Sebastian Josue Alba Vives wrot=
e:
> > From: Sebasti=C3=A1n Alba Vives <sebasjosue84@gmail.com>
> >
> > event_to_host_cb() uses msg->u.event_to_host.client_component as an
> > index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONE=
NTS
> > =3D 64) without any bounds validation. The client_component value comes
> > from the VideoCore GPU firmware via VCHIQ message passing.
> >
> > A malicious or buggy GPU firmware could send a crafted
> > MMAL_MSG_TYPE_EVENT_TO_HOST message with client_component >=3D 64 (or
> > negative), causing an out-of-bounds array access in kernel memory. This
> > results in reading/dereferencing a bogus vchiq_mmal_component structure
> > from memory beyond the array, which can lead to kernel crashes or
> > potentially arbitrary kernel memory access.
>
> The kernel trusts the hardware the driver is bound to, so this shouldn't
> be happening ever, right?
>
> >
> > Add a bounds check on comp_idx before using it as an array index.
> > Move the component pointer assignment after the validation.
> >
> > Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from cam=
era")
> > Signed-off-by: Sebasti=C3=A1n Alba Vives <sebasjosue84@gmail.com>
>
> No cc: stable?
>
> > ---
> >  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/dr=
ivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > index d36ad71cc..4772126d7 100644
> > --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > @@ -477,12 +477,19 @@ static void event_to_host_cb(struct vchiq_mmal_in=
stance *instance,
> >                            struct mmal_msg *msg, u32 msg_len)
> >  {
> >       int comp_idx =3D msg->u.event_to_host.client_component;
> > -     struct vchiq_mmal_component *component =3D
> > -                                     &instance->component[comp_idx];
> > +     struct vchiq_mmal_component *component;
> >       struct vchiq_mmal_port *port =3D NULL;
> >       struct mmal_msg_context *msg_context;
> >       u32 port_num =3D msg->u.event_to_host.port_num;
> >
> > +     if (comp_idx < 0 || comp_idx >=3D VCHIQ_MMAL_MAX_COMPONENTS) {
> > +             pr_err("%s: component index %d out of range\n",
> > +                    __func__, comp_idx);
>
> dev_err() is best, right?
>
> And are you going to allow a malicious hardware device to spam the
> kernel log?  :)
>
> thanks,
>
> greg k-h



--=20
Sebasti=C3=A1n Alba

