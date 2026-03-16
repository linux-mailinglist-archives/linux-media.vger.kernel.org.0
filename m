Return-Path: <linux-media+bounces-55865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD3YAjLEt2m1VAEAu9opvQ
	(envelope-from <linux-media+bounces-55865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:49:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 245BE296741
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B62E302A535
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7D338228A;
	Mon, 16 Mar 2026 08:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Hw6f/Dcc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522B3202C48
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650959; cv=pass; b=QP37fDuJO1EBYMQGYSBecgXqnqjO8HuOKvnArPjdUkBXteRMI6+qqBdjXc/zvoJgbMRroy8od0vKqELHU9PZEj/imgUyUY6W3lFuK376+Fmsa0wAv1Anbn6jedmPAjbXlz0mdl8tgH2KgljRGmXFTXOBsi+TPMdyjLc5+w35m5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650959; c=relaxed/simple;
	bh=UVhxMZDzAKn4BhKATa6Db9iPxKggmV2NEwuIPmQiOhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvlsusrIZxK3u1yUOEpLHfwv/v7OGNQa2Q43fbgeWgGYoIUEIcCfFnBJuVF2vhQxqPGNBgOWWfdFsX9feGrmiUpn1hZII2qYoNORO/CcUgk1Kh+vFMLrvHrq8tgPlew5eCgbuy9ItU/n2L/WftXLjkDH9wTYT+tVNl5fwI1bV3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Hw6f/Dcc; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b886fc047d5so708634066b.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773650956; cv=none;
        d=google.com; s=arc-20240605;
        b=G6vIH8AI9K/qt5LD0hyAvFMLUNk71qonAtkJheiib1cNjnF4J3BJwujq/s0VTCbGd8
         GD7ohqGjJhXJf4bzSihpbsEOQEJrKaqoF7zULNIR93EY3LSwTKrYf2JB0yU8+1P8E2yt
         MWEwRmjMBTBz94nmQp6p523o3yUTxt9vgwC2xh84qvnoaVNQG7N4pccN50f2Q4BoMKYx
         RHZJ+Up1F7tPJjotSR3l/m6xyR9TaraO5nauuoepbbjN3u/w7zjGN4+M3IwfCVk9WGMS
         C19OYJZTkgybfszAa+dqA/aMP6Cqd9MCyBR5NHOGADPVF0NpjhXuc4oexteHgaQoksOa
         D0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UVhxMZDzAKn4BhKATa6Db9iPxKggmV2NEwuIPmQiOhA=;
        fh=Gr1jPPHwmHu7bj8VTjLodgnSmZCfl1QT8+u6/FOaaYM=;
        b=bkyNsJolSPjVe/ZEkFlFKygFNpyZ6nln9mbgLHhs/XB7WYDeRHdGJaUEFnjYhyKGv0
         4hyi3Fd+5xN83o6Qm6kg1G5HJkbSYY8LoYvWTYDydTVJXW4+bhGP2zEOqXRffYIvdilU
         3VXixkJED7tlRMVqoH7zix/s6CuF2FWFnwjBIadP0mlAhrIrYz+xWBNSZLBM2uQ88/nu
         ifvBAgBQ7wpstz1qbPm2mpOZiL52uY47wSMTF564/OvT+Mq3SEZNcRvJyDXfLPOJDL0o
         Ruw9l8g0s39/a+KBYj/CMnWPtkVPFzX8HZzabB0u6HgxmdvI2rN4fWdDJdGPFR8rFKS5
         kMMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1773650956; x=1774255756; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UVhxMZDzAKn4BhKATa6Db9iPxKggmV2NEwuIPmQiOhA=;
        b=Hw6f/Dcct+7qabi9PoOdk8iHslbMnCM4oGzBX2i6N/hHth3nq/IFYSfdQ3gEZWcyxH
         8Fn1c8gl/0tHc1f19c0Z3C+iHCxzZerVp0mK9/YF8UwpVhgORBvDenkE7sXF9WDB1Xab
         CLY2SX1xtA+9ZS6O58enXDVAEX1hxN/PYXApgTTj66j3BmLtZTSim0cqh0WlWbUPvBaG
         L7bI+Kl0QvbyLSnBca1PCTEGWgCYUex6Vd1Z309HC/jUWlXqW15YBEn/exzGZnEUMOBS
         GTEo1ejTZtOAn612jUPoXtW9dqPPolmELfoik9LALgeUoGIjYis+nk1eQDAzmjq23Mo9
         GAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650956; x=1774255756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVhxMZDzAKn4BhKATa6Db9iPxKggmV2NEwuIPmQiOhA=;
        b=hBMzyfZp/ZY3LnfbTd0oskTSm8oZV5bG3DA/RH8nXWsdSJWhwesgTPiA9ZVCwOXtqo
         3lNCaDmkt7GpyvGG1lbZPcAp8NjEme1+bgPCuqLqWdEZO2WrAHkSgLftqaIaxNQH4CZ1
         B0ebz4jgNz+0hpQEA6DYm+A8Y11vD7Dk4trkx7PQkQGxq8gJrbtHSn7Yt74zVbCPoOH8
         PblPOZ7ZXOw9JcUUdB2LoHOVTV5Xf6fmTIXY0ijqH2mydaF+OYION7rhi2VZiNJ+Wrp5
         iUFm1Hu6SbQdaG7zU3dHcLNbKjoPF8iNpAU/ke4I4QJXiL/vQBcmu7vk/9BFii7/5SGo
         Dn4g==
X-Forwarded-Encrypted: i=1; AJvYcCV0Ap3A+qTkBK9QTdHYLE3bERWZGTvaI0/4nEvcvVPLSlZ9PVr0ljZHjnOKNTZewh+AQfBowYho5qzufg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuT4aX6cwNzvDd9IZgr3TZ2Z4zOLCN57c3K6UjJmInRz2Akxo+
	Cjbo92BgDfprhCRzG+sR/oKs17dusP0ZVwsEpg1kyxirzeXXED+URXKIQ1ZSGF4O3us3Wfog7s0
	g7XMbK1u7Y0HysKsDMWdd0FCUKMhxa69c/Fw+td3hTXilmmEZvisus6Y=
X-Gm-Gg: ATEYQzxb1fG8pQIpPj8c+Umm2PUrFfQSOVW2aEDF1kQ5Vs6qN8uhg+nelcdgc9N0GRD
	do2fbfwE+9vqV5gNzUB/ph64rJ8vb4VLsmZKHmjwN4p+FL3EmtVP/9FKew9mhNx4VcsmvPtCKqj
	bYmHdHDOWzT1yTa7n6J3k1XDkcgeT/M3ulq9BMAuV2XI0bGw9v8BqIdt8ZyBowmyeItaZyWW+w1
	y5sm4EnExBEWR14p4QJJA7oSsv3Wgb1kc5Ur3QUZq5ET2ghZYYNlq4Hzm+lPTVcgFB2qHPK/Wzt
	+HT9FcZ0YP27uut/0Gaxvrhg83r/gnQ9AXzvE/Ss57o8tGgg/ZwZp0M0oD4wSd1XkkFmbt5PXbt
	85iV611GCRFPgsbF4cG94SOSg
X-Received: by 2002:a17:907:9450:b0:b97:cbb9:2290 with SMTP id
 a640c23a62f3a-b97cbb953e4mr46228666b.11.1773650955537; Mon, 16 Mar 2026
 01:49:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315221126.GA520505@killaraus.ideasonboard.com>
In-Reply-To: <20260315221126.GA520505@killaraus.ideasonboard.com>
From: David Plowman <david.plowman@raspberrypi.com>
Date: Mon, 16 Mar 2026 08:49:04 +0000
X-Gm-Features: AaiRm51ysJUaV8Joxugk-TxrZnpGgY49KMK98R2vQ237-6y_cLKlIaOPGOBk43g
Message-ID: <CAHW6GYLG5FxjsbAk8OiYvNyWjtLvsbtv-THRyNcqSYkDwTH2vw@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2026 - Nice, May 29th
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55865-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david.plowman@raspberrypi.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,raspberrypi.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 245BE296741
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent

Yes, please add me to the list of attendees. I have a couple of topics
I'd like to discuss:

1. Bayer reprocessing

I posted patches for this in the not-very-distant past, and I've built
a number of functional demos based on those which I'd be happy to
show.

2. Control queues

Folks may have noticed I posted a patch just the other day based
closely on an earlier one from Barnabas. It would be great to agree on
some progress here.

Thanks!
David

On Sun, 15 Mar 2026 at 22:11, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello everybody,
>
> With spring approaching (at least in the northern hemisphere), it is
> time to announce the next libcamera workshop. After four stops in four
> different countries, we will pause our journey through Europe by
> extending last year's stay in Nice for one more edition.
>
> The workshop will be organized by Ideas on Board at the Radisson Blu
> Hotel Nice ([1]) on Friday the 29th of May. It will be the perfect
> occasion to meet face to face with the libcamera community and to
> discuss the project's roadmap together. The event will be free of charge
> for attendees.
>
> We will be part of the "Embedded Week in Nice" ([2]), a week-long event
> that extends the Embedded Recipes conference ([3]) for extra
> embedded-related fun. As last year, communities we cooperate with will
> be present. In addition to the PipeWire Hackfest, this edition will
> bring the Display Next Hackfest to the French Riviera, and the Linux
> Media Summit will also be organized in a nearby location on Tuesday the
> 26th ([4]).
>
> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you would
> like to include in the schedule. We will draft and circulate an agenda
> after receiving topic proposals. If registrations exceed our capacity,
> priority will be given based on topic submissions.
>
> [1] https://www.openstreetmap.org/relation/5130684
> [2] https://embedded-recipes.org/2026/colo/
> [3] https://embedded-recipes.org/2026/
> [4] https://lore.kernel.org/linux-media/92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org
>
> --
> Regards,
>
> Laurent Pinchart

