Return-Path: <linux-media+bounces-58872-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMqDJa244GmIlAAAu9opvQ
	(envelope-from <linux-media+bounces-58872-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:23:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C12F40CDF3
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E53323023DA5
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFF139F16C;
	Thu, 16 Apr 2026 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fyq6HP5N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B49339E185
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334762; cv=pass; b=X8wOPw2ShDO2qOwNfyi0oMSJLoM7knwy1iRAxW+d3vSnvdwTkjwbH8BxppCXrW2OErPdRNGMlgKn9z69Rxu83vhyHvYT1HFS4xXVDjSXYh9oU+CBtaK5PuogEsuf/P+vXldUNwFAKmgDc3krK7z3ojrzHVWVWybyApl3nK/iuqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334762; c=relaxed/simple;
	bh=FmTw8wBXe89Pltt8tgV0n8gbhghogNAb+gjvdMos5/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IevaRzGG9+dXZVrlv0c9cJY/3SStfmkz/0bskUkiHn2fiZ8+xbb0R/qwzGS0MBZsYp9OV8mqdioGM/ivEt4c1+b8Unz1w1LvM1y4U/2DGXC0rjbtx6GZwb+PfUvx3S5v5MQ/wHli7qkTFjqA5eNrTbTGLrPhz5LqImfASUJ2DdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fyq6HP5N; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-650789b22e3so9033680d50.1
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 03:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776334760; cv=none;
        d=google.com; s=arc-20240605;
        b=kwzNwXqS0UDoe6QdEzIM16MP7LdppzcAUwZAFNZigLcwK6hb+vo4V4ujRP9kexl8eP
         sraG+z2WNs97d6pG29f2kMV0lg6yaamFo6hNCxQEHtxc3FntkHdmflskhTT8hDf3TCVR
         9Eldq0WGdn8cuiO6Pf7VzIdL9Oni73pNiVqanPkaHD6VOlameM0OSMGOaSZ7QZxWKFHP
         shoczOvoAqPideqXL9Ifx8+xp/0eZSVRXfsC6Q4bp2PElX84CBysJQOFdNnUC6ZDqwT2
         kd3RuAicMsLNMBbx9XFjWsWxJeUbKHzAGF/zj8MhGzq3mV47vOULP7HP21KZAf/TYj0p
         dKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FmTw8wBXe89Pltt8tgV0n8gbhghogNAb+gjvdMos5/k=;
        fh=57Xhd7STMzRLL37seFS69oBkSkmEXFMq6vlsCVDmn0E=;
        b=ll6H+9CBStBgUIw8bPQvSDKP/E21vDoo2PZS1SgUflmhyYyjGInbZcUo32x5/q8/jL
         N2+g3eiLP/hkbDvgQsMQLGscYpJL+COJJHCSIhXYc5k/L7oHYR43UpT8nC9bHnwtAefq
         O2vAfLv0/Y7KNaBDUKfaAR+B8gemzLV3xGpu7wj9OmI2RxQKU32SHbckYW2uR5qStsSu
         5TGyLtKTE6iJcTp5DgeGIorwkkmm/DZAWlUh+kTfNwWnaLzXvvr7RXy+OXfM0fwukIb5
         w4P9CHx+KQ7oeirlulBPd36wVJk3zYoOFtXx2oC/69DddVBDzHcOZ5KA/N0/Fn7yX4fx
         bVWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776334760; x=1776939560; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FmTw8wBXe89Pltt8tgV0n8gbhghogNAb+gjvdMos5/k=;
        b=Fyq6HP5NS4a9D1E0xI++inqdcQKfES5aqKnBrpIiJkra8fPxM3I96OvlAe7dGIBmkH
         CDdaCCoEJeVBEd3pO94okEgrBnxUpvI/RDAWyxVogyVfP/cqzFkuzCqXSdH/H9oITU7A
         8QYEPTkSapcDAg/QA6fNnvVw3lgBvjx7Z8xcS3yH300LRoIKAW7Lwt/fM+zv2iV/g1Ty
         Qd8bTe0eu7mRM3QcJ+121vr+FHWpaBXHzDF4lu2rCVUWOcKDFZI/W96cQ4UnYQdOAmxE
         UJTwWmrdftYywi9pupEIh2r9Nko9wyuwW34FufTVNkaH/xfIpwQg/UBLSCMZTYX36JxA
         nucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334760; x=1776939560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmTw8wBXe89Pltt8tgV0n8gbhghogNAb+gjvdMos5/k=;
        b=NZyNoAhTL7hi1ksjdq1cxBlQQpWg31WlrEJKCvhW/rZ56X42du7n2nkuKUgDvhgTLr
         SuuL6+3E3cnvbf7dXgGfBYCoKAC1YGhSWio7mcuZGrsdKiIX+o2yj5qE69j7x+6JQqXU
         igdV4CohXIhblzS1/R1UZ2F2SYpNSDKxwZPjfodsPvbAZ49VzcAK/ddT3gNhw7ZmkK4v
         9LrkjnP9HSKLwNJeIj9Y8oXnzt3vMyGJ6yKXAWkvtHJ2bFRapDhf1ON5atMkUVkrh3wd
         vt3eF2xvfn0hybhwAseTR1ZZ6VcctRc2FaHMcUQxPuH7bUvcJGGbrUYyLeBA645bvl0b
         KnJA==
X-Forwarded-Encrypted: i=1; AFNElJ8uKhpONEGBrrZEra4Szr+H6fcBbMS1qBVeO49ACH5zbju2UTRE/l5zdKAU5rGNyzO235mnl5xN0Fyp5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmJQE/2bb+ZnBPLDHXtDh7tTPm2KQO/z8VZCh9XKFXljXew+xC
	dPV6FiVUOwzs8D45YRFAP6Pk433C1gtuSw7BR6plI2StiNEBi+9njY6oe3SB/iOhaVd1efODiiv
	8PdviOvSRSRE8qfGriouxj0XLg4ggKqa180RUbwKGdkNF
X-Gm-Gg: AeBDiesa5CrtfkyINLqXEfgYmB7REAqKswn+4EdtX2s7x9XUHi9+Fp0e8ZebLT0OZau
	gJl787EdGF3L/BmNJRSQ3Amq01aDdaB3MnfHRlqwmdXe6GoMLWbnEa8L/EmaKEj9aG7IS95YOLd
	5UogvneuVYsqk7uxiOM0CDgZVjXsBgW94OPgD4X4S/jzTfr9gyyZx8cP2BRhnRXQt8ZEvVold6E
	FLHLmmxmoU279QZb2Ww9PbHqQk+CoVfXHCRgWy2r27pCgfBqHNeD7YAbAVOqNJpWtlg0cdBpAhz
	Af75NqMPWDYJR06BU4zH
X-Received: by 2002:a05:690e:4082:b0:651:cf77:f7cd with SMTP id
 956f58d0204a3-651cf780af2mr15598150d50.13.1776334759713; Thu, 16 Apr 2026
 03:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415151449.3387235-1-lgs201920130244@gmail.com> <20260416094932.GA1768243@killaraus.ideasonboard.com>
In-Reply-To: <20260416094932.GA1768243@killaraus.ideasonboard.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 18:19:06 +0800
X-Gm-Features: AQROBzDBn8q_l_a8hLjbowv1jbUe-5CaUu2DD5ZrJHPxsnOT3n-XM-B0E_Nm5y8
Message-ID: <CANUHTR9w7ca8gw5XdpxKG7kpbdrii4t_e3xJ_eaUQ5RBk2PnxQ@mail.gmail.com>
Subject: Re: [PATCH] media: vim2m: fix reference leak on failed device registration
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Matthew Majewski <mattwmajewski@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58872-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,pengutronix.de,linux.intel.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,patchew.org:url,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0C12F40CDF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

Thanks for the review.

On Thu, 16 Apr 2026 at 17:49, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>

> Functions that don't clean after themselves on failure are not a very
> good practice. It indeed seems that platform_device_register() will
> leave a dangling kref. Most callers don't seem to be aware of this
> though, even platform_add_devices() doesn't call platform_device_put() !
> This makes me think that this patch just works around the problem. A
> better solution is needed. Have you investigated if
> platform_device_register() can drop the reference on failure ? What
> problems would that cause ?
>
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: 1f923a42033ad ("[media] mem2mem_testdev: rename to vim2m")
>
> Quote unlikely.
>


You are right, this may be a workaround rather than the best fix if the
underlying issue is really in the platform_device_register() failure
semantics.

There is also discussion along the same lines in another patch caused by
the same API pattern:
https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail.com/

We are discussing there whether there is a better fix at the API/core
level instead of handling individual callers one by one.

Thanks,
Guangshuo

