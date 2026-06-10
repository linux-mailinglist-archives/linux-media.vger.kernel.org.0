Return-Path: <linux-media+bounces-64401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AQt7D4M7KWrrSgMAu9opvQ
	(envelope-from <linux-media+bounces-64401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:25:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFDE6683BD
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:25:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=A6fYcDlJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64401-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64401-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39BD13135B2D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2907A3F1AC9;
	Wed, 10 Jun 2026 10:22:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEAE3F1672
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 10:22:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086937; cv=none; b=Z4OgzS3EP1Df6jJSL/FudXVxpp3hR/XbJdCB0KvKOQ8JylKaszL0UeAvOOZhcR60kc8slS/80fUDTOUl/QdQpPULQI8ZCbX7rpbv+x3bNi2V1LPEEr6E6Coirz8huRmkEPRhcIG7d6AF9dR0WBhrx8dtMdARkLURyNPDZhMcwLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086937; c=relaxed/simple;
	bh=IJ+Mv8l8BOEJIzRxmCs273CN/9xHpQFpWdPkTCa38QQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=muCyxkWGZN+t7sB5wWNE7EsaEQDpoa+il9JN+k+238fVDvCfEdvU6/0wkHE99eVbqJbLYjIda6PS3xGckSiHMeifzREKsS7lF4J5ilCqJuG0oJTqOK48d0sVzokH9USac6sdyZbfrOa7jpiw29uJALxOOKEkuC5kug5K7bmw1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6fYcDlJ; arc=none smtp.client-ip=209.85.167.50
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa63daf2a5so6580280e87.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086933; x=1781691733; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Op2O4TfFNGM2XBexsf2lewmOpAfxsnhNoTBzMhjnW4E=;
        b=A6fYcDlJJcWJRuJEmcTgmmrTPXt7aoIQ3A2rE11ysx7cBSKKXzA2VrmM2NwzKzCbAq
         IRVV1GRVmWxU6YWxYUgcCOBY9kCcc1AoYRS1t25R2bsl21DwSR9uANWTdKLnaIqzzS3d
         z1yUDQ65T16L4+2CsrsIJmgy4iJglngLv7yGf7s+YZmG/eNQyk7W6uKiqwhsMdzC7g/k
         xCU28Tbirl6qDEh+zgFiD+KDDcSdgwWSC0S/0StOg8BHCm9/I3hC4fat6HxGBLL5dANI
         QmGLZKwywm8szyaXMirugEkc5biXYr1rwAfBoGOpIKgbGITIONeLXdPoGXHwEtj98s6S
         gK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086933; x=1781691733;
        h=mime-version:content-transfer-encoding:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Op2O4TfFNGM2XBexsf2lewmOpAfxsnhNoTBzMhjnW4E=;
        b=m3nrlSzvY+3An3uoua7ZzRG0ch2aGxDWq8XVG7TtTRNbsZJVaRKQKbHe9tBFBPB0IH
         5PSjv+03hlk0/VSoYZ2AjvLngfkcFo47ECpsWGUjYHjjEKDU1Fn8hurS9os0zzdfSVVm
         wRGQkl1G6sFf4pJV37NdFiQ3G0GlZDpFVaXsmzSJg6OiqoWo/LL+HxGNJLHNLVNVe0Gz
         eVyIKsrpy+3zSPtOgc/tdM8mppGuEuVKxsmhgcHMuYIu8wOuPtKSA2l44hcYDs1n0b5S
         ICpbJ9xeIzRR5VmERZXnSh4Ey7qz+7KRwBV5xUchU1F4Z7c0erjcQVmvF6YU0TO4r+hn
         T5gQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iGFY7/HIGw32tIZoqwdi3tNrafYZqU8776UvCCVm2+/EHy/oD/uGejEX1UAVG6BgHgVJP73m2pEGm1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm3dYWp0tJZePAsCT55kTIuHX3vmvg11ur4owibccvxaXQFoXZ
	ziS/A/qCm2hAdwy1dnMrKGqiV8LdWZTNaykeSZwNYgLOhf4D1PZd5kt8
X-Gm-Gg: Acq92OH3lSFY0LDB1JjtYbj55c8oNRl54Ttr1FXWleEcTHuqiro/vO29l8Nisq+1Ugq
	FE6M39/kvqzaZQYYMQGW9RfyTiM9R0NYx4OMsGZ7ExRhrcszoy6HAsPwdOFjijkr9qNrBNL1DVD
	LRYSXgTRXsO5rggDBfhDhZoH4qR26E4h5MjXWXsmcfHmrojaNMkSFgYZSnVHC5n2zbAF9/p1Cze
	GIlDTA+heaZ98nijFo7Yv+TleyCcK+tqEbBDK+MPqsNRb4opNDDWMfyGZdEb3ypiJsRR1rzuyjS
	d8D/HS4dqpLBdUosJ3Ilj80c/xWkAyF4CAJ6TelLX4EabQrdbeZGiL4T/KF9iEgaubi51zbBXIu
	+hjTrq11pjv75bYVyceTdiLz+YxmjGFVn8C7uWOouQdUEvrODN0/OJB5hfB8r0/r/LgN8ck9ONO
	uK73ESiZtepPKno4SuPw31KqgGm2v6TbVafjCtAD/G00jfAP4q50umfEizSrdkCJPXqPhdXN+gJ
	JxOg6uzL3FjWFL1eOY3JuL+Bgk3BDJP
X-Received: by 2002:a05:6512:8053:b0:5aa:6f8e:ffdf with SMTP id 2adb3069b0e04-5aa87bc1892mr4015424e87.22.1781086933187;
        Wed, 10 Jun 2026 03:22:13 -0700 (PDT)
Received: from [127.0.1.1] ([79.106.123.139])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed718sm5200547e87.14.2026.06.10.03.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:22:12 -0700 (PDT)
From: Jurison Murati <eng.juri@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov8865: Drop PM runtime reference if
 stream start fails
In-Reply-To: <aikZRf93bHZEBL-e@kekkonen.localdomain>
References: <20260609232255.13559-2-eng.juri@gmail.com>
 <aikZRf93bHZEBL-e@kekkonen.localdomain>
Date: Wed, 10 Jun 2026 12:22:12 +0200
Message-ID: <178108693204.7090.12999474570277037921@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64401-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dan.scally@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DFDE6683BD

Hi Sakari,

Thanks for the review.

> How about:
>
> 	if (ret || !enable)
> 		pm_runtime_put(sensor->dev);
>
> 	if (!ret)
> 		state->streaming = enable;
>
> 	return ret;

Done in v2 - that also covers the case where disabling the stream
fails, which v1 missed. Since the logic changed I didn't carry Dan's
Reviewed-by over. I also moved this patch to 1/2 so the stream start
patch can rely on the unified error path.

> The driver should be switched to {enable,disable}_streams but that's
> another issue altogether.

Noted - I'll leave that for a separate series.

Regards,
Jurison

