Return-Path: <linux-media+bounces-57287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFnKJMe6xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:13:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 117213481F3
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8079300E15D
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A48632FA18;
	Fri, 27 Mar 2026 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uf+eMPDf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DF0373C0C
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631150; cv=pass; b=k+jUieUj3bG8+PT7h+9uIGaOEeSWRN/0ZzZmkLvzEugvI8vtMeYKqz3rGidFQO6qYArhqZ3PP3D1ydOny0ZxACdNmBquLZkgA17U5dN3gMy+pwYZ9HUskC5niN+tv1tQsctKksdtWdE9WV6DcK54MKLcHCOWGmJTQnmf8+4LV0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631150; c=relaxed/simple;
	bh=KxDcSy47bAfoQuMRLt5MzBmd7xaJbpL9h78ZE4K/MgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYkF4f+fb8s0nbo5nh86vyh4d8Ygr64WSspn0Ooy4RqZjdcWRo21FaZMHA75U3Tz3+FSfqXtExHpyiwt5bNQ6yQL0NtNBM3Us3brNkf2eqxzllxCqEnzAm8A17ab8E1BBySI5zdVcdQqVPtBxVA8FtH9MJXY7637RUuXuhgJpNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uf+eMPDf; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-41c4d660b19so747095fac.1
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 10:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774631147; cv=none;
        d=google.com; s=arc-20240605;
        b=Nwlc8DcJoTfCKGac3Ki9l8/E06O4b1dquTX0hrwhysIimzYRuvs3rjXjAMrJIHL/40
         urGkfRjuuXHfBWTTw176ldmUz8PF6aP13zoXqK2i8cbxEQhsxrdFuuGdHKGtLlRRExOb
         U6BlNfnSGcL0dUB4lq2/F3caIDZKzl7RR6Bo3dgjuNk7s/mr31dqjUWBLBpco5Z+PDoa
         m22bmc5q5/V5HhkdYQvGOu4m8pcp+5bD5m61q7B4tFqT4+5K9rBDBy1oHswhsot+v4et
         AM2Lxa0/g2e7dFIGXp4BaGOosPoJ6Sa1VAjele71Q50qYxB20jInZIri5LTBGNXjP/7K
         0hSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lX9rU1JAxt+bgoXrnOOZH0yzE8Cx3Qhs2LlHjL4ZTtY=;
        fh=RSfsxxjCkTNAMsI7eDj4OS5e5/dSaf9yotJQaq3E1hQ=;
        b=ELd8qyVeBSrecsJOR7PXupS4v8gGmPQNPvSY+vWYLK1Fy0OWWXWn0veGOK+rvXKw4Q
         0HJqDjM/H/rDduAzSmPJjQ4ooFYLiUGJGKNcfWEn+1xFp1W2ujzuGfO8vGO1Fc7Imgv+
         907yl+qF9zP5TK5q1IBgrr5QiSAFlrYTMK9phtCCQP3tBDHamlFYp0PbMZHcpuVPT20B
         fC2yBPvLYQnDkIETzK2DkwNJOJV+5aQ9ZOv4wW5xAnkSE/ak/WG3dJ3GddZlFJ3pi1ng
         shuGByMsAovjSf3DahV7hN4onqWGkfcMcwQlXDIGVofehIoOBpUvQZHHbcSE3AxkxB9F
         gPBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774631147; x=1775235947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lX9rU1JAxt+bgoXrnOOZH0yzE8Cx3Qhs2LlHjL4ZTtY=;
        b=Uf+eMPDfG3L9EYtmChqJAosaa/QTbucim2qJWmb0hOqvMRguuWFiLq+2bkXJP2NQWe
         tDASN2eZehDmGhFUQqnIwWZLPBd74kNRQnipUXy734wIx9o1i3afkbQDcFcDnMzqS7H+
         +hp5C2yW50eTrIHa79qTTkLrpeO6IixOL2UCRtaqAtnUZl367rV5+TNxsB3/H0pVXgxh
         wYMlNOsjQagAvfzhLwu7rJy3FJr4h3s3c1bjvOzyRQ+mliPEuna5hZAItFqG+RfXHvbm
         sjyG93KWs4qE4p83IbsdlXPTiUnw1pKKUz6mZiHhG8JanCpdphN7ubRARTUXkBouEzEY
         O2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631147; x=1775235947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lX9rU1JAxt+bgoXrnOOZH0yzE8Cx3Qhs2LlHjL4ZTtY=;
        b=GvB5sT1jzgibwEpq6E5mXfF1FIMfIAyiAQD2ZJQGTe1bh21dyAw7c27gqvTRXRXDIQ
         VJy8S7JYzqbhUXyjyOqN33jCY6pzffSClcYplLg9cXrv9ZJjkF9FEopRVS7KVzF7Vsi2
         bBg+VOgR3OKkMSbcNrwHm+DKVsChpvnbY/HyXA7crE7V/xiE85JXpABtDecaqMbEJLmY
         0fjLkik2Wyrv7Q9n01VFZgXeEJxwVhaMr8HVoTSmuXXZh4Gif8TTZia/WFPBumtSGeSM
         NDcH14wY2tVjmvO4AN+NF72vNIk/Q8HErRbPgbfVtsJO8pIts6wVnUq6vuxGO3ba0fz/
         Zxsw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ0UEmU4+JsxU6Q9nbF2UUW1fGbFX1TG7UcCp+/DrlAEimHEho0NK0oY4v5E5j+icqw/K5LVB4W2rEAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzaEFfIHceCyIVfd92atauyl8FMtMnEOhJ+gxXPsUolK3Tms3T
	2ATIrlKIfzxMqd+uhbXZeJWHMTyH0yQKbHsZEgR73Eek1LttfShzCo5EglNKjT45hTn46spZjsH
	XO8CCBIoeltfS5wE3/s4icJ0wbER1KuRnfDhS
