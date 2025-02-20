Return-Path: <linux-media+bounces-26481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C89A3DD3D
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BDE13BAA1C
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AA01FAC5E;
	Thu, 20 Feb 2025 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="C7e4uqLd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A421FC7F5
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740062414; cv=none; b=oQn6jqd4olZng20dM/70/z+03mU4N7s1561jP8p3iutYVl3uXvI4HoKHGanWmsHcmkQ5SYZgBFZLgYafWeuRtYTuVwYpSN3GRCMyItGVUeJSYU+1TymM1puMAtFIxuuAXbA9YDD7XAB15AMinqLagjT0VYWiiXECq4CchUrrtWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740062414; c=relaxed/simple;
	bh=6kfOWm+URc2Zned6i3jMwRgiY/2DJFSd2cstHahkYic=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iCQYIflpoMmRlQQfSch+XpMjSR4AzX1aYWbTHpJQ/KrPRUSini1q0750hPgHGmmN/2xRXkLSNzTNleCufbnNhRlDGlhvyy40v2oFmk5s/U8IvubpHobF2VwDFrm91ZnR+US8872LYZllrF1v4GFhaUSqCKcFbLBzCSUrbDaxQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=C7e4uqLd; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c0a4b030f2so126067585a.0
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 06:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1740062412; x=1740667212; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/KUR5A5kqRojDu2u7WtYcyO/i/08CHxuuT8EQD2aGQw=;
        b=C7e4uqLd/qDLfqLh7IKlFBssDxCfvc8TDCA1+m8Puu7y7Y2sZKLyU2wo4gXqbQ+vNu
         qsYFow4Rkc25mBYWsNFlSxTGjKYO0bTsBflJJYJ6+2lGbCrLVSA6Ns+EzP7AVEzyYHHS
         1epUNFSil0vcfANtqJyzj86pIsgeVGWaazbWDIiK3NlazE4UHAmat44ftDi3vD067pbz
         8ywzJBDbQIhOR7pLokTE2yG77AAwFWKIMGP8advLP3XFRwD6l4ggVYrynpRkdc1WZULV
         XyIGVDLTtBf0nGnUasIRP3rxbhE9evtK9VxwO1lu1BjV7cBYxGAuXqk1lNm5jxTGNExz
         ORUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740062412; x=1740667212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/KUR5A5kqRojDu2u7WtYcyO/i/08CHxuuT8EQD2aGQw=;
        b=jVN1C3WWgCvexvEvie+iyVK7CfmZ5U97FwEbE8vY806Jw6DXPs3TsZiepSmGakC9hV
         P3C2kiDrzYsJfxo9ZO4kBuMx0byykNvi9lBKspknfNte0hI+FpGE3fc48G4JGKC64hnj
         Bm+EQmz6ulOUTLfN4T1nee1BXu84ZRM8kWAz0DV9iIkyG8HI7pmjWsH2B77DjhJVjV0s
         +Hx7+gE8ipyJWJa4fSMZ8XjUgFTmiZFQlVFQWNtzkRLT/FyE/n1bEC5tDLB0gNZ/r3Dj
         TxoO0EH/sKdKl9vkcjh46dNm+H/decqgFAFiAdkNzjBJCX5gW1fkpyN2q0CRE+Qjyvjc
         x8+w==
X-Forwarded-Encrypted: i=1; AJvYcCUvlcMMjhojlkZ8NkhFiCXebowWDpW6VlK8ScJ6wStilrKhbH82UHUFf1+fqQM3/TaaNt3/SO9sQqRTzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYlTsNplV1mnSaW8MRacl8CorflsR/A4Vdzt4n2Tlqigrj+odt
	bfwvLedVL+EnPPT8VGJ3Y+I+zkkLQGyayRzaZmuL4/Cyrdtd+DCKnIBIEbEUjaA=
X-Gm-Gg: ASbGncvXCbYljY8cZ2EpnFltbW/3Oa9NJmQcKdat9FyhSpqzDTmpXc5ijvHxAljGLfx
	c8v4w09jiFRZXqTDs6tdwPwjneML1WP/zTuK+BXUlvhd/WxWB2K+CQPDXFnXtZP/rv1pYwnM3/V
	nm5GmElk1ag7yqL8VC38u6Xun89VUnBq0/1AwxJQYVQqIKdc5pKut3GWnq7rzff2FGNZ4A1lQun
	9jatIrvGpWJ33SyU9SEOwD2Wo0o5j9B882T7alsE88koEGAne7m5k7ZomfLxP7AbhX7+gqEL8uL
	D6EqQK966JdxXmEHceoF
