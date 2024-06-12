Return-Path: <linux-media+bounces-12985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 596099049E4
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 06:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F851F2451C
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 04:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39869208AF;
	Wed, 12 Jun 2024 04:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n/F7W5hh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC3628385
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 04:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718165576; cv=none; b=GoUQNXQnGg5X/tDV/weS7nAT3ZWl6Kr6s6+ijzHnYdtEA1GLTDXmil99r2i6ZaT4iW3D7bu8xqbNAs9kjqIR2/xNqc6qdbo6bcJB8ENmBpYSI2uV12DqVDgTIMb5Ddp9ieX4tSRK356WygfSDuBk27Hh6z/vz9xafkN7lRGQJ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718165576; c=relaxed/simple;
	bh=KCiP/Gxv0AiHUU4dZ/FxdzbDXyeg/BiSsXDUXCQtCFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EjXzTX1vZnI3d6UxlqFKilLIK5M2wSncpN0hcK0z4gqd4kPq99ta8NibNDhX3SeSUJ594VXBVrSP+n1zuY6EdbKzWNeUtFs1YHrGfifnUVgcBNA1CmUAwTdjUcI3fPblYAjUF0HiQasvEiZyYm/UM327CsfSW7h5ptEaAaspSpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n/F7W5hh; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57ca8e45a1bso318915a12.0
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 21:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718165572; x=1718770372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCiP/Gxv0AiHUU4dZ/FxdzbDXyeg/BiSsXDUXCQtCFY=;
        b=n/F7W5hhuNsZT4EBElumtuL4jzwk4iJ61SgAEVgwMF6UJT1rgGXAvXRM2aS3izrqPD
         bahMFIvKKRU3ymoQIIXbYd9wfbMsRkIzrFIDrD8hfNlpGJ7gKbecIC6Z3t3jrkieMOqM
         +eL+FM07yoTsJjhrVZV8GPn4rKrb/0UVMS5FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718165572; x=1718770372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCiP/Gxv0AiHUU4dZ/FxdzbDXyeg/BiSsXDUXCQtCFY=;
        b=TB9Wsj1H3Cr1ZpXNUPn3iE+DVvO6BIZQIAN/o59vmNjSZsb2HOPXU8abeie6BMDkV8
         QxVWswTZiFnEu+TlTWzNP4r5T4YqSLVNVBN1ro4pjR54umrTpPhbQEcmriRHqsFzjmjP
         Rv2k2RjSMNyaCfivUa9fwnxDG0z4pUYb+IPfEvZF+9jgkVtR6cfHr937RpgPOYRc0V7h
         64V7ZK8f5+8AI6jM+xGQgsiKAE//q9lQ5rEfkDX1OvG4z5NnrRJzpfLOZqYcxGyDE9Kd
         gWOkOIFdyo98loHNzRi54z0sObGh9QQtu2O5K/Q4HWYop6SCjRtBd6RkyPRE8MM5xvUZ
         cdDg==
X-Forwarded-Encrypted: i=1; AJvYcCVtvPNGoUVjvFIVEbcLFA7xneUJeFjARAa88INW4aLr/I5ySDWd7z8h9fNhFdMr1HVuKBP4i5ECE+35Sgg03gfFFOABQfOnftezSds=
X-Gm-Message-State: AOJu0YxRw/EmSx9YsJ6t7iJ5tsAqdR1JZbTitT+s11FJmAxlmvklfEHp
	AKkVddkgBxcLCJuUQQas5kfdD3+2bkA355QJub/YRr9VUWrcUp/k+zbpE8jqtpFfnVGkLmo6rVd
	AXw==
X-Google-Smtp-Source: AGHT+IEkqbTQCobcsDbkOwOSI/BuVt+0VZ3CnFptVqU+zSLuzKdEJ4L+kCXYSJQtciZCtqn4HDVZ5Q==
X-Received: by 2002:a17:906:3491:b0:a6e:f596:7433 with SMTP id a640c23a62f3a-a6f47f99ca6mr53495266b.45.1718165571862;
        Tue, 11 Jun 2024 21:12:51 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0d8b280esm516479166b.149.2024.06.11.21.12.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 21:12:51 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so2806241a12.3
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 21:12:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbGZWtmEAxIl5pRKHCpMHlFuc69nFxf0aHBcIm3udvw/MEESxiSwHxxgRqtoj2pFeXkWId7yPQ3CeWz+IjmAVLX1hVjLYUWV8ZBRQ=
X-Received: by 2002:a17:907:944c:b0:a6f:7cb:6e76 with SMTP id
 a640c23a62f3a-a6f480084f5mr62371966b.51.1718165570466; Tue, 11 Jun 2024
 21:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl> <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
In-Reply-To: <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 12 Jun 2024 13:12:29 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
Message-ID: <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Daniel Almeida <daniel.almeida@collabora.com>, 
	Hidenori Kobayashi <hidenorik@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 1:19=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Hans, all,
>
> I=E2=80=99d like to attend in person and discuss the use of Rust in the s=
ubsystem, especially in light of [0] and [1].
>
> Please note that these are new submissions that are unrelated with what w=
as discussed last year.
>
> 30 minutes will do.
>
> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.almeida@=
collabora.com/
> [1] https://lwn.net/Articles/970565

Somewhat related to the topic: I see potential for a quite big
redesign of the videobuf2 framework going forward and recently with
more Rust adoption I'm starting to think it could benefit from being
implemented in Rust, since we would have to rewrite it quite a bit
anyway. Especially since it's a part of the subsystem that has to deal
with memory management, object lifetime and asynchronousness quite a
lot and we had a history of issues there. So it could be interesting
to hear everyone's thoughts.

That said, I wouldn't be able to travel this time unfortunately, so it
would be nice if we could arrange this topic in a time slot friendly
for remote attendance from Japan. Also +Hidenori Kobayashi from my
team who would also be interested in joining remotely.

Best,
Tomasz

