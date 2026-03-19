Return-Path: <linux-media+bounces-56326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP4QJs/Uu2k4owIAu9opvQ
	(envelope-from <linux-media+bounces-56326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:49:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECEF2C9C02
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D63BD302A7E7
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27FE3C4540;
	Thu, 19 Mar 2026 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCGCoOCI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248403C344C
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773917388; cv=pass; b=TcXvbN/pzzTv7zYrCgbcJnaLDyfVbBKiS49efy30pPP7tfbXDnIjo7wZmi/sP0i6+lm64KswjP832pLPmTJCkg3g9K8OH/h4dMzLYFYliVFX09+uVETnpDSXA8GEYadaEeBGkM7znoaL6RsIKcwYNlAd9ElnGbDvkk0/tSMV4fI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773917388; c=relaxed/simple;
	bh=/l28jUEFKZlcFm9kAnI0WjoSyaQ5f/siyMtiPPCrI6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eye14cAA9fitB3+MwifqFlQXQ7lcz3UhcR73g9cDnJADOGa+dkvIO0vcZs5wAzJph0UMW79RGKmLssDd86yTWhaPQaKLcM/yXik1dQ1ogdJ+1mew/kkfOuEcWTFuJy2crv7e7O1x7lkihR6ySJZ1tVKQIimW44U6EK9vR4nctGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCGCoOCI; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffbd778410so249481137.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 03:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773917386; cv=none;
        d=google.com; s=arc-20240605;
        b=SMqsBWhRcfSXXGkg4Pq7q4X+CEuDSipmEkboVqvEcTTiqwPecMkcP0FtIO9VLo9uPW
         5crzryz2zINIix6HwtNY8mKatV3S0juMJh+Je7/2KuV1RNL0aeXLLwmp9cbpzakmYMfK
         ZXBNC1HGEscyB6PCiDLumFNmtidtS+P/nLtem3KWYCovSENwtOB3VPoCwHBcwqswCNG9
         IXJbKAev0A7osJ4jaqxImuOZlzGVdhiUe1Lpvx66vyDXh54E+hcLfTUpyEarYzCwsX3C
         OKq5lLpBf2sG72cQ6SJBkKbj77H0k9DTtrydyOJuh1dTk1nFz/TJ1W+9dnQtgp4WCFaK
         j56g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/l28jUEFKZlcFm9kAnI0WjoSyaQ5f/siyMtiPPCrI6Y=;
        fh=tULzQN3jw/tM59OH/Tvbno/N1bDCQvrMs6ifEjlDSTY=;
        b=eD7lAgeOuiKmYo/UWpyRFiW0+nmKgeSOiTnt/SLjlADZFG4UXbQjSU9M9hCVGHui5S
         nfDnV3dPRt/ChLylauvC83zIV4pIfX6g2m4Viz5f4XeMup5NgtUNU36YsWqEIIH4X7Q6
         vJlMAihozYJ28DN5qbsi8gaCRFGBWyvYIBMdsWzWdzDtmeWGCyYxRcZVimNi7ulu34Wy
         xfMO9Y+oGbgCqPTFatOArsUa12AZ0wOticZgOIEzLzSVVGj8yBbITC5GIrAcB1r43owN
         UUOn18kaNICaFOPHvM3mP06J22POIGI3XXe2ijJxtVVByvoa+552eB7juShxkecbnmVI
         ps6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773917386; x=1774522186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l28jUEFKZlcFm9kAnI0WjoSyaQ5f/siyMtiPPCrI6Y=;
        b=aCGCoOCIEGA+tO35gH8WhOKWgsScVeB5uC0OG1v6EMwOGnsLUd1KLtPVPfMMrKwnhM
         5P0OgIrPFtm5exsLU+qMpPQIVeWl7n0QkvoUbSrRa2ItkHGVWoNh580cSymSU3gsC5pw
         VKAaJibhen57VWSjC6uyqYINf5FrXuK+f/8atx3JgFRVBEMrXP2C830orRwWfDRUy3ls
         U/xE49HqwWs7fL0pkg/tpDqpIKGKSaTQeWzCNn1SY+702kC/vr6A4x+UPELKvO44ug2i
         bGGxkhQFBJh5CDOlnCJNVBtMoUZbSkUa0ObXJX0kRGnbRPkix+LyjKGKSPtMkPK7+/F7
         lwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773917386; x=1774522186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/l28jUEFKZlcFm9kAnI0WjoSyaQ5f/siyMtiPPCrI6Y=;
        b=RoehLL7m72iARgGAnXcNP5L6t2qpHOOxLV/jSAKbahIwgOYT2EFAIRrrlodbRMz6Ob
         I6rhtjIDyN8rqfnxwpZVe8Ko+uEbiXcNXY5nbwFa1DdJ+woEShKXLpFi8ufh3UnjZfBx
         xs2tDOylsmVXWnwZt9QvLZocIQgY4qBrpj2RZInDjzBE8xbEtl7/+SeKZrzAiaNiIAgr
         JuKpltohFnyOAF1onSpa2FXwFBabFHXF+Kj+ayrkT19v2eMsCSCKo5kZNjDiLdAx+/cB
         Xu0okfZ59f+EZskd6lpDfbANNP/OoyrXrKoy6xWgSxPC7ZB7VWxWLO/gpsA42Le5YpJJ
         w5aw==
X-Forwarded-Encrypted: i=1; AJvYcCXmkVHqKKUypfmvFcDGQvrHZoypmdXR/cRFb82+ivPaodPpE5Dj+8vOHYZNCC+aHITk/UqI6FUdZ5XIdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt7JUhhSy9yd6aS7lzyhvSN1SHbXvoL4VFQgIZpyCPYkbUmk6w
	Yt2lQLzA9aIXuo9JknhKljvDjKKHiifBuvJzqpb9i0mobQOWCmkOULYvoUEysJ97wXsO0RUR30N
	aXAyW1pmCm6V9b5TaIBSpXzI74bzLltpezjYf
X-Gm-Gg: ATEYQzwvc4+9AEpOF2gdlqhi4+h8QwOEgZ+D6zMjUqzHgMJfbG40ivZVitYBToXZjLE
	bZhm7HOUWf+hQJgXWEHmLXBuJtVUVLAlBi0BZ96VN3xMNYu8o5KkX4Qo7K8sT29sR8t1ZzIGs6t
	SAWMFuAVupQomZHovRla1+0EaHsjG4rTINxAnVcBzMg3Jb93QnpwbQR7vMPqBUDMqkUDy5ZuehP
	K/zQ6Ws4EVEZObCN/Gk9vGxAtxdRrGcqUh89NwwFN0FngvlDS4nRJ2EYH+RUf0QQe7gHb5F7zsU
	wGFSUckMDbwpIsCbqKIHhFs47mJ4sPRV8NeOi6nTNNP4KwU4vsTyvpZ8+RaF1Mev2UdDeg==
X-Received: by 2002:a05:6102:4186:b0:602:6c69:eec7 with SMTP id
 ada2fe7eead31-6027d320cb1mr2774310137.23.1773917386002; Thu, 19 Mar 2026
 03:49:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315221126.GA520505@killaraus.ideasonboard.com>
In-Reply-To: <20260315221126.GA520505@killaraus.ideasonboard.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 19 Mar 2026 11:49:29 +0100
X-Gm-Features: AaiRm51DBtazWYzw9vQ3c2QdzG-tYK7waEjgNSEM8GOfmhPFW69oRiE5CAXzWQo
Message-ID: <CAPybu_30mW5z7TMqWvqEN7vWrs8-bd9f76Eq55M22VY-BmXE2Q@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2026 - Nice, May 29th
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56326-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.942];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ricardoribalda@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,openstreetmap.org:url,ideasonboard.com:email,embedded-recipes.org:url]
X-Rspamd-Queue-Id: 0ECEF2C9C02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent
On Sun, Mar 15, 2026 at 11:11=E2=80=AFPM Laurent Pinchart
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

Thanks for organizing this!

I would like to attend to be up to date with the project. I have
nothing to present, so if you have short of space please prio other
person that will actually contribute :).

Thanks

>
> [1] https://www.openstreetmap.org/relation/5130684
> [2] https://embedded-recipes.org/2026/colo/
> [3] https://embedded-recipes.org/2026/
> [4] https://lore.kernel.org/linux-media/92e24f36-d189-4ba8-ad0b-43277bc1a=
abd@kernel.org
>
> --
> Regards,
>
> Laurent Pinchart
>


--=20
Ricardo Ribalda

