Return-Path: <linux-media+bounces-58709-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OKyBy7l3WnDkwkAu9opvQ
	(envelope-from <linux-media+bounces-58709-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 08:56:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC803F64B1
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 08:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 765CD300AD8E
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 06:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58094343D7B;
	Tue, 14 Apr 2026 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W9Kdd2/v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAB5342144
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 06:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149774; cv=none; b=UAlHliYmvT5FCr5bMWr2W9qkPhrclKOPxZLbhVjBnM/hu6zsUCdp725EmhX+LX6VH2/S/b0XEgk2LKrF1F8RlBX/7Tl1uhUHJZR1C5lv/3P9n28nQxwiqC/HiY6GuUvruJn3x0nkEaTd0+P+9vApqGPZjQoUJDUFAuQ/L/hBPZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149774; c=relaxed/simple;
	bh=bUQOJiLl2FV9gn65rwNfjYXL98SdrR7IaoUR7IzcMjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fK+hOpj0k7Jo9D87gaT2WgxERBx24Ckra0p3Nn1Mq+FKNRw4T3e8OfSZ5xAEaxoITdzbnVphvVFB8G6hgYQ3dKVMZP39cMlzrutLCTgVkTP0/f5UdycMMOPLpILvWRdWhHhfaV9BjLo4fElwn0oXm/XKloNPwjy52C+iX4vk0AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W9Kdd2/v; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so691958a12.0
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 23:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776149771; x=1776754571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2TO5qyLBafodY78wWjaI4XVjCX8nRun229GSE4hPY8=;
        b=W9Kdd2/vEgod6dT/KmsUHZQ1nPJQXwdxeesJIxtWBL1Dqq/uM0691vtsqX/sq++UFp
         ICWLPxtkaFxmQHnSHd0AntZmYCTQ4cLDxyyEo/nTiHhuioumtBA/V46kk0TyTqS/0cBA
         GVSiNltiSw26/J24y3bzum2CedOtHExt5731Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776149771; x=1776754571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2TO5qyLBafodY78wWjaI4XVjCX8nRun229GSE4hPY8=;
        b=tU7/pCaIiMv0hyEjKTXh3D2U3czg+aUh+dtvrRiHcnDC6nNg0P/MLg0hbZFIRiWPkv
         lNHtja/stJxKqBmLUEBvjBQuwt9L5h2qN7NjSQs7LuzlpC8dgSqJ3D7fU0TEZ2QkGGyx
         pxGb9Q+8Ar+W2IbeCW7xAYcUSLCzzWBhh7VJTblZKcRmzGi84GyDGjN7ZWrkwE8LgmVE
         zqdQOebvtOGCj4m5O1pswtyQF/0lzCd3LYhsgzDPxZIO7ucuuDRhMzdhVZR7AFi9XmW0
         FGW4BP2ZZqesF1xkLEotlkMIi5jQuOHUnrGtliSjJTeU4N4IP7M8mAUAYD6AHywNraTO
         kBDw==
X-Forwarded-Encrypted: i=1; AFNElJ8+AXspT68ueRtKZ5+8W/z7Lw0Zpyt0xNx2NggO5nzX4jL305ENStvlbFgWhZhxwO2JVkU8/vGOkEfGBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOaz4rvlIJg3upR1wSAEpxwwaLilo8mm0VoDeYYsVfQWbN7h4z
	jt0y4LPzrpcuDmxyXIPqrsLtwEaRqs0tSFwIIUDpHKBa/wKcXxjYuHCqRLoliOCba0QZCK96oNo
	/HkvRGQ==
X-Gm-Gg: AeBDieuoGdzgsWvjgG+C0PJn9SoU02oC7R8PNI9Qh6ZNv0pIn1lh/IyAw831HJcoSuT
	zz9XoU72dvS7HJ2xRE2e11HLtdiHRlcSD7GDdbUM/3TH+Xp7Eu399Lh/cPN6sSzA+xzXwuZDsVI
	uVoHWbYjOQ0xHMvRm9WqGLiL/ETLJAWNQsrFx9LmMgas9hrwTx75B5YkbNDZ5hu5p5czIKr7lyn
	If5kf2mO6qL6P+KKMDeFYvcrA9p7rtBmECS6njKhyFdVOsA7m8VeRWczqCECDDe7XvH7V0US4XW
	BDk0wWJIfIAm2VO7Lzw3X29ljoaeSI45zzXoekZydxical/FANotqUBYeG4jHQ00C2lZjiAiPqN
	pKKSqsSKIQhjzTITvBhSQCDtPYUDCQLWzVRdBosT6lgzUzwr9WxDw4lo1KcIeupdvzkwgPz36qO
	CukfJSI7bW+FfU2oWfEtQrx8sMWuF7SU0KMVGyeJGmgpqSEWkiE7Yj5halvjm+
X-Received: by 2002:a17:907:3c89:b0:b9c:b808:4617 with SMTP id a640c23a62f3a-b9d72499227mr1012345766b.7.1776149770754;
        Mon, 13 Apr 2026 23:56:10 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd77f6sm376180366b.21.2026.04.13.23.56.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 23:56:10 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b941762394aso640153266b.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 23:56:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/nQ1+ZO81r3Y5lGOIDwhFQV4cWS7n6ai8ju/5E721qljwmxMY8EgyDPq+HN20R6TnfTXfqMT+0pG17jQ==@vger.kernel.org
X-Received: by 2002:a17:907:3f09:b0:b9d:f6e9:91c6 with SMTP id
 a640c23a62f3a-b9df6e99932mr282722066b.3.1776149769139; Mon, 13 Apr 2026
 23:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
 <CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
 <20260413201907.GD4034@killaraus.ideasonboard.com> <becd4dc0fe49c9d63fa6b49aab5afb3c4cffa8af.camel@collabora.com>
 <20260413211602.GE4034@killaraus.ideasonboard.com> <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
In-Reply-To: <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 14 Apr 2026 08:55:55 +0200
X-Gmail-Original-Message-ID: <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
X-Gm-Features: AQROBzDmTpo9cQwNqZlxedCF_ZOOICXGe8jLPr93vrZ-mWKytGPmUC2cucYV7vA
Message-ID: <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>, 
	Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Kevin Hilman <khilman@baylibre.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>, Brandon Brnich <b-brnich@ti.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Michael Riesch <michael.riesch@collabora.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	"Padhi, Beleswar" <b-padhi@ti.com>, "Donadkar, Rishikesh" <r-donadkar@ti.com>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58709-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_TWELVE(0.00)[36];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1EC803F64B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

On Tue, 14 Apr 2026 at 08:47, Hans Verkuil <hverkuil+cisco@kernel.org> wrot=
e:
>
> On 13/04/2026 23:16, Laurent Pinchart wrote:
> > On Mon, Apr 13, 2026 at 04:25:54PM -0400, Nicolas Dufresne wrote:
> >> Le lundi 13 avril 2026 =C3=A0 23:19 +0300, Laurent Pinchart a =C3=A9cr=
it :
> >>> On Mon, Apr 13, 2026 at 10:03:52PM +0200, Loic Poulain wrote:
> >>>> Hi Hans,
> >>>>
> >>>> I would be happy to discuss this if a slot is available:
> >>>>
> >>>> Title: Generic V4L2 ISP M2M framework
> >>>> Presenter: Loic Poulain
> >>>> Time estimate: ~20min
> >>>> Description: During early development of a Qualcomm Offline Image
> >>>> Processing Engine (OPE), we relied on the V4L2 memory=E2=80=91to=E2=
=80=91memory
> >>>> (v4l2=E2=80=91m2m) framework, which is widely used and provides soli=
d support
> >>>> for buffer management and scheduling. However, applying it to an ISP
> >>>> use case exposes limitations: ISP engines often require a richer med=
ia
> >>>> graph, with multiple pads and metadata flows, similar to inline ISP
> >>>> pipelines (params, stats, outputs). This talk proposes discussing th=
e
> >>>> need for and design of a common V4L2 ISP M2M framework to factor out
> >>>> shared functionality across drivers, particularly around buffer/queu=
e
> >>>> management and job scheduling.
> >>>
> >>> That's well aligned with the v4l2-isp framework that Jacopo started, =
and
> >>> to the multi-context and media-jobs APIs that we have proposed. I
> >>> wonder, however, if a short session at the media summit will be enoug=
h,
> >>> or if we should try to organize a half day brainstorming workshop at
> >>> some point. Depending on when the people interested in this topic pla=
n
> >>> to arrive, Monday could be an option.
> >>
> >> I'm also/still interested in the multi-context for m2m decoders that h=
ave inline
> >> post-processing capabilities (current model forces us to waste a lot o=
f RAM). We
> >> just restarted some design discussion with the team, with an increased
> >> confidence that multi-context is the way. The scheduler could come han=
dy in the
> >> future if we get to deal with more multi-stage codecs in the future. I=
'll be in
> >> Nice all day Monday.
> >
> > I will unfortunately be available only until 15:00 on Monday, but Jacop=
o
> > should be available through the day. Let's see who would be interested
> > and available, and try to organize something.
>
> I'm available on Monday as well. I think this is a topic that is well sui=
ted
> to a brainstorm session.

I am also available on Monday and would like to attend the session.

Regards!

>
> The agenda for the media summit is getting quite full, and I agree with L=
aurent
> that 20 minutes is likely not enough. If we can so a session on Monday in=
stead,
> then that would be a good solution.
>
> I have never been very enthusiastic about the m2m framework: it's fine fo=
r e.g.
> simple scalers, but it's awkward to use for codecs let alone ISPs.
>
> I always felt that we really need variants of the m2m framework that are =
customized
> to specific use-cases: i.e. a codec m2m framework, and (perhaps) an ISP m=
2m framework.
>
> The big problem with that is of course who will do the work. Making new f=
rameworks
> is difficult and takes a long time.
>
> Regards,
>
>         Hans
>
> >
> >>>> On Sun, Apr 12, 2026 at 12:25=E2=80=AFPM Hans Verkuil wrote:
> >>>>>
> >>>>> (Please pass this on to anyone you think might be interested in thi=
s!)
> >>>>>
> >>>>> Hi all,
> >>>>>
> >>>>> This is the fourth version of this announcement, updating the list =
of
> >>>>> attendees
> >>>>> and the tentative agenda at the end: please let me know if you see
> >>>>> mistakes.
> >>>>> Note that there is still time for one or two other topics. Also ple=
ase
> >>>>> check
> >>>>> the agenda if you need more (or perhaps less) time for your topic.
> >>>>>
> >>>>> This year's Media Summit will be held on Tuesday May 26th the day b=
efore
> >>>>> the
> >>>>> Embedded Recipes Conference in Nice, France:
> >>>>>
> >>>>> https://embedded-recipes.org/2026/
> >>>>>
> >>>>> The Media Summit will be held at Hotel Campanile and in the same me=
eting
> >>>>> room
> >>>>> as last year (Nikaia):
> >>>>>
> >>>>> https://nice-aeroport.campanile.com/en-us/
> >>>>>
> >>>>> It is close to the Airport and to the Embedded Recipes venue.
> >>>>>
> >>>>> The meeting room can hold up to 30 people and I will provide video
> >>>>> conferencing support,
> >>>>> just like last year. The location and the meeting room was quite ni=
ce last
> >>>>> year, so
> >>>>> I saw no need to change it.
> >>>>>
> >>>>> That said, in-person participation is very much preferred. This yea=
rly
> >>>>> summit is meant
> >>>>> for active media developers to meet face-to-face and to discuss med=
ia
> >>>>> subsystem issues.
> >>>>>
> >>>>> And it is also a good opportunity to talk to each other during the
> >>>>> Embedded Recipes
> >>>>> conference to discuss topics in a smaller group. But if you are an =
active
> >>>>> media developer
> >>>>> and are really not able to attend in person, then remote participat=
ion is
> >>>>> an option.
> >>>>>
> >>>>> If you want to attend the meeting (either in person or remote), the=
n send
> >>>>> an email to me
> >>>>> directly. The deadline for in-person attendance is May 14 as the ho=
tel
> >>>>> needs to know the
> >>>>> final number of attendees by then.
> >>>>>
> >>>>> There is no registration fee, the meeting room is sponsored by Cisc=
o and
> >>>>> Collabora, and
> >>>>> the lunch is sponsored by Ideas on Board! Many thanks to our sponso=
rs,
> >>>>> it's very much
> >>>>> appreciated.
> >>>>>
> >>>>> If you have a topic that you want to discuss, just 'Reply All' to t=
his
> >>>>> announcement
> >>>>> and give the topic title, a short description and a guesstimate of =
the
> >>>>> time you need
> >>>>> for your topic.
> >>>>>
> >>>>> See last year's Media Summit Report as an example of what to expect=
:
> >>>>>
> >>>>> https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad08=
9298d@jjverkuil.nl/
> >>>>>
> >>>>> Regards,
> >>>>>
> >>>>>         Hans
> >>>>>
> >>>>> PS: Be aware that May 24 and 25 are public holidays in France. So m=
any
> >>>>> shops may be
> >>>>> closed those days.
> >>>>>
> >>>>> In-person attendees:
> >>>>> Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>>> Kieran Bingham <kieran.bingham@ideasonboard.com>
> >>>>> Brandon Brnich <b-brnich@ti.com>
> >>>>> Rouven Czerwinski <rouven.czerwinski@linaro.org>
> >>>>> Mehdi Djait <mehdi.djait@linux.intel.com>
> >>>>> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>>> Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >>>>> Marco Felsch <m.felsch@pengutronix.de>
> >>>>> Paul Kocialkowski <paulk@sys-base.io>
> >>>>> Jai Luthra <jai.luthra@ideasonboard.com>
> >>>>> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >>>>> Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> >>>>> Beleswar Padhi <b-padhi@ti.com>
> >>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>> Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>> Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> >>>>> Ricardo Ribalda <ribalda@chromium.org>
> >>>>> Michael Riesch <michael.riesch@collabora.com>
> >>>>> Devarsh Thakkar <devarsht@ti.com>
> >>>>> Michael Tretter <m.tretter@pengutronix.de>
> >>>>> Hans Verkuil <hverkuil@kernel.org>
> >>>>>
> >>>>> Remote attendees:
> >>>>> Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> >>>>> Rishikesh Donadkar <r-donadkar@ti.com>
> >>>>> Jackson Lee <jackson.lee@chipsnmedia.com>
> >>>>> Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)
> >>>>>
> >>>>>
> >>>>> Agenda (tentative):
> >>>>>
> >>>>> 8:45-9:20: Arrive, settle in
> >>>>>
> >>>>> 9:20-9:30: Short intro (Hans Verkuil)
> >>>>>
> >>>>> 9:30-9:45: Status of ISP support in V4L2
> >>>>>         Presenter: Laurent Pinchart
> >>>>>         Description: Summary of ISP-related development in V4L2 sin=
ce the
> >>>>> last
> >>>>>         Linux Media Summit. This includes a brief overview of techn=
ical
> >>>>>         developments, and a summary of the efforts to engage with v=
endors.
> >>>>>
> >>>>> 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
> >>>>>         Presenter: Paul Kocialkowski
> >>>>>         Description: An update on the ongonig work to support state=
less
> >>>>> codecs in V4L2.
> >>>>>         Some of the remaining open topics will be presented and dis=
cussed.
> >>>>>
> >>>>> 10:45-11:00: break
> >>>>>
> >>>>> 11:00-11:30: Vulkan Video Codecs
> >>>>>         Presenter: Nicolas Dufresne
> >>>>>         Description: Vulkan video codecs: what are the viable optio=
ns for
> >>>>> Linux Media
> >>>>>         and what is in preparation outside of our subsystem. The se=
cond
> >>>>> aspect is
> >>>>>         informative as these discussions don't seem to lean toward =
our
> >>>>> subsystem as the
> >>>>>         foundation. But I think it's rather useful for everyone to
> >>>>> understand why and
> >>>>>         what is included.
> >>>>>
> >>>>> 11:30-12:00: Protected Video playback on i.MX8MQ
> >>>>>         Presenter: Rouven Czerwinski
> >>>>>         Description: Introduction to protected video playback
> >>>>>         on i.MX8MQ and missing bits for linux-media & protected hea=
p
> >>>>> interoperability.
> >>>>>
> >>>>> 12:00-13:30: Lunch
> >>>>>
> >>>>> 13:30-14:00: HDCP support for HDMI receivers
> >>>>>         Presenter: Hans Verkuil
> >>>>>         Description: I have been working on adding HDCP support for=
 HDMI
> >>>>> receivers.
> >>>>>         Specifically the HDCP negotiation between sources and sinks=
.
> >>>>>
> >>>>> 14:00-14:30: AI patches
> >>>>>         Presenter: Sakari Ailus
> >>>>>         Description: What is our policy w.r.t. AI generated patches=
?
> >>>>>
> >>>>> 14:30-15:00 Overview of Media CI: where do pipelines run?
> >>>>>         Presenter: Ricardo Ribalda
> >>>>>         Description: How are jobs in pipelines assigned? How does t=
he
> >>>>> infrastructure
> >>>>>         for Media CI work? Are there things that can be tweaked to =
make it
> >>>>> more
> >>>>>         reliable?
> >>>>>
> >>>>> 15:00-15:15: Break
> >>>>>
> >>>>> 15:15-16:15: Discussion of the media subsystem development process
> >>>>>         Presenter: Hans Verkuil
> >>>>>         Description: Review of the multi-committer model: current s=
tatus
> >>>>> and next steps.
> >>>>>         Are there any bottlenecks, any ideas for improvements, w.r.=
t. the
> >>>>> development process?
> >>>>>
> >>>>> As you can see, there is still some available time for other topics=
.
> >
>


--=20
Ricardo Ribalda