X-Google-Smtp-Source: AGHT+IHU15emZqAeOTYz8aZ4Ij1OHSmTzqwN9I8yXxdcoFO1XXW5xs6VqmXccnEqy1sGhF7rrqvUZA==
X-Received: by 2002:a05:620a:26a7:b0:7c0:c7aa:d829 with SMTP id af79cd13be357-7c0c7aaddc0mr217871885a.42.1740062411853;
        Thu, 20 Feb 2025 06:40:11 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d7a3f9dsm86665796d6.56.2025.02.20.06.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:40:11 -0800 (PST)
Message-ID: <3e821160bfa9190b0a64ff8dd4f26e3761ccc1cd.camel@ndufresne.ca>
Subject: Re: [ANN v2] Media Summit 2025: Nice in May or Amsterdam in August?
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Jacopo Mondi	
 <jacopo.mondi@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Niklas =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Tomi
 Valkeinen	 <tomi.valkeinen@ideasonboard.com>, Alain Volmat
 <alain.volmat@foss.st.com>,  "stanimir.k.varbanov@gmail.com"	
 <stanimir.k.varbanov@gmail.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Michael Tretter	
 <m.tretter@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>, "Hu, Jerry W"
	 <jerry.w.hu@intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Steve Cho <stevecho@chromium.org>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Kevin Hilman	 <khilman@baylibre.com>
Date: Thu, 20 Feb 2025 09:40:10 -0500
In-Reply-To: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
References: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi everyone,

Le jeudi 20 f=C3=A9vrier 2025 =C3=A0 11:24 +0100, Hans Verkuil a =C3=A9crit=
=C2=A0:
> [Repost because I mixed up a Lyon and Nice, and to provide more info on t=
he other
> =C2=A0events that take place in Nice. Also added Kevin Hilman to the CC l=
ist.]
>=20
> Hi all,
>=20
> We want to organize a Media Summit this year as well to meet each other f=
ace-to-face.
> We try to co-locate with an existing conference, and this year there are =
two options:
>=20
> 1) Co-locate with the Embedded Recipes conference in Nice in France which=
 is held on May 14-16:
>=20
> =C2=A0=C2=A0 https://embedded-recipes.org/2025/
>=20
> =C2=A0=C2=A0 So a media summit would probably take place on May 11 or 12.
>=20
> =C2=A0=C2=A0 This conference is a one room, one track format. But the roo=
m holds up to 200
> =C2=A0=C2=A0 people and the expectation is that it is not a problem to ge=
t tickets for it.
> =C2=A0=C2=A0 And we might be able to reserve some tickets for us as well.
>=20
> =C2=A0=C2=A0 There is a libcamera workshop on Friday, and AFAIK a pipewir=
e workshop on the same day.
> =C2=A0=C2=A0 GStreamer plans an event during the weekend after ER.

This one is my preference this year for few reasons. The
libcamera/gstreamer/pipewire meetings are the biggest weight in the
balance to justify this 6000 km trip. Its also good for the parallel
encoder effort (still need to send emails by the end of week) to get
some F2F sooner then later.

>=20
> 2) Co-locate with the Open Source Summit Europe in Amsterdam which is hel=
d on August 25-27.
>=20
> =C2=A0=C2=A0 https://events.linuxfoundation.org/open-source-summit-europe=
/
>=20
> =C2=A0=C2=A0 The Embedded Linux Conference Europe is part of that event. =
The summit would
> =C2=A0=C2=A0 probably be on August 24 or 28.

The second reason is that my lasts ELCE didn't give me the impression
the trip was worth it. It was very expensive for the level of talks
they where presenting.

Third reason is simply that I personally won't be able to attend since
I'll be on vacation with the family. School also only start the week
after, might be a little local of a comment, but that really makes the
date the most terrible choice for me personally. But I can imagine
other school in the world starts at similar date, and that other people
have young kids.

Nicolas

>=20
> I know that getting permission to travel is still a problem for many, whi=
ch is why we
> try to co-locate with a larger event.
>=20
> So: if you are a core media maintainer or an active media developer, and =
want to join
> the Media Summit, which of these two options would work for you?
>=20
> If possible, I would like to get an idea of what I can expect in about tw=
o weeks time.
> I'll send out a reminder in about a week as well.
>=20
> Feel free to forward this if you know other people who might be intereste=
d.
>=20
> If you haven't been to one of these Media Summits before, then you can fi=
nd the report
> on last year's summit here:
>=20
> https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@=
xs4all.nl/
>=20
> That should give you an idea of what to expect.
>=20
> Regards,
>=20
> 	Hans


