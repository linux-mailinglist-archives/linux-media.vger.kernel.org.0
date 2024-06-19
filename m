Return-Path: <linux-media+bounces-13663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD1090E710
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 11:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BBD2284B5B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087CA8002F;
	Wed, 19 Jun 2024 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j2if/0lJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD39980035
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718789353; cv=none; b=glZ6rlM5Ghmpb7UODd51hz6D8WMBcmHvsxx8c0rpeCvbFPjCY5nWYN2c3o8IWipZIkbUF6u3r6xR2ws2KqNQ7GDMgCsCysVQv98QRCCk0g/xuWJ7XdZG+kYQjdsJbDPtgCOXMZBtnR2QugDmTPxUKmT7iB+zxmLDeq5Vzo68OwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718789353; c=relaxed/simple;
	bh=rXcffqcjnOPXuOwhKbYxt1QKIxuBn2wu62IeBjqxH40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FnxzLwL8Hx9R6sCTGiVNgv6jeEFNajOqlhyxXZoWs3rMzd/3YL/GYOVhlqHh5d7QXHMw2+4yGz+WTUexwHlJ36hT2obg72oIvoCfHnwg9OkkxOP6xTFj6Wgk/04TxjU46d6vum8UUnOvUsGYLyYKqrp0tz4BGe6FcG4Cc7uZflQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j2if/0lJ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6f0c3d0792so754420166b.3
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 02:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718789349; x=1719394149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPhMd0WUU4FeqcenbGQ99Ytz1/QQcEyCAZoNdyt9D6k=;
        b=j2if/0lJERSyjFHwGTGme2zUFBmPt6Qb14KmVj/XWLsX13PTHrpaNL9dD0gqaPkynY
         10iCXplFlJ7nXYYh1p5J2NA/uWz0uLqnWXZtHpx6JiVwJqsZAeUHO2vYnaChARFfKWnW
         rIToyYlFE7ub/RN9pNJKxVekrSo6CabEY1fuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718789349; x=1719394149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPhMd0WUU4FeqcenbGQ99Ytz1/QQcEyCAZoNdyt9D6k=;
        b=N+i+/CxGeOPdcvKTeH6tGWC4UbyrUxn7Y3JrMDlEI9aru+DtpWlOZd4JbNPEi3xrim
         WUNIGmHpBMJzUDbzeqCxXxhbeTfgmcBt6vdm06CJa5jlSaCRnvq2ciRveV8rMbVlht1o
         vuMz/jmOevqM35i0/2IaHyKyyQZ4zO0osTxU5QLjLEscOUXzi+Re/sn6tPaRu/WrHLLq
         F9U3Vd9ft+FaRWSOJmdQc3FPxQh5gn7Ta3z7PwKa8d63WX8e7Q5iRCffQwnj8woHrtIr
         l6N8f3i9vaXKePTX3wCwNNmv29whbDsRHBFh8p5y7FfAfB/5sSvMIxSHCXpvpdOtDZ/J
         JC1A==
X-Gm-Message-State: AOJu0Yy7HU89c7v3e64MXJMS4zcGXzRpYZ3/ucJkYCFz9DCxBUAcvEBe
	ubdCB75D9F4hp8KRETi4s6j8mFqht5+XxTzp1MJYGE2PTzjYAgPaWjO1KWoTENFRQxRs5mZ9AnH
	ijZZo
X-Google-Smtp-Source: AGHT+IHmbn9Su6PA+WJuOU4Lx/xyaim7y+OjumkiYIyzPV2NbdniXp0AzI+/YORR0cW779S1ZBRPGA==
X-Received: by 2002:a17:906:6b08:b0:a6f:6d7e:f4d3 with SMTP id a640c23a62f3a-a6fab64238emr120492166b.34.1718789349400;
        Wed, 19 Jun 2024 02:29:09 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9806csm655184766b.195.2024.06.19.02.29.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 02:29:08 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a63359aaacaso1004967866b.1
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 02:29:08 -0700 (PDT)
X-Received: by 2002:a17:906:f349:b0:a6f:49eb:31a5 with SMTP id
 a640c23a62f3a-a6fab7d0b64mr92099166b.77.1718789347784; Wed, 19 Jun 2024
 02:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
In-Reply-To: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 19 Jun 2024 18:28:41 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D7j3GQxUNJ5U93kODOVrWSjRQ_xt5dawMqr-rSYeqk1A@mail.gmail.com>
Message-ID: <CAAFQd5D7j3GQxUNJ5U93kODOVrWSjRQ_xt5dawMqr-rSYeqk1A@mail.gmail.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans and everyone,

[re-sending in plain text...]

On Mon, May 6, 2024 at 8:34=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> Hi all,
>
> We will organize another Media Summit on Monday September 16th to coincid=
e with
> the Open Source Summit Europe in Vienna:
>
> https://events.linuxfoundation.org/open-source-summit-europe/
>
> Avnet Silica has very kindly offered to host this summit at their Vienna
> office, which is about 35 minutes by public transport from the OSSE venue=
.
>
> Location:
>
> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(=
Silica)/@48.183203,16.3100937,15z/data=3D!4m6!3m5!1s0x476da80e20b26d5b:0x2c=
5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=3Dttu
>
> The meeting room can hold 18 people and has video conferencing support (M=
S Teams).
>
> That said, I want to keep remote participation to a minimum. This yearly =
summit is meant
> for active media developers to meet up face-to-face and to discuss media =
subsystem issues.
> But if you are an active media developer, but are not able to attend in p=
erson, then this
> is an option.
>
> If you have a topic that you want to discuss, just 'Reply All' to this an=
nouncement.
> It would be very much appreciated if you can also add a guesstimate of th=
e time
> you need for your topic.

I'd like to propose the following topic:

Current state of videobuf2, its limitations and the paths forward.

In the session I'd go over the issues with the current design and
implementation of vb2 during my experience as a maintainer and a
driver developer. I have a couple of ideas on how to address those and
would also like to share those and get some initial high level
feedback on the direction.

I think I need 30 minutes, but unfortunately I can't travel at the
time if the conference and need to join remotely.

Best,
Tomasz

>
> If you want to attend the meeting (either in person or remote), then send=
 an email to me
> directly. Since the number of seats is limited, I may have to put people =
on a waiting list.
> Please let me know sooner rather than later (ideally by mid-July) so I ha=
ve a good idea
> what to expect.
>
> Priority goes to presenters and the core media maintainers. If multiple p=
eople of the same
> company want to attend, then I may ask to limit attendance to one or two =
people.
>
> It is hard to predict how many people want to attend, so I'll see how it =
goes.
>
> Regards,
>
>         Hans
>