X-Gm-Gg: ATEYQzxErbILo6/c211eBJeNESpSYk5fn+4WZcGAv+XeR02UexqI0zznk4+cpU3zqz7
	09vq5dsOarmtAvnGq1ffN587lQtypLJlQFcH5if0BrVcBg1M4uSzjUd713Wb6+b4X9admqTQiFv
	xrhZJfGIvFrmMu8GpvY9i0Z6CXcNI5A4M09P1D+mX+92VeKMbRKld4yGCTmrljo45Ixy9jsiklh
	x1vD8TJh0eCUhXbP1BlIwKwzg6MqrmAhM8IAFj4cv9+nmxzmr/+HcHlORBN8gevyYKJtSnPC6jq
	hY6Y/t/Sn/574hVNx+hONSjescHbrVUUQL7nEQ==
X-Received: by 2002:a05:6871:7517:b0:417:2d6d:b7ad with SMTP id
 586e51a60fabf-41cec1579bdmr1597208fac.21.1774631146623; Fri, 27 Mar 2026
 10:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327150707.256752-1-devnexen@gmail.com> <aca24HacGjPajA7i@zed>
In-Reply-To: <aca24HacGjPajA7i@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Fri, 27 Mar 2026 17:05:35 +0000
X-Gm-Features: AQROBzAElEP54RN_ETw7sNcPsrEGQ90Wb8hY173pNuX5Jhp6Fre8uKG-LXGcejQ
Message-ID: <CA+XhMqzsnhGH+e3=HpL9-1aqpJawOR_rkKAVYgGjqADtbRKa+w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] media: mali-c55: add missing of_reserved_mem_device_release()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57287-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 117213481F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 at 16:58, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi David
>
> On Fri, Mar 27, 2026 at 03:07:05PM +0000, David Carlier wrote:
> > mali_c55_probe() calls of_reserved_mem_device_init() to associate
> > reserved memory regions with the device. This function allocates a
> > struct rmem_assigned_device and adds it to a global linked list, which
> > must be explicitly released via of_reserved_mem_device_release() =E2=80=
=94 there
> > is no devm variant of this API.
> >
> > However, neither the probe error paths nor mali_c55_remove() called
> > of_reserved_mem_device_release(). Any probe failure after the
> > of_reserved_mem_device_init() call, as well as every normal device
> > removal, leaked the reserved memory association on the global list.
> >
> > Fix this by adding an err_release_mem label at the end of the probe
> > error chain and calling of_reserved_mem_device_release() in
> > mali_c55_remove(). The remove teardown order is also corrected to call
> > mali_c55_media_frameworks_deinit() before kfree(), mirroring the probe
> > init order in reverse.
> >
> > Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> With your permission, I'll take these three patches in a follow-up
> series that fixes the module loading/unloading.

Yes please go ahead ! Cheers,

>
> I could also specify it as pre-requisite to b4, I'll see what's easier
>
> Thanks
>   j
>
> > ---
> >  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/driv=
ers/media/platform/arm/mali-c55/mali-c55-core.c
> > index c1a562cd214e..5cb59c70ffc9 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > @@ -806,8 +806,10 @@ static int mali_c55_probe(struct platform_device *=
pdev)
> >       vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
> >
> >       ret =3D __mali_c55_power_on(mali_c55);
> > -     if (ret)
> > -             return dev_err_probe(dev, ret, "failed to power on\n");
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "failed to power on\n");
> > +             goto err_release_mem;
> > +     }
> >
> >       ret =3D mali_c55_check_hwcfg(mali_c55);
> >       if (ret)
> > @@ -846,6 +848,8 @@ static int mali_c55_probe(struct platform_device *p=
dev)
> >       kfree(mali_c55->context.registers);
> >  err_power_off:
> >       __mali_c55_power_off(mali_c55);
> > +err_release_mem:
> > +     of_reserved_mem_device_release(dev);
> >
> >       return ret;
> >  }
> > @@ -854,8 +858,9 @@ static void mali_c55_remove(struct platform_device =
*pdev)
> >  {
> >       struct mali_c55 *mali_c55 =3D platform_get_drvdata(pdev);
> >
> > -     kfree(mali_c55->context.registers);
> >       mali_c55_media_frameworks_deinit(mali_c55);
> > +     kfree(mali_c55->context.registers);
> > +     of_reserved_mem_device_release(&pdev->dev);
> >  }
> >
> >  static const struct of_device_id mali_c55_of_match[] =3D {
> > --
> > 2.53.0
> >
> >

