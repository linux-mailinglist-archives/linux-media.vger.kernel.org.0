Return-Path: <linux-media+bounces-63551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ri47FMLtH2o4sgAAu9opvQ
	(envelope-from <linux-media+bounces-63551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:02:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF7635F79
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:02:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ITFfIgS+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63551-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63551-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBDC930B2590
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042AE36A36E;
	Wed,  3 Jun 2026 09:00:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC89332ED6
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 09:00:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477221; cv=pass; b=QwV1bJoHTBiSZ30U77lix6z5DSSCVRG6OIN+m46NGc9ZXQRFkmUUfpnfFXQQdLvIiBCRHVDAOQUyRKQA116IDS5WoTruv3dnTPLannvSN2xry9K2k35zI5m0jjZl55WtQ1xBM1qMRmnAikrT3kzklUd5P1dmJTS9pIIZUbRJO4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477221; c=relaxed/simple;
	bh=zJgUN1W8jmIwmGBTP01N66fbI53UeJVRuicEBbMQ3dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiidfAWXiC4zImRGEjcFhg4I561XIomRHCYZNNQa9UK+4HdKfSnRaynH0qj8paKImhZb8DJDr/tEmRGYT/qNGkRdu6XikZcCuTgXfNwfucHnhVj5EDoH+vsp5ZSeWcjA8j/7mD2BuXgzH4Umh8utXlyviV1gm/huQVI2JWiy+a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ITFfIgS+; arc=pass smtp.client-ip=209.85.218.52
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bec2ddee9bbso655899166b.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 02:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780477218; cv=none;
        d=google.com; s=arc-20240605;
        b=Vw//2pspFa0ymP+6js7RSEu1K125FTLnS803M7NAOWTnumuswGlRBZnzvsBjEf+rJp
         KBOgQZhBUfHWrLeBVvjSGVfe9iiPFJPninrOugRQAnI8J/AvE59a3ppTHzp1EftmBBV9
         V+MtDDTKct0sZR8rE3eEeXEkA9qNDm8iXmxnnmBR0VKkrsaOE12PhZ/MjQ4wakpymgYp
         IFkik+1t6KVPNpeKM/wEFInKWvMfM8Ks2ELKF+ohxo9YfjBMTTVfUYHDsMpZRiBKwbte
         ZedZQv8b/rZJEBrWsJymFpITDydggZ6DMFGPzGMQvzdW+OlBNgPI8fbA+TTqTHORhuyD
         5qdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jzuby2umJ58JZM+JS4EAdHZjjbUUQ/puGed5+FBLJt0=;
        fh=b+HkhovkJ+dar2ONNyUT++L3ObhAf58pt55qF9YVhbc=;
        b=kRT2ZDYumG0ZpSNKCXt/TYuwtLitj8llPVBB+ja4ShbsNt6V4mLbJMup7yU53lD1Gc
         fPMXj2LXL7R5nqWCkOCAOm/LnUnCucpIPttZkHR7Fxoxp6Gld/dPUYN2Wp1DRSE/GKxx
         aBuQjXz09RjDYW1nxDlhQqr7KhzCeLQtLQrrmiGxtRGYO+7mItumKaPohzvseLXV2+MZ
         GQIHbXIjl1jzgt939lesaOdS0bexrSxv1PsdsKxsX7ZwGSb9hHapzdsgkeoplxjFnzUv
         GFBEhH2Nr5gwsFpS9pbnc9vis20sd95bD6aflEjvpcme4qfynGDyZZNk/8N7XzHnsHJN
         o5aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780477218; x=1781082018; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jzuby2umJ58JZM+JS4EAdHZjjbUUQ/puGed5+FBLJt0=;
        b=ITFfIgS+tj/hSXrZvFKv4z6CDTL8NZtyspXR0/HA0w7GBNmc/9wJ4QNQgHmr4/Jz7a
         88dWAmCzmSNn/kMP2Lpl0l2Iu41XYXstASxOVkaZz1iY6AdnH+c/wAJI4D8mPQdGmIUx
         jKvwiUV48dF+MrxVo7mQoo+yKBNMfWzpu6Jdxb0MbwuSM3gmglF6UAp9v3jwa1dPqt+q
         wohQb+NsdamB7oRTvFRO8pzt2EKSUtPEuxVEPg/qwd7NVAM84R58gRdHhrNTrLzwqKtR
         zcncszyfEPoNWcw+UT3wp/0irUFmSwjAN5aZ/v7WtySHkOprSSWvE2dIj2ttt3YRj8n/
         87rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780477218; x=1781082018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jzuby2umJ58JZM+JS4EAdHZjjbUUQ/puGed5+FBLJt0=;
        b=PiDrAx9qGy3QirmMRLdltl5YxMkwyBtER3eOxYQiEAxSuRJa9KT9fUZ6By/6cWk6G5
         g+zgaYZLLdYQOFD8ThzWu2hukqll0D2Qd7So9k2aToH0XzLNVHAyh2UhJiK22kN3qrmt
         P1cb6mN559skPESUfeMQuUANGFG5vWiNcQBaGOHwJqNrjFrRvZNwY1q1kjjPFKTig3u/
         KmpCiDaprKuI/+LjxU0KYambIwEpoUnlrYQvQS3agn62jC4c4fgL39RcBQTir11h7Riv
         orMzI5+cUozL3l/k07cJGFUuFpt0Mh0gJw6t16FHFqtAYmt9b4l7Cc0uo44EJq2l5Mb+
         CGKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tRNtX/kBW0GotItopH/l0g+urNcDecyAUNsbMvTgBXIdBrpfu8WzGduiypL8Bohfwoo8J1eXOpGTt3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpuPaDlIqnhhcLVReQDqlt/KyziT31kVr/Tz0ZLDXo8WZIL1xI
	fftk2QEV+ZqruqBoIUAeQJ7y9ReDEiMC3+rwoPU88fjgtfDkgvR41ugVOXz/snGeOFUx4FIHsL9
	MbxZ8jViRVrATgynDCgfjSCsIwdJY9uwUhTgFshjhMw==
X-Gm-Gg: Acq92OHmpojzunBcJo+D8jicaDZa7NEs+/wQrgZPmOQzta+kTdBbuYjpEjlyHuMhvKx
	8xjVgax3cei+amZe8cVSBoa41TRY8sGj/sZBvu5wAPolwH7A/9BB+aWCOroDsY2KcX+QY18esvg
	IDa+OUMeUyHslvEWD+Nemwi2nbxMugzxo/sqj9BQMS2vLPme0VWyDtMLy7dr1CRVDuzk4iHnU9f
	XVJFZZ23CyptMe4Mu3CuPFbT5RDsGP7y41JfnJ9uMd7l/fzmjjEt5qvTHyB7l888kyrJ9dzSbkE
	1usAl41FfQN8VZI1qeHlJ/9DOoPJat5g0GtQ48KVWulx3K42S4z7XSZj6w==
X-Received: by 2002:a17:907:86ac:b0:bb8:fd88:f400 with SMTP id
 a640c23a62f3a-bf0a97083b9mr124305866b.21.1780477218276; Wed, 03 Jun 2026
 02:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517172352.3615-2-thorsten.blum@linux.dev> <ah9cwXA2CO5VB6Kf@linux.dev>
In-Reply-To: <ah9cwXA2CO5VB6Kf@linux.dev>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 3 Jun 2026 14:30:06 +0530
X-Gm-Features: AVHnY4KggjhwnZqqk9ax1UCTzRTZe5T2OHJLulQOs1YKwvmbLelqVZK9U3zAOh0
Message-ID: <CAO_48GFrqMzqPJrXU8wKZNUKX083n1ef8163Yx0mkjS86DcJcw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] dma-buf: heaps: use max3 in dma_heap_ioctl
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63551-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.dev:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FDF7635F79

Hello Thorsten,

On Wed, 3 Jun 2026 at 04:14, Thorsten Blum <thorsten.blum@linux.dev> wrote:
>
> Gentle ping?
>
> On Sun, May 17, 2026 at 07:23:53PM +0200, Thorsten Blum wrote:
> > Replace two nested max() calls with a single max3() in dma_heap_ioctl().
> >
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
Apologies for the delay; its now pushed to drm-misc-next.

> > ---
> > Changes in v2:
> > - Include minmax.h as suggested by T.J. Mercier
> > - v1: https://lore.kernel.org/lkml/20260427172519.417333-3-thorsten.blum@linux.dev/
> > ---
> >  drivers/dma-buf/dma-heap.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index ac5f8685a649..d49188893608 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/err.h>
> >  #include <linux/export.h>
> >  #include <linux/list.h>
> > +#include <linux/minmax.h>
> >  #include <linux/nospec.h>
> >  #include <linux/syscalls.h>
> >  #include <linux/uaccess.h>
> > @@ -153,7 +154,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
> >               in_size = 0;
> >       if ((ucmd & kcmd & IOC_OUT) == 0)
> >               out_size = 0;
> > -     ksize = max(max(in_size, out_size), drv_size);
> > +     ksize = max3(in_size, out_size, drv_size);
> >
> >       /* If necessary, allocate buffer for ioctl argument */
> >       if (ksize > sizeof(stack_kdata)) {


Best,
Sumit.

